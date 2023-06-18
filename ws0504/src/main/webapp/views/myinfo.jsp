<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script>
    let myinfoForm = {
        init : function () {
            $('#myinfo_btn').click(function () {
                myinfoForm.send();
            })
        },
        send : function () {
            $('#myinfo_form').attr({
                'action' : '/myinfoimpl',
                'method': 'post',
            })
            $('#myinfo_form').submit();
        }
    }
    $(function () {
        myinfoForm.init();
    })
</script>
<div class="card shadow mb-4">
<div class="col-sm-8 text-left">
    <div class="container">My Info</div>
</div>
    <div class="card-body">
        <div class="col-sm-8 text-left">
            <div class="container">
                <div class="row content">
                    <div class="col-sm-6  text-left ">
                        <h1>My Info Page</h1>
                        <form id="myinfo_form" class="form-horizontal well">
                            <div class="form-group">
                                <label class="control-label col-sm-2" for="id">ID:</label>
                                <div class="col-sm-10">
                                    <input type="text" name="id" class="form-control" id="id" value="${adm.id}" readonly>
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
                                    <input type="number" name="lev" class="form-control" id="lev" value="${adm.lev}">
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-offset-2">
                                    <button id="myinfo_btn" type="button" class="btn btn-default">정보 수정</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>