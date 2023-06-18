<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>
    let item_get = {
        init:function () {
            $('#cart_btn').on('click', () => {
                let cust_id = '${logincust.id}';
                let item_id = ${gitem.id};
                let cnt = $('#cnt').val();
                $.ajax({
                    url : '/addcart',
                    data:{cust_id:cust_id, item_id:item_id, cnt:cnt},
                    success:function () {
                        $('#myModal').modal();
                    }
                })
                // $('#cart_form').attr({
                //     method:'post',
                //     action:'/item/addcart'
                // });
                // $('#cart_form').submit();
            })
        }
    };
    $(function () {
        item_get.init();
    })
</script>
<div class="col-sm-8 text-left" >
    <div class="container">
        <h3>Item Info</h3>
        <img src="/uimg/${gitem.imgname}" style="width: 100px; height:100px" />
        <h4>${gitem.id}</h4>
        <h4>${gitem.name}</h4>
        <h4>${gitem.price}</h4>
            <c:if test="${logincust != null}">
                <form id="cart_form" class="form-inline well">
                    <%-- display none 이 아닌 hidden--%>
                    <input name="cust_id" type="text" value="${logincust.id}" style="display: none"/>
                    <input type="number" name="item_id" value="${gitem.id}" style="display: none"/>
                    <div class="form-group">
                        <label for="id">Count:</label>
                        <input type="number" class="form-control" id="cnt" placeholder="Enter Count" name="cnt">
                    </div>
                    <button type="button" id="cart_btn" class="btn btn-primary">Cart</button>
                </form>
            </c:if>
    </div>
</div>

<!-- The Modal -->
<div class="modal fade" id="myModal">
    <div class="modal-dialog">
        <div class="modal-content">

            <!-- Modal Header -->
            <div class="modal-header">
                <h4 class="modal-title">Modal Heading</h4>
                <button type="button" class="close" data-dismiss="modal">×</button>
            </div>

            <!-- Modal body -->
            <div class="modal-body">
                <a href="/item/allcart?id=${logincust.id}" class="btn btn-info" role="button">장바구니로 이동</a>
                <a href="/item/allpage" class="btn btn-primary" role="button">계속 쇼핑</a>
            </div>
        </div>
    </div>
</div>