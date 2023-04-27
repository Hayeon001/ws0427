<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="EUC-KR" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style>
    #container{
        width: 600px;
        height: 400px;
        border: 2px solid blueviolet;
    }
</style>
<script>
    let chart02 = {
        init:function (){

            //(방법1)5초에 한번씩 데이터 불러오기
        //     $('#chart02 > button').on('click',()=>{
        //         //this.display();
        //         $.ajax({
        //             url:'/chart02',
        //             success:function (result){
        //                 //console.log(data);
        //                 chart02.display(result);
        //             }
        //         });
        //     });
        //
        //     setInterval(function (){},5000);
        // },

            //(방법2)5초에 한번씩 데이터 불러오기
            $('#chart02 > button').on('click',()=>{
                    chart02.getdata();
                });
                setInterval(chart02.getdata,5000);
            },
            getdata:function() {
                $.ajax({
                    url:'/chart02',
                    success: function (result) {
                        chart02.display(result);
                    }
                });
            },


        display:function(result){
            //차트 그리는 부분
            Highcharts.chart('container', {
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
                    // categories: ['Belgium', 'China', 'Denmark', 'Fiji', 'Germany', 'Netherlands', 'Russia',
                    //     'Sweden', 'Turkey', 'United States', 'Unspecified', 'Vietnam'],
                    categories: result.category,
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
                    // data: [16076, 112688, 39452, 0, 94352,
                    //     30495, 21813, 95908, 11596, 53771, null, 8270]
                    data: result.datas
                    //display:function (data)의 데이터가 여기로 들어옴
                }]
            });

            //차트 그리기 끝
        }
    };
    $(function(){
        chart02.init();
    });
</script>

<div class="col-sm-8 text-left">
    <div class="container" id="chart02">
        <h3>CHART02</h3>
        <button type="button" class="btn btn-primary" id="button">Chart</button>
        <div id="container"></div>
    </div>
</div>