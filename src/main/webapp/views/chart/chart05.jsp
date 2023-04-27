<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="EUC-KR" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script>
    let chart05 = {
        init:function (){
            $('#get_btn').click(function (){
                var year = $('#sel1').val();
                //alert(year);
                chart05.getdata(year);
            })
        },
        getdata:function (year){
            $.ajax({
                url:'/chart05',
                data:{'year':year},
                success:function (result){
                    //alert(result);
                    chart05.display1(result);
                    chart05.display2(result);
                }
            });
        },
        display1:function (result){
            //차트 시작
            Highcharts.chart('c1', {
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
                series: [{
                    name: 'Seoul',
                    marker: {
                        symbol: 'square'
                    },
                    data: result
                    //     [5.2, 5.7, 8.7, 13.9, 18.2, 21.4, 25.0, {
                    //     y: 26.4,
                    //     marker: {
                    //         symbol: 'url(https://www.highcharts.com/samples/graphics/sun.png)'
                    //     },
                    //     accessibility: {
                    //         description: 'Sunny symbol, this is the warmest point in the chart.'
                    //     }
                    // }, 22.8, 17.5, 12.1, 7.6]
                }]
            });

            //차트 끝
        },
        display2:function (result){
            //차트시작
            Highcharts.chart('c2', {
                chart: {
                    type: 'column',
                    options3d: {
                        enabled: true,
                        alpha: 10,
                        beta: 25,
                        depth: 70
                    }
                },
                title: {
                    text: 'External trade in goods by country, Norway 2021',
                    align: 'left'
                },
                subtitle: {
                    text: 'Source: ' +
                        '<a href="https://www.ssb.no/en/statbank/table/08804/"' +
                        'target="_blank">SSB</a>',
                    align: 'left'
                },
                plotOptions: {
                    column: {
                        depth: 25
                    }
                },
                xAxis: {
                    categories: ['Belgium', 'China', 'Denmark', 'Fiji', 'Germany', 'Netherlands', 'Russia',
                        'Sweden', 'Turkey', 'United States', 'Unspecified', 'Vietnam'],
                    labels: {
                        skew3d: true,
                        style: {
                            fontSize: '16px'
                        }
                    }
                },
                yAxis: {
                    title: {
                        text: 'NOK (million)',
                        margin: 20
                    }
                },
                tooltip: {
                    valueSuffix: ' MNOK'
                },
                series: [{
                    name: 'Total imports',
                    data: result
                        // [16076, 112688, 39452, 0, 94352,
                        // 30495, 21813, 95908, 11596, 53771, null, 8270]
                }]
            });

            //차트 끝
        },
    }
    $(function(){
        chart05.init();
    });
</script>

<div class="col-sm-8 text-left">
    <div class="container">
        <h3>CHART05</h3>
        <div class="row">
            <div class="form-group col-sm-2">
                <label for="sel1">Year:</label>
                <select class="form-control" id="sel1">
    <%--                <option>1</option>--%>
    <%--                <option>2</option>--%>
    <%--                <option>3</option>--%>
    <%--                <option>4</option>--%>
                    <%--form을 던진다면 반드시 name과 value가 있어야함--%>

                    <%--JSTL방식--%>
                    <%--<c:forEach begin="" end="" var=""></c:forEach>--%>
                    <c:forEach begin="2010" end="2020" var="year">
                        <option value="${year}">${year}</option>
                    </c:forEach>
                </select>
                <button id="get_btn">GET</button>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-4" id="c1"></div>
            <div class="col-sm-4" id="c2"></div>
        </div>
    </div>
</div>