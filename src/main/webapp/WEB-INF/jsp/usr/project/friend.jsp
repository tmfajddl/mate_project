<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="../common/head.jspf"%>
<link href="https://cdn.jsdelivr.net/gh/projectnoonnu/2411-3@1.0/index.css" rel="stylesheet">

<!DOCTYPE html>
<html lang="en">
<head>
<style>

body {
  font-family: 'Ownglyph_ParkDaHyun', sans-serif;
}

  section {
  min-height: 100vh;
  position: relative;
    z-index: 0;
}
.section-overlay {
  position: absolute;
  inset: 0;
  background-color: rgba(255, 255, 255, 0.5); /* 불투명도 조절 가능 */
  z-index: 1;
}


/* section 안 콘텐츠는 오버레이보다 위에 있도록 */
section > *:not(.section-overlay) {
  position: relative;
  z-index: 1;
}
  .main {
    border-radius: 10px;
    width: 80%;
    min-height: 350px;
    background-color: rgba(255, 255, 255, 0.9);
    border: 10px solid white;
    padding: 20px;
    margin: 20px auto;

    overflow-x: auto;
    white-space: nowrap;
  }

  .card {
    position: relative; /* 버튼 위치 위해 */
    display: inline-block;
    vertical-align: top;
    width: 22%;
    height: 350px;
    min-width: 200px;
    border-radius: 10px;
    background-color: #f7ecdc;
    padding: 15px;
    margin: 0 10px 10px 0;
    box-shadow: 2px 2px 6px rgba(0,0,0,0.1);
    text-align: center;
    white-space: normal;
    transition: box-shadow 0.3s ease;
  }

  /* 카드 호버시 살짝 그림자 강조 */
  .card:hover {
    box-shadow: 4px 4px 12px rgba(0,0,0,0.3);
  }

  .profile-img {
    display: block;
    margin: 0 auto 10px auto; /* 가운데 정렬 */
    width: 80px;
    height: 80px;
    border-radius: 50%;
    object-fit: cover;
  }

  .nickname {
    font-size: 1.2em;
    font-weight: bold;
    margin-bottom: 5px;
  }

  .intro {
    margin-bottom: 10px;
    color: #333;
  }

  .hashtag {
    font-size: 0.85em;
    color: #4a90e2;
    margin: 0 4px;
  }

  /* 숨겨진 채팅하기 버튼 */
  .chat-btn {
  position: absolute;
  bottom: 10px;   /* 아래에서 10px 위 */
  left: 50%;      /* 좌측 50% 위치 */
  transform: translateX(-50%); /* 가로 가운데 정렬 */
  background-color: #f2d8b1;
  border: none;
  color: black;
  padding: 6px 12px;
  border-radius: 5px;
  cursor: pointer;
  opacity: 0;
  transition: opacity 0.3s ease;
  font-weight: bold;
  font-size: 0.9em;
  z-index: 10;
}
  /* 카드에 마우스 올라가면 버튼 나타남 */
  .card:hover .chat-btn {
    opacity: 1;
  }

  .btn-back {
    background: #f7ecdc;
    border: none;
    cursor: pointer;
    color: black;
    padding: 6px 12px;
    border-radius: 5px;
  }

  .btn-back:hover {
    background-color: #f2d8b1;
  }
  
</style>
</head>

