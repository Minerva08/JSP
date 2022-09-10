<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<ul>
   <li>
      <c:if test="${not empty dailyResult.dailyBoxOfficeList.dailyBoxOffice}">
         <c:forEach items="${dailyResult.dailyBoxOfficeList.dailyBoxOffice}" var="boxoffice" varStatus="st">
            <button onclick="selectmov(${st.index})" id="st">${boxoffice.movieNm }</button>
            <div><img src="image/check.png" hidden="" id="${boxoffice.movieNm }"></div>
         </c:forEach>
      </c:if>
   </li>
   
</ul>
