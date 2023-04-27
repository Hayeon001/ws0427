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
    let map03 = {
        markers_arr   : [ ], // 배열
        map           : null,
        init          : function () {
            this.display();
            $('#s_btn').click(function () {
                // map03.go(37.5733686, 127.0755721, 's');
                map03.go(37.640446, 127.014702, 's');
            });

            $('#b_btn').click(function () {
                // map03.go(35.1531696, 129.118666, 'b');
                map03.go(35.1798456, 129.0705432, 'b');
            });

            $('#j_btn').click(function () {
                // map03.go(33.2501708, 126.5636786, 'j');
                map03.go(33.4999002, 126.5341787, 'j');
            });

        },//end of init
        display       : function () {
            var mapContainer = document.querySelector('#map03 > #map');
            var mapOption = {
                center: new kakao.maps.LatLng(37.5113184, 127.0116847), // 지도의 중심좌표
                level : 3 // 지도의 확대 레벨
            };
            // 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
            map = new kakao.maps.Map(mapContainer, mapOption);
            var mapTypeControl = new kakao.maps.MapTypeControl();
            // 지도에 컨트롤을 추가해야 지도위에 표시됩니다
            // kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
            map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
            // 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
            var zoomControl = new kakao.maps.ZoomControl();
            map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
            // 마커가 표시될 위치입니다
            var markerPosition = new kakao.maps.LatLng(37.5333184, 127.0486847);
            var marker = new kakao.maps.Marker({
                position: markerPosition
            });
            // 마커가 지도 위에 표시되도록 설정합니다
            marker.setMap(map);
        },
        go            : function (lat, lng, loc) {
            var moveLatLon = new kakao.maps.LatLng(lat, lng);
            // 지도 중심을 이동 시킵니다
            map.panTo(moveLatLon);
            var markerPosition = new kakao.maps.LatLng(lat, lng);
            var marker = new kakao.maps.Marker({
                position: markerPosition
            });
            marker.setMap(map);

            map03.markers(loc);
        },
        markers       : function (loc) {
            $.ajax({
                url    : '/markers',
                data   : {'loc': loc.toUpperCase()},
                success: function (data) {
                    map03.displaymarkers(data);
                }
            });
        },
        displaymarkers: function (positions) {

            // 모든 마커 삭제
            map03.clearMarkers(map03.markers_arr);

            var market = null;
            var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";
            for (var i = 0; i < positions.length; i++) {
                var imageSize = new kakao.maps.Size(20, 30);
                var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);
                var markerPosition = new kakao.maps.LatLng(positions[i].lat, positions[i].lng);
                var marker = new kakao.maps.Marker({
                    map     : map,
                    position: markerPosition,
                    title   : positions[i].title,
                    image   : markerImage
                });

                // marker를 배열에 추가
                map03.markers_arr.push(marker);

                // infoWindow
                var iwContent = '<h2>' + positions[i].title + '</h2>';
                iwContent += '<img src="/uimg/' + positions[i].img + '" style="width:50px">';

                var infowindow = new kakao.maps.InfoWindow({
                    position: markerPosition,
                    content : iwContent
                })

                kakao.maps.event.addListener(marker, 'mouseover', mouseoverListener(marker, infowindow));
                kakao.maps.event.addListener(marker, 'mouseout', mouseoutListener(marker, infowindow));
                kakao.maps.event.addListener(marker, 'click', mouseclickListener(positions[i].target));


                function mouseoverListener(marker, infowindow) {
                    return function () {
                        infowindow.open(map, marker);
                    };
                }

                function mouseoutListener(marker, infowindow) {
                    return function () {
                        infowindow.close();
                    };
                }

                function mouseclickListener(target) {
                    return function () {
                        location.href = target;
                    };
                }
            } // end for
        },
        clearMarkers  : function (markers_arr) {
            if(markers_arr != null){
                for (let i = 0; i < map03.markers_arr.length; i++) {
                    map03.markers_arr[i].setMap(null);
                }
                map03.markers_arr = [];
            }
        }
    };
    $(function () {
        map03.init();
    })

</script>

<%--<script>--%>
<%--    let map03 ={--%>
<%--        map:null,--%>
<%--        init:function (){--%>

<%--            this.display();  //지도야 뿌려라--%>
<%--            //$('#s_btn').click(function (){});  //버튼에 이동 이벤트 붙이기--%>
<%--            $('#s_btn').click(function (){--%>
<%--                map03.go(37.638446, 127.013702, 'S');--%>
<%--            });--%>
<%--            $('#b_btn').click(function (){--%>
<%--                map03.go(35.1796456,129.0786432, 'B');--%>
<%--            });--%>
<%--            $('#j_btn').click(function (){--%>
<%--                map03.go(33.4998002,126.5355787, 'J');--%>
<%--            });--%>


<%--        },--%>
<%--        display:function (){  //여기에--%>
<%--            var mapContainer = document.querySelector('#map03 > #map');--%>
<%--            var mapOption = {--%>
<%--                center: new kakao.maps.LatLng(37.5446805, 127.0567084), // 지도의 중심좌표--%>
<%--                level: 5 // 지도의 확대 레벨--%>
<%--            };--%>
<%--            map = new kakao.maps.Map(mapContainer, mapOption);--%>

<%--            var mapTypeControl = new kakao.maps.MapTypeControl();--%>
<%--            map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);--%>
<%--            var zoomControl = new kakao.maps.ZoomControl();--%>
<%--            map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);--%>

