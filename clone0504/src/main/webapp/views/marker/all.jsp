<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script>
    let marker_search = {
        init: function () {
            $('#search_btn').click(function () {
                $('#search_form').attr({
                    method:'GET',
                    action: '/marker/search'
                });
                $('#search_form').submit();
            })
        }};
    $(function () {
        marker_search.init();
    });
</script>

<!-- Begin Page Content -->
<div class="container-fluid">

    <!-- Page Heading -->
    <h1 class="h3 mb-2 text-gray-800">Marker All</h1>
    <p class="mb-4">DataTables is a third party plugin that is used to generate the demo table below.
        For more information about DataTables, please visit the <a target="_blank"
                                                                   href="https://datatables.net">official DataTables documentation</a>.</p>

    <!-- DataTales Example -->
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">Marker All</h6>
            <form id="search_form" class="form-inline well">
                <div class="form-group">
                    <label for="loc">위치</label>
                    <select class="form-control" id="loc" name="loc">
                        <option value="S" <c:if test="${ms.loc == 'S'}">selected</c:if>>서울</option>
                        <option value="B" <c:if test="${ms.loc == 'B'}">selected</c:if>>부산</option>
                        <option value="J" <c:if test="${ms.loc == 'J'}">selected</c:if>>제주</option>
                    </select>
                </div>
            <div class="form-group">
                <label class="control-label col-sm-2" for="title">TITLE</label>
                <div class="col-sm-2">
                    <input type="text" name="title" class="form-control" id="title" placeholder="Enter Title" value="${ms.title}">
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-2">
                    <button id="search_btn" type="button" class="btn btn-info">Search</button>
                </div>
            </div>
            </form>
        </div>
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                    <thead>
                    <tr>
                        <th>IMG</th>
                        <th>ID</th>
                        <th>TITLE</th>
                        <th>TARGET</th>
                        <th>PRICE</th>
                        <th>LNG</th>
                        <th>LOC</th>
                    </tr>
                    </thead>
                    <tfoot>
                    <tr>
                        <th>IMG</th>
                        <th>ID</th>
                        <th>TITLE</th>
                        <th>TARGET</th>
                        <th>PRICE</th>
                        <th>LNG</th>
                        <th>LOC</th>
                    </tr>
                    </tfoot>
                    <tbody>
                    <c:forEach var="obj" items="${mlist}">
                        <tr>
                            <td href="#" data-toggle="modal" data-target="#my${obj.id}">
                                <img id="marker_img" src="/uimg/${obj.img}" style="width: 50px; height: 50px;" />
                            </td>
                            <td>
                                <a href="/marker/detail?id=${obj.id}">${obj.id}</a>
                            </td>
                            <td>${obj.title}</td>
                            <td>${obj.target}</td>
                            <td>${obj.lat}</td>
                            <td>${obj.lng}</td>
                            <td>${obj.loc}</td>
                        </tr>
                        <div id="my${obj.id}" class="modal fade" role="dialog">
                            <div class="modal-dialog">
                                <!-- Modal content-->
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                        <h4 class="modal-title">Detail Image</h4>
                                    </div>
                                    <div class="modal-body">
                                        <p>${obj.title}</p>
                                        <img src="/uimg/${obj.img}"/>
                                    </div>
                                    <div class="modal-footer">
                                        <a href="/marker/detail?id=${obj.id}" class="btn btn-info" role="button">Detail</a>
                                        <a href="#" data-dismiss="modal" class="btn btn-info" role="button">Close</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>

                    </tbody>

                </table>
            </div>
        </div>
    </div>
</div>
<!-- Modal -->


<!-- Modal -->
