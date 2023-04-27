<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="EUC-KR" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=da86c8457c75372952796f5bbc52cb25"></script>
<style>
    #map01 > #map{
        width: 400px;
        height: 400px;
        border: 2px solid red;
    }
</style>
<script>
    let map01={
        map:null,
        init:function(){
            var mapContainer = document.querySelector('#map');
            var mapOption = {
                center: new kakao.maps.LatLng(33.450701, 126.570667), // ������ �߽���ǥ
                level: 3 // ������ Ȯ�� ����
            };
            map = new kakao.maps.Map(mapContainer, mapOption);

            //////////////////////////////////
            //
            //var map = new kakao.maps.Map(mapContainer, mapOption); // ������ �����մϴ�
            // �Ϲ� ������ ��ī�̺�� ���� Ÿ���� ��ȯ�� �� �ִ� ����Ÿ�� ��Ʈ���� �����մϴ�
            var mapTypeControl = new kakao.maps.MapTypeControl();

            // ������ ��Ʈ���� �߰��ؾ� �������� ǥ�õ˴ϴ�
            // kakao.maps.ControlPosition�� ��Ʈ���� ǥ�õ� ��ġ�� �����ϴµ� TOPRIGHT�� ������ ���� �ǹ��մϴ�
            map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

            // ���� Ȯ�� ��Ҹ� ������ �� �ִ�  �� ��Ʈ���� �����մϴ�
            var zoomControl = new kakao.maps.ZoomControl();
            map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);

            /////////////////////////
            //��Ŀ�����ϱ�
            // ��Ŀ�� ǥ�õ� ��ġ�Դϴ�
            var markerPosition  = new kakao.maps.LatLng(33.450701, 126.570667);
            // ��Ŀ�� �����մϴ�
            var marker = new kakao.maps.Marker({
                position: markerPosition
            });
            // ��Ŀ�� ���� ���� ǥ�õǵ��� �����մϴ�
            marker.setMap(map);

            ////////////////////
            //�̹��� ����
            var iwContent= '<img src="/img/fjords.jpg" style="width:80px"><div style="padding:5px">Hello</div>'


            /////////////////////////
            //��Ŀ�� ���콺�̺�Ʈ ����ϱ�
            // ��Ŀ�� Ŀ���� �������� �� ��Ŀ ���� ǥ���� ���������츦 �����մϴ�
            var iwContent = '<div style="padding:5px;">Hello World!</div>'; // ���������쿡 ǥ��� �������� HTML ���ڿ��̳� document element�� �����մϴ�
            // ���������츦 �����մϴ�
            var infowindow = new kakao.maps.InfoWindow({
                content : iwContent
            });
            // ��Ŀ�� ���콺���� �̺�Ʈ�� ����մϴ�
            kakao.maps.event.addListener(marker, 'mouseover', function() {
                // ��Ŀ�� ���콺���� �̺�Ʈ�� �߻��ϸ� ���������츦 ��Ŀ���� ǥ���մϴ�
                infowindow.open(map, marker);
            });
            // ��Ŀ�� ���콺�ƿ� �̺�Ʈ�� ����մϴ�
            kakao.maps.event.addListener(marker, 'mouseout', function() {
                // ��Ŀ�� ���콺�ƿ� �̺�Ʈ�� �߻��ϸ� ���������츦 �����մϴ�
                infowindow.close();
            });

            /////////////////////
            //Ŭ���̺�Ʈ �߰�
            kakao.maps.event.addListener(marker, 'click', function() {
                // ��Ŀ�� ���콺�ƿ� �̺�Ʈ�� �߻��ϸ� ���������츦 �����մϴ�
                location.href="http://www.naver.com";
            });


        }
    };
    $(function(){
        map01.init()
    });
</script>

<div class="col-sm-8 text-left">
    <div class="container" id="map01">
        <h3>MAP01</h3>
<%--���� ���� �ڸ��� �ݵ�� ���μ��� ũ�� ���� �ʼ�!--%>
        <div id="map"></div>
    </div>
</div>