<%--            //마커--%>
<%--            var markerPosition  = new kakao.maps.LatLng(37.5446805, 127.0567084);--%>
<%--            var marker = new kakao.maps.Marker({--%>
<%--                position: markerPosition--%>
<%--            });--%>
<%--            marker.setMap(map);--%>
<%--        },--%>

<%--        //클릭하면 지도 좌표로 이동하고 마커 찍기--%>
<%--        go:function (lat, lng, loc){--%>
<%--            var moveLatLon = new kakao.maps.LatLng(lat, lng);--%>
<%--            map.panTo(moveLatLon);--%>
<%--            //마커찍기--%>
<%--            var markerPosition  = new kakao.maps.LatLng(lat, lng);--%>
<%--            var marker = new kakao.maps.Marker({--%>
<%--                position: markerPosition--%>
<%--            });--%>
<%--            marker.setMap(map);--%>
<%--            map03.markers(loc);--%>
<%--        },--%>
<%--        //데이터 달라고 요청하기--%>
<%--        markers:function (loc){--%>
<%--            $.ajax({--%>
<%--                url:'/markers',--%>
<%--                data:{'loc':loc},--%>
<%--                success:function (data){--%>
<%--                    //alert(data);--%>
<%--                    map03.displaymarkers(data);--%>
<%--                }--%>
<%--            });--%>
<%--        },--%>
<%--        displaymarkers:function(positions){--%>

<%--            //데이터 넣기--%>
<%--            var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";--%>
<%--            var markers = [];--%>
<%--            //var overlays = [];--%>

<%--            for (var i = 0; i < positions.length; i ++) {--%>
<%--                var imageSize = new kakao.maps.Size(20, 30);--%>
<%--                var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);--%>
<%--                var markerPosition = new kakao.maps.LatLng(positions[i].lat, positions[i].lng);--%>

<%--                var marker = new kakao.maps.Marker({--%>
<%--                    //map: map,--%>
<%--                    position: markerPosition,--%>
<%--                    title: positions[i].title,--%>
<%--                    image: markerImage--%>
<%--                });--%>
<%--                // infoWindow--%>
<%--                var iwContent = '<h2>' + positions[i].title + '</h2>';--%>
<%--                iwContent += '<img src="/uimg/' + positions[i].img + '" style="width:50px">';--%>

<%--                var infowindow = new kakao.maps.InfoWindow({--%>
<%--                    position: markerPosition,--%>
<%--                    content: iwContent--%>
<%--                });--%>

<%--                markers.push(marker);--%>

<%--                kakao.maps.event.addListener(marker, 'mouseover', mouseoverListener(marker, infowindow));--%>
<%--                kakao.maps.event.addListener(marker, 'mouseout', mouseoutListener(marker, infowindow));--%>
<%--                kakao.maps.event.addListener(marker, 'click', mouseclickListener(positions[i].target));--%>
<%--            }--%>

<%--            //지도에 마커 표시--%>
<%--            for (var i = 0; i < markers.length; i++) {--%>
<%--                markers[i].setMap(map);--%>
<%--            }--%>

<%--                function mouseoverListener(marker, infowindow) {--%>
<%--                    return function(){--%>
<%--                        infowindow.open(map, marker);--%>
<%--                    };--%>
<%--                }--%>
<%--                function mouseoutListener(marker, infowindow) {--%>
<%--                    return function(){--%>
<%--                        infowindow.close();--%>
<%--                    };--%>
<%--                }--%>
<%--                function mouseclickListener(target) {--%>
<%--                    return function(){--%>
<%--                        location.href = target;--%>
<%--                    };--%>
<%--                }--%>

<%--            //} // 데이터넣기 end--%>
<%--        }--%>
<%--    };--%>
<%--    $(function(){--%>
<%--        map03.init()--%>
<%--    });--%>
<%--</script>--%>

<div class="col-sm-8 text-left">
    <div class="container" id="map03">
        <h3>MAP03</h3>
        <button id="s_btn" type="button" class="btn btn-primary">서울</button>
        <button id="b_btn" type="button" class="btn btn-primary">부산</button>
        <button id="j_btn" type="button" class="btn btn-primary">제주</button>
        <div id="map"></div> <%--지도영역엔 스타일 필수!--%>
    </div>
</div>