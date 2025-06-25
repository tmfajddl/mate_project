<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/head.jspf"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="en">
  <style>
  
    .btn-back {
    margin-top: 30px;
      background: none;
      border: none;
      cursor: pointer;
      color: black;
      padding: 4px 10px;
      border-radius: 5px;
      background-color: #f7ecdc;
    }
    .btn-back:hover {
      background-color: #f2d8b1;
    }
    
    /* 뉴스 슬라이더 스타일 */
.news-slider-container {
  width: 80vw;
  height: 50vh; /* 기존 60vh → 3배 확대 */
  margin: 20px auto;
  overflow: hidden;
  border-radius: 15px;
  box-shadow: 0 4px 10px rgba(0,0,0,0.2);
  position: relative;
}

    .news-slider {
      display: flex;
      height: 100%;
      overflow-x: auto;
      scroll-behavior: smooth;
      scrollbar-width: none; /* Firefox */
    }
    .news-slider::-webkit-scrollbar {
      display: none; /* Chrome, Safari */
    }

    .news-card {
    width: calc(100%/2);
      min-width: 300px;
      height: 100%;
      flex-shrink: 0;
      border-radius: 15px;
      margin-right: 15px;
      background-size: cover;
      background-position: center;
      position: relative;
      color: white;
      display: flex;
      align-items: flex-end;
      padding: 20px;
      box-shadow: inset 0 -60px 60px -20px rgba(0, 0, 0, 0.7);
      cursor: pointer;
      text-decoration: none;
    }

    .news-title {
      font-size: 2rem;
      font-weight: bold;
      text-shadow: 1px 1px 3px rgba(0,0,0,0.8);
    }

    .slider-button {
      position: absolute;
      top: 50%;
      transform: translateY(-50%);
      background-color: rgba(247,236,220,0.7);
      border: none;
      border-radius: 50%;
      width: 40px;
      height: 40px;
      cursor: pointer;
      z-index: 10;
    }
    .slider-button:hover {
      background-color: #f2d8b1;
    }
    .slider-button.left {
      left: 10px;
    }
    .slider-button.right {
      right: 10px;
    }
    
    .players-container {
  display: flex;
  width: 100vw;
  margin: 0;
  gap: 20px;
  transform: scale(0.8);
  
}
section {
  min-height: 100vh;
}

  .box-rounded {
    background-color: #fff7e6;
    border-radius: 15px;
    padding: 20px;
    box-shadow: 0 2px 8px rgba(0,0,0,0.1);
    width: 40%; /* 부모 컨테이너 너비의 절반 */
    overflow-x: auto; /* 테이블 가로 스크롤 방지용 */
  }

  .player-table {
    width: 100%;
    border-collapse: collapse;
  }

  .player-table th, .player-table td {
    padding: 8px 12px;
    border-bottom: 1px solid #ddd;
    text-align: center;
  }

  .player-table th {
    background-color: #f7ecdc;
  }
  
  .box-rounded.schedule {
  width: 80%; /* 가로폭을 100%로 확장 */
  height: 20%;
}

@font-face {
    font-family: 'Ownglyph_ParkDaHyun';
    src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/2411-3@1.0/Ownglyph_ParkDaHyun.woff2') format('woff2');
    font-weight: normal;
    font-style: normal;
}

body {
  font-family: 'Ownglyph_ParkDaHyun', sans-serif;
  font-size: 1.25rem;
}
  
  
    
  </style>
</head>
<body class="m-0 h-full" style="background-color: #f7f0e9;">

