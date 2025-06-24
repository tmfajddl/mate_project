<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/head.jspf"%>
<link href="https://cdn.jsdelivr.net/gh/projectnoonnu/2411-3@1.0/index.css" rel="stylesheet">
<!DOCTYPE html>
<html lang="en">
<head>
<style>
body {
  font-family: 'Ownglyph_ParkDaHyun', sans-serif;
  overflow-x: hidden; /* 가로 스크롤 제거 */
}
.filter-section {
  width: 15%;
  min-width: 150px;
  background-color: rgba(255, 255, 255, 0.6);
  padding: 10px;
  border-radius: 10px;
  height: 100%;
}
.filter-button {
  display: block;
  width: 100%;
  margin-bottom: 10px;
  padding: 8px;
  background-color: #f7ecdc;
  border: none;
  border-radius: 5px;
  cursor: pointer;
  font-size: 0.9rem;
}
.filter-button:hover {
  background-color: #f2d8b1;
}
.content-wrapper {
  display: flex;
  width: 90%;
  height: 90%;
  background-color: rgb(255, 255, 255);
  border-radius: 20px;
  padding: 20px;
  gap: 20px;
}
.news-list {
  width: 100%;
  max-height: 100%;
  overflow-y: auto;
  overflow-x: hidden; /* 가로 스크롤 제거 */
  padding-right: 10px;
}

.news-item {
  display: flex;
  align-items: center;
  border-bottom: 1px solid #f2d8b1;
  padding: 8px 0;
  gap: 10px;
}
.news-img {
  flex: 0 0 80px;
  height: 60px;
  border-radius: 8px;
  overflow: hidden;
}
.news-img img {
  width: 100%;
  height: 100%;
  object-fit: cover;
}
.news-text {
  flex: 1;
  display: flex;
  flex-direction: column;
  justify-content: center;
  min-width: 0;
  overflow: hidden; /* 자식 요소 넘침 방지 */
}
.news-title {
  font-size: 0.95rem;
  color: #000;
  white-space: nowrap;
  overflow: hidden;
  text-overflow: ellipsis;
  text-decoration: none;
}
.news-body {
  font-size: 0.8rem;
  color: #333;
  white-space: nowrap;
  overflow: hidden;
  text-overflow: ellipsis;
}
   .btn-back {
  background: none;
  border: none;
  cursor: pointer;
  color: inline-block;
  padding: 4px 10px;
  border-radius: 5px;
  background-color: #f7ecdc;
}

