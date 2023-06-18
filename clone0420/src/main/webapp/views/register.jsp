<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
    let registerForm = {
        init : function () {
            $('#register_btn').click(function () {
                registerForm.send()
            });
        },
        send: function () {
            $('#register_form').attr({
                'action' : '/registerimpl',
                'method' : 'get',
                }
            )
            $('#register_form').submit();
        },
    };
    $(function () {
        registerForm.init();
    });
</script>
<div class="col-sm-8 text-left" >
    <h2>회원가입 페이지</h2>
    <form id="register_form">
        <div class="form-group">
            <label for="email" >Email:</label>
            <input type="email" class="form-control" id="email" placeholder="Enter email" name="email">
        </div>
        <div class="form-group" style="">
            <label for="pwd">Password:</label>
            <input type="password" class="form-control" id="pwd" placeholder="Enter password" name="pwd">
        </div>
        <div class="form-group">
            <label for="usrName">이름:</label>
            <input type="text" class="form-control" id="usrName" placeholder="Enter password" name="usrName">
        </div>
        <div class="form-group">
            <label for="phone">연락처:</label>
            <input type="text" class="form-control" id="phone" placeholder="Enter password" name="phone">
        </div>

        <div class="checkbox">
            <label><input type="checkbox" name="remember"> Remember me</label>
        </div>
        <button type="button" id="register_btn" class="btn btn-primary">가입</button>
    </form>

</div>