<c:choose>
    <c:when test="${rq.loginedTeam == null}">
        <section class=" bg-cover bg-center bg-no-repeat bg-fixed flex flex-col items-center text-black"
                 style="background-image: url('/images/bg12.png'); cursor: url('/images/cursor0.png') 25 25, auto;">
    </c:when>
    <c:when test="${rq.loginedTeam eq '한화 이글스'}">
        <section class="bg-cover bg-center bg-no-repeat bg-fixed flex flex-col items-center text-black"
                 style="background-image: url('/images/bg21.png'); cursor: url('/images/cursor2.png') 25 25, auto;">
    </c:when>
    <c:when test="${rq.loginedTeam eq '두산 베어스'}">
        <section class="bg-cover bg-center bg-no-repeat bg-fixed flex flex-col items-center text-black"
                 style="background-image: url('/images/bg22.png'); cursor: url('/images/cursor3.png') 25 25, auto;">
    </c:when>
    <c:when test="${rq.loginedTeam eq '롯데 자이언츠'}">
        <section class="bg-cover bg-center bg-no-repeat bg-fixed flex flex-col items-center text-black"
                 style="background-image: url('/images/bg23.png'); cursor: url('/images/cursor4.png') 25 25, auto;">
    </c:when>
    <c:when test="${rq.loginedTeam eq 'LG 트윈스'}">
        <section class="bg-cover bg-center bg-no-repeat bg-fixed flex flex-col items-center text-black"
                 style="background-image: url('/images/bg24.png'); cursor: url('/images/cursor5.png') 25 25, auto;">
    </c:when>
    <c:when test="${rq.loginedTeam eq '삼성 라이온즈'}">
        <section class="bg-cover bg-center bg-no-repeat bg-fixed flex flex-col items-center text-black"
                 style="background-image: url('/images/bg25.png'); cursor: url('/images/cursor6.png') 25 25, auto;">
    </c:when>
    <c:when test="${rq.loginedTeam eq '키움 히어로즈'}">
        <section class="bg-cover bg-center bg-no-repeat bg-fixed flex flex-col items-center text-black"
                 style="background-image: url('/images/bg26.png'); cursor: url('/images/cursor7.png') 25 25, auto;">
    </c:when>
    <c:when test="${rq.loginedTeam eq 'SSG 랜더스'}">
        <section class="bg-cover bg-center bg-no-repeat bg-fixed flex flex-col items-center text-black"
                 style="background-image: url('/images/bg27.png'); cursor: url('/images/cursor1.png') 25 25, auto;">
    </c:when>
    <c:when test="${rq.loginedTeam eq 'NC 다이노스'}">
        <section class="bg-cover bg-center bg-no-repeat bg-fixed flex flex-col items-center text-black"
         style="background-image: url('/images/bg28.png'); cursor: url('/images/cursor8.png') 25 25, auto;">
    </c:when>
    <c:when test="${rq.loginedTeam eq 'KT 위즈'}">
        <section class="bg-cover bg-center bg-no-repeat bg-fixed flex flex-col items-center text-black"
                 style="background-image: url('/images/bg29.png'); cursor: url('/images/cursor9.png') 25 25, auto;">
    </c:when>
    <c:when test="${rq.loginedTeam eq 'KIA 타이거즈'}">
        <section class="bg-cover bg-center bg-no-repeat bg-fixed flex flex-col items-center text-white"
                 style="background-image: url('/images/bg30.png'); cursor: url('/images/cursor10.png') 25 25, auto;">
    </c:when>
</c:choose>

  <!-- 뉴스 슬라이더를 상단에 배치 -->
  <c:set var="teamName" value="${rq.loginedTeam}" />

<div class="news-slider-container">
    <button class="slider-button left" aria-label="왼쪽으로 이동">&#10094;</button>
    <div class="news-slider" id="newsSlider">
      <c:forEach var="news" items="${breakingNews}">
        <%-- 제목이나 본문에 teamName 포함되어 있으면 출력 --%>
        <c:if test="${fn:contains(news.title, teamName) or fn:contains(news.body, teamName)}">
          <a href="${news.linkUrl}" target="_blank" class="news-card" 
             style="background-image: url('${news.imgUrl != null ? news.imgUrl : '/images/default-news.png'}');">
            <div class="news-title">${news.title}</div>
          </a>
        </c:if>
      </c:forEach>
    </div>
    <button class="slider-button right" aria-label="오른쪽으로 이동">&#10095;</button>
</div>
  <c:set var="loginedTeamFull" value="${rq.loginedTeam}" />
<c:set var="loginedTeamShort" value="${fn:split(loginedTeamFull, ' ')[0]}" />
 <!-- 선수 등록 / 말소 현황을 가로 배치하는 컨테이너 -->
<div class="players-container self-start">
  <div class="box-rounded">
    <div class="section-title">등록 선수 현황</div>

<table class="player-table">
  <thead>
    <tr>
      <th>선수명</th>
      <th>포지션</th>
      <th>팀</th>
    </tr>
  </thead>
  <tbody>
    <c:choose>
      <c:when test="${empty registeredPlayers}">
        <tr>
          <td colspan="3">당일 1군 등록된 선수가 없습니다.</td>
        </tr>
      </c:when>
      <c:otherwise>
        <!-- 로그인 팀 선수 먼저 출력 -->
        <c:forEach var="player" items="${registeredPlayers}">
          <c:if test="${player.team == loginedTeamShort}">
            <tr style="background-color:#ffffe0;">
              <td><c:out value="${player.name}" /></td>
              <td><c:out value="${player.position}" /></td>
              <td><c:out value="${player.team}" /></td>
            </tr>
          </c:if>
        </c:forEach>

        <!-- 그 외 선수 출력 -->
        <c:forEach var="player" items="${registeredPlayers}">
          <c:if test="${player.team != loginedTeamShort}">
            <tr>
              <td><c:out value="${player.name}" /></td>
              <td><c:out value="${player.position}" /></td>
              <td><c:out value="${player.team}" /></td>
            </tr>
          </c:if>
        </c:forEach>
      </c:otherwise>
    </c:choose>
  </tbody>
</table>
  </div>

  <div class="box-rounded">
    <div class="section-title">말소 선수 현황</div>
    <c:set var="teamName" value="${rq.loginedTeam}" />

