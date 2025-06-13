<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="../common/head.jspf"%>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">
<link href="https://cdn.jsdelivr.net/gh/projectnoonnu/2411-3@1.0/index.css" rel="stylesheet">
<style>

body {
  font-family: 'Ownglyph_ParkDaHyun', sans-serif;
}
  /* 채팅방 박스: 화면 높이 80% */
  .chat-container {
  display: flex;
  flex-direction: column;
  height: 80vh; /* 화면 높이 80% */
  background-color: rgba(255, 255, 255, 0.7);
  border-radius: 10px;
  padding: 16px;
}

.chat-messages {
  flex-grow: 1;
  overflow-y: auto;
  max-height: calc(80vh - 120px); /* 폼, 타이틀 등 공간 제외한 높이 */
  background-color: #fff;
  border-radius: 10px;
  padding: 10px;
  margin-bottom: 12px;
}

  /* 채팅방 목록 */
  .chat-list {
    background-color: #f7ecdc;
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
    background-color: #f2d8b1;
  }
  .chat-item.active {
    background-color: #f2d8b1;
    font-weight: bold;
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
    background-color: #f2d8b1;
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
    border-color: transparent transparent transparent #f2d8b1;
  }

  /* 상대방 메시지 (왼쪽 정렬, 회색 말풍선) */
  .message.other {
    background-color: #f7ecdc;
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
    border-color: transparent #f7ecdc transparent transparent;
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
    background-color: #f7ecdc;
    border: none;
    cursor: pointer;
    color: black;
    padding: 4px 10px;
    border-radius: 5px;
  }
  .btn-back:hover {
    background-color: #f2d8b1;
  }
</style>

<body class="m-0 h-full" style="background-color: #f7f0e9;">

  <c:choose>
    <c:when test="${rq.loginedTeam == null}">
        <section class="h-screen bg-cover bg-center bg-no-repeat bg-fixed flex flex-col items-center justify-center text-black"
                 style="background-image: url('/images/bg12.png'); cursor: url('/images/cursor0.png') 25 25, auto;">
    </c:when>
    <c:when test="${rq.loginedTeam eq '한화 이글스'}">
        <section class="h-screen bg-cover bg-center bg-no-repeat bg-fixed flex flex-col items-center justify-center text-black"
                 style="background-image: url('/images/bg21.png'); cursor: url('/images/cursor2.png') 25 25, auto;">
    </c:when>
    <c:when test="${rq.loginedTeam eq '두산 베어스'}">
        <section class="h-screen bg-cover bg-center bg-no-repeat bg-fixed flex flex-col items-center justify-center text-black"
                 style="background-image: url('/images/bg22.png') cursor: url('/images/cursor3.png') 25 25, auto;;">
    </c:when>
        <c:when test="${rq.loginedTeam eq '롯데 자이언츠'}">
        <section class="h-screen bg-cover bg-center bg-no-repeat bg-fixed flex flex-col items-center justify-center text-black"
                 style="background-image: url('/images/bg23.png') cursor: url('/images/cursor4.png') 25 25, auto;;">
    </c:when>
        <c:when test="${rq.loginedTeam eq 'LG 트윈스'}">
        <section class="h-screen bg-cover bg-center bg-no-repeat bg-fixed flex flex-col items-center justify-center text-black"
                 style="background-image: url('/images/bg24.png'); cursor: url('/images/cursor5.png') 25 25, auto;">
    </c:when>
        <c:when test="${rq.loginedTeam eq '삼성 라이온즈'}">
        <section class="h-screen bg-cover bg-center bg-no-repeat bg-fixed flex flex-col items-center justify-center text-black"
                 style="background-image: url('/images/bg25.png'); cursor: url('/images/cursor6.png') 25 25, auto;">
    </c:when>
        <c:when test="${rq.loginedTeam eq '키움 히어로즈'}">
        <section class="h-screen bg-cover bg-center bg-no-repeat bg-fixed flex flex-col items-center justify-center text-black"
                 style="background-image: url('/images/bg26.png'); cursor: url('/images/cursor7.png') , auto;">
    </c:when>
        <c:when test="${rq.loginedTeam eq 'SSG 랜더스'}">
        <section class="h-screen bg-cover bg-center bg-no-repeat bg-fixed flex flex-col items-center justify-center text-black"
                 style="background-image: url('/images/bg27.png'); cursor: url('/images/cursor1.png') 25 25, auto;">
    </c:when>
        <c:when test="${rq.loginedTeam eq 'NC 다이노스'}">
        <section class="h-screen bg-cover bg-center bg-no-repeat bg-fixed flex flex-col items-center justify-center text-black"
         style="background-image: url('/images/bg28.png'); cursor: url('/images/cursor8.png') 25 25, auto;">
    </c:when>
        <c:when test="${rq.loginedTeam eq 'KT 위즈'}">
        <section class="h-screen bg-cover bg-center bg-no-repeat bg-fixed flex flex-col items-center justify-center text-black"
                 style="background-image: url('/images/bg29.png'); cursor: url('/images/cursor9.png') 25 25, auto;">
    </c:when>
        <c:when test="${rq.loginedTeam eq 'KIA 타이거즈'}">
        <section class="h-screen bg-cover bg-center bg-no-repeat bg-fixed flex flex-col items-center justify-center text-white"
                 style="background-image: url('/images/bg30.png'); cursor: url('/images/cursor10.png') 25 25, auto;">
    </c:when>
    </c:choose>

  <div class="absolute inset-0 "></div>
  
  <div style="width: 80%; margin: 20px auto 0 auto;">
  <h2 style="font-size: 3em; font-weight: bold; color: #918c84; text-align: left; margin-left: 1%;">채팅</h2>
</div>

  <div class="relative flex w-full max-w-6xl gap-4">

    <!-- 왼쪽: 채팅방 목록 -->
    <div class="w-1/3 chat-list">
      <div class="text-xl font-bold mb-2">채팅방 목록</div>
      <c:forEach var="room" items="${chatRooms}">
       <div class="chat-item flex items-center gap-2 ${room.id == selectedRoomId ? 'active' : ''}"
     onclick="location.href='/usr/project/chat/room?roomId=${room.id}'">
 <img src="${room.otherProfileImg != null ? room.otherProfileImg : '/images/ball.jpg'}"
     alt="profile"
     class="w-8 h-8 rounded-full border border-gray-300 object-cover" />
  <span>${room.otherMemberNickname}</span>
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