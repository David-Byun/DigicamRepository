<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script>
    let custinfoForm = {
        init : function () {
            $("#custupdate_btn").click(function () {
                custinfoForm.send();
            })
            $("#custdelete_btn").click(function () {
                let c = confirm("삭제하시겠습니까?");
                if (c == true) {
                    location.href="/cust/delete?id=${custinfo.id}"
                }
            });
        },
        send : function () {
            $("#custinfo_form").attr({
                action : '/cust/detailimpl',
                method: 'post',
            })
            $("#custinfo_form").submit();
        },
    }
    $(function () {
        custinfoForm.init();
    })
</script>
<div class="card shadow mb-4">
<div class="col-sm-8 text-left">
    <div class="container">Cust Info</div>
</div>
    <div class="card-body">
        <div class="col-sm-8 text-left">
            <div class="container">
                <div class="row content">
                    <div class="col-sm-6  text-left ">
                        <h1>Cust Info Page</h1>
                        <form id="custinfo_form" class="form-horizontal well">
                            <div class="form-group">
                                <label class="control-label col-sm-2" for="id">ID:</label>
                                <div class="col-sm-10">
                                    <input type="text" name="id" class="form-control" id="id" value="${custinfo.id}" readonly>
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
                                <label class="control-label" for="name">NAME:</label>
                                <div class="col-sm-10">
                                    <input type="text" name="name" class="form-control" id="name" value="${custinfo.name}">
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-offset-2">
                                    <button id="custdelete_btn" type="button" class="btn btn-facebook">정보 삭제</button>
                                    <button id="custupdate_btn" type="button" class="btn btn-warning">정보 수정</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>