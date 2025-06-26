<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/head.jspf"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>야구 팬 메인 페이지</title>
  <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
  <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
  <link href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css" rel="stylesheet" />
  <script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script>
  <style>
     * { margin: 0; padding: 0; box-sizing: border-box; }
    body {
      font-family: 'Ownglyph_ParkDaHyun', sans-serif;
      background-color: #f7f0e9;
      overflow-x: hidden;
    }
    section {
      width: 100vw;
      min-height: 100vh;
      display: flex;
      justify-content: center;
      align-items: center;
      flex-direction: column;
      padding: 60px 20px;
    }
     .hero {
  position: relative;
  z-index: 0; /* 명확하게 설정 */
  width: 100vw;
  height: 100vh;
  overflow: hidden;
}
 .video-background {
  position: absolute;
  top: 50%;
  left: 2.5%;
  width: 177.77vh;
  height: 100vh;
  max-width: 100vw;
  transform: translate(-50%, -50%);
  overflow: hidden;
  z-index: -1;
}

.content {
  position: relative;
  z-index: 10; /* 더 크게 */
  color: white;
  text-align: center;
  padding: 2rem;
}

.video-background iframe {
  width: 100%;
  height: 100%;
  pointer-events: none;
  display: block;
}
    .section-title {
      font-size: 2rem;
      margin-bottom: 20px;
    }
    .swiper-section {
      width: 90%;
      max-width: 1000px;
    }
.swiper-card {
  background: #ffffff;
  border: 1px solid #e0e0e0;
  border-radius: 10px;
  padding: 16px;
  height: 100px;
  display: flex;
  flex-direction: column;
  justify-content: center;
  transition: box-shadow 0.2s ease;
  text-align: center;
}

.swiper-card:hover {
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.08);
}

.swiper-card-title {
  font-size: 1rem;
  font-weight: 600;
  margin-bottom: 8px;
}

.swiper-card div {
  font-size: 0.9rem;
}

.highlight {
  border: 2px solid #ffa500;
  background-color: #fffdf4;
}
    .news-card {
      background-size: cover;
      background-position: center;
      height: 200px;
      display: flex;
      align-items: end;
      padding: 16px;
      color: white;
      border-radius: 12px;
      text-shadow: 1px 1px 4px rgba(0,0,0,0.7);
    }
.btn-action {
  display: inline-flex;
  align-items: center;
  gap: 8px;
  color: #fff;
  padding: 12px 20px;
  font-size: 1rem;
  border: none;
  border-radius: 12px;
  cursor: pointer;
  box-shadow: 0 4px 10px rgba(0,0,0,0.1);
  transition: filter 0.2s, transform 0.2s;
}

.btn-action:hover {
  filter: brightness(85%);
  transform: translateY(-2px);
}

  .btn-group {
    display: flex;
    gap: 16px;
    margin-top: 30px;
  }
  </style>
</head>
<body class="m-0" style="background-color: #f7f0e9;">

<c:choose>
    <c:when test="${rq.loginedTeam == null}">
        <section class="bg-cover bg-repeat"
                 style="background-image: url('/images/bg12.png'); cursor: url('/images/cursor0.png') 25 25, auto; background-repeat: repeat; background-size: auto;">
    </c:when>
    <c:when test="${rq.loginedTeam eq '한화 이글스'}">
        <section class="bg-cover bg-repeat"
                 style="background-image: url('/images/bg21.png'); cursor: url('/images/cursor2.png') 25 25, auto; background-repeat: repeat; background-size: auto;">
    </c:when>
    <c:when test="${rq.loginedTeam eq '두산 베어스'}">
        <section class="bg-cover bg-repeat"
                 style="background-image: url('/images/bg22.png') cursor: url('/images/cursor3.png') 25 25, auto; background-repeat: repeat; background-size: auto;">
    </c:when>
        <c:when test="${rq.loginedTeam eq '롯데 자이언츠'}">
        <section class="bg-cover bg-repeat"
                 style="background-image: url('/images/bg23.png') cursor: url('/images/cursor4.png') 25 25, auto; background-repeat: repeat; background-size: auto;">
    </c:when>
        <c:when test="${rq.loginedTeam eq 'LG 트윈스'}">
        <section class="bg-cover bg-repeat"
                 style="background-image: url('/images/bg24.png'); cursor: url('/images/cursor5.png') 25 25, auto; background-repeat: repeat; background-size: auto;">
    </c:when>
        <c:when test="${rq.loginedTeam eq '삼성 라이온즈'}">
        <section class="bg-cover bg-repeat"
                 style="background-image: url('/images/bg25.png'); cursor: url('/images/cursor6.png') 25 25, auto; background-repeat: repeat; background-size: auto;">
    </c:when>
        <c:when test="${rq.loginedTeam eq '키움 히어로즈'}">
        <section class="bg-cover bg-repeat"
                 style="background-image: url('/images/bg26.png'); cursor: url('/images/cursor7.png') , auto; background-repeat: repeat; background-size: auto;">
    </c:when>
        <c:when test="${rq.loginedTeam eq 'SSG 랜더스'}">
        <section class="bg-cover bg-repeat"
                 style="background-image: url('/images/bg27.png'); cursor: url('/images/cursor1.png') 25 25, auto; background-repeat: repeat; background-size: auto;">
    </c:when>
        <c:when test="${rq.loginedTeam eq 'NC 다이노스'}">
        <section class="bg-cover bg-repeat"
         style="background-image: url('/images/bg28.png'); cursor: url('/images/cursor8.png') 25 25, auto; background-repeat: repeat; background-size: auto;">
    </c:when>
        <c:when test="${rq.loginedTeam eq 'KT 위즈'}">
        <section class="bg-cover bg-repeat"
                 style="background-image: url('/images/bg29.png'); cursor: url('/images/cursor9.png') 25 25, auto; background-repeat: repeat; background-size: auto;">
    </c:when>
        <c:when test="${rq.loginedTeam eq 'KIA 타이거즈'}">
        <section class="bg-cover bg-repeat"
                 style="background-image: url('/images/bg30.png'); cursor: url('/images/cursor10.png') 25 25, auto; background-repeat: repeat; background-size: auto;">
    </c:when>
