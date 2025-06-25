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

  /* 컨테이너 넓히고 위아래 여백 넉넉하게 */
  .video-slider-wrapper {
    position: relative;
    width: 80%;
    margin: 40px auto 60px auto;
  }

  /* 제목 크고 진하게 + 텍스트 그림자 */
  .video-slider-wrapper h2 {
    margin-left: 0.5%;
    margin-bottom: 20px;
    font-size: 2.4em;
    font-weight: 900;
    color: #222;
    letter-spacing: 1.2px;
    text-shadow: 1px 1px 3px rgba(0,0,0,0.15);
  }

  /* 슬라이더 flex */
  .video-slider {
    display: flex;
    overflow-x: hidden;
  }

  /* 카드 스타일 + 그림자 + 둥근 모서리 + margin */
  .video-item {
    background-color: white;
    flex: 0 0 calc(33.3333% - 15px);
    margin-right: 20px;
    border-radius: 16px;
    box-shadow: 0 8px 20px rgba(0,0,0,0.12);
    overflow: hidden;
    transition: transform 0.3s ease, box-shadow 0.3s ease;
    cursor: pointer;
  }

  /* hover 시 확대 + 그림자 강하게 */
  .video-item:hover {
    box-shadow: 0 15px 40px rgba(0,0,0,0.25);
  }

  /* iframe 스타일 - 둥근 모서리 상단만 + border 제거 */
  .video-item iframe {
    width: 100%;
    height: 200px;
    border: none;
    border-bottom: 1px solid #ddd;
    border-radius: 16px 16px 0 0;
  }

  /* 제목 및 날짜 영역 약간 여백 조절 */
  .video-item > div {
    padding: 10px 12px;
    font-size: 0.95em;
    color: #333;
  }

  /* 슬라이더 버튼 원형 + 투명도 + 그림자 + 위치 조정 */
  .btn-slide {
  position: absolute;
  top: 60%;
  transform: translateY(-50%);
  border-radius: 50%;
  color: #black;
  font-size: 1.8rem;
  cursor: pointer;
  z-index: 30;
  transition: all 0.3s ease;
}


.btn-prev {
  left: -30px;
}

.btn-next {
  right: -30px;
}

  /* 섹션 오버레이 더 부드럽게 */
  .section-overlay {
    position: absolute;
    inset: 0;
    background-color: rgba(255, 255, 255, 0.3);
    z-index: 1;
  }

  /* section 콘텐츠 텍스트 그림자 */
  section > *:not(.section-overlay) {
    position: relative;
    z-index: 2;
    text-shadow: 0 1px 3px rgba(0,0,0,0.1);
  }

  /* 배경 및 섹션 기본 스타일 유지 */
  section {
    min-height: 100vh;
    position: relative;
    z-index: 0;
  }

  /* 반응형 */
  @media (max-width: 900px) {
    .video-item {
      flex: 0 0 calc(50% - 12px);
    }
  }
  @media (max-width: 600px) {
    .video-item {
      flex: 0 0 100%;
      margin-right: 0;
    }
    .btn-slide {
      font-size: 2rem;
      padding: 8px 12px;
    }
    .btn-prev {
      left: 5px;
    }
    .btn-next {
      right: 5px;
    }
  }
</style>

<body class="m-0 h-full" style="background-color: #f7f0e9;">

  <!-- 배경 설정 -->
  <c:choose>
    <c:when test="${rq.loginedTeam == null}">
      <section class="bg-cover bg-center bg-no-repeat bg-fixed flex flex-col items-center text-black"
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

  <div class="section-overlay"></div>

  <!-- 최근 경기 영상 -->
  <div style="background-color: #f7f0e9;" class="video-slider-wrapper" style="padding-top: 40px;">
    <h2>${rq.loginedTeam} 최근 경기 영상</h2>

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
              <div>
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

  <!-- 재미있는 KBO 모음집 -->
  <div style="background-color: #f7f0e9;" class="video-slider-wrapper">
    <h2>재미있는 KBO 모음집</h2>

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
              <div>
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
<c:if test="${rq.isLogined()}">
  <!-- 선수 일상 -->
  <div style="background-color: #f7f0e9;" class="video-slider-wrapper">
    <h2>${rq.loginedTeam} 선수 일상</h2>

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
              <div>
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
</c:if>
  <script>
    function slideVideosById(sliderId, direction) {
      const slider = document.getElementById(sliderId);
      if (!slider) return;

      const item = slider.querySelector('.video-item');
      if (!item) return;

      const itemWidth = item.offsetWidth + 20; // margin-right 포함 (20px로 맞춤)
      slider.scrollLeft += direction * itemWidth * 3; // 3개씩 이동
    }
  </script>

</section>
</body>
</html>