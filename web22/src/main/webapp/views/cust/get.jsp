<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="col-sm-8 text-left" >
    <h2>회원정보 페이지</h2>
    <form id="register_form">
        <div class="form-group">
            <label for="id" >ID:</label>
            <input type="text" class="form-control" id="id" value="${gcust.id}" name="id" readonly>
        </div>
        <div class="form-group" style="">
            <label for="pwd">Password:</label>
            <input type="password" class="form-control" id="pwd" value="${gcust.pwd}" name="pwd">
        </div>
        <div class="form-group">
            <label for="name">이름:</label>
            <input type="text" class="form-control" id="name" value="${gcust.name}" name="name">
        </div>
        <button type="button" id="register_btn" class="btn btn-primary">업데이트</button>
        <button type="button" id="remove_btn" class="btn btn-primary">삭제</button>
    </form>

</div>