<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>

</script>
<div class="col-sm-8 text-left" >
    <h2>회원가입 페이지</h2>
    <form id="register_form">
        <div class="form-group">
            <label for="id" >ID:</label>
            <input type="text" class="form-control" id="id" placeholder="Enter ID" name="id">
        </div>
        <div class="form-group" style="">
            <label for="pwd">Password:</label>
            <input type="password" class="form-control" id="pwd" placeholder="Enter password" name="pwd">
        </div>

        <div class="form-group">
            <label for="name">이름:</label>
            <input type="text" class="form-control" id="name" placeholder="Enter name" name="name">
        </div>
        <div class="checkbox">
            <label><input type="checkbox" name="remember">Remember me</label>
        </div>
        <button type="button" id="register_btn" class="btn btn-primary">가입</button>
    </form>

</div>