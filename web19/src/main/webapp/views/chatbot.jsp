<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style>
    #all {
        width: 400px;
        height: 200px;
        overflow: auto;
        border: 2px solid red;
    }

    #me {
        width: 400px;
        height: 200px;
        overflow: auto;
        border: 2px solid blue;
    }

    #to {
        width: 400px;
        height: 200px;
        overflow: auto;
        border: 2px solid green;
    }
</style>

<script>
    let chatbot = {
        id:null,
        stompClient:null,
        init:function(){
            this.id = $('#adm_id').text();
            $("#connect").click(function() {
                chatbot.connect();
            });
            $("#disconnect").click(function() {
                chatbot.disconnect();
            });
            $("#sendme").click(function() {
                chatbot.sendMe();
            });
        },
        connect:function(){
            var sid = this.id;
            //chatbot 서버로 접속
            var socket = new SockJS('${adminserver}/chbot');
            this.stompClient = Stomp.over(socket);

            this.stompClient.connect({}, function(frame) {
                chatbot.setConnected(true);
                console.log('Connected: ' + frame);
                //chsend로 보내지는 메시지를 받겠다(받을 준비)
                this.subscribe('/chsend/'+sid, function(msg) {
                    $("#me").append(
                        "<h4>" + "chatbot" +":"+
                        JSON.parse(msg.body).content1+ "</h4>");
                });
            });
        },
        disconnect:function(){
            if (this.stompClient !== null) {
                this.stompClient.disconnect();
            }
            chatbot.setConnected(false);
            console.log("Disconnected");
        },
        setConnected:function(connected){
            if (connected) {
                $("#status").text("Connected");
            } else {
                $("#status").text("Disconnected");
            }
        },
        sendMe:function (){
            var msg = JSON.stringify({
                'sendid' : this.id,
                'content1' : $('#metext').val()
            });
            //chatbot 서버에게 /chatbotme로 보내고 있다(보낼때는 chatbotme 로 보냄) admin chatbot으로 보냄
            this.stompClient.send("/chatbotme", {}, msg);
            $('#me').prepend(
                '<h4>' + this.id + ':' + $('#metext').val() + '</h4>'
            );
            $('#metext').val('');
        }
    };
    $(function(){
        chatbot.init();
    })
</script>
<!-- Begin Page Content -->
<div class="col-sm-8 text-left">
    <h1 id="chatbot">Chatbot</h1>
    <h1 id="adm_id">${logincust.id}</h1>
    <h1 id="status">Status</h1>
    <button id="connect">Connect</button>
    <button id="disconnect">Disconnect</button>

    <h3>Me</h3>

    <input type="text" id="metext"><button id="sendme">Send</button>
    <div id="me"></div>
    <!-- /.container-fluid -->
</div>
