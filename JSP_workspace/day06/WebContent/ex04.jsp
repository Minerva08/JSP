<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.Arrays"%>
<%@ page import="java.util.List"%>
<%@ page import="day06.Customer"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex04 - forEach</title>
<style>
        .odd, .even {
                padding: 5px;
                width: 200px;
        }
        .odd {
                color: white;
                background-color: black;
        }
        .even {
                color: black;
                background-color: white;
        }
        
</style>
</head>
<body>

        <h1>forEach</h1>
        <hr>
        <%
                Customer cu1 = new Customer();        // 기본 생성자로 객체 생성
                Customer cu2 = new Customer();
                Customer cu3 = new Customer();
                
                cu1.setName("김수현");                        // setter로 값을 할당
                cu1.setPnum("010-1212-1212");
                
                cu2.setName("박서준");
                cu2.setPnum("010-2323-2323");
                
                cu3.setName("성동일");
                cu3.setPnum("010-3434-3434");
                
                Customer[] arr = { cu1, cu2, cu3 };        // 배열 생성
                
                List<Customer> list = Arrays.asList(arr);        // 배열을 리스트로 변환
                
                ArrayList<Customer> arrayList = new ArrayList<Customer>(list); // 리스트를 ArrayList로 생성
                
                pageContext.setAttribute("arr", arr);
                pageContext.setAttribute("list", list);
                pageContext.setAttribute("arrayList", arrayList);
                
                for(Customer dto : arr) {
                        System.out.println(dto.getName() + " : " + dto.getPnum());
                }
        %>
        
        <ul>
        <c:forEach var="dto" items="${arr }">
                <li>${dto.name } : ${dto.pnum }</li>
        </c:forEach>
        </ul>
        
        <table border="1" cellspacing="0" cellpadding="7">
        <thead>
                <tr>
                        <th>이름</th>
                        <th>전화번호</th>
                        <th>varStatus.first</th>
                        <th>varStatus.last</th>
                        <th>varStatus.index</th>
                        <th>varStatus.count</th>
                </tr>
        </thead>
        <tbody>
        <c:forEach var="dto" items="${list }" varStatus="st">
        <tr>
                <td>${dto.name }</td>
                <td>${dto.pnum }</td>
                <td>${st.first }</td>
                <td>${st.last }</td>
                <td>${st.index }</td>
                <td>${st.count }</td>
        </tr>
        </c:forEach>
        </tbody>
        </table>
        
        <c:forEach var="i" begin="0" end="${arrayList.size() - 1 }" step="1">
                <div class="${i % 2 == 0 ? 'even' : 'odd' }">
                        ${i+1}
                        <span class="name">${arrayList[i].name }</span> : 
                        <span class="pnum">${arrayList[i].pnum }</span>
                </div>        
        </c:forEach>
        
        
        
        

</body>
</html>