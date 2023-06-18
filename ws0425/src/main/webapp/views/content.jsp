<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>

    let chart = {
        init : function () {
            this.getdata();
            setInterval(()=>{
                this.getdata();
            }, 1500)
        },
        display: function (result) {
            // Create the chart
            Highcharts.chart('container', {
                chart: {
                    type: 'pie'
                },
                title: {
                    text: 'Ajax 활용한 Donut Chart',
                    align: 'left'
                },
                subtitle: {
                    text: 'Click the slices to view versions. Source: <a href="http://statcounter.com" target="_blank">statcounter.com</a>',
                    align: 'left'
                },

                accessibility: {
                    announceNewData: {
                        enabled: true
                    },
                    point: {
                        valueSuffix: '%'
                    }
                },

                plotOptions: {
                    series: {
                        borderRadius: 5,
                        dataLabels: {
                            enabled: true,
                            format: '{point.name}: {point.y:.1f}%'
                        }
                    }
                },

                tooltip: {
                    headerFormat: '<span style="font-size:11px">{series.name}</span><br>',
                    pointFormat: '<span style="color:{point.color}">{point.name}</span>: <b>{point.y:.2f}%</b> of total<br/>'
                },

                series: [
                    {
                        name: 'Browsers',
                        colorByPoint: true,
                        data: result
                    }
                ],
                drilldown: {
                    series: [
                        {
                            name: 'Chrome',
                            id: 'Chrome',
                            data: [
                                [
                                    'v97.0',
                                    36.89
                                ],
                                [
                                    'v96.0',
                                    18.16
                                ],
                                [
                                    'v95.0',
                                    0.54
                                ],
                                [
                                    'v94.0',
                                    0.7
                                ],
                                [
                                    'v93.0',
                                    0.8
                                ],
                                [
                                    'v92.0',
                                    0.41
                                ],
                                [
                                    'v91.0',
                                    0.31
                                ],
                                [
                                    'v90.0',
                                    0.13
                                ],
                                [
                                    'v89.0',
                                    0.14
                                ],
                                [
                                    'v88.0',
                                    0.1
                                ],
                                [
                                    'v87.0',
                                    0.35
                                ],
                                [
                                    'v86.0',
                                    0.17
                                ],
                                [
                                    'v85.0',
                                    0.18
                                ],
                                [
                                    'v84.0',
                                    0.17
                                ],
                                [
                                    'v83.0',
                                    0.21
                                ],
                                [
                                    'v81.0',
                                    0.1
                                ],
                                [
                                    'v80.0',
                                    0.16
                                ],
                                [
                                    'v79.0',
                                    0.43
                                ],
                                [
                                    'v78.0',
                                    0.11
                                ],
                                [
                                    'v76.0',
                                    0.16
                                ],
                                [
                                    'v75.0',
                                    0.15
                                ],
                                [
                                    'v72.0',
                                    0.14
                                ],
                                [
                                    'v70.0',
                                    0.11
                                ],
                                [
                                    'v69.0',
                                    0.13
                                ],
                                [
                                    'v56.0',
                                    0.12
                                ],
                                [
                                    'v49.0',
                                    0.17
                                ]
                            ]
                        },
                        {
                            name: 'Safari',
                            id: 'Safari',
                            data: [
                                [
                                    'v15.3',
                                    0.1
                                ],
                                [
                                    'v15.2',
                                    2.01
                                ],
                                [
                                    'v15.1',
                                    2.29
                                ],
                                [
                                    'v15.0',
                                    0.49
                                ],
                                [
                                    'v14.1',
                                    2.48
                                ],
                                [
                                    'v14.0',
                                    0.64
                                ],
                                [
                                    'v13.1',
                                    1.17
                                ],
                                [
                                    'v13.0',
                                    0.13
                                ],
                                [
                                    'v12.1',
                                    0.16
                                ]
                            ]
                        },
                        {
                            name: 'Edge',
                            id: 'Edge',
                            data: [
                                [
                                    'v97',
                                    6.62
                                ],
                                [
                                    'v96',
                                    2.55
                                ],
                                [
                                    'v95',
                                    0.15
                                ]
                            ]
                        },
                        {
                            name: 'Firefox',
                            id: 'Firefox',
                            data: [
                                [
                                    'v96.0',
                                    4.17
                                ],
                                [
                                    'v95.0',
                                    3.33
                                ],
                                [
                                    'v94.0',
                                    0.11
                                ],
                                [
                                    'v91.0',
                                    0.23
                                ],
                                [
                                    'v78.0',
                                    0.16
                                ],
                                [
                                    'v52.0',
                                    0.15
                                ]
                            ]
                        }
                    ]
                }
            });

        },
        getdata: function () {
            $.ajax({
                url : '/chart/get',
                success : function (result) {
                    chart.display(result);
                }
            })
        },
    }
    let areachart = {
        init: function () {
            this.getdata();
            setInterval(()=>{
                this.getdata();
            }, 1500)
        },
        display:function (result) {
            Highcharts.chart('areachart', {
                title: {
                    text: 'Ajax 활용한 Bar CHART',
                    align: 'left'
                },
                subtitle: {
                    text: 'Chart option: Plain | Source: ' +
                        '<a href="https://www.nav.no/no/nav-og-samfunn/statistikk/arbeidssokere-og-stillinger-statistikk/helt-ledige"' +
                        'target="_blank">NAV</a>',
                    align: 'left'
                },
                colors: [
                    '#4caefe',
                    '#3fbdf3',
                    '#35c3e8',
                    '#2bc9dc',
                    '#20cfe1',
                    '#16d4e6',
                    '#0dd9db',
                    '#03dfd0',
                    '#00e4c5',
                    '#00e9ba',
                    '#00eeaf',
                    '#23e274'
                ],
                xAxis: {
                    categories: result.categories
                },
                series: [{
                    type: 'column',
                    name: 'Unemployed',
                    borderRadius: 5,
                    colorByPoint: true,
                    data: result.data,
                    showInLegend: false
                }]
            });
        },
        getdata : function () {
            $.ajax({
                url : '/areachart/get',
                success : function (result) {
                    areachart.display(result);
                }
            })
        }
    }
    let barchart = {
        init : function () {
            this.getdata()
            setTimeout(()=>{
                this.getdata()
            }, 1500)
        },
        display : function (result) {
            Highcharts.chart('barchart', {
                chart: {
                    type: 'bar'
                },
                title: {
                    text: 'UEFA CL top scorers by season'
                },
                xAxis: {
                    categories: ['2020/21', '2019/20', '2018/19', '2017/18', '2016/17']
                },
                yAxis: {
                    min: 0,
                    title: {
                        text: 'Goals'
                    }
                },
                legend: {
                    reversed: true
                },
                plotOptions: {
                    series: {
                        stacking: 'normal',
                        dataLabels: {
                            enabled: true
                        }
                    }
                },
                series: [{
                    name: 'Cristiano Ronaldo',
                    data: result[0]
                }, {
                    name: 'Lionel Messi',
                    data: result[1]
                }, {
                    name: 'Robert Lewandowski',
                    data: result[2]
                }]
            });
        },
        getdata : function () {
            $.ajax('/barchart/get').done((result)=>{
                this.display(result);
            })
        }

    }
    $(function () {
        chart.init();
        areachart.init();
        barchart.init();
    })

