<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="EUC-KR" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%--
https://www.highcharts.com/demo
하이차트닷컴
--%>

<style>
    #container{
        width: 600px;
        height: 400px;
        border: 2px solid blueviolet;
    }
</style>
<script>
    let chart01 = {
        init:function (){
            //전체 코드 복사 시작부분
            Highcharts.chart('container', {
                chart: {
                    type: 'spline'
                },
                title: {
                    text: 'Monthly Average Temperature'
                },
                subtitle: {
                    text: 'Source: ' +
                        '<a href="https://en.wikipedia.org/wiki/List_of_cities_by_average_temperature" ' +
                        'target="_blank">Wikipedia.com</a>'
                },
                xAxis: {
                    categories: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
                        'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
                    accessibility: {
                        description: 'Months of the year'
                    }
                },
                yAxis: {
                    title: {
                        text: 'Temperature'
                    },
                    labels: {
                        formatter: function () {
                            return this.value + '°';
                        }
                    }
                },
                tooltip: {
                    crosshairs: true,
                    shared: true
                },
                plotOptions: {
                    spline: {
                        marker: {
                            radius: 4,
                            lineColor: '#666666',
                            lineWidth: 1
                        }
                    }
                },
                //데이터
                series: [{
                    name: 'Tokyo',
                    marker: {
                        symbol: 'square'
                    },
                    data: [5.2, 5.7, 8.7, 13.9, 18.2, 21.4, 25.0, 26, 22.8, 17.5, 12.1, 7.6]
                    // data: [5.2, 5.7, 8.7, 13.9, 18.2, 21.4, 25.0, {
                    //     y: 26.4,
                    //     marker: {
                    //         symbol: 'url(https://www.highcharts.com/samples/graphics/sun.png)'
                    //     },
                    //     accessibility: {
                    //         description: 'Sunny symbol, this is the warmest point in the chart.'
                    //     }
                    // }, 22.8, 17.5, 12.1, 7.6]
                }, {
                    name: 'Bergen',
                    marker: {
                        symbol: 'diamond'
                    },
                    data: [1.0, 1.6, 3.3, 5.9, 10.5, 13.5, 14.5, 14.4, 11.5, 8.7, 4.7, 2.6]
                    // data: [{
                    //     y: 1.5,
                    //     marker: {
                    //         symbol: 'url(https://www.highcharts.com/samples/graphics/snow.png)'
                    //     },
                    //     accessibility: {
                    //         description: 'Snowy symbol, this is the coldest point in the chart.'
                    //     }
                    // }, 1.6, 3.3, 5.9, 10.5, 13.5, 14.5, 14.4, 11.5, 8.7, 4.7, 2.6]
                }, {
                    name: 'Seoul',
                    marker: {
                        symbol: 'diamond'
                    },
                    data: [2.0, 1.8, 3.7, 6.9, 13.5, 15.5, 18.5, 17.4, 14.5, 7.7, 3.7, 1.6]

                }
                ]
            });
            //전체코드복사 끝
        }
    };
    $(function(){
        chart01.init();
    });
</script>

<div class="col-sm-8 text-left">
    <div class="container">
        <h3>CHART01</h3>
        <%--지도가 뿌려지는 영역--%>
        <div id="container"></div>

    </div>
</div>