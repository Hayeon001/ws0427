<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="EUC-KR" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style>
    #map02 > #map{
        width: 400px;
        height: 400px;
        border: 2px solid red;
    }
</style>
<script>
    let map02 ={
        map:null,
        init:function (){
            this.display();  //������ �ѷ���
            //$('#s_btn').click(function (){});  //��ư�� �̵� �̺�Ʈ ���̱�
            $('#s_btn').click(function (){
                map02.go(37.579617, 126.977041);
            });
            $('#b_btn').click(function (){
                map02.go(35.2100142,129.0688702);
            });
            $('#j_btn').click(function (){
                map02.go(33.2541205,126.560076);
            });
        },
        display:function (){  //���⿡
            var mapContainer = document.querySelector('#map02 > #map');
            var mapOption = {
                center: new kakao.maps.LatLng(37.5446805, 127.0567084), // ������ �߽���ǥ
                level: 5 // ������ Ȯ�� ����
            };
            map = new kakao.maps.Map(mapContainer, mapOption);

            var mapTypeControl = new kakao.maps.MapTypeControl();
            map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
            var zoomControl = new kakao.maps.ZoomControl();
            map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);

            //��Ŀ
            var markerPosition  = new kakao.maps.LatLng(37.5446805, 127.0567084);
            var marker = new kakao.maps.Marker({
                position: markerPosition
            });
            marker.setMap(map);
        },

        //Ŭ���ϸ� ���� ��ǥ�� �̵��ϰ� ��Ŀ ���
        go:function (lat, lng){
            var moveLatLon = new kakao.maps.LatLng(lat, lng);
            map.panTo(moveLatLon);
            //��Ŀ
            var markerPosition  = new kakao.maps.LatLng(lat, lng);
            var marker = new kakao.maps.Marker({
                position: markerPosition
            });
            marker.setMap(map);
            }
    };
    $(function(){
        map02.init()
    });
</script>

<div class="col-sm-8 text-left">
    <div class="container" id="map02">
        <h3>MAP02</h3>
        <button id="s_btn" type="button" class="btn btn-primary">Seoul</button>
        <button id="b_btn" type="button" class="btn btn-primary">Busan</button>
        <button id="j_btn" type="button" class="btn btn-primary">Jeju</button>
        <div id="map"></div> <%--���������� ��Ÿ�� �ʼ�!--%>
        <%--��ư Ŭ���ϸ� �ش����� ��ǥ�� �̵�--%>

    </div>
</div>

<%--
���� Maps Ȱ��
����      37.5446805  127.0567084

����      37.579617   126.977041
�λ�      35.2100142  129.0688702
����      33.2541205  126.560076
--%>