</c:choose>

<c:set var="team" value="${rq.loginedTeam}" />
<c:set var="shortTeam" value="${fn:substring(team, 0, 2)}" />

<%-- 기본 영상 ID 설정 --%>
<c:set var="videoId" value="OQpSpCIM5GE" />

<%-- 팀별 영상 ID 분기 설정 --%>
<c:choose>
  <c:when test="${shortTeam == '한화'}">
    <c:set var="videoId" value="8TswlwWIV9c" />
  </c:when>
  <c:when test="${shortTeam == 'LG'}">
    <c:set var="videoId" value="ZP_p9sPPPjY" />
  </c:when>
  <c:when test="${shortTeam == '롯데'}">
    <c:set var="videoId" value="Pl_8gPuQLlc" />
  </c:when>
  <c:when test="${shortTeam == 'KI'}"> <%-- KIA --%>
    <c:set var="videoId" value="1tdthdeILno" />
  </c:when>
  <c:when test="${shortTeam == 'KT'}">
    <c:set var="videoId" value="0U-oOIdapss" />
  </c:when>
  <c:when test="${shortTeam == '삼성'}">
    <c:set var="videoId" value="TYjA8kguSts" />
  </c:when>
  <c:when test="${shortTeam == 'SS'}"> <%-- SSG --%>
    <c:set var="videoId" value="a2Er8gPMNzI" />
  </c:when>
  <c:when test="${shortTeam == '두산'}">
    <c:set var="videoId" value="gs9wCs3lCRQ" />
  </c:when>
  <c:when test="${shortTeam == '키움'}">
    <c:set var="videoId" value="kPivCYyNWx8" />
  </c:when>
  <c:when test="${shortTeam == 'NC'}">
    <c:set var="videoId" value="E-zSRbhAWhY" />
  </c:when>
</c:choose>
<%-- Hero Section --%>
<section class="hero">
  <div class="video-background">
    <iframe 
      src="https://www.youtube.com/embed/${videoId}?autoplay=1&mute=1&loop=1&playlist=${videoId}&controls=0&showinfo=0&rel=0"
      frameborder="0" allow="autoplay" allowfullscreen>
    </iframe>
  </div>
  <div class="content">
    <!-- 여기에 페이지 내용 추가 -->
  </div>
</section>
<%-- 로그인한 팀 앞 두 글자 추출 --%>
<c:set var="shortTeam" value="${fn:substring(rq.loginedTeam, 0, 2)}" />

