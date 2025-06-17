<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@ include file="../common/head.jspf"%>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">
<link href="https://cdn.jsdelivr.net/gh/projectnoonnu/2411-3@1.0/index.css" rel="stylesheet">
<style>
  body {
    font-family: 'Ownglyph_ParkDaHyun', sans-serif;
  }
  .video-slider-wrapper {
    position: relative;
    width: 80%;
    margin: 20px auto 0 auto;
  }
  .video-slider {
    display: flex;
    overflow-x: hidden;
    scroll-behavior: smooth;
  }
  .video-item {
  background-color: white;
    flex: 0 0 calc(33.3333% - 10px); /* 3개씩 보이도록 너비 설정 */
    margin-right: 15px;
  }
  .video-item iframe {
    width: 100%;
    height: 180px;
  }
  /* 버튼 스타일 */
  .btn-slide {
    position: absolute;
    top: 50%;
    transform: translateY(-50%);
    background-color: rgba(255,255,255,0.8);
    border: none;
    font-size: 2rem;
    cursor: pointer;
    padding: 5px 10px;
    z-index: 10;
  }
  .btn-prev {
    left: -40px;
  }
  .btn-next {
    right: -40px;
  }
</style>

<body class="m-0 h-full" style="background-color: #f7f0e9;">

  <!-- 배경 설정 -->
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
                 style="background-image: url('/images/bg22.png'); cursor: url('/images/cursor3.png') 25 25, auto;">
    </c:when>
    <c:when test="${rq.loginedTeam eq '롯데 자이언츠'}">
        <section class="h-screen bg-cover bg-center bg-no-repeat bg-fixed flex flex-col items-center justify-center text-black"
                 style="background-image: url('/images/bg23.png'); cursor: url('/images/cursor4.png') 25 25, auto;">
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
                 style="background-image: url('/images/bg26.png'); cursor: url('/images/cursor7.png') 25 25, auto;">
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
  <h2 style="font-size: 3em; font-weight: bold; color: #918c84; text-align: left; margin-left: 1%;">영상</h2>
</div>
  
    <div class="video-slider-wrapper">
  <h2 style="font-size: 2em; font-weight: bold; color: black; text-align: left; margin-left: 1%;">
    ${rq.loginedTeam} 최근 경기 영상
  </h2>

  <c:choose>
    <c:when test="${not empty videoIds3}">
      <button class="btn-slide btn-prev" onclick="slideVideosById('videoSlider3', -1)">
        <i class="fas fa-chevron-left"></i>
      </button>
      <button class="btn-slide btn-next" onclick="slideVideosById('videoSlider3', 1)">
        <i class="fas fa-chevron-right"></i>
      </button>

      <div class="video-slider" id="videoSlider3">
        <c:forEach var="video" items="${videoIds3}">
          <div class="video-item">
            <iframe src="https://www.youtube.com/embed/${video.id}" frameborder="0" allowfullscreen></iframe>
            <div style="padding: 5px; font-size: 0.9em;">
              <strong>${video.title}</strong><br/>
              <small>${video.date}</small>
            </div>
          </div>
        </c:forEach>
      </div>
    </c:when>
    <c:otherwise>
      <p>최근 경기 영상이 없습니다.</p>
    </c:otherwise>
  </c:choose>
</div>
  
    <div class="video-slider-wrapper">
  <h2 style="font-size: 2em; font-weight: bold; color: black; text-align: left; margin-left: 1%;">
    재미있는 KBO 모음집
  </h2>

  <c:choose>
    <c:when test="${not empty videoIds2}">
      <button class="btn-slide btn-prev" onclick="slideVideosById('videoSlider2', -1)">
        <i class="fas fa-chevron-left"></i>
      </button>
      <button class="btn-slide btn-next" onclick="slideVideosById('videoSlider2', 1)">
        <i class="fas fa-chevron-right"></i>
      </button>

      <div class="video-slider" id="videoSlider2">
        <c:forEach var="video" items="${videoIds2}">
          <div class="video-item">
            <iframe src="https://www.youtube.com/embed/${video.id}" frameborder="0" allowfullscreen></iframe>
            <div style="padding: 5px; font-size: 0.9em;">
              <strong>${video.title}</strong><br/>
              <small>${video.date}</small>
            </div>
          </div>
        </c:forEach>
      </div>
    </c:when>
    <c:otherwise>
      <p>최근 영상이 없습니다.</p>
    </c:otherwise>
  </c:choose>
</div>
  
       <div class="video-slider-wrapper">
  <h2 style="font-size: 2em; font-weight: bold; color: black; text-align: left; margin-left: 1%;">
    ${rq.loginedTeam} 선수 일상
  </h2>

  <c:choose>
    <c:when test="${not empty videoIds}">
      <button class="btn-slide btn-prev" onclick="slideVideosById('videoSlider1', -1)">
        <i class="fas fa-chevron-left"></i>
      </button>
      <button class="btn-slide btn-next" onclick="slideVideosById('videoSlider1', 1)">
        <i class="fas fa-chevron-right"></i>
      </button>

      <div class="video-slider" id="videoSlider1">
        <c:forEach var="video" items="${videoIds}">
          <div class="video-item">
            <iframe src="https://www.youtube.com/embed/${video.id}" frameborder="0" allowfullscreen></iframe>
            <div style="padding: 5px; font-size: 0.9em;">
              <strong>${video.title}</strong><br/>
              <small>${video.date}</small>
            </div>
          </div>
        </c:forEach>
      </div>
    </c:when>
    <c:otherwise>
      <p>최근 영상이 없습니다.</p>
    </c:otherwise>
  </c:choose>
</div>
  

  <script>
    function slideVideosById(sliderId, direction) {
      const slider = document.getElementById(sliderId);
      if (!slider) return;

      const item = slider.querySelector('.video-item');
      if (!item) return;

      const itemWidth = item.offsetWidth + 15; // margin-right 포함
      slider.scrollLeft += direction * itemWidth * 3; // 3개씩 이동
    }
  </script>

  </section>
</body>
</html>