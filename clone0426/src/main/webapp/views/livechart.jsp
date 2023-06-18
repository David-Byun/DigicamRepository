<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style>
    #container{
        width:700px;
        height:400px;
        border:2px solid green;
    }
</style>
<script>
    let chart04 = {
        init : function () {
            var defaultData = 'http://localhost:8083/log/custinfo.log';
            var urlInput = document.getElementById('fetchURL');
            var pollingCheckbox = document.getElementById('enablePolling');
            var pollingInput = document.getElementById('pollingTime');

            function createChart() {
                Highcharts.chart('container', {
                    chart: {
                        type: 'spline'
                    },
                    title: {
                        text: 'Live Data'
                    },
                    accessibility: {
                        announceNewData: {
                            enabled: true,
                            minAnnounceInterval: 15000,
                            announcementFormatter: function (allSeries, newSeries, newPoint) {
                                if (newPoint) {
                                    return 'New point added. Value: ' + newPoint.y;
                                }
                                return false;
                            }
                        }
                    },
                    data: {
                        csvURL: urlInput.value,
                        enablePolling: pollingCheckbox.checked === true,
                        dataRefreshRate: parseInt(pollingInput.value, 10)
                    }
                });

                if (pollingInput.value < 1 || !pollingInput.value) {
                    pollingInput.value = 1;
                }
            }

            urlInput.value = defaultData;

            // We recreate instead of using chart update to make sure the loaded CSV
            // and such is completely gone.
            pollingCheckbox.onchange = urlInput.onchange = pollingInput.onchange = createChart;

            // Create the chart
            createChart();
        }
    };
    $(function () {
        chart04.init();
    });
</script>

<div class="container-fluid" style="height: 100%">

    <!-- Page Heading -->
    <h1 class="h3 mb-2 text-gray-800">Live Chart</h1>
    <p class="mb-4">DataTables is a third party plugin that is used to generate the demo table below.
        For more information about DataTables, please visit the <a target="_blank"
                                                                   href="https://datatables.net">official DataTables documentation</a>.</p>

    <!-- DataTales Example -->
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">Live Chart</h6>
        </div>
        <div class="card-body">
            <h1>Chart04</h1>
            <div class="ld-row">
                <label class="ld-label">
                    Enable Polling
                </label>
                <input type="checkbox" checked="checked" id="enablePolling"/>
            </div>
            <div class="ld-row">
                <label class="ld-label">
                    Polling Time (Seconds)
                </label>
                <input class="ld-time-input" type="number" value="2" id="pollingTime"/>
            </div>
            <div class="ld-row">
                <label class="ld-label">
                    CSV URL
                </label>
                <input class="ld-url-input" type="text" id="fetchURL"/>
            </div>
            <div class="container" id="container">

            </div>
        </div>
    </div>

</div>

<!-- Bootstrap core JavaScript-->
<script src="/vendor/jquery/jquery.min.js"></script>
<script src="/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Core plugin JavaScript-->
<script src="/vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Custom scripts for all pages-->
<script src="/js/sb-admin-2.min.js"></script>

<!-- Page level plugins -->
<script src="/vendor/chart.js/Chart.min.js"></script>

<!-- Page level custom scripts -->
<script src="/js/demo/chart-area-demo.js"></script>
<script src="/js/demo/chart-pie-demo.js"></script>
<script src="/js/demo/chart-bar-demo.js"></script>
<!-- Bootstrap core JavaScript-->
<script src="/vendor/jquery/jquery.min.js"></script>
<script src="/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Core plugin JavaScript-->
<script src="/vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Custom scripts for all pages-->
<script src="/js/sb-admin-2.min.js"></script>

<!-- Page level plugins -->
<script src="/vendor/datatables/jquery.dataTables.min.js"></script>
<script src="/vendor/datatables/dataTables.bootstrap4.min.js"></script>

<!-- Page level custom scripts -->
<script src="/js/demo/datatables-demo.js"></script>