<section data-aos="fade-up">
  <!-- 뉴스 슬라이더 -->
  <div class="section-title">📰 ${rq.loginedTeam != null ? rq.loginedTeam : ""} 관련 뉴스</div>
  <div class="swiper swiper-section">
    <div class="swiper-wrapper">
      <c:forEach var="news" items="${breakingNews}">
        <c:if test="${fn:contains(news.title, team) || fn:contains(news.body, team)}">
          <div class="swiper-slide">
            <a href="${news.linkUrl}" target="_blank">
              <div class="news-card" style="background-image:url('${news.imgUrl != null ? news.imgUrl : "/images/default-news.png"}')">
                <div>${news.title}</div>
              </div>
            </a>
          </div>
        </c:if>
      </c:forEach>
    </div>
  </div>

  <!-- 최근 경기 영상 -->
  <div class="section-title" style="margin-top: 40px;">🎬 ${rq.loginedTeam != null ? rq.loginedTeam : ""} 최근 경기 영상</div>
  <div class="swiper swiper-section">
    <div class="swiper-wrapper">
      <c:forEach var="video" items="${videoIds3}">
        <div class="swiper-slide" style="width: 300px;">
          <div class="swiper-card" style="height: 250px; position: relative; border-radius: 8px; overflow: hidden;">
            <iframe src="https://www.youtube.com/embed/${video.id}" 
                    frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" 
                    allowfullscreen 
                    style="width: 100%; height: 100%; display: block;">
            </iframe>
            <div style="
              position: absolute;
              bottom: 0;
              left: 0;
              width: 100%;
              padding: 10px;
              background: rgba(0, 0, 0, 0.6);
              color: white;
              font-weight: 600;
              font-size: 1rem;
              box-sizing: border-box;
            ">
              ${video.title}
            </div>
          </div>
        </div>
      </c:forEach>
    </div>
  </div>
</section>



<section data-aos="fade-up" >
  <div class="section-title">📅 오늘의 ${rq.loginedTeam} 일정 및 선수 현황</div>

  <%-- 경기 일정: 로그인 팀 위주 --%>
  <div class="section-title" style="font-size: 1.2rem;">경기 일정</div>
  <div class="swiper swiper-section" style="margin-bottom: 30px">
    <div class="swiper-wrapper">
      <c:forEach var="row" items="${naverBaseballSchedule}">
        <c:if test="${fn:contains(row['왼쪽팀명'], shortTeam) || fn:contains(row['오른쪽팀명'], shortTeam)}">
          <div class="swiper-slide">
            <div class="swiper-card" style="background-color: white; color: black;">
              <div class="swiper-card-title">${row['왼쪽팀명']} (${row['왼쪽상태및투수']}) VS ${row['오른쪽팀명']} (${row['오른쪽상태및투수']})</div>
              <div>시간: ${row['시간']}</div>
              <div>구장: ${row['구장']}</div>
            </div>
          </div>
        </c:if>
      </c:forEach>
      <c:forEach var="row" items="${naverBaseballSchedule}">
        <c:if test="${!(fn:contains(row['왼쪽팀명'], shortTeam) || fn:contains(row['오른쪽팀명'], shortTeam))}">
          <div class="swiper-slide">
            <div class="swiper-card">
              <div class="swiper-card-title">${row['왼쪽팀명']} (${row['왼쪽상태및투수']}) VS ${row['오른쪽팀명']} (${row['오른쪽상태및투수']})</div>
              <div>시간: ${row['시간']}</div>
              <div>구장: ${row['구장']}</div>
            </div>
          </div>
        </c:if>
      </c:forEach>
    </div>
  </div>

  <%-- 등록 선수 --%>
  <div class="section-title" style="font-size: 1.2rem;">📌 등록 선수</div>
  <div class="swiper swiper-section">
    <div class="swiper-wrapper">
      <c:forEach var="p" items="${registeredPlayers}">
        <%-- 선수별 팀 컬러 설정 --%>
        <c:set var="playerTeamColor" value="#f2d8b1" />
        <c:choose>
          <c:when test="${fn:contains(p.team, 'LG')}"><c:set var="playerTeamColor" value="#C30452" /></c:when>
          <c:when test="${fn:contains(p.team, '두산')}"><c:set var="playerTeamColor" value="#1A1748" /></c:when>
          <c:when test="${fn:contains(p.team, 'SSG')}"><c:set var="playerTeamColor" value="#CE0E2D" /></c:when>
          <c:when test="${fn:contains(p.team, '삼성')}"><c:set var="playerTeamColor" value="#074CA1" /></c:when>
          <c:when test="${fn:contains(p.team, '롯데')}"><c:set var="playerTeamColor" value="#041E42" /></c:when>
          <c:when test="${fn:contains(p.team, '한화')}"><c:set var="playerTeamColor" value="#FC4E00" /></c:when>
          <c:when test="${fn:contains(p.team, 'KIA')}"><c:set var="playerTeamColor" value="#EA0029" /></c:when>
          <c:when test="${fn:contains(p.team, 'NC')}"><c:set var="playerTeamColor" value="#315288" /></c:when>
          <c:when test="${fn:contains(p.team, '키움')}"><c:set var="playerTeamColor" value="#570514" /></c:when>
          <c:when test="${fn:contains(p.team, 'KT')}"><c:set var="playerTeamColor" value="#000000" /></c:when>
        </c:choose>

        <div class="swiper-slide">
          <div class="swiper-card" style="background-color: ${playerTeamColor}; color: white;">
            <div class="swiper-card-title">${p.name}</div>
            <div>포지션: ${p.position}</div>
            <div>팀: ${p.team}</div>
          </div>
        </div>
      </c:forEach>
    </div>
  </div>

  <%-- 말소 선수 --%>
  <div class="section-title" style="font-size: 1.2rem; margin-top: 30px;">❌ 말소 선수</div>
  <div class="swiper swiper-section">
    <div class="swiper-wrapper">
      <c:forEach var="p" items="${canceledPlayers}">
        <%-- 선수별 팀 컬러 설정 --%>
        <c:set var="playerTeamColor" value="#f2d8b1" />
        <c:choose>
          <c:when test="${fn:contains(p.team, 'LG')}"><c:set var="playerTeamColor" value="#C30452" /></c:when>
          <c:when test="${fn:contains(p.team, '두산')}"><c:set var="playerTeamColor" value="#1A1748" /></c:when>
          <c:when test="${fn:contains(p.team, 'SSG')}"><c:set var="playerTeamColor" value="#CE0E2D" /></c:when>
          <c:when test="${fn:contains(p.team, '삼성')}"><c:set var="playerTeamColor" value="#074CA1" /></c:when>
          <c:when test="${fn:contains(p.team, '롯데')}"><c:set var="playerTeamColor" value="#041E42" /></c:when>
          <c:when test="${fn:contains(p.team, '한화')}"><c:set var="playerTeamColor" value="#FC4E00" /></c:when>
          <c:when test="${fn:contains(p.team, 'KIA')}"><c:set var="playerTeamColor" value="#EA0029" /></c:when>
          <c:when test="${fn:contains(p.team, 'NC')}"><c:set var="playerTeamColor" value="#315288" /></c:when>
          <c:when test="${fn:contains(p.team, '키움')}"><c:set var="playerTeamColor" value="#570514" /></c:when>
          <c:when test="${fn:contains(p.team, 'KT')}"><c:set var="playerTeamColor" value="#000000" /></c:when>
        </c:choose>

        <div class="swiper-slide">
          <div class="swiper-card" style="background-color: ${playerTeamColor}; color: white;">
            <div class="swiper-card-title">${p.name}</div>
            <div>포지션: ${p.position}</div>
            <div>팀: ${p.team}</div>
          </div>
        </div>
      </c:forEach>
    </div>
  </div>
