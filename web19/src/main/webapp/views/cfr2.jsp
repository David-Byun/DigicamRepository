<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>

</script>
<div class="col-sm-8 text-left">
    <h1>CFR2</h1>
    <c:forEach items="${result}" var="map">
        <h1>${map.key} = ${map.value}</h1>
    </c:forEach>
    <form id="cfr2_form" method="post" action="/mycfr" enctype="multipart/form-data">
        <div class="form-group">
            <label for="img">Image:</label>
            <input type="file" class="form-control" id="img" placeholder="Input Image" name="imgname">
        </div>
        <button type="submit" id="login_btn" class="btn btn-primary">Send</button>
    </form>
</div>

