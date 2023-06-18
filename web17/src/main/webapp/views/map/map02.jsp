<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<style>
    #map02 > #map{
        width:400px;
        height:400px;
        border:1px solid green;
    }
</style>
<script>
    let map02 = {
        map : null,
        init: function () {
            this.display();
            $('#s_btn').click(function () {
                map02.go(37.579617, 126.977041);
            });
            $('#b_btn').click(function () {
                map02.go(35.1009643, 129.0291238);
            });
            $('#j_btn').click(function () {
                map02.go(33.5042977, 126.954048);
            });
        },
        display:function () {
            let mapContainer = document.querySelector('#map');
            let mapOption = {
                center: new kakao.maps.LatLng(37.5449833, 127.0557403),
                // 지도의 중심좌표
                level: 3 // 지도의 확대 레벨
            };
            // 마커를 표시할 위치와 title 객체 배열입니다
            // 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
            var map = new kakao.maps.Map(mapContainer, mapOption);
            // 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
            var mapTypeControl = new kakao.maps.MapTypeControl();

            // 지도에 컨트롤을 추가해야 지도위에 표시됩니다
            // kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
            map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

            // 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
            var zoomControl = new kakao.maps.ZoomControl();
            // 마커가 표시될 위치입니다
            var markerPosition  = new kakao.maps.LatLng(37.5449833, 127.0557403);

            // 마커를 생성합니다
            var marker = new kakao.maps.Marker({
                position: markerPosition
            });

            map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
            // 마커가 지도 위에 표시되도록 설정합니다
            marker.setMap(map);

        },
        go: function (lat, lng) {
            let mapContainer = document.querySelector('#map');
            let mapOption = {
                center: new kakao.maps.LatLng(lat, lng),
                // 지도의 중심좌표
                level: 3 // 지도의 확대 레벨
            };
            // 마커를 표시할 위치와 title 객체 배열입니다
            // 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
            var map = new kakao.maps.Map(mapContainer, mapOption);
            var moveLatLon = new kakao.maps.LatLng(lat, lng);
            map.panTo(moveLatLon);
            var markerPosition  = new kakao.maps.LatLng(lat, lng);
            var marker = new kakao.maps.Marker({
                position: markerPosition
            });
            marker.setMap(map);
        },
    };
    $(function () {
        map02.init();
    });
</script>
<div class="col-sm-8 text-left">
    <div class="container" id="map02">
        <h1>Map02</h1>
        <button id="s_btn" type="button" class="btn btn-info">Seoul</button>
        <button id="b_btn" type="button" class="btn btn-info">Busan</button>
        <button id="j_btn" type="button" class="btn btn-info">Jeju</button>
        <div id="map"></div>

    </div>
</div>