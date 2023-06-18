<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<style>
    #w2 {
        width:500px;
        border : 1px solid green;
    }
</style>

<script>
    let center = {
        init : function () {
            $.ajax({
                url : '/weather2',
                success : function (data) {
                   console.log(data);
                   center.display(data);
                }
            })
        },
        display : function (data) {
            //result 는 배열값. for 문 돌려서 끄집어 냄
            let result = data.response.body.items.item;
            let txt = "";
            $(result).each(function (index, item) {
                txt += '<h5>';
                txt += item.tm + '' + item.ta;
                txt += '</h5>';
            });
            $('#w2').html(txt);
        }
    };
    $(function () {
        // center.init();
    })
</script>
<div class="col-sm-8 text-left">
    <h1>공공데이터 API</h1>
    <div>
        <label for="w1">1</label>
        <textarea id="w1" cols="50" rows="30">${weatherinfo}</textarea>
    </div>
    <div>
        <div id="w2" cols="50" rows="30"></div>
    </div>
</div>