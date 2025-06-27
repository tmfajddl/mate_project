<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/stompjs@2.3.3/lib/stomp.min.js"></script>

<%@ include file="../common/head.jspf"%>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">
<link href="https://cdn.jsdelivr.net/gh/projectnoonnu/2411-3@1.0/index.css" rel="stylesheet">
<style>

html, body, section {
  height: 100%;
  margin: 0;
  padding: 0;
  overflow: hidden; /* 필요 시 스크롤 제거 */
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
  display: flex;
  flex-direction: column;  /* 수직 정렬 */
  overflow-y: auto;
  max-height: calc(80vh - 120px);
  padding: 10px;
  background-color: #fff;
  border-radius: 10px;
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
  display: inline-block;
  padding: 8px 12px;
  border-radius: 20px;
  position: relative;
  word-break: break-word;
  font-size: 14px;
  text-align: left;
  margin-bottom: 25px;
  max-width: 60%;
  min-width: 1.5em;
}

.message.mine {
  background-color: #f2d8b1;
  color: black;
  align-self: flex-end;
}

.message.other {
  background-color: #f7ecdc;
  color: black;
  align-self: flex-start;
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

/* 시간: 말풍선 왼쪽 아래 (내 메시지) */
.message.mine .time {
  position: absolute;
  bottom: -18px;  /* 말풍선 바로 아래 */
  left: 10px;     /* 왼쪽 여백 */
  font-size: 10px;
  color: #999;
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

/* 시간: 말풍선 오른쪽 아래 (상대 메시지) */
.message.other .time {
  position: absolute;
  bottom: -18px;  /* 말풍선 바로 아래 */
  right: 10px;    /* 오른쪽 여백 */
  font-size: 10px;
  color: #999;
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
  .date-separator {
  text-align: center;
  margin: 20px 0;
  position: relative;
  color: #888;
  font-size: 14px;
  font-weight: bold;
}

.date-separator span {
  background-color: #f7f0e9;
  padding: 0 10px;
  position: relative;
  z-index: 1;
}

.date-separator::before {
  content: "";
  position: absolute;
  top: 50%;
  left: 0;
  right: 0;
  border-top: 1px solid #ccc;
  z-index: 0;
}

.unread-count {
  background-color: #e74c3c; /* 빨간색 */
  color: white;
  font-size: 12px;
  font-weight: bold;
  padding: 2px 6px;
  border-radius: 12px;
  margin-left: auto; /* 오른쪽 끝으로 밀기 */
  min-width: 20px;
  text-align: center;
  line-height: 1.2;
}
</style>

<body class="m-0" style="background-color: #f7f0e9;">

  <c:choose>
    <c:when test="${rq.loginedTeam == null}">
        <section class="bg-cover bg-repeat flex flex-col items-center"
                 style="background-image: url('/images/bg12.png'); cursor: url('/images/cursor0.png') 25 25, auto; background-repeat: repeat; background-size: auto;">
    </c:when>
    <c:when test="${rq.loginedTeam eq '한화 이글스'}">
        <section class="bg-cover bg-repeat flex flex-col items-center"
                 style="background-image: url('/images/bg21.png'); cursor: url('/images/cursor2.png') 25 25, auto; background-repeat: repeat; background-size: auto;">
    </c:when>
    <c:when test="${rq.loginedTeam eq '두산 베어스'}">
        <section class="bg-cover bg-repeat flex flex-col items-center"
                 style="background-image: url('/images/bg22.png') cursor: url('/images/cursor3.png') 25 25, auto; background-repeat: repeat; background-size: auto;">
    </c:when>
        <c:when test="${rq.loginedTeam eq '롯데 자이언츠'}">
        <section class="bg-cover bg-repeat flex flex-col items-center"
                 style="background-image: url('/images/bg23.png') cursor: url('/images/cursor4.png') 25 25, auto; background-repeat: repeat; background-size: auto;">
    </c:when>
        <c:when test="${rq.loginedTeam eq 'LG 트윈스'}">
        <section class="bg-cover bg-repeat flex flex-col items-center"
                 style="background-image: url('/images/bg24.png'); cursor: url('/images/cursor5.png') 25 25, auto; background-repeat: repeat; background-size: auto;">
    </c:when>
        <c:when test="${rq.loginedTeam eq '삼성 라이온즈'}">
        <section class="bg-cover bg-repeat flex flex-col items-center"
                 style="background-image: url('/images/bg25.png'); cursor: url('/images/cursor6.png') 25 25, auto; background-repeat: repeat; background-size: auto;">
    </c:when>
        <c:when test="${rq.loginedTeam eq '키움 히어로즈'}">
        <section class="bg-cover bg-repeat flex flex-col  items-center" 
                 style="background-image: url('/images/bg26.png'); cursor: url('/images/cursor7.png') , auto; background-repeat: repeat; background-size: auto;">
    </c:when>
        <c:when test="${rq.loginedTeam eq 'SSG 랜더스'}">
        <section class="bg-cover bg-repeat flex flex-col items-center"
                 style="background-image: url('/images/bg27.png'); cursor: url('/images/cursor1.png') 25 25, auto; background-repeat: repeat; background-size: auto;">
    </c:when>
        <c:when test="${rq.loginedTeam eq 'NC 다이노스'}">
        <section class="bg-cover bg-repeat flex flex-col items-center" 
         style="background-image: url('/images/bg28.png'); cursor: url('/images/cursor8.png') 25 25, auto; background-repeat: repeat; background-size: auto;">
    </c:when>
        <c:when test="${rq.loginedTeam eq 'KT 위즈'}">
        <section class="bg-cover bg-repeat flex flex-col items-center"
                 style="background-image: url('/images/bg29.png'); cursor: url('/images/cursor9.png') 25 25, auto; background-repeat: repeat; background-size: auto;">
    </c:when>
        <c:when test="${rq.loginedTeam eq 'KIA 타이거즈'}">
        <section class="bg-cover bg-repeat flex flex-col items-center" 
                 style="background-image: url('/images/bg30.png'); cursor: url('/images/cursor10.png') 25 25, auto; background-repeat: repeat; background-size: auto;">
    </c:when>
</c:choose>

  <div class="absolute inset-0 "></div>
  

  <div class="relative flex w-full max-w-6xl gap-4">

    <!-- 왼쪽: 채팅방 목록 -->
    <div class="w-1/3 chat-list">
      <div class="text-xl font-bold mb-2">채팅방 목록</div>
      <c:forEach var="room" items="${chatRooms}">
  <div class="chat-item flex items-center gap-2 ${room.id == selectedRoomId ? 'active' : ''}"
     data-room-id="${room.id}"
     onclick="location.href='/usr/project/chat/room?roomId=${room.id}'">
    <img src="${room.otherProfileImg != null ? room.otherProfileImg : '/images/ball.jpg'}"
         alt="profile"
         class="w-8 h-8 rounded-full border border-gray-300 object-cover" />
    <span>${room.otherMemberNickname}</span>
    
    <!-- 안 읽은 메시지 수 표시 -->
      <span class="unread-count" style="${room.unreadCount == 0 ? 'display:none;' : ''}">
  ${room.unreadCount}
</span>
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
<c:set var="prevDate" value="" />
<c:forEach var="msg" items="${messages}">
    <c:set var="currentDate" value="${fn:substring(msg.sentDate, 0, 10)}" />
    <c:if test="${currentDate ne prevDate}">
        <!-- 날짜 구분선 -->
        <div class="date-separator">
            <span>${currentDate}</span>
        </div>
        <c:set var="prevDate" value="${currentDate}" />
    </c:if>
    <div class="message ${msg.senderId == LoginedMemberId ? 'mine' : 'other'}">
  <strong>${msg.senderName}</strong><br/>
  ${msg.message}
  <span class="time">${fn:substring(msg.sentDate, 11, 16)}</span>
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

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script>
  const contextPath = "${pageContext.request.contextPath}";
  const loginedMemberId = "${LoginedMemberId}";
  const selectedRoomId = "${selectedRoomId}";

  // 사용자의 전체 채팅방 목록을 JS 배열로 넘김
  const chatRooms = [
    <c:forEach var="room" items="${chatRooms}" varStatus="i">
      ${i.index > 0 ? ',' : ''}{ id: '${room.id}' }
    </c:forEach>
  ];
</script>

<script>
  console.log("contextPath:", contextPath);
  console.log("loginedMemberId:", loginedMemberId);
  console.log("selectedRoomId:", selectedRoomId);

  let socket;

  if (loginedMemberId) {
    const protocol = location.protocol === 'https:' ? 'wss' : 'ws';
    const sock = new SockJS(contextPath + '/ws-chat');
    const stompClient = Stomp.over(sock);

    stompClient.connect({}, function (frame) {
      // ✅ 모든 채팅방에 대해 구독
      chatRooms.forEach(room => {
        stompClient.subscribe('/topic/chat/' + room.id, function (message) {
          const msg = JSON.parse(message.body);

          moveChatRoomToTop(msg.roomId); // 🔄 새 메시지 오면 해당 채팅방 위로 이동

          if (String(msg.roomId) === String(selectedRoomId)) {
            addMessageToContainer(msg);
          } else {
            increaseUnreadCount(msg.roomId);
          }
        });
      });

      // ✅ 선택된 채팅방 읽음 처리
      if (selectedRoomId) {
        $.post(contextPath + '/usr/project/chat/markAsRead', {
          roomId: selectedRoomId,
          memberId: loginedMemberId
        }).done(() => {
          const $roomItem = $('.chat-item[data-room-id="' + selectedRoomId + '"]');
          const $unreadSpan = $roomItem.find('.unread-count');
          if ($unreadSpan.length) {
            $unreadSpan.text('0').hide();
          }
        });
      }
    });

    socket = sock;
  }

  // ✅ 메시지 전송 처리
  $(function () {
    $('form').on('submit', function (e) {
      e.preventDefault();
      const $form = $(this);
      const roomId = $form.find('input[name="roomId"]').val();
      const message = $form.find('input[name="message"]').val();

      if (!message.trim()) return;

      $.ajax({
        url: $form.attr('action'),
        type: 'POST',
        dataType: 'json',
        data: {
          roomId: roomId,
          senderId: loginedMemberId,
          message: message
        },
        success: function () {
          $form.find('input[name="message"]').val('');
        }
      });
    });

    // ✅ 메시지를 채팅창에 추가
    window.addMessageToContainer = function (msg) {
      const $container = $('.chat-messages');
      const lastDate = $container.find('.date-separator span').last().text();
      const msgDate = msg.sentDate.substring(0, 10);

      if (msgDate !== lastDate) {
    	  $container.append(
    			  $('<div class="date-separator">').append(
    			    $('<span>').text(msgDate)
    			  )
    			);
      }

      const isMine = String(msg.senderId) === String(loginedMemberId);
      const messageClass = isMine ? 'mine' : 'other';

      const $msgDiv = $('<div>').addClass('message ' + messageClass);
      $msgDiv.append(
        $('<strong>').text(msg.senderName),
        $('<br>'),
        $('<span>').html(msg.message.replace(/\n/g, '<br>')),
        $('<span>').addClass('time').text(msg.sentDate.substring(11, 16))
      );
      $container.append($msgDiv);
      $container.scrollTop($container[0].scrollHeight);
    };

    // ✅ 안읽은 메시지 수 증가
    window.increaseUnreadCount = function (roomId) {
      const $roomItem = $('.chat-item[data-room-id="' + roomId + '"]');
      let $countSpan = $roomItem.find('.unread-count');

      if ($countSpan.length) {
        let current = parseInt($countSpan.text()) || 0;
        $countSpan.text(current + 1).show();
      } else {
        $countSpan = $('<span class="unread-count">1</span>');
        $roomItem.append($countSpan);
      }
    };

    // ✅ 최초 진입 시 스크롤 아래로
    const chatMessages = document.querySelector('.chat-messages');
    if (chatMessages) {
      chatMessages.scrollTop = chatMessages.scrollHeight;
    }
  });

  // ✅ 채팅방을 채팅 목록 상단으로 이동시키는 함수 (clone 방식)
  function moveChatRoomToTop(roomId) {
    const $roomItem = $('.chat-item[data-room-id="' + roomId + '"]');
    const $chatList = $('.chat-list');

    if ($roomItem.length && $chatList.length) {
      const $cloned = $roomItem.clone(true); // 이벤트 포함 복제
      $roomItem.remove(); // 원본 삭제
      const $firstItem = $chatList.find('.chat-item').first();
      if ($firstItem.length) {
        $cloned.insertBefore($firstItem);
      } else {
        $chatList.append($cloned);
      }
    } else {
      console.warn("moveChatRoomToTop: 항목이 없음", roomId);
    }
  }

  // ✅ 페이지 전체 로딩 완료 시 스크롤 아래로
  window.onload = function () {
    const chatMessages = document.querySelector('.chat-messages');
    if (chatMessages) {
      console.log("window.onload: scroll chat messages to bottom");
      chatMessages.scrollTop = chatMessages.scrollHeight;
    }
  };
</script>

</body>