/* 뒤로가기 버튼에 마우스 올리면 테이블 행 호버 색과 같게 */
.btn-back:hover {
background-color: #f2d8b1;
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

.news-item:hover {
  background-color: #fdf5ec;
  border-radius: 8px;
  transition: background-color 0.3s ease;
}
.active-filter {
  background-color: #f2d8b1;
  font-weight: bold;
  box-shadow: 0 0 0 2px #e6be9d inset;
}

</style>
<script>
function filterNews(team) {
  const items = document.querySelectorAll('.news-item');
  items.forEach(item => {
    const title = item.querySelector('.news-title').innerText;
    if (team === '전체' || title.includes(team)) {
      item.style.display = 'flex';
    } else {
      item.style.display = 'none';
    }
  });
}
</script>
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

<div class="section-overlay"></div>
<div style="width: 80%; margin: 20px auto 0 auto;">
  <h2 style="font-size: 3em; font-weight: bold; color: black; text-align: left; margin-left: 1%; margin-top: 40px;"> 최신 뉴스</h2>
</div>

  <div class="content-wrapper">
    <!-- 왼쪽 필터 -->
    <div class="filter-section">
  <c:choose>
    <c:when test="${selectedTeam eq '전체'}">
      <button class="filter-button active-filter">전체</button>
    </c:when>
    <c:otherwise>
      <button class="filter-button" onclick="location.href='?team=전체&page=1'">전체</button>
    </c:otherwise>
  </c:choose>

  <c:choose>
    <c:when test="${selectedTeam eq '한화'}">
      <button class="filter-button active-filter">한화 이글스</button>
    </c:when>
    <c:otherwise>
      <button class="filter-button" onclick="location.href='?team=한화&page=1'">한화 이글스</button>
    </c:otherwise>
  </c:choose>

  <c:choose>
    <c:when test="${selectedTeam eq '두산'}">
      <button class="filter-button active-filter">두산 베어스</button>
    </c:when>
    <c:otherwise>
      <button class="filter-button" onclick="location.href='?team=두산&page=1'">두산 베어스</button>
    </c:otherwise>
  </c:choose>

  <c:choose>
    <c:when test="${selectedTeam eq '롯데'}">
      <button class="filter-button active-filter">롯데 자이언츠</button>
    </c:when>
    <c:otherwise>
      <button class="filter-button" onclick="location.href='?team=롯데&page=1'">롯데 자이언츠</button>
    </c:otherwise>
  </c:choose>

  <c:choose>
    <c:when test="${selectedTeam eq 'LG'}">
      <button class="filter-button active-filter">LG 트윈스</button>
    </c:when>
    <c:otherwise>
      <button class="filter-button" onclick="location.href='?team=LG&page=1'">LG 트윈스</button>
    </c:otherwise>
  </c:choose>

  <c:choose>
    <c:when test="${selectedTeam eq '삼성'}">
      <button class="filter-button active-filter">삼성 라이온즈</button>
    </c:when>
    <c:otherwise>
      <button class="filter-button" onclick="location.href='?team=삼성&page=1'">삼성 라이온즈</button>
    </c:otherwise>
  </c:choose>

  <c:choose>
    <c:when test="${selectedTeam eq '키움'}">
      <button class="filter-button active-filter">키움 히어로즈</button>
    </c:when>
    <c:otherwise>
      <button class="filter-button" onclick="location.href='?team=키움&page=1'">키움 히어로즈</button>
    </c:otherwise>
  </c:choose>

  <c:choose>
    <c:when test="${selectedTeam eq 'SSG'}">
      <button class="filter-button active-filter">SSG 랜더스</button>
    </c:when>
    <c:otherwise>
      <button class="filter-button" onclick="location.href='?team=SSG&page=1'">SSG 랜더스</button>
    </c:otherwise>
  </c:choose>

  <c:choose>
    <c:when test="${selectedTeam eq 'NC'}">
      <button class="filter-button active-filter">NC 다이노스</button>
    </c:when>
    <c:otherwise>
      <button class="filter-button" onclick="location.href='?team=NC&page=1'">NC 다이노스</button>
    </c:otherwise>
  </c:choose>

  <c:choose>
    <c:when test="${selectedTeam eq 'KT'}">
      <button class="filter-button active-filter">KT 위즈</button>
    </c:when>
    <c:otherwise>
      <button class="filter-button" onclick="location.href='?team=KT&page=1'">KT 위즈</button>
    </c:otherwise>
  </c:choose>

  <c:choose>
    <c:when test="${selectedTeam eq 'KIA'}">
      <button class="filter-button active-filter">KIA 타이거즈</button>
    </c:when>
    <c:otherwise>
      <button class="filter-button" onclick="location.href='?team=KIA&page=1'">KIA 타이거즈</button>
    </c:otherwise>
  </c:choose>
</div>

    <!-- 뉴스 리스트 -->
    <div class="news-list">
      <c:forEach var="news" items="${breakingNews}">
        <div class="news-item">
          <div class="news-img">
            <c:if test="${not empty news.imgUrl}">
              <img src="${news.imgUrl}" alt="뉴스 이미지" />
            </c:if>
            <c:if test="${empty news.imgUrl}">
              <img src="/images/default-news.png" alt="기본 이미지" />
            </c:if>
          </div>
          <div class="news-text">
            <a href="${news.linkUrl}" target="_blank" class="news-title">${news.title}</a>
            <p class="news-body">${news.body}</p>
          </div>
        </div>
      </c:forEach>
    </div>
  </div>
  
  <div style="margin-top: 20px; text-align: center;">
  <!-- 이전 버튼 -->
<c:if test="${startPage > 1}">
  <a href="?team=${selectedTeam}&page=${startPage - 1}" style="margin: 0 10px;">◀ 이전</a>
</c:if>

<!-- 페이지 숫자 -->
<c:forEach var="i" begin="${startPage}" end="${endPage}">
  <c:choose>
    <c:when test="${i == currentPage}">
      <span style="margin: 0 5px; font-weight: bold; color: white; background-color: #f2d8b1; padding: 4px 8px; border-radius: 5px;">${i}</span>
    </c:when>
    <c:otherwise>
      <a href="?team=${selectedTeam}&page=${i}" style="margin: 0 5px; color: #555; text-decoration: none;">${i}</a>
    </c:otherwise>
  </c:choose>
</c:forEach>

<!-- 다음 버튼 -->
<c:if test="${endPage < totalPages}">
  <a href="?team=${selectedTeam}&page=${endPage + 1}" style="margin: 0 10px;">다음 ▶</a>
</c:if>
</div>

</section>
</body>
</html>



