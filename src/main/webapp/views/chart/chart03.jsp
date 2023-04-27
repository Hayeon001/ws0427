<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="EUC-KR" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%--<style>--%>
<%--    #c1,#c2,#c3{--%>
<%--        width: 250px;--%>
<%--        height: 300px;--%>
<%--        border: 2px solid dodgerblue;--%>
<%--        margin: 0 10px;--%>
<%--    }--%>
<%--</style>--%>
<script>
    let chart03 = {
        init:function (){
            this.getdata1();
            this.getdata2();
            this.getdata3();
            this.getdata4();
        },
        getdata1:function (){
            $.ajax({
                url:'/chart0301',
                success:function(result){
                    chart03.display1(result);
                }
            });
        },
        getdata2:function (){
            $.ajax({
                url:'/chart0302',
                success:function(result){
                    chart03.display2(result);
                }
            });
        },
        getdata3:function (){
            $.ajax({
                url:'/chart0303',
                success:function(result){
                    chart03.display3(result);
                }
            });
        },
        getdata4:function (){
            $.ajax({
                url:'/chart0304',
                success:function(result){
                    chart03.display4(result);
                }
            });
        },

        display1:function (result){
            //차트1 그리는부분
            Highcharts.chart('c1', {
                chart: {
                    type: 'pie',
                    options3d: {
                        enabled: true,
                        alpha: 45
                    }
                },
                title: {
                    text: 'Beijing 2022 gold medals by country',
                    align: 'left'
                },
                subtitle: {
                    text: '3D donut in Highcharts',
                    align: 'left'
                },
                plotOptions: {
                    pie: {
                        innerSize: 100,
                        depth: 45
                    }
                },
                series: [{
                    name: 'Medals',
                    // data: [  // 배열안에 배열
                    //     ['Norway', 16],
                    //     ['Germany', 12],
                    //     ['USA', 8],
                    //     ['Sweden', 8],
                    //     ['Netherlands', 8],
                    //     ['ROC', 6],
                    //     ['Austria', 7],
                    //     ['Canada', 4],
                    //     ['Japan', 3]
                    //
                    // ]
                    data: result
                }]
            });
            //차트1 끝
        },
        display2:function (){
            Highcharts.chart('c2', {
                title: {
                    text: 'Sales of petroleum products March, Norway',
                    align: 'left'
                },
                xAxis: {
                    categories: ['Jet fuel', 'Duty-free diesel', 'Petrol', 'Diesel', 'Gas oil']
                },
                yAxis: {
                    title: {
                        text: 'Million liters'
                    }
                },
                tooltip: {
                    valueSuffix: ' million liters'
                },
                plotOptions: {
                    series: {
                        borderRadius: '25%'
                    }
                },
                series: [{
                    type: 'column',
                    name: '2020',
                    data: [59, 83, 65, 228, 184]
                }, {
                    type: 'column',
                    name: '2021',
                    data: [24, 79, 72, 240, 167]
                }, {
                    type: 'column',
                    name: '2022',
                    data: [58, 88, 75, 250, 176]
                }, {
                    type: 'spline',
                    name: 'Average',
                    data: [47, 83.33, 70.66, 239.33, 175.66],
                    marker: {
                        lineWidth: 2,
                        lineColor: Highcharts.getOptions().colors[3],
                        fillColor: 'white'
                    }
                }, {
                    type: 'pie',
                    name: 'Total',
                    data: [{
                        name: '2020',
                        y: 619,
                        color: Highcharts.getOptions().colors[0], // 2020 color
                        dataLabels: {
                            enabled: true,
                            distance: -50,
                            format: '{point.total} M',
                            style: {
                                fontSize: '15px'
                            }
                        }
                    }, {
                        name: '2021',
                        y: 586,
                        color: Highcharts.getOptions().colors[1] // 2021 color
                    }, {
                        name: '2022',
                        y: 647,
                        color: Highcharts.getOptions().colors[2] // 2022 color
                    }],
                    center: [75, 65],
                    size: 100,
                    innerSize: '70%',
                    showInLegend: false,
                    dataLabels: {
                        enabled: false
                    }
                }]
            });

        },
        display3:function (result) {
            Highcharts.chart('c3', {
                chart: {
                    type: 'area',
                    options3d: {
                        enabled: true,
                        alpha: 15,
                        beta: 30,
                        depth: 200
                    }
                },
                title: {
                    text: 'Visual comparison of Mountains Panorama'
                },
                accessibility: {
                    description: 'The chart is showing the shapes of three mountain ranges as three area line series laid out in 3D behind each other.',
                    keyboardNavigation: {
                        seriesNavigation: {
                            mode: 'serialize'
                        }
                    }
                },
                lang: {
                    accessibility: {
                        axis: {
                            xAxisDescriptionPlural: 'The chart has 3 unlabelled X axes, one for each series.'
                        }
                    }
                },
                yAxis: {
                    title: {
                        text: 'Height Above Sea Level',
                        x: -40
                    },
                    labels: {
                        format: '{value:,.0f} MAMSL'
                    },
                    gridLineDashStyle: 'Dash'
                },
                xAxis: [{
                    visible: false
                }, {
                    visible: false
                }, {
                    visible: false
                }],
                plotOptions: {
                    area: {
                        depth: 100,
                        marker: {
                            enabled: false
                        },
                        states: {
                            inactive: {
                                enabled: false
                            }
                        }
                    }
                },
                tooltip: {
                    valueSuffix: ' MAMSL'
                },
                series: [{
                    name: 'Tatra Mountains visible from Rusinowa polana',
                    lineColor: 'rgb(180,90,50)',
                    color: 'rgb(200,110,50)',
                    fillColor: 'rgb(200,110,50)',
                    data: result
                    //     [
                    //     ['Mura?', 1890],
                    //     ['Nowy Wierch', 2009],
                    //     ['Hawra?', 2152],
                    //     ['Płaczliwa Skała', 2142],
                    //     ['Szalony Wierch', 2061],
                    //     ['Karczmarski Wierch', 1438],
                    //     ['Jagni?cy Szczyt', 2230],
                    //     ['Czerwona Turnia', 2284],
                    //     ['Kołowy Szczyt', 2418],
                    //     ['Czarny Szczyt', 2429],
                    //     ['Baranie Rogi', 2526],
                    //     ['?nie?ny Szczyt', 2465],
                    //     ['Lodowy Szczyt', 2627],
                    //     ['Lodowa Kopa', 2602],
                    //     ['Szeroka Jaworzy?ska', 2210],
                    //     ['Horwacki Wierch', 1902],
                    //     ['Spismichałowa Czuba', 2012],
                    //     ['Zielona Czuba', 2130],
                    //     ['Wielicki Szczyt', 2318],
                    //     ['Gerlach', 2655],
                    //     ['Baty?owiecki Szczyt', 2448],
                    //     ['Kaczy Szczyt', 2395],
                    //     ['Zmarzły Szczyt', 2390],
                    //     ['Ko?czysta', 2538],
                    //     ['Młynarz', 2170],
                    //     ['Ganek', 2462],
                    //     ['Wysoka', 2547],
                    //     ['Ci??ki Szczyt', 2520],
                    //     ['Rysy', 2503],
                    //     ['?abi Mnich', 2146],
                    //     ['?abi Ko?', 2291],
                    //     ['?abia Turnia Mi?guszowiecka', 2335],
                    //     ['Wołowa Turnia', 2373]
                    // ]
                }, {
                    xAxis: 1,
                    lineColor: 'rgb(120,160,180)',
                    color: 'rgb(140,180,200)',
                    fillColor: 'rgb(140,180,200)',
                    name: 'Dachstein panorama seen from Krippenstein',
                    data: result
                    //     [
                    //     ['Kufstein', 2049],
                    //     ['Hohe Wildstelle', 2746],
                    //     ['Kleiner Miesberg', 2173],
                    //     ['Großer Miesberg', 2202],
                    //     ['Hochstein', 2543],
                    //     ['Lackner Miesberg', 2232],
                    //     ['Wasenspitze', 2257],
                    //     ['Sinabell', 2349],
                    //     ['Feister Scharte', 2198],
                    //     ['Eselstein', 2556],
                    //     ['Landfriedstein', 2536],
                    //     ['Scheichenspitz', 2667],
                    //     ['Schmiedstock', 2634],
                    //     ['Gamsfeldspitze', 2611],
                    //     ['Edelgriess', 2305],
                    //     ['Koppenkarstein', 2863],
                    //     ['Niederer Gjaidstein', 2483],
                    //     ['Hoher Gjaidstein', 2794],
                    //     ['Hoher Dachstein', 2995],
                    //     ['Niederer Dachstein', 2934],
                    //     ['Hohes Kreuz', 2837],
                    //     ['Hoher Ochsenkogel', 2513]
                    // ]
                }, {
                    xAxis: 2,
                    lineColor: 'rgb(200, 190, 140)',
                    color: 'rgb(200, 190, 140)',
                    fillColor: 'rgb(230, 220, 180)',
                    name: 'Panorama from Col Des Mines',
                    data: result
                    //     [
                    //     ['Combin de la Tsessette', 4141],
                    //     ['Grand Combin de Grafeneire', 4314],
                    //     ['Combin de Corbassi?re', 3716],
                    //     ['Petit Combin', 3672],
                    //     ['Pointe de Boveire', 3212],
                    //     ['Grand Aget', 3133],
                    //     ['Mont Rogneux', 3084],
                    //     ['Dents du Grand L?', 2884],
                    //     ['Monts Telliers', 2951],
                    //     ['Grand Golliat', 3238],
                    //     ['Mont Grande Roch?re', 3326],
                    //     ['Mont de la Fouly', 2871],
                    //     ['T?te de la Payanne', 2452],
                    //     ['Pointe Allobrogia', 3172],
                    //     ['Six Blanc', 2334],
                    //     ['Mont Dolent', 3820],
                    //     ['Aiguille de Triolet', 3870],
                    //     ['Le Tour Noir', 3836],
                    //     ['Aiguille de l\'A Neuve', 3753],
                    //     ['Aiguille d\'Argenti?re', 3900],
                    //     ['Aiguille du Chardonnet', 3824],
                    //     ['Aiguille du Tour', 3540],
                    //     ['Aiguille du Pissoir', 3440],
                    //     ['Le Catogne', 2598],
                    //     ['Pointe de Prosom', 2762],
                    //     ['Pointe Ronde', 2700],
                    //     ['Mont Buet', 3096],
                    //     ['Le Cheval Blanc', 2831],
                    //     ['Pointe de la Finive', 2838],
                    //     ['Pic de Tenneverge', 2985],
                    //     ['Pointe d\'Aboillon', 2819],
                    //     ['Tour Salli?re', 3220],
                    //     ['Le D?me', 3138],
                    //     ['Haute Cime', 3257],
                    //     ['Pierre Avoi', 2473],
                    //     ['Cime de l\'Est', 3178]
                    // ]
                }]
            });
        },
        display4:function (result){
            var categories = [
                '0-4', '5-9', '10-14', '15-19', '20-24', '25-29', '30-34', '35-40', '40-45',
                '45-49', '50-54', '55-59', '60-64', '65-69', '70-74', '75-79', '80+'
            ];

            Highcharts.chart('c4', {
                chart: {
                    type: 'bar'
                },
                title: {
                    text: 'Population pyramid for Somalia, 2021',
                    align: 'left'
                },
                subtitle: {
                    text: 'Source: <a ' +
                        'href="https://countryeconomy.com/demography/population-structure/somalia"' +
                        'target="_blank">countryeconomy.com</a>',
                    align: 'left'
                },
                accessibility: {
                    point: {
                        valueDescriptionFormat: '{index}. Age {xDescription}, {value}%.'
                    }
                },
                xAxis: [{
                    categories: categories,
                    reversed: false,
                    labels: {
                        step: 1
                    },
                    accessibility: {
                        description: 'Age (male)'
                    }
                }, { // mirror axis on right side
                    opposite: true,
                    reversed: false,
                    categories: categories,
                    linkedTo: 0,
                    labels: {
                        step: 1
                    },
                    accessibility: {
                        description: 'Age (female)'
                    }
                }],
                yAxis: {
                    title: {
                        text: null
                    },
                    labels: {
                        formatter: function () {
                            return Math.abs(this.value) + '%';
                        }
                    },
                    accessibility: {
                        description: 'Percentage population',
                        rangeDescription: 'Range: 0 to 5%'
                    }
                },

                plotOptions: {
                    series: {
                        stacking: 'normal',
                        borderRadius: '50%'
                    }
                },

                tooltip: {
                    formatter: function () {
                        return '<b>' + this.series.name + ', age ' + this.point.category + '</b><br/>' +
                            'Population: ' + Highcharts.numberFormat(Math.abs(this.point.y), 1) + '%';
                    }
                },

                series: [{
                    name: 'Male',
                    data: [
                        -8.98, -7.52, -6.65, -5.72, -4.85,
                        -3.71, -2.76, -2.07, -1.70, -1.47,
                        -1.22, -0.99, -0.81, -0.62, -0.41,
                        -0.23, -0.15
                    ]
                }, {
                    name: 'Female',
                    data: [
                        8.84, 7.42, 6.57, 5.68, 4.83,
                        3.74, 2.80, 2.14, 1.79, 1.59,
                        1.34, 1.06, 0.83, 0.63, 0.43,
                        0.25, 0.19
                    ]
                }]
            });
        }
    }
    $(function(){
        chart03.init();
    });
</script>

<div class="col-sm-8 text-left">
    <div class="container">
        <h3>CHART03</h3>
        <div class="row">
            <div class="col-sm-4" id="c1" style="margin-right: 50px"></div>
            <div class="col-sm-4" id="c2"></div>
        </div>
        <div class="row">
            <div class="col-sm-4" id="c3" style="margin-right: 50px"></div>
            <div class="col-sm-4" id="c4"></div>
        </div>
    </div>
</div>