<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style>

</style>
<script>
    let chart03 = {
        init : function () {
            this.getdata1();
            this.getdata2();
            this.getdata3();
        },
        // 데이터 : 배열안에 배열 [[],[],[]]
        getdata1 : function () {
            $.ajax({
               url : '/chart0301',
               success: (result)=> {
                   this.display1(result);
               }
            });
        },
        getdata2: function () {
            $.ajax({
                url : '/chart0302',
                success: (result) => {
                    console.log(result);
                    this.display2(result);
                }
            })
        },
        getdata3: function () {
            $.ajax({
                url : '/chart0303',
                success : (result) => {
                    this.display3(result);
                }
            })
        },
        display1: function (result) {
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
                    name: 'Numbers',
                    data: result
                }]
            });

        },
        display2: function (result) {
            Highcharts.chart('c2', {
                chart: {
                    type: 'packedbubble',
                    height: '100%'
                },
                title: {
                    text: 'Carbon emissions around the world (2014)',
                    align: 'left'
                },
                tooltip: {
                    useHTML: true,
                    pointFormat: '<b>{point.name}:</b> {point.value}m CO<sub>2</sub>'
                },
                plotOptions: {
                    packedbubble: {
                        minSize: '20%',
                        maxSize: '100%',
                        zMin: 0,
                        zMax: 1000,
                        layoutAlgorithm: {
                            gravitationalConstant: 0.05,
                            splitSeries: true,
                            seriesInteraction: false,
                            dragBetweenSeries: true,
                            parentNodeLimit: true
                        },
                        dataLabels: {
                            enabled: true,
                            format: '{point.name}',
                            filter: {
                                property: 'y',
                                operator: '>',
                                value: 250
                            },
                            style: {
                                color: 'black',
                                textOutline: 'none',
                                fontWeight: 'normal'
                            }
                        }
                    }
                },
                series: [{
                    name: 'Europe',
                    data: [{
                        name: 'Germany',
                        value: 767.1
                    }, {
                        name: 'Croatia',
                        value: 20.7
                    },
                        {
                            name: 'Belgium',
                            value: 97.2
                        },
                        {
                            name: 'Czech Republic',
                            value: 111.7
                        },
                        {
                            name: 'Netherlands',
                            value: 158.1
                        },
                        {
                            name: 'Spain',
                            value: 241.6
                        },
                        {
                            name: 'Ukraine',
                            value: 249.1
                        },
                        {
                            name: 'Poland',
                            value: 298.1
                        },
                        {
                            name: 'France',
                            value: 323.7
                        },
                        {
                            name: 'Romania',
                            value: 78.3
                        },
                        {
                            name: 'United Kingdom',
                            value: 415.4
                        }, {
                            name: 'Turkey',
                            value: 353.2
                        }, {
                            name: 'Italy',
                            value: 337.6
                        },
                        {
                            name: 'Greece',
                            value: 71.1
                        },
                        {
                            name: 'Austria',
                            value: 69.8
                        },
                        {
                            name: 'Belarus',
                            value: 67.7
                        },
                        {
                            name: 'Serbia',
                            value: 59.3
                        },
                        {
                            name: 'Finland',
                            value: 54.8
                        },
                        {
                            name: 'Bulgaria',
                            value: 51.2
                        },
                        {
                            name: 'Portugal',
                            value: 48.3
                        },
                        {
                            name: 'Norway',
                            value: 44.4
                        },
                        {
                            name: 'Sweden',
                            value: 44.3
                        },
                        {
                            name: 'Hungary',
                            value: 43.7
                        },
                        {
                            name: 'Switzerland',
                            value: 40.2
                        },
                        {
                            name: 'Denmark',
                            value: 40
                        },
                        {
                            name: 'Slovakia',
                            value: 34.7
                        },
                        {
                            name: 'Ireland',
                            value: 34.6
                        },
                        {
                            name: 'Croatia',
                            value: 20.7
                        },
                        {
                            name: 'Estonia',
                            value: 19.4
                        },
                        {
                            name: 'Slovenia',
                            value: 16.7
                        },
                        {
                            name: 'Lithuania',
                            value: 12.3
                        },
                        {
                            name: 'Luxembourg',
                            value: 10.4
                        },
                        {
                            name: 'Macedonia',
                            value: 9.5
                        },
                        {
                            name: 'Moldova',
                            value: 7.8
                        },
                        {
                            name: 'Latvia',
                            value: 7.5
                        },
                        {
                            name: 'Cyprus',
                            value: 7.2
                        }]
                }, {
                    name: 'Africa',
                    data: result
                }, {
                    name: 'Oceania',
                    data: [{
                        name: 'Australia',
                        value: 409.4
                    },
                        {
                            name: 'New Zealand',
                            value: 34.1
                        },
                        {
                            name: 'Papua New Guinea',
                            value: 7.1
                        }]
                }, {
                    name: 'North America',
                    data: [{
                        name: 'Costa Rica',
                        value: 7.6
                    },
                        {
                            name: 'Honduras',
                            value: 8.4
                        },
                        {
                            name: 'Jamaica',
                            value: 8.3
                        },
                        {
                            name: 'Panama',
                            value: 10.2
                        },
                        {
                            name: 'Guatemala',
                            value: 12
                        },
                        {
                            name: 'Dominican Republic',
                            value: 23.4
                        },
                        {
                            name: 'Cuba',
                            value: 30.2
                        },
                        {
                            name: 'USA',
                            value: 5334.5
                        }, {
                            name: 'Canada',
                            value: 566
                        }, {
                            name: 'Mexico',
                            value: 456.3
                        }]
                }, {
                    name: 'South America',
                    data: result
                }, {
                    name: 'Asia',
                    data: [{
                        name: 'Nepal',
                        value: 6.5
                    },
                        {
                            name: 'Georgia',
                            value: 6.5
                        },
                        {
                            name: 'Brunei Darussalam',
                            value: 7.4
                        },
                        {
                            name: 'Kyrgyzstan',
                            value: 7.4
                        },
                        {
                            name: 'Afghanistan',
                            value: 7.9
                        },
                        {
                            name: 'Myanmar',
                            value: 9.1
                        },
                        {
                            name: 'Mongolia',
                            value: 14.7
                        },
                        {
                            name: 'Sri Lanka',
                            value: 16.6
                        },
                        {
                            name: 'Bahrain',
                            value: 20.5
                        },
                        {
                            name: 'Yemen',
                            value: 22.6
                        },
                        {
                            name: 'Jordan',
                            value: 22.3
                        },
                        {
                            name: 'Lebanon',
                            value: 21.1
                        },
                        {
                            name: 'Azerbaijan',
                            value: 31.7
                        },
                        {
                            name: 'Singapore',
                            value: 47.8
                        },
                        {
                            name: 'Hong Kong',
                            value: 49.9
                        },
                        {
                            name: 'Syria',
                            value: 52.7
                        },
                        {
                            name: 'DPR Korea',
                            value: 59.9
                        },
                        {
                            name: 'Israel',
                            value: 64.8
                        },
                        {
                            name: 'Turkmenistan',
                            value: 70.6
                        },
                        {
                            name: 'Oman',
                            value: 74.3
                        },
                        {
                            name: 'Qatar',
                            value: 88.8
                        },
                        {
                            name: 'Philippines',
                            value: 96.9
                        },
                        {
                            name: 'Kuwait',
                            value: 98.6
                        },
                        {
                            name: 'Uzbekistan',
                            value: 122.6
                        },
                        {
                            name: 'Iraq',
                            value: 139.9
                        },
                        {
                            name: 'Pakistan',
                            value: 158.1
                        },
                        {
                            name: 'Vietnam',
                            value: 190.2
                        },
                        {
                            name: 'United Arab Emirates',
                            value: 201.1
                        },
                        {
                            name: 'Malaysia',
                            value: 227.5
                        },
                        {
                            name: 'Kazakhstan',
                            value: 236.2
                        },
                        {
                            name: 'Thailand',
                            value: 272
                        },
                        {
                            name: 'Taiwan',
                            value: 276.7
                        },
                        {
                            name: 'Indonesia',
                            value: 453
                        },
                        {
                            name: 'Saudi Arabia',
                            value: 494.8
                        },
                        {
                            name: 'Japan',
                            value: 1278.9
                        },
                        {
                            name: 'China',
                            value: 10540.8
                        },
                        {
                            name: 'India',
                            value: 2341.9
                        },
                        {
                            name: 'Russia',
                            value: 1766.4
                        },
                        {
                            name: 'Iran',
                            value: 618.2
                        },
                        {
                            name: 'Korea',
                            value: 610.1
                        }]
                }]
            });

        },
        display3: function (result) {
            Highcharts.chart('c3', {
                chart: {
                    zoomType: 'xy'
                },
                title: {
                    text: 'Average Monthly Precipitation and Temperature in Karasjok, 2021',
                    align: 'left'
                },
                subtitle: {
                    text: 'Source: ' +
                        '<a href="https://www.yr.no/nb/historikk/graf/5-97251/Norge/Troms%20og%20Finnmark/Karasjok/Karasjok?q=2021"' +
                        'target="_blank">YR</a>'
                },
                xAxis: [{
                    categories: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
                        'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
                    crosshair: true
                }],
                yAxis: [{ // Primary yAxis
                    labels: {
                        format: '{value}°C',
                        style: {
                            color: Highcharts.getOptions().colors[1]
                        }
                    },
                    title: {
                        text: 'Temperature',
                        style: {
                            color: Highcharts.getOptions().colors[1]
                        }
                    }
                }, { // Secondary yAxis
                    title: {
                        text: 'Precipitation',
                        style: {
                            color: Highcharts.getOptions().colors[0]
                        }
                    },
                    labels: {
                        format: '{value} mm',
                        style: {
                            color: Highcharts.getOptions().colors[0]
                        }
                    },
                    opposite: true
                }],
                tooltip: {
                    shared: true
                },
                legend: {
                    align: 'left',
                    x: 80,
                    verticalAlign: 'top',
                    y: 80,
                    floating: true,
                    backgroundColor:
                        Highcharts.defaultOptions.legend.backgroundColor || // theme
                        'rgba(255,255,255,0.25)'
                },
                series: [{
                    name: 'Precipitation',
                    type: 'column',
                    yAxis: 1,
                    data: result.precipitation,
                    tooltip: {
                        valueSuffix: ' mm'
                    }

                }, {
                    name: 'Temperature',
                    type: 'spline',
                    data: result.temp,
                    tooltip: {
                        valueSuffix: '°C'
                    }
                }]
            });
        }
    }
    $(function () {
        chart03.init();
    });
</script>
<div class="col-sm-8 text-left">
    <div class="container">
        <h1>Chart03</h1>
        <div class="row">
            <div class="col-sm-4" id="c1"></div>
            <div class="col-sm-4" id="c2"></div>
            <div class="col-sm-4" id="c3"></div>
        </div>

    </div>
</div>