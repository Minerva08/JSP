<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <style>
        .seat {
            width: 30px;
            height: 30px;
            margin:10px;
        }
        
        .clicked {
            background-color: red;
            color: white;
        }
    </style>
</head>
<body>
<jsp:useBean id="ticket" class="ticketing.TicketingDTO"/>
<jsp:setProperty property="*" name="ticket"/>
<div>
	
	<div id="seat"></div>
</div>

<form action="">
	<input type="text" name="city" value="${ticket.city}">
	<input type="text"  name="branch"value="${ticket.branch}">
	<input type="text" name="movie_name"value="${ticket.movie_name}">
	<input type="text" name="start_time"value="${ticket.start_time}">
	<input type="text"  name="run_house"value="${ticket.run_house}">
	<input type="text" id="movie_seat" name="seat"value="${ticket.seat}">
	<button>완료</button>
</form>
</body>

<script>

	const times = document.querySelectorAll('#seat')
	times.forEach(th => th.style.cursor = 'pointer')
	times.forEach(btn => {
		btn.onclick = function(){
			const  seat1 = btn.dataset.seat
			const seat = document.getElementById('movie_seat');
			seat.setAttribute("value", seat1);
			
		}
	})

    let test = [];
    let selectedSeats = new Array();
    let selectedSeatsMap = [];
    const seatWrapper = document.querySelector("#seat");
    let clicked = "";
    let div = "";

    for (let i = 0; i < 7; i++) {
        div = document.createElement("div");
        seatWrapper.append(div);
        for (let j = 0; j < 7; j++) {
            const input = document.createElement('input');
            input.type = "button";
            input.name = "seat"
            input.classList = "seat1";
            //3중포문을 사용하지 않기위해 
            mapping(input, i, j);
            div.append(input);
            input.addEventListener('click', function(e) {
                console.log(e.target.value);
                //중복방지 함수
                selectedSeats = selectedSeats.filter((element, index) => selectedSeats.indexOf(element) != index);

                //click class가 존재할때(제거해주는 toggle)
                if (input.classList.contains("clicked")) {
                    input.classList.remove("clicked");
                    clicked = document.querySelectorAll(".clicked");
                    selectedSeats.splice(selectedSeats.indexOf(e.target.value), 1);
                    clicked.forEach((data) => {
                        selectedSeats.push(data.value);
                    });
                    //click class가 존재하지 않을때 (추가해주는 toggle)
                } else {
                    input.classList.add("clicked");
                    clicked = document.querySelectorAll(".clicked");
                    clicked.forEach((data) => {
                        selectedSeats.push(data.value);
                    })
                }
                console.log(selectedSeats);
            })
        }
    }

    function mapping(input, i, j) {
        if (i === 0) {
            input.value = "A" + j;
        } else if (i === 1) {
            input.value = "B" + j;
        } else if (i === 2) {
            input.value = "C" + j;
        } else if (i === 3) {
            input.value = "D" + j;
        } else if (i === 4) {
            input.value = "E" + j;
        } else if (i === 5) {
            input.value = "F" + j;
        } else if (i === 6) {
            input.value = "G" + j;
        }
    }
</script>

</html>

