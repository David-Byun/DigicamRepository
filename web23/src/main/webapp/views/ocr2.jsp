<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>

</script>
<div class="col-sm-8 text-left">
    <h1>OCR2</h1>
    <h2>${result.country}</h2>
    <h2>${result.surname}</h2>
    <h2>${result.givenname}</h2>
    <h2>${result.korname}</h2>
    <h2>${result.num}</h2>
    <h2>${result.birth}</h2>
    <h2>${result.start}</h2>
    <h2>${result.end}</h2>

    <form id="cfr1_form" method="post" action="/ocr2impl" enctype="multipart/form-data">
        <div class="form-group">
            <label for="img">Image:</label>
            <input type="file" class="form-control" id="img" placeholder="Input Image" name="img">
        </div>
        <button type="submit" id="login_btn" class="btn btn-primary">Send</button>
    </form>
</div>
