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
        markers_arr   : [ ], // �迭
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
                center: new kakao.maps.LatLng(37.5113184, 127.0116847), // ������ �߽���ǥ
                level : 3 // ������ Ȯ�� ����
            };
            // ������ ǥ���� div��  ���� �ɼ�����  ������ �����մϴ�
            map = new kakao.maps.Map(mapContainer, mapOption);
            var mapTypeControl = new kakao.maps.MapTypeControl();
            // ������ ��Ʈ���� �߰��ؾ� �������� ǥ�õ˴ϴ�
            // kakao.maps.ControlPosition�� ��Ʈ���� ǥ�õ� ��ġ�� �����ϴµ� TOPRIGHT�� ������ ���� �ǹ��մϴ�
            map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
            // ���� Ȯ�� ��Ҹ� ������ �� �ִ�  �� ��Ʈ���� �����մϴ�
            var zoomControl = new kakao.maps.ZoomControl();
            map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
            // ��Ŀ�� ǥ�õ� ��ġ�Դϴ�
            var markerPosition = new kakao.maps.LatLng(37.5333184, 127.0486847);
            var marker = new kakao.maps.Marker({
                position: markerPosition
            });
            // ��Ŀ�� ���� ���� ǥ�õǵ��� �����մϴ�
            marker.setMap(map);
        },
        go            : function (lat, lng, loc) {
            var moveLatLon = new kakao.maps.LatLng(lat, lng);
            // ���� �߽��� �̵� ��ŵ�ϴ�
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

            // ��� ��Ŀ ����
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

                // marker�� �迭�� �߰�
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

<%--            this.display();  //������ �ѷ���--%>
<%--            //$('#s_btn').click(function (){});  //��ư�� �̵� �̺�Ʈ ���̱�--%>
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
<%--        display:function (){  //���⿡--%>
<%--            var mapContainer = document.querySelector('#map03 > #map');--%>
<%--            var mapOption = {--%>
<%--                center: new kakao.maps.LatLng(37.5446805, 127.0567084), // ������ �߽���ǥ--%>
<%--                level: 5 // ������ Ȯ�� ����--%>
<%--            };--%>
<%--            map = new kakao.maps.Map(mapContainer, mapOption);--%>

<%--            var mapTypeControl = new kakao.maps.MapTypeControl();--%>
<%--            map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);--%>
<%--            var zoomControl = new kakao.maps.ZoomControl();--%>
<%--            map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);--%>

<%--            //��Ŀ--%>
<%--            var markerPosition  = new kakao.maps.LatLng(37.5446805, 127.0567084);--%>
<%--            var marker = new kakao.maps.Marker({--%>
<%--                position: markerPosition--%>
<%--            });--%>
<%--            marker.setMap(map);--%>
<%--        },--%>

<%--        //Ŭ���ϸ� ���� ��ǥ�� �̵��ϰ� ��Ŀ ���--%>
<%--        go:function (lat, lng, loc){--%>
<%--            var moveLatLon = new kakao.maps.LatLng(lat, lng);--%>
<%--            map.panTo(moveLatLon);--%>
<%--            //��Ŀ���--%>
<%--            var markerPosition  = new kakao.maps.LatLng(lat, lng);--%>
<%--            var marker = new kakao.maps.Marker({--%>
<%--                position: markerPosition--%>
<%--            });--%>
<%--            marker.setMap(map);--%>
<%--            map03.markers(loc);--%>
<%--        },--%>
<%--        //������ �޶�� ��û�ϱ�--%>
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

<%--            //������ �ֱ�--%>
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

<%--            //������ ��Ŀ ǥ��--%>
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

<%--            //} // �����ͳֱ� end--%>
<%--        }--%>
<%--    };--%>
<%--    $(function(){--%>
<%--        map03.init()--%>
<%--    });--%>
<%--</script>--%>

<div class="col-sm-8 text-left">
    <div class="container" id="map03">
        <h3>MAP03</h3>
        <button id="s_btn" type="button" class="btn btn-primary">����</button>
        <button id="b_btn" type="button" class="btn btn-primary">�λ�</button>
        <button id="j_btn" type="button" class="btn btn-primary">����</button>
        <div id="map"></div> <%--���������� ��Ÿ�� �ʼ�!--%>
    </div>
</div>