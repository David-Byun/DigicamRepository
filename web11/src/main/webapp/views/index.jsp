<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Bootstrap Example</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=877b72a4084b62dd3183b611e21359eb"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

    <!-- HighChart Library -->
    <script src="https://code.highcharts.com/highcharts.js"></script>
    <script src="https://code.highcharts.com/highcharts-3d.js"></script>
    <script src="https://code.highcharts.com/modules/exporting.js"></script>
    <script src="https://code.highcharts.com/modules/export-data.js"></script>
    <script src="https://code.highcharts.com/modules/accessibility.js"></script>
    <script src="https://code.highcharts.com/highcharts-more.js"></script>
    <script src="https://code.highcharts.com/modules/data.js"></script>

    <script src="/js/index0421.js"></script>
    <style>
        /* Remove the navbar's default margin-bottom and rounded borders */
        .navbar {
            margin-bottom: 0;
            border-radius: 0;
        }

        /* Set height of the grid so .sidenav can be 100% (adjust as needed) */
        .row.content {height: 450px}

        /* Set gray background color and 100% height */
        .sidenav {
            padding-top: 20px;
            background-color: #f1f1f1;
            height: 100%;
        }

        /* Set black background color, white text and some padding */
        footer {
            background-color: #555;
            color: white;
            padding: 15px;
        }

        /* On small screens, set height to 'auto' for sidenav and grid */
        @media screen and (max-width: 767px) {
            .sidenav {
                height: auto;
                padding: 15px;
            }
            .row.content {height:auto;}
        }
    </style>
</head>
<body>

<!-- Nav Bar Start -->
<nav class="navbar navbar-inverse">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">Logo</a>
        </div>
        <div class="collapse navbar-collapse" id="myNavbar">
            <ul class="nav navbar-nav">
                <li class="active"><a href="/">Home</a></li>
                <li><a href="/cust">Cust</a></li>
                <li><a href="/item">Items</a></li>
                <c:if test="${logincust != null}">
                    <li><a href="/jsp/jsp01">JSP</a></li>
                    <li><a href="/ajax">AJAX</a></li>
                    <li><a href="/map/map01">Map</a></li>
                    <li><a href="/chart/chart01">Chart</a></li>
                    <li><a href="#">Contact</a></li>
                </c:if>
            </ul>
            <c:choose>
                <%-- 세션에 담은 정보도 끄집어 낼 수 있다.--%>
                <c:when test="${logincust == null}">
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="/login"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
                        <li><a href="/register"><span class="glyphicon glyphicon-log-in"></span> Register</a></li>
                    </ul>
                </c:when>
                <c:otherwise>
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="/logout"><span class="glyphicon glyphicon-log-in"></span> Logout</a></li>
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="/custinfo?id=${logincust.id}">${logincust.id}</a></li>
                    </ul>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</nav>


<div class="container-fluid text-center">
    <div class="row content">
        <!-- Left Nav Start -->
        <c:choose>
            <c:when test="${left == null}">
                <jsp:include page="left.jsp" />
            </c:when>
            <c:otherwise>
                <jsp:include page="${left}.jsp" />
            </c:otherwise>
        </c:choose>
        <!-- Left Nav End -->

        <!-- Main Center Start -->
        <c:choose>
            <c:when test="${center == null}">
                <jsp:include page="center.jsp" />
            </c:when>
            <c:otherwise>
                <jsp:include page="${center}.jsp" />
            </c:otherwise>
        </c:choose>

        <!-- Main Center End -->
        <!-- Right Sidebar Start -->
        <div class="col-sm-2 sidenav">
            <div class="well">
                <p>ADS</p>
            </div>
            <div class="well">
                <p>ADS</p>
            </div>
        </div>
        <!-- Right Sidebar End -->
    </div>
</div>

</body>
</html>