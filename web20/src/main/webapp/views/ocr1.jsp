<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>

</script>
<div class="col-sm-8 text-left">
    <h1>OCR1</h1>
    <h2>${result.biznum}</h2>
    <h2>${result.bizname}</h2>
    <h2>${result.bizowner}</h2>
    <h2>${result.bizdate}</h2>
    <h2>${result.bizadd}</h2>

    <form id="cfr1_form" method="post" action="/ocr1impl" enctype="multipart/form-data">
        <div class="form-group">
            <label for="img">Image:</label>
            <input type="file" class="form-control" id="img" placeholder="Input Image" name="img">
        </div>
        <button type="submit" id="login_btn" class="btn btn-primary">Send</button>
    </form>
</div>

