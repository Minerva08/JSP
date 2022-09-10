<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<main>
      <div class="main_component">
         <div class="left_nav">
            <ul>
               <li>
                  <span>01</span>
                  <span>상영시간</span>
               </li>
               <li>
                  <span>02</span>
                  <span>인원/좌석</span>
               </li>
               <li>
                  <span>03</span>
                  <span>결제</span>
               </li>
            </ul>
         </div>
         <div class="movie_place">
            <div class="movie_place_tab"><h4 id="bs">영화관</h4></div>
            <div class="place_choose">
               	전체
            </div>
            <div class="movie_selector">
               <div id="busan">
                  <ul>
                     <li id="select1">
                        <button onclick="btn1()" id="b1input">부산</button>
                        <div><img src="image/check.png" hidden="" id="img1"></div>
                     </li>
                     <li id="select2">
                        <button onclick="btn2()" id="b2input">서울</button>
                        <div><img src="image/check.png" hidden="" id="img2"></div>
                     </li>
                  </ul>
               </div>
               <div style="width: 50%; display: none;" id="list1">
                  <ul>
                     <li>
                        <button onclick="btn11()" id="col11">센텀</button>
                        <div><img src="image/check.png" hidden="" id="img11"></div>
                     </li>
                     <li>
                        <button onclick="btn12()" id="col12">사상</button>
                        <div><img src="image/check.png" hidden="" id="img12"></div>
                     </li>
                     <li>
                        <button onclick="btn13()" id="col13">서면</button>
                        <div><img src="image/check.png" hidden="" id="img13"></div>
                     </li>
                  </ul>
               </div>
               
               <div style="width: 50%; display: none;" id="list2">
                  <ul>
                     <li>
                        <button onclick="btn21()" id="col21">강남</button>
                        <div><img src="image/check.png" hidden="" id="img21"></div>
                     </li>
                     <li>
                        <button onclick="btn22()" id="col22">명동</button>
                        <div><img src="image/check.png" hidden="" id="img22"></div>
                     </li>
                     <li>
                        <button onclick="btn23()" id="col23">이태원</button>
                        <div><img src="image/check.png" hidden="" id="img23"></div>
                     </li>
                  </ul>
               </div>
            </div>
         </div>
         <div class="movie_choose">
            <div class="movie_choose_tab">
				<h4 id="select_mov">영화 선택</h4>         
            </div>
              
            <div class="selector_option">
                

            </div>
            <div class="movie_list">
                     
            </div>
         </div>
         <div class="date">
            <div class="date_tab"><h4><%=today %></h4></div>
            
            <div>
               <form method="POST">
                  <input type="hidden" id="area1" name="city">
                  <input type="hidden" id="area2" name="branch">
                  <input type="hidden" id="selectmov" name="movie_name">
                  <!--<input type="hidden" id="idx" name="idx">-->
                  <input type="submit" value="예매하기">
               </form>
               
               <c:if test="${pageContext.request.method == 'POST'}">
                  <jsp:useBean id="dto" class="ticketing.TicketingDTO"></jsp:useBean>
                  <jsp:setProperty property="*" name="dto"/>
                  
                  <script>
                       const row = '${Tdao.insert_ticket(dto)}'
                        alert(row == 1 ? '성공' : '실패');
                     </script>
                  
               </c:if>
            </div>
         </div>
      </div>
   </main>
   
   <script>
   
      function btn1() {
         var va = document.getElementById('area1');
         va.setAttribute("value", "부산")
         var el = document.getElementById('list1');
         el.setAttribute("style", "width: 50%;")
         var ell = document.getElementById('list2');
         ell.setAttribute("style", "width: 50%; display: none;")
         
         document.getElementById('select1').setAttribute("style", "background-color: white;");
         document.getElementById('select2').removeAttribute('style');
         
         document.getElementById('img1').removeAttribute('hidden');
         document.getElementById('img2').setAttribute("hidden", "");      
         
         document.getElementById('b1input').setAttribute("style", "width: 90%;background-color: white;border: none;text-align: left;padding: 7px 16px;cursor: pointer;font-size: 13px;margin: 2px;font-weight: bold;");
         document.getElementById('b2input').setAttribute("style", "width: 90%;background-color: rgb(245,245,245);border: none;text-align: left;padding: 7px 16px;cursor: pointer;font-size: 13px;margin: 2px;font-weight: bold;");
         
         var va2 = document.getElementById('area2');
         va2.removeAttribute('value');
        
         
      }
      function btn2() {
         var va = document.getElementById('area1');
         va.setAttribute("value", "서울");
         var el = document.getElementById('list2');
         el.setAttribute("style", "width: 50%;");
         var ell = document.getElementById('list1');
         ell.setAttribute("style", "width: 50%; display: none;")
         
         document.getElementById('select2').setAttribute("style", "background-color: white;");
         document.getElementById('select1').removeAttribute('style');
         
         document.getElementById('img2').removeAttribute('hidden');
         document.getElementById('img1').setAttribute("hidden", "");
         
         document.getElementById('b2input').setAttribute("style", "width: 90%;background-color: white;border: none;text-align: left;padding: 7px 16px;cursor: pointer;font-size: 13px;margin: 2px;font-weight: bold;");
         document.getElementById('b1input').setAttribute("style", "width: 90%;background-color: rgb(245,245,245);border: none;text-align: left;padding: 7px 16px;cursor: pointer;font-size: 13px;margin: 2px;font-weight: bold;");
         
         var va2 = document.getElementById('area2');
         va2.removeAttribute('value');
         
   
      }
      function btn11() {
         var va = document.getElementById('area2');
         va.setAttribute("value", "센텀");
         
         document.getElementById('img11').removeAttribute('hidden');
         document.getElementById('img12').setAttribute("hidden", "");
         document.getElementById('img13').setAttribute("hidden", "");
         
         document.getElementById('col11').setAttribute("style", "color: red;")
         document.getElementById('col12').removeAttribute('style');
         document.getElementById('col13').removeAttribute('style');
         
         var b = document.getElementById('bs');
         b.innerHTML = "센텀";
      }
      function btn12() {
         var va = document.getElementById('area2');
         va.setAttribute("value", "사상");
         
         document.getElementById('img12').removeAttribute('hidden');
         document.getElementById('img11').setAttribute("hidden", "");
         document.getElementById('img13').setAttribute("hidden", "");
         
         document.getElementById('col12').setAttribute("style", "color: red;")
         document.getElementById('col11').removeAttribute('style');
         document.getElementById('col13').removeAttribute('style');
         
         var b = document.getElementById('bs');
         b.innerHTML = "사상";
      }
      function btn13() {
         var va = document.getElementById('area2');
         va.setAttribute("value", "서면");
         
         document.getElementById('img13').removeAttribute('hidden');
         document.getElementById('img12').setAttribute("hidden", "");
         document.getElementById('img11').setAttribute("hidden", "");
         
         document.getElementById('col13').setAttribute("style", "color: red;")
         document.getElementById('col12').removeAttribute('style');
         document.getElementById('col11').removeAttribute('style');
         
         var b = document.getElementById('bs');
         b.innerHTML = "서면";
      }
      function btn21() {
         var va = document.getElementById('area2');
         va.setAttribute("value", "강남");
         
         document.getElementById('img21').removeAttribute('hidden');
         document.getElementById('img22').setAttribute("hidden", "");
         document.getElementById('img23').setAttribute("hidden", "");
         
         document.getElementById('col21').setAttribute("style", "color: red;")
         document.getElementById('col22').removeAttribute('style');
         document.getElementById('col23').removeAttribute('style');
         
         var b = document.getElementById('bs');
         b.innerHTML = "강남";
      }
      function btn22() {
         var va = document.getElementById('area2');
         va.setAttribute("value", "명동");
         
         document.getElementById('img22').removeAttribute('hidden');
         document.getElementById('img21').setAttribute("hidden", "");
         document.getElementById('img23').setAttribute("hidden", "");
         
         document.getElementById('col22').setAttribute("style", "color: red;")
         document.getElementById('col23').removeAttribute('style');
         document.getElementById('col21').removeAttribute('style');
         
         var b = document.getElementById('bs');
         b.innerHTML = "명동";
      }
      function btn23() {
         var va = document.getElementById('area2');
         va.setAttribute("value", "이태원");
         
         document.getElementById('img23').removeAttribute('hidden');
         document.getElementById('img22').setAttribute("hidden", "");
         document.getElementById('img21').setAttribute("hidden", "");
         
         document.getElementById('col23').setAttribute("style", "color: red;")
         document.getElementById('col22').removeAttribute('style');
         document.getElementById('col21').removeAttribute('style');
         
         var b = document.getElementById('bs');
         b.innerHTML = "이태원";
      }
      
      
      var list = new Array();
      <c:forEach items="${dailyResult.dailyBoxOfficeList.dailyBoxOffice}" var="boxoffice">
         list.push("${boxoffice.movieNm }");
      </c:forEach>
      function selectmov(e) {
         
         var va = document.getElementById('selectmov');
         var vb = document.getElementById('select_mov');
         for (var i = 0 ; i < list.length ; i++) {
            if (e == i) {
               	va.setAttribute("value", list[i]);   
               	vb.innerHTML = list[i];
		        document.getElementById(list[i]).removeAttribute('hidden');
            }
            else {
            	document.getElementById(list[i]).setAttribute("hidden", "");	
            }
         }
      }
      
	
      
      
   </script>

	
	