</section>

<c:set var="teamColor" value="#f2d8b1" />
<c:choose>
  <c:when test="${shortTeam == 'LG'}"><c:set var="teamColor" value="#C30452" /></c:when>
  <c:when test="${shortTeam == '두산'}"><c:set var="teamColor" value="#1A1748" /></c:when>
  <c:when test="${shortTeam == 'SS'}"><c:set var="teamColor" value="#CE0E2D" /></c:when>
  <c:when test="${shortTeam == '삼성'}"><c:set var="teamColor" value="#074CA1" /></c:when>
  <c:when test="${shortTeam == '롯데'}"><c:set var="teamColor" value="#041E42" /></c:when>
  <c:when test="${shortTeam == '한화'}"><c:set var="teamColor" value="#FC4E00" /></c:when>
  <c:when test="${shortTeam == 'KI'}"><c:set var="teamColor" value="#EA0029" /></c:when>
  <c:when test="${shortTeam == 'NC'}"><c:set var="teamColor" value="#315288" /></c:when>
  <c:when test="${shortTeam == '키움'}"><c:set var="teamColor" value="#570514" /></c:when>
  <c:when test="${shortTeam == 'KT'}"><c:set var="teamColor" value="#000000" /></c:when>
</c:choose>
<%-- 로그인/로그아웃 --%>
<section data-aos="fade-up">
  <div class="btn-group">
    <c:if test="${!rq.isLogined()}">
      <button class="btn-action" style="background-color: ${teamColor};" onclick="location.href='../member/login'">🔐 로그인</button>
      <button class="btn-action" style="background-color: ${teamColor};" onclick="location.href='../member/join'">📝 회원가입</button>
    </c:if>
    <c:if test="${rq.isLogined()}">
      <button class="btn-action" style="background-color: ${teamColor};" onclick="if(confirm('로그아웃 하시겠습니까?')) location.href='../member/doLogout'">🚪 로그아웃</button>
    </c:if>
  </div>
</section>
</section>
<script>
  AOS.init();
  new Swiper('.swiper-section', {
    slidesPerView: 1.2,
    spaceBetween: 20,
    loop: false,
    autoplay: {
      delay: 4000,
    },
    breakpoints: {
      768: { slidesPerView: 2 },
      1024: { slidesPerView: 3 }
    }
  });
</script>
</body>
</html>