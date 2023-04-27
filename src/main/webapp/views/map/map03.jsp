<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="EUC-KR" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style>
    #map03 > #map{
        width: 700px;
        height: 400px;
        border: 2px solid deepskyblue;
    }
</style>
<script>
    let map03 ={
        map:null,
        init:function (){

            this.display();  //지도야 뿌려라
            //$('#s_btn').click(function (){});  //버튼에 이동 이벤트 붙이기
            $('#s_btn').click(function (){
                map03.go(37.579617, 126.977041, 's');
            });
            $('#b_btn').click(function (){
                map03.go(35.2100142,129.0688702, 'b');
            });
            $('#j_btn').click(function (){
                map03.go(37.5446805,127.0567084, 'j');
            });


        },
        display:function (){  //여기에
            var mapContainer = document.querySelector('#map03 > #map');
            var mapOption = {
                center: new kakao.maps.LatLng(37.5446805, 127.0567084), // 지도의 중심좌표
                level: 5 // 지도의 확대 레벨
            };
            map = new kakao.maps.Map(mapContainer, mapOption);

            var mapTypeControl = new kakao.maps.MapTypeControl();
            map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
            var zoomControl = new kakao.maps.ZoomControl();
            map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);

            //마커
            var markerPosition  = new kakao.maps.LatLng(37.5446805, 127.0567084);
            var marker = new kakao.maps.Marker({
                position: markerPosition
            });
            marker.setMap(map);
        },

        //클릭하면 지도 좌표로 이동하고 마커 찍기
        go:function (lat, lng, loc){
            var moveLatLon = new kakao.maps.LatLng(lat, lng);
            map.panTo(moveLatLon);
            //마커찍기
            var markerPosition  = new kakao.maps.LatLng(lat, lng);
            var marker = new kakao.maps.Marker({
                position: markerPosition
            });
            marker.setMap(map);
            map03.markers(loc);
        },
        //데이터 달라고 요청하기
        markers:function (loc){
            $.ajax({
                url:'/markers',
                data:{'loc':loc},
                success:function (data){
                    //alert(data);
                    map03.displaymarkers(data);
                }
            });
        },
        displaymarkers:function(positions){

            //데이터 넣기
            var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";
            for (var i = 0; i < positions.length; i ++) {
                var imageSize = new kakao.maps.Size(20, 30);
                var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);
                var markerPosition = new kakao.maps.LatLng(positions[i].lat, positions[i].lng);

                var marker = new kakao.maps.Marker({
                    map: map,
                    position: markerPosition,
                    title : positions[i].title,
                    image : markerImage
                });
                // infoWindow
                var iwContent = '<h2>'+positions[i].title+'</h2>';
                iwContent += '<img src="/img/'+positions[i].img+'" style="width:50px">';

                var infowindow = new kakao.maps.InfoWindow({
                    position : markerPosition,
                    content : iwContent
                });

                kakao.maps.event.addListener(marker, 'mouseover', mouseoverListener(marker, infowindow));
                kakao.maps.event.addListener(marker, 'mouseout', mouseoutListener(marker, infowindow));
                kakao.maps.event.addListener(marker, 'click', mouseclickListener(positions[i].target));


                function mouseoverListener(marker, infowindow) {
                    return function(){
                        infowindow.open(map, marker);
                    };
                }
                function mouseoutListener(marker, infowindow) {
                    return function(){
                        infowindow.close();
                    };
                }
                function mouseclickListener(target) {
                    return function(){
                        location.href = target;
                    };
                }

            } // 데이터넣기 end
        }
    };
    $(function(){
        map03.init()
    });
</script>

<div class="col-sm-8 text-left">
    <div class="container" id="map03">
        <h3>MAP03</h3>
        <button id="s_btn" type="button" class="btn btn-primary">서울</button>
        <button id="b_btn" type="button" class="btn btn-primary">부산</button>
        <button id="j_btn" type="button" class="btn btn-primary">성수</button>
        <div id="map"></div> <%--지도영역엔 스타일 필수!--%>
    </div>
</div>