</script>
<div class="container-fluid">

    <!-- Page Heading -->
    <div class="d-sm-flex align-items-center justify-content-between mb-4">
        <h1 class="h3 mb-0 text-gray-800">Dashboard</h1>
        <a href="#" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i
                class="fas fa-download fa-sm text-white-50"></i> Generate Report</a>
    </div>

    <!-- Content Row -->
    <div class="row">

        <!-- Earnings (Monthly) Card Example -->
        <div class="col-xl-3 col-md-6 mb-4">
            <div class="card border-left-primary shadow h-100 py-2">
                <div class="card-body">
                    <div class="row no-gutters align-items-center">
                        <div class="col mr-2">
                            <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
                                Earnings (Monthly)</div>
                            <div class="h5 mb-0 font-weight-bold text-gray-800">$40,000</div>
                        </div>
                        <div class="col-auto">
                            <i class="fas fa-calendar fa-2x text-gray-300"></i>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Earnings (Monthly) Card Example -->
        <div class="col-xl-3 col-md-6 mb-4">
            <div class="card border-left-success shadow h-100 py-2">
                <div class="card-body">
                    <div class="row no-gutters align-items-center">
                        <div class="col mr-2">
                            <div class="text-xs font-weight-bold text-success text-uppercase mb-1">
                                Earnings (Annual)</div>
                            <div class="h5 mb-0 font-weight-bold text-gray-800">$215,000</div>
                        </div>
                        <div class="col-auto">
                            <i class="fas fa-dollar-sign fa-2x text-gray-300"></i>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Earnings (Monthly) Card Example -->
        <div class="col-xl-3 col-md-6 mb-4">
            <div class="card border-left-info shadow h-100 py-2">
                <div class="card-body">
                    <div class="row no-gutters align-items-center">
                        <div class="col mr-2">
                            <div class="text-xs font-weight-bold text-info text-uppercase mb-1">Tasks
                            </div>
                            <div class="row no-gutters align-items-center">
                                <div class="col-auto">
                                    <div class="h5 mb-0 mr-3 font-weight-bold text-gray-800">50%</div>
                                </div>
                                <div class="col">
                                    <div class="progress progress-sm mr-2">
                                        <div class="progress-bar bg-info" role="progressbar"
                                             style="width: 50%" aria-valuenow="50" aria-valuemin="0"
                                             aria-valuemax="100"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-auto">
                            <i class="fas fa-clipboard-list fa-2x text-gray-300"></i>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Pending Requests Card Example -->
        <div class="col-xl-3 col-md-6 mb-4">
            <div class="card border-left-warning shadow h-100 py-2">
                <div class="card-body">
                    <div class="row no-gutters align-items-center">
                        <div class="col mr-2">
                            <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">
                                Pending Requests</div>
                            <div class="h5 mb-0 font-weight-bold text-gray-800">18</div>
                        </div>
                        <div class="col-auto">
                            <i class="fas fa-comments fa-2x text-gray-300"></i>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Content Row -->

    <div class="row">

        <!-- Area Chart -->
        <div class="col-xl-8 col-lg-7">
            <div id="areachart"></div>
        </div>

        <!-- Pie Chart -->
        <div class="col-xl-4 col-lg-5">
            <div id="container"></div>
                <!-- Card Header - Dropdown -->
            </div>
        </div>
    </div>

    <!-- Content Row -->
    <div class="row">

        <!-- Content Column -->
        <div class="col-lg-6 mb-4">

            <!-- Project Card Example -->
            <div id="barchart"></div>

            <!-- Color System -->
            <div class="row">
                <div class="col-lg-6 mb-4">
                    <div class="card bg-primary text-white shadow">
                        <div class="card-body">
                            Primary
                            <div class="text-white-50 small">#4e73df</div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 mb-4">
                    <div class="card bg-success text-white shadow">
                        <div class="card-body">
                            Success
                            <div class="text-white-50 small">#1cc88a</div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 mb-4">
                    <div class="card bg-info text-white shadow">
                        <div class="card-body">
                            Info
                            <div class="text-white-50 small">#36b9cc</div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 mb-4">
                    <div class="card bg-warning text-white shadow">
                        <div class="card-body">
                            Warning
                            <div class="text-white-50 small">#f6c23e</div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 mb-4">
                    <div class="card bg-danger text-white shadow">
                        <div class="card-body">
                            Danger
                            <div class="text-white-50 small">#e74a3b</div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 mb-4">
                    <div class="card bg-secondary text-white shadow">
                        <div class="card-body">
                            Secondary
                            <div class="text-white-50 small">#858796</div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 mb-4">
                    <div class="card bg-light text-black shadow">
                        <div class="card-body">
                            Light
                            <div class="text-black-50 small">#f8f9fc</div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 mb-4">
                    <div class="card bg-dark text-white shadow">
                        <div class="card-body">
                            Dark
                            <div class="text-white-50 small">#5a5c69</div>
                        </div>
                    </div>
                </div>
            </div>

        </div>

        <div class="col-lg-6 mb-4">

            <!-- Illustrations -->
            <div class="card shadow mb-4">
                <div class="card-header py-3">
                    <h6 class="m-0 font-weight-bold text-primary">Illustrations</h6>
                </div>
                <div class="card-body">
                    <div class="text-center">
                        <img class="img-fluid px-3 px-sm-4 mt-3 mb-4" style="width: 25rem;"
                             src="img/undraw_posting_photo.svg" alt="...">
                    </div>
                    <p>Add some quality, svg illustrations to your project courtesy of <a
                            target="_blank" rel="nofollow" href="https://undraw.co/">unDraw</a>, a
                        constantly updated collection of beautiful svg images that you can use
                        completely free and without attribution!</p>
                    <a target="_blank" rel="nofollow" href="https://undraw.co/">Browse Illustrations on
                        unDraw &rarr;</a>
                </div>
            </div>

            <!-- Approach -->
            <div class="card shadow mb-4">
                <div class="card-header py-3">
                    <h6 class="m-0 font-weight-bold text-primary">Development Approach</h6>
                </div>
                <div class="card-body">
                    <p>SB Admin 2 makes extensive use of Bootstrap 4 utility classes in order to reduce
                        CSS bloat and poor page performance. Custom CSS classes are used to create
                        custom components and custom utility classes.</p>
                    <p class="mb-0">Before working with this theme, you should become familiar with the
                        Bootstrap framework, especially the utility classes.</p>
                </div>
            </div>

        </div>
    </div>
