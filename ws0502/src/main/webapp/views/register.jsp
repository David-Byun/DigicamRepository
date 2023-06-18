<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script>
    let registerForm = {
        init : function () {
            $('#register_btn').click(function () {
                registerForm.send();
            })
        },
        send : function () {
            let id = $('#id').val();
            let pwd = $('#pwd').val();
            let name = $('#name').val();
            $('#register_form').attr({
                'action' : '/registerimpl',
                'method': 'post',
            })
            $('#register_form').submit();
        }
    }
    $(function () {
        registerForm.init();
    })
</script>
<div class="card shadow mb-4">
<div class="col-sm-8 text-left">
    <div class="container">Register</div>
</div>
    <div class="card-body">
        <div class="col-sm-8 text-left">
            <div class="container">
                <div class="row content">
                    <div class="col-sm-6  text-left ">
                        <h1>Register Page</h1>
                        <form id="register_form" class="form-horizontal well">
                            <div class="form-group">
                                <label class="control-label col-sm-2" for="id">ID:</label>
                                <div class="col-sm-10">
                                    <input type="text" name="id" class="form-control" id="id" placeholder="Enter id">
                                </div>
                                <div class="col-sm-10">
                                    <span id="check_id" class="bg-danger"></span>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label" for="pwd">Password:</label>
                                <div class="col-sm-10">
                                    <input type="password" name="pwd" class="form-control" id="pwd" placeholder="Enter password">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label" for="lev">LEVEL:</label>
                                <div class="col-sm-10">
                                    <input type="number" name="lev" class="form-control" id="lev" placeholder="Enter Level">
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-offset-2">
                                    <button id="register_btn" type="button" class="btn btn-default">Register</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>