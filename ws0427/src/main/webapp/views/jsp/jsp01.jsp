<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="col-sm-8 text-left">
    <div class="container">
        <h1 id="jsp01">JSP01</h1>
        <h3>${num}</h3>
        <h3>${cust}</h3>
        <!-- getter 없으면 값을 가져올 수가 없음-->
        <h3>${cust.id}</h3>
        <h3>${cust.name}</h3>
        <!-- 서버의 시간 -->
        <h3>${cdate}</h3>
        <h3><c:out value="${cust.name}"/></h3>
        <h3><c:out value="${cust.id}"/></h3>
        
        <h3><fmt:formatDate value="${cdate}" pattern="yyyy-MM-dd hh:mm:ss"/> </h3>

        <h3><fmt:parseNumber value="${num}"  integerOnly="true" type="number" /></h3>
        <h3><fmt:formatNumber value="${num}" type="currency" /></h3>
        <h3><fmt:formatNumber value="${num}" type="number" pattern="#,###.###$" /></h3>

        <h3>${num * 2}</h3>
        <!-- 서버에서 내려주는 게 좋지 java 코드 혼재는 좋지 않다 -->
        <h5><c:set var="mynum" value="${num * 3}"/></h5>
        <h5><c:out value="${mynum}"/></h5>
        <h3>mynum : ${mynum}</h3>

    </div>
</div>