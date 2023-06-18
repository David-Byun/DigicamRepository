<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script>
    let marker_detail = {
        init : function () {
            $('#register_btn').click(function () {
                marker_detail.send();
            });
            $('#delete_btn').click(function () {
                let c = confirm("삭제하시겠습니까?")
                if (c == true) {
                    location.href = '/marker/deleteimpl?id='+${marker.id};
                }
            })
        },
        send : function () {
            $('#register_form').attr({
                method:'post',
                action:'/marker/updateimpl',
                enctype: 'multipart/form-data'
            });
            $('#register_form').submit();
        },
    };
    function readImage(input) {
        // 인풋 태그에 파일이 있는 경우
        if(input.files && input.files[0]) {

            // FileReader 인스턴스 생성
            const reader = new FileReader()
            // 이미지가 로드가 된 경우
            reader.onload = e => {
                const previewImage = document.getElementById("preview")
                previewImage.src = e.target.result
            }
            // reader가 이미지 읽도록 하기
            reader.readAsDataURL(input.files[0])
        }
    }
    $(function () {
        marker_detail.init();
        $('#imgname').on("change", e => {
            readImage(e.target)
        })
    });
</script>

<!-- Begin Page Content -->
<div class="container-fluid">

    <!-- Page Heading -->
    <h1 class="h3 mb-2 text-gray-800">Marker Add</h1>
    <p class="mb-4">DataTables is a third party plugin that is used to generate the demo table below.
        For more information about DataTables, please visit the <a target="_blank"
                                                                   href="https://datatables.net">official DataTables documentation</a>.</p>

    <!-- DataTales Form -->
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">Marker Detail</h6>
        </div>
        <div class="card-body">
            <form id="register_form" class="form-horizontal well">
                <div class="form-group">
                    <div class="col-sm-10">
                        <input type="file" name="imgname" class="form-control" id="imgname" style="display:none" >
                        <a href="javascript:void(0);" onclick="$('#imgname').trigger('click')">
                            <img src="/uimg/${marker.img}" id="preview" style="width:300px; height:300px">
                        </a>
                    </div>
                </div>
                <div class="form-group">
                    <input type="hidden" name="id" value="${marker.id}">
                    <input type="hidden" name="img" value="${marker.img}">
                    <label class="control-label col-sm-2" for="title">TITLE :</label>
                    <div class="col-sm-10">
                        <input type="text" name="title" class="form-control" id="title" value="${marker.title}">
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-2" for="target">TARGET :</label>
                    <div class="col-sm-10">
                        <input type="text" name="target" class="form-control" id="target" value="${marker.target}">
                    </div>
                </div>
                <%-- 이미지 한번에 업로드 할 수 있다.--%>
                <div class="form-group">
                    <label class="control-label col-sm-2" for="lat">LAT :</label>
                    <div class="col-sm-10">
                        <input type="number" name="lat" class="form-control" id="lat" value="${marker.lat}">
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-2" for="lat">LAT :</label>
                    <div class="col-sm-10">
                        <input type="number" name="lng" class="form-control" id="lng" value="${marker.lng}">
                    </div>
                </div>

                <div class="form-group">
                    <label for="loc">Select LOC</label>
                    <select class="form-control" id="loc" name="loc" value="${marker.loc}">
                        <option>S</option>
                        <option>B</option>
                        <option>J</option>
                    </select>
                </div>
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