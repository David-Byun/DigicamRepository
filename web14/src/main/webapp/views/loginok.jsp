<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<div class="col-sm-8 text-left">
    <div class="container">
        <h1>로그인 성공</h1>
        <%--세션에 있는 정보도 jsp에서 바로 꺼낼 수 있음--%>
        <h3>${logincust.name}님 환영합니다.</h3>
    </div>
</div>
