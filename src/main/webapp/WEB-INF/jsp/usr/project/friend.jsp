<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="../common/head.jspf"%>

<!DOCTYPE html>
<html lang="en">
<head>
<style>
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
    background-color: #f0f8ff;
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
  background-color: #4a90e2;
  border: none;
  color: white;
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
    background: #82c3f5;
    border: none;
    cursor: pointer;
    color: #fff;
    padding: 6px 12px;
    border-radius: 5px;
  }

  .btn-back:hover {
    background-color: #4a90e2;
  }
</style>
</head>

<body class="m-0 h-full font-sans">

  <section class="h-screen bg-cover bg-center bg-no-repeat bg-fixed flex flex-col items-center justify-center text-black" style="background-image: url('/images/bg.jpg');">

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

              <button class="chat-btn" type="button" onclick="alert('채팅하기 기능 구현 필요');">채팅하기</button>

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