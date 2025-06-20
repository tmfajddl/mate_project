<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/head.jspf"%>
<link href="https://cdn.jsdelivr.net/gh/projectnoonnu/2411-3@1.0/index.css" rel="stylesheet">
<!DOCTYPE html>
<html lang="en">
<head>
<style>
body {
  font-family: 'Ownglyph_ParkDaHyun', sans-serif;
}

.menu2 {
  display: flex;
  flex-direction: row;
  justify-content: end;
  width: 70%;
  height: 80px;
  margin: 0;
  padding: 0;
}
.menu2 > :nth-child(3) {
  width: 20%;
  height: 100%;
  border: 2px solid #f2d8b1;
  border-bottom: none;
  border-radius: 10px 10px 0 0;
}
.menu2 > div {
  width: 20%;
  height: 100%;
  border: 2px solid #f2d8b1;
  border-radius: 10px 10px 0 0;
}
.menu2 > div a {
  display: flex;
  justify-content: center;
  align-items: center;
  height: 100%;
  font-size: 1.25rem;
  text-decoration: none;
  color: inherit;
}

.main {
  border-radius: 10px;
  width: 70%;
  min-height: 350px;
  background-color: rgba(255, 255, 255, 0.9);
  border: 10px solid white;
  padding: 20px;
  margin: 20px auto;
  overflow-x: auto;
  box-sizing: border-box;
  box-shadow: 0 4px 10px rgba(0,0,0,0.1);
}

.card-container {
  display: flex;
  gap: 16px;
  overflow-x: auto;
  padding-bottom: 10px;
}

.card {
  background-color: #f7ecdc;
  border-radius: 12px;
  width: 250px;
  flex-shrink: 0;
  padding: 15px;
  box-sizing: border-box;
  color: #000;
  text-align: left;
  box-shadow: 0 2px 8px rgba(0,0,0,0.15);
}

.card img {
  width: 100%;
  height: 140px;
  object-fit: cover;
  border-radius: 10px;
  margin-bottom: 10px;
}

.card h3 {
  margin: 0 0 6px 0;
  font-size: 1.1rem;
  font-weight: bold;
}

.card p {
  margin: 4px 0;
  font-size: 0.9rem;
  white-space: normal;
  word-wrap: break-word;
}

.btn-back {
  background: none;
  border: none;
  cursor: pointer;
  padding: 4px 10px;
  border-radius: 5px;
  background-color: #f7ecdc;
}
.btn-back:hover {
  background-color: #f2d8b1;
}

.spinner {
  border: 4px solid #f3f3f3;
  border-top: 4px solid #f2d8b1;
  border-radius: 50%;
  width: 30px;
  height: 30px;
  animation: spin 1s linear infinite;
  display: inline-block;
  margin-bottom: 10px;
}

@keyframes spin {
  0% { transform: rotate(0deg); }
  100% { transform: rotate(360deg); }
}
</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>

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
<div style="width: 80%; margin: 20px auto 0 auto;">
  <h2 style="font-size: 3em; font-weight: bold; color: #918c84; text-align: left; margin-left: 7%;">선수들이 자주 찾는 맛집</h2>
  <h2 style="font-size: 1em; font-weight: bold; color: #918c84; text-align: left; margin-left: 7%;">응원하느라 수고한 당신! 선수들이 좋아하는 음식을 먹으러 가보는건 어떠신가요?</h2>
</div>

  <!-- 본문 카드 영역 -->
  <div class="main">
    <div id="loading" style="text-align: center; margin: 20px 0;">
      <div class="spinner"></div>
      <p>AI가 데이터를 불러오는 중입니다...</p>
    </div>
    <div class="card-container" id="cardContainer" style="display:none;"></div>
  </div>

  <!-- 뒤로가기 버튼 -->
  <div class="left-controls flex items-center gap-4 mt-2 mb-4" style="justify-content:flex-start; text-align:left;">
    <button class="btn-back btn btn-ghost" type="button" onclick="history.back();">뒤로가기</button>
  </div>

</section>

<script>
$(document).ready(function(){
  $.ajax({
    url: "/usr/project/getPlaceRecommendations",
    method: "GET",
    dataType: "json",
    success: function(data) {
      var cardContainer = $("#cardContainer");
      cardContainer.empty();
      data.forEach(function(item) {
        var card = $("<div>").addClass("card");
        var img = $("<img>").attr("src", item.imageUrl).attr("alt", item.name);
        var name = $("<h3>").text(item.name);
        var reason = $("<p>").append($("<strong>").text("추천이유:")).append(" " + item.reason);
        var address = $("<p>").append($("<strong>").text("주소:")).append(" " + item.address);
        card.append(img, name, reason, address);
        cardContainer.append(card);
      });
      cardContainer.show();
      $("#loading").hide();
    },
    error: function() {
      $("#loading").text("데이터를 불러오지 못했습니다.");
    }
  });
});
</script>

</body>
</html>