<table class="player-table">
  <thead>
    <tr>
      <th>선수명</th>
      <th>포지션</th>
      <th>팀</th>
    </tr>
  </thead>
  <tbody>
    <c:choose>
      <c:when test="${empty canceledPlayers}">
        <tr>
          <td colspan="3">당일 1군 말소된 선수가 없습니다.</td>
        </tr>
      </c:when>
      <c:otherwise>
        <!-- 로그인 팀 선수 먼저 출력 -->
        <c:forEach var="player" items="${canceledPlayers}">
          <c:if test="${player.team == loginedTeamShort}">
            <tr style="background-color:#ffffe0;">
              <td><c:out value="${player.name}" /></td>
              <td><c:out value="${player.position}" /></td>
              <td><c:out value="${player.team}" /></td>
            </tr>
          </c:if>
        </c:forEach>

        <!-- 그 외 선수 출력 -->
        <c:forEach var="player" items="${canceledPlayers}">
          <c:if test="${player.team != loginedTeamShort}">
            <tr>
              <td><c:out value="${player.name}" /></td>
              <td><c:out value="${player.position}" /></td>
              <td><c:out value="${player.team}" /></td>
            </tr>
          </c:if>
        </c:forEach>
      </c:otherwise>
    </c:choose>
  </tbody>
</table>
  </div>
  
<div class="box-rounded schedule"> 
  <div class="section-title">오늘 야구 일정</div>
  <table class="player-table">
    <thead>
      <tr>
          <th>시간</th>
          <th>경기</th>
          <th>구장</th>
      </tr>
    </thead>
    <tbody>
      <c:choose>
        <c:when test="${empty naverBaseballSchedule 
    or empty naverBaseballSchedule[0]['왼쪽팀명'] 
    or empty naverBaseballSchedule[0]['오른쪽팀명']}">
  <tr>
    <td colspan="4">오늘 야구 일정이 없습니다.</td>
  </tr>
</c:when>
        <c:otherwise>
          <!-- 1) 로그인 팀명이 포함된 일정 먼저 출력 -->
          <c:forEach var="row" items="${naverBaseballSchedule}">
            <c:if test="${fn:contains(row['왼쪽팀명'], loginedTeamShort) or fn:contains(row['오른쪽팀명'], loginedTeamShort)}">
              <tr>
                <td><c:out value="${row['시간']}" /></td>
                <td>
                  <c:out value="${row['왼쪽팀명']}" /> (<c:out value="${row['왼쪽상태및투수']}" />) VS 
                  <c:out value="${row['오른쪽팀명']}" /> (<c:out value="${row['오른쪽상태및투수']}" />)
                </td>
                <td><c:out value="${row['구장']}" /></td>
              </tr>
            </c:if>
          </c:forEach>

          <!-- 2) 그 외 일정 출력 -->
          <c:forEach var="row" items="${naverBaseballSchedule}">
            <c:if test="${!(fn:contains(row['왼쪽팀명'], loginedTeamShort) or fn:contains(row['오른쪽팀명'], loginedTeamShort))}">
              <tr>
                <td><c:out value="${row['시간']}" /></td>
                <td>
                  <c:out value="${row['왼쪽팀명']}" /> (<c:out value="${row['왼쪽상태및투수']}" />) VS 
                  <c:out value="${row['오른쪽팀명']}" /> (<c:out value="${row['오른쪽상태및투수']}" />)
                </td>
                <td><c:out value="${row['구장']}" /></td>
              </tr>
            </c:if>
          </c:forEach>
        </c:otherwise>
      </c:choose>
    </tbody>
  </table>
</div>
  
    <!-- 로그인 / 로그아웃 버튼 영역 -->
  <div style="margin-top: 20px;">
    <c:if test="${!rq.isLogined()}">
      <button class="btn-back"><a href="../member/login">로그인</a></button>
      <button class="btn-back">회원가입</button>
    </c:if>
    <c:if test="${rq.isLogined()}">
      <button class="btn-back">
        <a onclick="if(confirm('로그아웃 하시겠습니까?') == false) return false;" href="../member/doLogout">로그아웃</a>
      </button>
    </c:if>
  </div>
</div>

<script>
const slider = document.getElementById('newsSlider');
const btnLeft = document.querySelector('.slider-button.left');
const btnRight = document.querySelector('.slider-button.right');

function getCardWidth() {
  const card = slider.querySelector('.news-card');
  if (!card) return 320; // 기본값

  const style = window.getComputedStyle(card);
  const width = card.offsetWidth;
  const marginRight = parseInt(style.marginRight) || 0;

  return width + marginRight;
}

btnLeft.addEventListener('click', () => {
  const scrollAmount = getCardWidth();
  slider.scrollBy({ left: -scrollAmount, behavior: 'smooth' });
});

btnRight.addEventListener('click', () => {
  const scrollAmount = getCardWidth();
  slider.scrollBy({ left: scrollAmount, behavior: 'smooth' });
});
</script>
</section>
</body>
</html>