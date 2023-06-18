<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
    #map01 {
        width:400px;
        height:400px;
        border:1px solid green;
    }
</style>
<script>
    let map01 = {
        map : null,
        init: function () {
            let mapContainer = document.querySelector('#map');
            let mapOption = {
                center: new kakao.maps.LatLng(${gmarket.lat}, ${gmarket.lng}),
                // 지도의 중심좌표
                level: 3 // 지도의 확대 레벨
            };
            // 마커를 표시할 위치와 title 객체 배열입니다
            // 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
            map = new kakao.maps.Map(mapContainer, mapOption);
            // 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
            var mapTypeControl = new kakao.maps.MapTypeControl();

            // 지도에 컨트롤을 추가해야 지도위에 표시됩니다
            // kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
            map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

            // 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
            var zoomControl = new kakao.maps.ZoomControl();
            // 마커가 표시될 위치입니다
            var markerPosition  = new kakao.maps.LatLng(${gmarket.lat}, ${gmarket.lng});

            // 마커를 생성합니다
            var marker = new kakao.maps.Marker({
                position: markerPosition
            });

            // 마커가 지도 위에 표시되도록 설정합니다
            marker.setMap(map);
            map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);

            // 마커에 커서가 오버됐을 때 마커 위에 표시할 인포윈도우를 생성합니다
            var iwContent = '<img src="/img/fjords.jpg" style="width : 100px"><div style="padding:5px;">Hello World!</divdiv>'; // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다

            // 인포윈도우를 생성합니다
            var infowindow = new kakao.maps.InfoWindow({
                content : iwContent
            });

            // 마커에 마우스오버 이벤트를 등록합니다
            kakao.maps.event.addListener(marker, 'mouseover', function() {
                // 마커에 마우스오버 이벤트가 발생하면 인포윈도우를 마커위에 표시합니다
                infowindow.open(map, marker);
            });

            // 마커에 마우스아웃 이벤트를 등록합니다
            kakao.maps.event.addListener(marker, 'mouseout', function() {
                // 마커에 마우스아웃 이벤트가 발생하면 인포윈도우를 제거합니다
                infowindow.close();
            });

            kakao.maps.event.addListener(marker, 'click', function() {
                // 마커에 마우스아웃 이벤트가 발생하면 인포윈도우를 제거합니다
                location.href="http://www.nate.com"
            });
        },
    }

    $(function () {
        map01.init();
    })
</script>
<div class="col-sm-8 text-left">
    <div class="container">

        <h1>Map center</h1>
        <a href="http://www.naver.com">
            <img src="/uimg/${gmarket.img}" />
        </a>
        <h3>${gmarket.id}</h3>
        <h4>${gmarket.title}</h4>
        <h3>${gmarket.lat}</h3>
        <h3>${gmarket.lng}</h3>
        <h3>${gmarket.loc}</h3>
        <div class="row content">
            <div class="col-sm-6 text-left">
                <h3>Detail All Page</h3>
                <table class="table table-hover">
                    <thead>
                    <tr>
                        <th>IMG</th>
                        <th>ITEM</th>
                        <th>PRICE</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="m" items="${mlist}">
                        <tr>
                            <td><img src="/uimg/${m.imgname}"></td>
                            <td>${m.item}</td>
                            <td>${m.price}</td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>