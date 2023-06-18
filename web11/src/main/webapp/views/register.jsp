<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
    let register_form = {
        init:function(){
            $('#register_btn').click(function(){
                register_form.send();
            });
            $('#name').keyup(function () {
                let id = $('#id').val();
                let pwd = $('#pwd').val();
                let name = $('#name').val();
                if ($(this).val() != '' && pwd != '' && name != '' && $(this).val() < 3) {
                    $('#register_btn').removeClass('disabled');
                }
            })
            $('#id').keyup(function () {
                let txt_id = $(this).val();
                if (txt_id.length < 3) {
                    return;
                }
                $.ajax({
                    url : '/checkid',
                    data : {'id' : txt_id},
                    success : function (result) {
                        if (result == 0) {
                            // 다른데서 사용할 수도 있으므로 부모 selector 추가 하기
                            $('#check_id').text('사용 가능 합니다.')
                            $('#pwd').focus();
                        } else {
                            $('#check_id').text('사용 불가능 합니다.')
                        }
                    }

                });
            });
        },
        send:function(){
            let id = $('#id').val();
            let pwd = $('#pwd').val();
            let name = $('#name').val();
            if (id.length < 3) {
                $('#check_id').text('3자리 이상이어야 합니다.');
                $('#id').focus()
                return;
            }
            if (pwd == '') {
                return;
            }
            if (name == '') {
                return;
            }

            $('#register_form').attr({
                'action':'/registerimpl',
                'method':'post'
            });
            $('#register_form').submit();
        }
    };
    $(function(){
        register_form.init();
    });
</script>
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
                        <label class="control-label col-sm-2" for="pwd">Password:</label>
                        <div class="col-sm-10">
                            <input type="password" name="pwd" class="form-control" id="pwd" placeholder="Enter password">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-2" for="name">NAME:</label>
                        <div class="col-sm-10">
                            <input type="text" name="name" class="form-control" id="name" placeholder="Enter name">
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-10">
                            <button id="register_btn" type="button" class="btn btn-default">Register</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>