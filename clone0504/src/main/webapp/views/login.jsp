<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>

<script>
    let login_form = {
        init:function(){
            $('#login_btn').click(function(){
                login_form.send();
            });
        },
        send:function(){
            $('#login_form').attr({
                'action':'/loginimpl',
                'method':'post'
            });
            $('#login_form').submit();
        }
    };
    $(function () {
        login_form.init();
    })
</script>
<div class="card shadow mb-4">
<div class="col-sm-8 text-left">
    <div class="container">LOGIN</div>
</div>
    <div class="card-body">
        <div class="col-sm-8 text-left">
            <h2>로그인 페이지</h2>
            <form id="login_form">
                <div class="form-group">
                    <label for="id">ID:</label>
                    <input type="email" class="form-control" id="id" placeholder="Enter ID" name="id">
                </div>
                <div class="form-group">
                    <label for="pwd">Password:</label>
                    <input type="password" class="form-control" id="pwd" placeholder="Enter password" name="pwd">
                </div>
                <div class="checkbox">
                    <label><input type="checkbox" name="remember">Remember me</label>
                </div>
                <button type="button" id="login_btn" class="btn btn-primary">로그인</button>
            </form>
        </div>

    </div>
</div>