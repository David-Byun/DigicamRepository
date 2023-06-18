<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script>
    let item_detail = {
        init : function () {
            $('#register_btn').click(function () {
                item_detail.send();
            });
            $('#delete_btn').click(function () {
                let c = confirm("삭제하시겠습니까?")
                if (c == true) {
                    location.href = '/item/deleteimpl?id='+${gitem.id};
                }
            })
        },
        send : function () {
            $('#register_form').attr({
                method:'post',
                action:'/item/updateimpl',
                enctype: 'multipart/form-data'
            });
            $('#register_form').submit();
        }
    };
    $(function () {
        item_detail.init();
    });
</script>

<!-- Begin Page Content -->
<div class="container-fluid">

    <!-- Page Heading -->
    <h1 class="h3 mb-2 text-gray-800">Tables</h1>
    <p class="mb-4">DataTables is a third party plugin that is used to generate the demo table below.
        For more information about DataTables, please visit the <a target="_blank"
                                                                   href="https://datatables.net">official DataTables documentation</a>.</p>

    <!-- DataTales Form -->
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">${gitem.id}</h6>
        </div>
        <div class="card-body">

            <%--폼과 폼사이 데이터가 날아간다.--%>
            <form id="register_form" class="form-horizontal well">
                <input type="hidden" name="id" value="${gitem.id}">
                <input type="hidden" name="imgname" value="${gitem.imgname}">

                <%-- input 태그는 보이지 않지만, 폼과 폼사이의 데이터가 날아간다.--%>
                <div class="form-group">
                    <div class="col-sm-10">
                        <img src="/uimg/${gitem.imgname}">
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-2" for="name">Name :</label>
                    <div class="col-sm-10">
                        <input type="text" name="name" class="form-control" id="name" value="${gitem.name}">
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-2" for="price">Price :</label>
                    <div class="col-sm-10">
                        <input type="number" name="price" class="form-control" id="price" value="${gitem.price}">
                    </div>
                </div>
                <%-- 이미지 한번에 업로드 할 수 있다. 이미지 선택 안 할 경우 이미지값이 넘어가지 않는다. --%>
                <div class="form-group">
                    <label class="control-label col-sm-2" for="img">파일 :</label>
                    <div class="col-sm-10">
                        <input type="file" name="img" class="form-control" id="img" value="${gitem.price}">
                    </div>
                </div>
                <%--폼과 폼사이 데이터를 전송할 수 없다. 왜냐하면 primary 키가 없기 때문에 업데이트가 안됨--%>
                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                        <button id="register_btn" type="button" class="btn btn-info">수정</button>
                        <button id="delete_btn" type="button" class="btn btn-info">삭제</button>
                    </div>
                </div>
            </form>
        </div>
    </div>

</div>
<!-- /.container-fluid -->