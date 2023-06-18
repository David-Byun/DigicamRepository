<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="col-sm-8 text-left">
    <h2>로그인 페이지</h2>
    <form id="login_form">
        <input type="hidden" />
        <div class="form-group">
            <label for="id">ID:</label>
            <input type="email" class="form-control" id="id" placeholder="Enter ID" name="id">
        </div>
        <div class="form-group">
            <label for="pwd">Password:</label>
            <input type="password" class="form-control" id="pwd" placeholder="Enter password" name="pwd">
        </div>
        <div class="checkbox">
            <label><input type="checkbox" name="remember"> Remember me</label>
        </div>
        <button type="button" id="login_btn" class="btn btn-primary">로그인</button>
    </form>
</div>