<body class="m-0 h-full" style="background-color: #f7f0e9;">

    <c:choose>
    <c:when test="${rq.loginedTeam == null}">
        <section class="bg-cover bg-repeat flex flex-col justify-center items-center"
                 style="background-image: url('/images/bg12.png'); cursor: url('/images/cursor0.png') 25 25, auto; background-repeat: repeat; background-size: auto;">
    </c:when>
    <c:when test="${rq.loginedTeam eq '한화 이글스'}">
        <section class="bg-cover bg-repeat flex flex-col justify-center items-center"
                 style="background-image: url('/images/bg21.png'); cursor: url('/images/cursor2.png') 25 25, auto; background-repeat: repeat; background-size: auto;">
    </c:when>
    <c:when test="${rq.loginedTeam eq '두산 베어스'}">
        <section class="bg-cover bg-repeat flex flex-col justify-center items-center"
                 style="background-image: url('/images/bg22.png') cursor: url('/images/cursor3.png') 25 25, auto; background-repeat: repeat; background-size: auto;">
    </c:when>
        <c:when test="${rq.loginedTeam eq '롯데 자이언츠'}">
        <section class="bg-cover bg-repeat flex flex-col justify-center items-center"
                 style="background-image: url('/images/bg23.png') cursor: url('/images/cursor4.png') 25 25, auto; background-repeat: repeat; background-size: auto;">
    </c:when>
        <c:when test="${rq.loginedTeam eq 'LG 트윈스'}">
        <section class="bg-cover bg-repeat flex flex-col justify-center items-center"
                 style="background-image: url('/images/bg24.png'); cursor: url('/images/cursor5.png') 25 25, auto; background-repeat: repeat; background-size: auto;">
    </c:when>
        <c:when test="${rq.loginedTeam eq '삼성 라이온즈'}">
        <section class="bg-cover bg-repeat flex flex-col justify-center items-center"
                 style="background-image: url('/images/bg25.png'); cursor: url('/images/cursor6.png') 25 25, auto; background-repeat: repeat; background-size: auto;">
    </c:when>
        <c:when test="${rq.loginedTeam eq '키움 히어로즈'}">
        <section class="bg-cover bg-repeat flex flex-col justify-center items-center" 
                 style="background-image: url('/images/bg26.png'); cursor: url('/images/cursor7.png') , auto; background-repeat: repeat; background-size: auto;">
    </c:when>
        <c:when test="${rq.loginedTeam eq 'SSG 랜더스'}">
        <section class="bg-cover bg-repeat flex flex-col justify-center items-center"
                 style="background-image: url('/images/bg27.png'); cursor: url('/images/cursor1.png') 25 25, auto; background-repeat: repeat; background-size: auto;">
    </c:when>
        <c:when test="${rq.loginedTeam eq 'NC 다이노스'}">
        <section class="bg-cover bg-repeat flex flex-col justify-center items-center" 
         style="background-image: url('/images/bg28.png'); cursor: url('/images/cursor8.png') 25 25, auto; background-repeat: repeat; background-size: auto;">
    </c:when>
        <c:when test="${rq.loginedTeam eq 'KT 위즈'}">
        <section class="bg-cover bg-repeat flex flex-col justify-center items-center"
                 style="background-image: url('/images/bg29.png'); cursor: url('/images/cursor9.png') 25 25, auto; background-repeat: repeat; background-size: auto;">
    </c:when>
        <c:when test="${rq.loginedTeam eq 'KIA 타이거즈'}">
        <section class="bg-cover bg-repeat flex flex-col justify-center items-center" 
                 style="background-image: url('/images/bg30.png'); cursor: url('/images/cursor10.png') 25 25, auto; background-repeat: repeat; background-size: auto;">
    </c:when>
</c:choose>

<div class="section-overlay"></div> 

<div style="background-color: #faf5f0;">
  <h2 style="font-size: 3em; font-weight: bold; color: black; text-align: center;">추천 친구 목록</h2>
  <h2 style="font-size: 1em; font-weight: bold; color: black; text-align: center;">취향이 비슷한 친구들을 추천 드려요!</h2>
</div>
    <div class="main">
      <c:choose>
        <c:when test="${not empty recommendedFriends}">
          <c:forEach var="recommend" items="${recommendedFriends}">
            <div class="card">
              <c:choose>
                <c:when test="${empty recommend.profileImg}">
                  <img src="/images/ball.jpg" alt="기본 이미지" class="profile-img" />
                </c:when>
                <c:otherwise>
                  <img src="${recommend.profileImg}" alt="회원 이미지" class="profile-img" />
                </c:otherwise>
              </c:choose>

              <button class="chat-btn" type="button"
    onclick="location.href='/usr/project/chat/start?otherId=${recommend.id}'">
    채팅하기
</button>

              <div class="nickname">${recommend.nickname}</div>
              <div class="intro">${recommend.introduce}</div>
              <div>
                <c:forEach var="tag" items="${fn:split(recommend.survey.cheeringStyle, ',')}">
                  <span class="hashtag">#${tag}</span>
                </c:forEach>
              </div>
            </div>
          </c:forEach>

          <c:if test="${fn:length(recommendedFriends) == 0}">
            <div style="text-align:center;">추천 친구가 없습니다.</div>
          </c:if>
        </c:when>

        <c:otherwise>
          <div style="text-align:center;">추천 친구가 없습니다.</div>
        </c:otherwise>
      </c:choose>

    </div>
      <!-- 뒤로가기 버튼 -->
      <div class="left-controls flex items-center gap-4 mt-4" style="justify-content:flex-start; text-align:left;">
        <button class="btn-back" type="button" onclick="history.back();">뒤로가기</button>
      </div>
  </section>

</body>
</html>