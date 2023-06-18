<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
    #getdata > div {
        width:500px;
        border : 1px solid green;
    }
</style>

<script>
    /*
        웹소켓 : 서버가 클라리언트에게 데이터 보내주는 형태
     */
    let ajax03 = {
        init : function () {
            $('#getdata > button').click(function () {
                $.ajax({
                    url : '/getdata',
                    success: function (result) {
                        ajax03.display(result)
                    },
                })
            })
            // setInterval(function () {
            //     $.ajax({
            //         url : '/getdata',
            //         success: function (data) {
            //             ajax03.display(data)
            //         },
            //     })
            // }, 3000);
        },
        display: function (data) {
            let result = "";
            $(data).each(function (index, item) {
                result += '<h4>';
                result += item.id + ' ' + item.pwd + ' ' + item.name;
                result += '</h4>';

            });
            $('#getdata > div').html(result);
        },
    }
    $(function () {
        ajax03.init();
    });
</script>
<div class="col-sm-8 text-left">
    <div class="container" id="getdata">
        <h3>Ajax03</h3>
        <button type="button" class="btn btn-success">Success</button>
        <div></div>

    </div>
</div>