<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>WebSocket 채팅 테스트</title>
    <script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/stompjs@2.3.3/lib/stomp.min.js"></script>
    <style>
        #chat-box {
            border: 1px solid #ccc;
            height: 300px;
            overflow-y: scroll;
            padding: 10px;
            margin-bottom: 10px;
        }
        .my-message {
            color: blue;
        }
        .other-message {
            color: green;
        }
    </style>
</head>
<body>
<h2>WebSocket 채팅 테스트</h2>

<!-- 채팅 메시지 표시 영역 -->
<div id="chat-box"></div>

<!-- 입력 폼 -->
<input type="text" id="message-input" placeholder="메시지를 입력하세요">
<button onclick="sendMessage()">보내기</button>

<script>
    let stompClient = null;
    const roomId = 1;          // 테스트용 채팅방 ID
    const senderId = 123;      // 테스트용 사용자 ID
    const senderName = "테스트유저"; // 테스트용 이름

    function connect() {
        const socket = new SockJS('/ws-chat');
        stompClient = Stomp.over(socket);

        stompClient.connect({}, function (frame) {
            console.log('Connected: ' + frame);

            stompClient.subscribe('/topic/chat/' + roomId, function (message) {
                const chatMessage = JSON.parse(message.body);
                showMessage(chatMessage);
            });
        });
    }

    function sendMessage() {
        const input = document.getElementById('message-input');
        const message = input.value;

        if (!message.trim()) return;

        stompClient.send("/app/chat.sendMessage", {}, JSON.stringify({
            roomId: roomId,
            senderId: senderId,
            message: message
        }));

        input.value = '';
    }

    function showMessage(chatMessage) {
        const chatBox = document.getElementById('chat-box');
        const msgDiv = document.createElement('div');

        const isMine = chatMessage.senderId === senderId;
        msgDiv.className = isMine ? "my-message" : "other-message";
        msgDiv.textContent = `[${chatMessage.senderName || "익명"}] ${chatMessage.message}`;

        chatBox.appendChild(msgDiv);
        chatBox.scrollTop = chatBox.scrollHeight;
    }

    // 연결 시작
    connect();
</script>

</body>
</html>