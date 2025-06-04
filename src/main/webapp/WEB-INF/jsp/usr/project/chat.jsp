<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="../common/head.jspf"%>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">

<style>
  /* 채팅방 박스: 화면 높이 80% */
  .chat-container {
    background-color: rgba(255, 255, 255, 0.7); /* 반투명 흰색 */
    border-radius: 10px;
    padding: 16px;
    min-height: 80vh;
    display: flex;
    flex-direction: column;
  }

  /* 채팅방 목록 */
  .chat-list {
    background-color: #e0f2fe;
    border-radius: 10px;
    padding: 10px;
  }
  .chat-item {
    cursor: pointer;
    padding: 8px;
    border-radius: 5px;
    margin-bottom: 4px;
  }
  .chat-item:hover {
    background-color: #bae6fd;
  }
  .chat-item.active {
    background-color: #7dd3fc;
    font-weight: bold;
  }

  /* 메시지 영역: 스크롤 처리 */
  .chat-messages {
    background-color: #fff;
    border-radius: 10px;
    padding: 10px;
    flex-grow: 1;
    overflow-y: auto;
    margin-bottom: 12px;
  }

  /* 말풍선 기본 스타일 */
  .message {
    max-width: 30%;
    padding:0 5px;
    margin-bottom: 10px;
    border-radius: 20px;
    position: relative;
    clear: both;
    word-wrap: break-word;
    font-size: 14px;
    text-align: center;
  }

  /* 내가 보낸 메시지 (오른쪽 정렬, 파란색 말풍선) */
  .message.mine {
    background-color: #7dd3fc;
    color: black;
    margin-left: auto;
    
  }
  .message.mine::after {
    content: "";
    position: absolute;
    right: -10px;
    top: 50%;
    transform: translateY(-50%);
    border-width: 8px 0 8px 10px;
    border-style: solid;
    border-color: transparent transparent transparent #7dd3fc;
  }

  /* 상대방 메시지 (왼쪽 정렬, 회색 말풍선) */
  .message.other {
    background-color: #e5e7eb;
    color: black;
    margin-right: auto;
  }
  .message.other::after {
    content: "";
    position: absolute;
    left: -10px;
    top: 50%;
    transform: translateY(-50%);
    border-width: 8px 10px 8px 0;
    border-style: solid;
    border-color: transparent #e5e7eb transparent transparent;
  }

  /* 보낸 시간 작게 */
  .message .time {
    font-size: 10px;
    color: #999;
    margin-top: 4px;
    display: block;
    text-align: right;
  }

  /* 전송 버튼 */
  .btn-back {
    background-color: #82c3f5;
    border: none;
    cursor: pointer;
    color: #fff;
    padding: 4px 10px;
    border-radius: 5px;
  }
  .btn-back:hover {
    background-color: #4a90e2;
  }
</style>

<body class="m-0 h-full font-sans">

<section class="h-screen bg-cover bg-center bg-no-repeat bg-fixed relative flex items-start justify-center p-8"
         style="background-image: url('/images/bg.jpg');">

  <div class="absolute inset-0 bg-blue-100 bg-opacity-70"></div>

  <div class="relative flex w-full max-w-6xl gap-4">

    <!-- 왼쪽: 채팅방 목록 -->
    <div class="w-1/3 chat-list">
      <div class="text-xl font-bold mb-2">채팅방 목록</div>
      <c:forEach var="room" items="${chatRooms}">
        <div class="chat-item ${room.id == selectedRoomId ? 'active' : ''}"
             onclick="location.href='/usr/project/chat/room?roomId=${room.id}'">
          ${room.otherMemberNickname}
        </div>
      </c:forEach>
      <c:if test="${empty chatRooms}">
        <div class="italic text-gray-500">참여 중인 채팅방이 없습니다</div>
      </c:if>
    </div>

    <!-- 오른쪽: 채팅방 화면 -->
    <div class="w-2/3 chat-container">
      <div class="text-xl font-bold mb-2">채팅방</div>

      <div class="flex-1 chat-messages mb-4">
        <c:choose>
          <c:when test="${not empty messages}">
            <c:forEach var="msg" items="${messages}">
              <div class="message ${msg.senderId == LoginedMemberId ? 'mine' : 'other'}">
                <strong>${msg.senderName}</strong><br/>
                ${msg.message}
                <span class="time">${msg.sentDate}</span>
              </div>
            </c:forEach>
          </c:when>
          <c:otherwise>
            <div class="italic text-gray-500 h-full flex items-center justify-center">
              메시지가 없습니다
            </div>
          </c:otherwise>
        </c:choose>
      </div>

      <c:if test="${LoginedMemberId != null && selectedRoomId != null}">
        <form action="/usr/project/chat/send" method="POST" class="flex">
          <input type="hidden" name="roomId" value="${selectedRoomId}" />
          <input class="flex-1 border rounded px-2 py-1" name="message" placeholder="메시지를 입력하세요" required />
          <button type="submit" class="btn-back ml-2">전송</button>
        </form>
      </c:if>
    </div>
  </div>
  
</section>

<%@ include file="../common/foot.jspf"%>
</body>