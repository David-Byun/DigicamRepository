<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style>
    #container{
        width:600px;
        height:400px;
        border:2px solid green;
    }
</style>
<script>
    let chart02 = {
        init :function () {
            // setInterval(()=>{
            //     this.getdata();
            // }, 5000)
            $('#chart02 > button').on('click', ()=>{
                this.getdata();
                // $.ajax({
                //     url : '/chart02'
                // }).done((data)=> {this.display(data)}).fail((err) => {alert(err)})
            })
        },
        getdata: function () {
            $.ajax(
                {
                    url : '/chart02',
                    success : (result) =>{
                        this.display(result);
                    }
                }
            )
        },
        display : function (result) {
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
                    data: result.datas
                }]
            });

        }
        
    };
    $(function () {
        chart02.init();
    });
</script>
<div class="col-sm-8 text-left">
    <div class="container" id="chart02">
        <h1>Chart02</h1>
        <button type="button" class="btn btn-danger">Chart</button>
        <div id="container"></div>
    </div>
</div>