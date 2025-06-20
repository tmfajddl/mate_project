<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/head.jspf"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <style>
    .btn-back {
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
section {
  min-height: 100vh;
}


@font-face {
    font-family: 'Ownglyph_ParkDaHyun';
    src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/2411-3@1.0/Ownglyph_ParkDaHyun.woff2') format('woff2');
    font-weight: normal;
    font-style: normal;
}

body {
  font-family: 'Ownglyph_ParkDaHyun', sans-serif;
  
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

  <!-- Tailwind CSS & Swiper -->
  <script src="https://cdn.tailwindcss.com"></script>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.css" />
  <script src="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.js"></script>
</head>
<body class="bg-gray-50 min-h-screen flex flex-col items-center p-4">
  <h1 style="margin-top: 50px;" class="text-3xl font-bold mb-6">야구 포지션</h1>

     <div class="flex flex-col items-center w-full max-w-screen-xl mx-auto gap-10">
      <!-- 구장 + 설명 -->
  <div class="flex flex-col md:flex-row w-full gap-6 justify-center">
    <!-- 구장 이미지와 포지션 버튼 -->
    <div class="relative" style="width: 40vw; min-width: 320px;">
      <img src="/images/base.jpg" alt="야구장" class="w-full h-auto rounded-lg shadow" />

      <button id="pos-p" class="absolute bg-yellow-500 w-8 h-8 rounded-full border-2 border-white"
        style="top: 63%; left: 50%; transform: translate(-50%, -50%)" title="투수"></button>
      <button id="pos-c" class="absolute bg-blue-500 w-8 h-8 rounded-full border-2 border-white"
        style="top: 78%; left: 50%; transform: translate(-50%, -50%)" title="포수"></button>
      <button id="pos-1b" class="absolute bg-green-500 w-8 h-8 rounded-full border-2 border-white"
        style="top: 64%; left: 65%; transform: translate(-50%, -50%)" title="1루수"></button>
      <button id="pos-2b" class="absolute bg-red-500 w-8 h-8 rounded-full border-2 border-white"
        style="top: 50%; left: 60%; transform: translate(-50%, -50%)" title="2루수"></button>
      <button id="pos-3b" class="absolute bg-blue-200 w-8 h-8 rounded-full border-2 border-white"
        style="top: 64%; left: 35%; transform: translate(-50%, -50%)" title="3루수"></button>
      <button id="pos-ss" class="absolute bg-yellow-700 w-8 h-8 rounded-full border-2 border-white"
        style="top: 50%; left: 40%; transform: translate(-50%, -50%)" title="유격수"></button>
      <button id="pos-lf" class="absolute bg-purple-500 w-8 h-8 rounded-full border-2 border-white"
        style="top: 35%; left: 25%; transform: translate(-50%, -50%)" title="좌익수"></button>
      <button id="pos-cf" class="absolute bg-pink-600 w-8 h-8 rounded-full border-2 border-white"
        style="top: 25%; left: 50%; transform: translate(-50%, -50%)" title="중견수"></button>
      <button id="pos-rf" class="absolute bg-red-200 w-8 h-8 rounded-full border-2 border-white"
        style="top: 35%; left: 80%; transform: translate(-50%, -50%)" title="우익수"></button>
     </div>

    <!-- 설명 영역 -->
    <div class="bg-white rounded-lg shadow p-6 min-h-[320px] flex flex-col justify-center items-center text-center"
      style="width: 40vw; min-width: 320px;">
      <h2 id="pos-title" class="text-2xl font-semibold mb-4 text-center text-gray-700">포지션을 선택하세요</h2>
      <p id="pos-desc" class="text-gray-600 text-center px-2">야구장에서 각 포지션 버튼을 눌러 기본 역할을 확인해보세요.</p>

      <h3 class="text-xl font-semibold mt-6 text-center text-gray-600">대표 선수</h3>
      <div class="swiper playerSwiper mt-4 w-full">
        <div class="swiper-wrapper" id="player-slide-wrapper" style="min-height: 150px;"></div>
        <div class="swiper-pagination"></div>
      </div>
    </div>
  </div>
  
  
 <div class="quiz-container flex max-w-6xl mx-auto mb-6 gap-6">

  <!-- 왼쪽: 동영상 -->
  <div class="quiz-container flex flex-col max-w-6xl mx-auto mb-6 gap-6">
   <h2 class="text-xl font-bold">아구 룰</h2>
    <iframe
      width="100%"
      height="240"
      src="https://www.youtube.com/embed/QIhve9_Ef5s"
      title="YouTube video player"
      frameborder="0"
      allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
      allowfullscreen
      class="rounded"
    ></iframe>
  </div>

  <!-- 가운데: 이미지/움짤 -->
  <div id="quiz-image" class="w-1/3 flex items-center justify-center bg-gray-50 rounded-xl shadow p-4">
    <img src="default-image.jpg" alt="퀴즈 상황 이미지" class="max-h-48 rounded" />
  </div>

  <!-- 오른쪽: 퀴즈 카드 슬라이더 -->
  <div class="swiper quizSwiper w-1/3">
    <div class="swiper-wrapper">
  
  <!-- 카드 6: ABS -->
<div class="swiper-slide">
  <div class="card w-full h-64 bg-white rounded-xl shadow-lg p-6 flex flex-col items-center justify-center relative cursor-pointer" onclick="flipCard(this)">
    <div class="card-front absolute w-full h-full flex flex-col items-center justify-center backface-hidden">
      <h2 class="text-xl font-bold mb-4">⚾ 스트라이크와 볼을 심판 대신 누가 판정할까요?</h2>
      <p class="text-sm text-gray-500">(카드를 클릭해보세요!)</p>
    </div>
    <div class="card-back absolute w-full h-full flex flex-col items-center justify-center rotate-y-180 hidden">
      <h2 class="text-xl font-bold text-green-600 mb-2">👉 ABS (자동 판정 시스템)</h2>
      <p class="text-gray-600">센서와 시스템이 공 위치를 감지해 스트라이크/볼을 자동으로 판정해요</p>
    </div>
  </div>
</div>

<!-- 카드 7: 스트라이크 -->
<div class="swiper-slide">
  <div class="card w-full h-64 bg-white rounded-xl shadow-lg p-6 flex flex-col items-center justify-center relative cursor-pointer" onclick="flipCard(this)">
    <div class="card-front absolute w-full h-full flex flex-col items-center justify-center backface-hidden">
      <h2 class="text-xl font-bold mb-4">⚾ 스트라이크 존을 통과한 공! 뭐라고 할까요?</h2>
      <p class="text-sm text-gray-500">(카드를 클릭해보세요!)</p>
    </div>
    <div class="card-back absolute w-full h-full flex flex-col items-center justify-center rotate-y-180 hidden">
      <h2 class="text-xl font-bold text-green-600 mb-2">👉 스트라이크</h2>
      <p class="text-gray-600">공이 스트라이크 존을 통과하거나, 타자가 헛스윙하면 스트라이크!</p>
    </div>
  </div>
</div>

<!-- 카드 8: 볼 -->
<div class="swiper-slide">
  <div class="card w-full h-64 bg-white rounded-xl shadow-lg p-6 flex flex-col items-center justify-center relative cursor-pointer" onclick="flipCard(this)">
    <div class="card-front absolute w-full h-full flex flex-col items-center justify-center backface-hidden">
      <h2 class="text-xl font-bold mb-4">⚾ 타자가 치지 않았고, 공이 스트존을 벗어났어요!</h2>
      <p class="text-sm text-gray-500">(카드를 클릭해보세요!)</p>
    </div>
    <div class="card-back absolute w-full h-full flex flex-col items-center justify-center rotate-y-180 hidden">
      <h2 class="text-xl font-bold text-green-600 mb-2">👉 볼</h2>
      <p class="text-gray-600">스트라이크 존을 벗어난 공이에요. 4개 모이면 볼넷이 됩니다.</p>
    </div>
  </div>
</div>

<!-- 카드 3: 삼진아웃 -->
<div class="swiper-slide">
  <div class="card w-full h-64 bg-white rounded-xl shadow-lg p-6 flex flex-col items-center justify-center relative cursor-pointer" onclick="flipCard(this)">
    <div class="card-front absolute w-full h-full flex flex-col items-center justify-center backface-hidden">
      <h2 class="text-xl font-bold mb-4">⚾ 스트라이크를 세 번 당한 타자! 어떻게 될까요?</h2>
      <p class="text-sm text-gray-500">(카드를 클릭해보세요!)</p>
    </div>
    <div class="card-back absolute w-full h-full flex flex-col items-center justify-center rotate-y-180 hidden">
      <h2 class="text-xl font-bold text-green-600 mb-2">👉 삼진아웃</h2>
      <p class="text-gray-600">스트라이크 3번이면 타자는 아웃! 스윙을 하든 말든 세 번이면 끝이에요.</p>
    </div>
  </div>
</div>

<!-- 카드 2: 플라이볼 -->
<div class="swiper-slide">
  <div class="card w-full h-64 bg-white rounded-xl shadow-lg p-6 flex flex-col items-center justify-center relative cursor-pointer" onclick="flipCard(this)">
    <div class="card-front absolute w-full h-full flex flex-col items-center justify-center backface-hidden">
      <h2 class="text-xl font-bold mb-4">⚾ 공이 높이 떠서 바운드 없이 야수가 바로 잡았어요. 이건?</h2>
      <p class="text-sm text-gray-500">(카드를 클릭해보세요!)</p>
    </div>
    <div class="card-back absolute w-full h-full flex flex-col items-center justify-center rotate-y-180 hidden">
      <h2 class="text-xl font-bold text-green-600 mb-2">👉 플라이볼 (Fly Ball)</h2>
      <p class="text-gray-600">타구가 공중으로 높이 뜨고 야수에게 바로 잡히는 경우예요. 아웃될 가능성이 높아요.</p>
    </div>
  </div>
</div>

<!-- 카드 4: 땅볼 -->
<div class="swiper-slide">
  <div class="card w-full h-64 bg-white rounded-xl shadow-lg p-6 flex flex-col items-center justify-center relative cursor-pointer" onclick="flipCard(this)">
    <div class="card-front absolute w-full h-full flex flex-col items-center justify-center backface-hidden">
      <h2 class="text-xl font-bold mb-4">⚾ 타구가 땅을 굴러가요! 어떤 타구일까요?</h2>
      <p class="text-sm text-gray-500">(카드를 클릭해보세요!)</p>
    </div>
    <div class="card-back absolute w-full h-full flex flex-col items-center justify-center rotate-y-180 hidden">
      <h2 class="text-xl font-bold text-green-600 mb-2">👉 땅볼 (Ground Ball)</h2>
      <p class="text-gray-600">공이 땅바닥을 구르며 굴러가는 타구예요. 내야수가 잡기 좋아요.</p>
    </div>
  </div>
</div>

<!-- 카드 5: 볼넷 -->
<div class="swiper-slide">
  <div class="card w-full h-64 bg-white rounded-xl shadow-lg p-6 flex flex-col items-center justify-center relative cursor-pointer" onclick="flipCard(this)">
    <div class="card-front absolute w-full h-full flex flex-col items-center justify-center backface-hidden">
      <h2 class="text-xl font-bold mb-4">⚾ 스트라이크 존을 벗어난 공이 4개! 타자는?</h2>
      <p class="text-sm text-gray-500">(카드를 클릭해보세요!)</p>
    </div>
    <div class="card-back absolute w-full h-full flex flex-col items-center justify-center rotate-y-180 hidden">
      <h2 class="text-xl font-bold text-green-600 mb-2">👉 볼넷 (Base on Balls)</h2>
      <p class="text-gray-600">스트라이크 존을 벗어난 공이 4개면 1루로 걸어나갈 수 있어요.</p>
    </div>
  </div>
</div>

<!-- 카드 9: 홈런 -->
<div class="swiper-slide">
  <div class="card w-full h-64 bg-white rounded-xl shadow-lg p-6 flex flex-col items-center justify-center relative cursor-pointer" onclick="flipCard(this)">
    <div class="card-front absolute w-full h-full flex flex-col items-center justify-center backface-hidden">
      <h2 class="text-xl font-bold mb-4">⚾ 공이 외야 담장을 넘었어요! 이건?</h2>
      <p class="text-sm text-gray-500">(카드를 클릭해보세요!)</p>
    </div>
    <div class="card-back absolute w-full h-full flex flex-col items-center justify-center rotate-y-180 hidden">
      <h2 class="text-xl font-bold text-green-600 mb-2">👉 홈런 (Home Run)</h2>
      <p class="text-gray-600">공이 외야 펜스를 넘기면 홈런! 모든 주자도 함께 점수 획득!</p>
    </div>
  </div>
</div>

<!-- 카드 10: 도루 -->
<div class="swiper-slide">
  <div class="card w-full h-64 bg-white rounded-xl shadow-lg p-6 flex flex-col items-center justify-center relative cursor-pointer" onclick="flipCard(this)">
    <div class="card-front absolute w-full h-full flex flex-col items-center justify-center backface-hidden">
      <h2 class="text-xl font-bold mb-4">⚾ 타자가 치기 전 주자가 몰래 뛰었어요!</h2>
      <p class="text-sm text-gray-500">(카드를 클릭해보세요!)</p>
    </div>
    <div class="card-back absolute w-full h-full flex flex-col items-center justify-center rotate-y-180 hidden">
      <h2 class="text-xl font-bold text-green-600 mb-2">👉 도루 (Stolen Base)</h2>
      <p class="text-gray-600">주자가 타자 없이 다음 루로 달려 세이프가 되면 도루 성공이에요.</p>
    </div>
  </div>
</div>

    <!-- 카드 1: 주루사 -->
<div class="swiper-slide">
  <div class="card w-full h-64 bg-white rounded-xl shadow-lg p-6 flex flex-col items-center justify-center relative cursor-pointer" onclick="flipCard(this)">
    <div class="card-front absolute w-full h-full flex flex-col items-center justify-center backface-hidden">
      <h2 class="text-xl font-bold mb-4">⚾ 주자가 도루나 진루하다가 아웃! 이 상황은?</h2>
      <p class="text-sm text-gray-500">(카드를 클릭해보세요!)</p>
    </div>
    <div class="card-back absolute w-full h-full flex flex-col items-center justify-center rotate-y-180 hidden">
      <h2 class="text-xl font-bold text-green-600 mb-2">👉 주루사</h2>
      <p class="text-gray-600">주자가 도루나 진루 중에 수비수에게 잡혀서 아웃되는 걸 주루사라고 해요.</p>
    </div>
  </div>
</div>

<!-- 카드 11: 더블플레이 -->
<div class="swiper-slide">
  <div class="card w-full h-64 bg-white rounded-xl shadow-lg p-6 flex flex-col items-center justify-center relative cursor-pointer" onclick="flipCard(this)">
    <div class="card-front absolute w-full h-full flex flex-col items-center justify-center backface-hidden">
      <h2 class="text-xl font-bold mb-4">⚾ 한 선수가 공을 쳤는데 두명의 선수가 아웃된 상황은 무엇일까요?</h2>
      <p class="text-sm text-gray-500">(카드를 클릭해보세요!)</p>
    </div>
    <div class="card-back absolute w-full h-full flex flex-col items-center justify-center rotate-y-180 hidden">
      <h2 class="text-xl font-bold text-green-600 mb-2">👉 더블플레이 (Double Play), 병살</h2>
      <p class="text-gray-600">수비수가 두 명의 주자를 연속으로 아웃시키는 플레이예요!<br/>수비하는 팀에게는 더블플레이, 공격팀 입장에서는 병살이라고 불립니다.</p>
    </div>
  </div>
</div>

<!-- 카드 12: 번트 -->
<div class="swiper-slide">
  <div class="card w-full h-64 bg-white rounded-xl shadow-lg p-6 flex flex-col items-center justify-center relative cursor-pointer" onclick="flipCard(this)">
    <div class="card-front absolute w-full h-full flex flex-col items-center justify-center backface-hidden">
      <h2 class="text-xl font-bold mb-4">⚾ 타자가 배트를 살짝 대서 공을 굴렸어요!</h2>
      <p class="text-sm text-gray-500">(카드를 클릭해보세요!)</p>
    </div>
    <div class="card-back absolute w-full h-full flex flex-col items-center justify-center rotate-y-180 hidden">
      <h2 class="text-xl font-bold text-green-600 mb-2">👉 번트 (Bunt)</h2>
      <p class="text-gray-600">스윙하지 않고 배트를 가만히 대서 공을 굴리는 작전이에요. 주자 진루에 효과적이에요!</p>
    </div>
  </div>
</div>

<!-- 카드 13: 강공전환 -->
<div class="swiper-slide">
  <div class="card w-full h-64 bg-white rounded-xl shadow-lg p-6 flex flex-col items-center justify-center relative cursor-pointer" onclick="flipCard(this)">
    <div class="card-front absolute w-full h-full flex flex-col items-center justify-center backface-hidden">
      <h2 class="text-xl font-bold mb-4">⚾ 번트할 줄 알았는데 갑자기 크게 스윙했어요!</h2>
      <p class="text-sm text-gray-500">(카드를 클릭해보세요!)</p>
    </div>
    <div class="card-back absolute w-full h-full flex flex-col items-center justify-center rotate-y-180 hidden">
      <h2 class="text-xl font-bold text-green-600 mb-2">👉 강공 전환</h2>
      <p class="text-gray-600">번트하려는 척하다가 갑자기 강하게 스윙하는 전술이에요. 수비를 속이기 위한 작전이죠.</p>
    </div>
  </div>
</div>

<!-- 카드 14: 사구 -->
<div class="swiper-slide">
  <div class="card w-full h-64 bg-white rounded-xl shadow-lg p-6 flex flex-col items-center justify-center relative cursor-pointer" onclick="flipCard(this)">
    <div class="card-front absolute w-full h-full flex flex-col items-center justify-center backface-hidden">
      <h2 class="text-xl font-bold mb-4">⚾ 투구가 타자 몸에 맞았어요! 이 상황은?</h2>
      <p class="text-sm text-gray-500">(카드를 클릭해보세요!)</p>
    </div>
    <div class="card-back absolute w-full h-full flex flex-col items-center justify-center rotate-y-180 hidden">
      <h2 class="text-xl font-bold text-green-600 mb-2">👉 사구 (Hit by Pitch)</h2>
      <p class="text-gray-600">투구가 타자의 몸에 맞으면 타자는 1루로 걸어나가요. 주로 피하는 게 중요해요!</p>
    </div>
  </div>
</div>

    </div>
    <div class="swiper-pagination quiz-pagination mt-4"></div>
  </div>

</div>


</div>

<script>

const playerSwiper = new Swiper('.playerSwiper', {
	  slidesPerView: 3,
	  spaceBetween: 20,
	  loop: true,
	  autoplay: { delay: 3000 },
	  pagination: {
	    el: '.swiper-pagination', 
	    clickable: true
	  }
	});

	const quizImages = {
	  0: '/images/abs.png',
	  1: '/images/strike.gif',
	  2: '/images/ball.gif',
	  3: '/images/strikeout.gif',
	  4: '/images/flyball.gif',
	  5: '/images/groundball.gif',
	  6: '/images/walk.gif',
	  7: '/images/homerun.gif',
	  8: '/images/stealbase.gif',
	  9: '/images/tagout.gif',
	  10: '/images/doubleplay.gif',
	  11: '/images/bunt.gif',
	  12: '/images/powerhit.gif',
	  13: '/images/bodyhit.gif',
	};

	const quizSwiper = new Swiper('.quizSwiper', {
		  slidesPerView: 1,
		  spaceBetween: 20,
		  pagination: {
		    el: '.quiz-pagination', 
		    clickable: true
		  },
		  on: {
		    slideChange: function() {
		      const idx = this.realIndex;
		      const imageEl = document.querySelector('#quiz-image img');
		      if(imageEl) {
		        imageEl.src = quizImages[idx] || 'images/default.jpg';
		      }
		    }
		  }
		});

		// 처음 로드 시 첫 슬라이드에 맞게 이미지 세팅
		window.addEventListener('load', () => {
		  const firstIndex = quizSwiper.realIndex || 0;
		  const imageEl = document.querySelector('#quiz-image img');
		  if(imageEl) {
		    imageEl.src = quizImages[firstIndex] || 'images/default.jpg';
		  }
		});

	// 카드 앞/뒷면 전환
	function flipCard(cardEl) {
	  const front = cardEl.querySelector('.card-front');
	  const back = cardEl.querySelector('.card-back');
	  front.classList.toggle('hidden');
	  back.classList.toggle('hidden');
	}

</script>
  <!-- JavaScript -->
<script>
  const descriptions = {
    p: { title: '투수 (Pitcher)', desc: '경기에서 공을 던지는 선수로, 경기를 주도하고 아웃을 잡는 역할을 합니다.' },
    c: { title: '포수 (Catcher)', desc: '투수가 던진 공을 받고 작전을 지시하며, 수비를 조율하는 역할을 합니다.' },
    '1b': { title: '1루수 (First Baseman)', desc: '1루를 지키며 타자가 친 공을 잡거나 주자를 아웃시키는 역할을 합니다.' },
    '2b': { title: '2루수 (Second Baseman)', desc: '2루 주변을 수비하며 빠른 동작으로 타구를 처리합니다.' },
    '3b': { title: '3루수 (Third Baseman)', desc: '3루를 지키며 강한 타구를 처리하는 역할을 합니다.' },
    ss: { title: '유격수 (Shortstop)', desc: '1루와 2루 사이를 수비하며 가장 많은 움직임이 필요한 포지션입니다.' },
    lf: { title: '좌익수 (Left Fielder)', desc: '외야의 좌측을 지키며 타구를 잡아내는 역할을 합니다.' },
    cf: { title: '중견수 (Center Fielder)', desc: '외야 중앙을 수비하며 넓은 범위를 커버합니다.' },
    rf: { title: '우익수 (Right Fielder)', desc: '외야 우측을 맡아 강한 송구를 하는 역할입니다.' }
  };

  // 각 포지션별 KBO 대표 선수 10명 (예시 이미지 경로와 이름)
  const playerData = {
		  p: [
			    { team: "LG", name: "임찬규", img: "/images/players/lg_pitcher.jpg" },
			    { team: "KT", name: "소형준", img: "/images/players/kt_pitcher.jpg" },
			    { team: "SSG", name: "김광현", img: "/images/players/ssg_pitcher.jpg" },
			    { team: "NC", name: "라일리", img: "/images/players/nc_pitcher.jpg" },
			    { team: "두산", name: "최승용", img: "/images/players/doosan_pitcher.jpg" },
			    { team: "키움", name: "로젠버그", img: "/images/players/kiwoom_pitcher.jpg" },
			    { team: "삼성", name: "원태인", img: "/images/players/samsung_pitcher.jpg" },
			    { team: "롯데", name: "박세웅", img: "/images/players/lotte_pitcher.jpg" },
			    { team: "KIA", name: "네일", img: "/images/players/kia_pitcher.jpg" },
			    { team: "한화", name: "폰세", img: "/images/players/hanwha_pitcher.jpg" }
			  ],
			  c: [
			    { team: "LG", name: "박동원", img: "/images/players/lg_catcher.jpg" },
			    { team: "KT", name: "장성우", img: "/images/players/kt_catcher.jpg" },
			    { team: "SSG", name: "조형우", img: "/images/players/ssg_catcher.jpg" },
			    { team: "NC", name: "김형준", img: "/images/players/nc_catcher.jpg" },
			    { team: "두산", name: "양의지", img: "/images/players/doosan_catcher.jpg" },
			    { team: "키움", name: "김재현", img: "/images/players/kiwoom_catcher.jpg" },
			    { team: "삼성", name: "강민호", img: "/images/players/samsung_catcher.jpg" },
			    { team: "롯데", name: "유강남", img: "/images/players/lotte_catcher.jpg" },
			    { team: "KIA", name: "김태군", img: "/images/players/kia_catcher.jpg" },
			    { team: "한화", name: "최재훈", img: "/images/players/hanwha_catcher.jpg" }
			  ],
			  "1b": [
			    { team: "LG", name: "오스틴", img: "/images/players/lg_1b.jpg" },
			    { team: "KT", name: "문상철", img: "/images/players/kt_1b.jpg" },
			    { team: "SSG", name: "고명준", img: "/images/players/ssg_1b.jpg" },
			    { team: "NC", name: "데이비슨", img: "/images/players/nc_1b.jpg" },
			    { team: "두산", name: "양석환", img: "/images/players/doosan_1b.jpg" },
			    { team: "키움", name: "최주환", img: "/images/players/kiwoom_1b.jpg" },
			    { team: "삼성", name: "디아즈", img: "/images/players/samsung_1b.jpg" },
			    { team: "롯데", name: "나승엽", img: "/images/players/lotte_1b.jpg" },
			    { team: "KIA", name: "위즈덤", img: "/images/players/kia_1b.jpg" },
			    { team: "한화", name: "채은성", img: "/images/players/hanwha_1b.jpg" }
			  ],
			  "2b": [
			    { team: "LG", name: "신민재", img: "/images/players/lg_2b.jpg" },
			    { team: "KT", name: "김상수", img: "/images/players/kt_2b.jpg" },
			    { team: "SSG", name: "정준재", img: "/images/players/ssg_2b.jpg" },
			    { team: "NC", name: "박민우", img: "/images/players/nc_2b.jpg" },
			    { team: "두산", name: "강승호", img: "/images/players/doosan_2b.jpg" },
			    { team: "키움", name: "오선진", img: "/images/players/kiwoom_2b.jpg" },
			    { team: "삼성", name: "류지혁", img: "/images/players/samsung_2b.jpg" },
			    { team: "롯데", name: "고승민", img: "/images/players/lotte_2b.jpg" },
			    { team: "KIA", name: "김선빈", img: "/images/players/kia_2b.jpg" },
			    { team: "한화", name: "황영묵", img: "/images/players/hanwha_2b.jpg" }
			  ],
			  "3b": [
			    { team: "LG", name: "문보경", img: "/images/players/lg_3b.jpg" },
			    { team: "KT", name: "허경민", img: "/images/players/kt_3b.jpg" },
			    { team: "SSG", name: "최정", img: "/images/players/ssg_3b.jpg" },
			    { team: "NC", name: "서호철", img: "/images/players/nc_3b.jpg" },
			    { team: "두산", name: "임종성", img: "/images/players/doosan_3b.jpg" },
			    { team: "키움", name: "송성문", img: "/images/players/kiwoom_3b.jpg" },
			    { team: "삼성", name: "김영웅", img: "/images/players/samsung_3b.jpg" },
			    { team: "롯데", name: "손호영", img: "/images/players/lotte_3b.jpg" },
			    { team: "KIA", name: "김도영", img: "/images/players/kia_3b.jpg" },
			    { team: "한화", name: "노시환", img: "/images/players/hanwha_3b.jpg" }
			  ],
			  ss: [
			    { team: "LG", name: "오지환", img: "/images/players/lg_ss.jpg" },
			    { team: "KT", name: "권동진", img: "/images/players/kt_ss.jpg" },
			    { team: "SSG", name: "박성한", img: "/images/players/ssg_ss.jpg" },
			    { team: "NC", name: "김주원", img: "/images/players/nc_ss.jpg" },
			    { team: "두산", name: "오명진", img: "/images/players/doosan_ss.jpg" },
			    { team: "키움", name: "김태진", img: "/images/players/kiwoom_ss.jpg" },
			    { team: "삼성", name: "이재현", img: "/images/players/samsung_ss.jpg" },
			    { team: "롯데", name: "전민재", img: "/images/players/lotte_ss.jpg" },
			    { team: "KIA", name: "박찬호", img: "/images/players/kia_ss.jpg" },
			    { team: "한화", name: "심우준", img: "/images/players/hanwha_ss.jpg" }
			  ],
			  lf: [
			    { team: "LG", name: "문성주", img: "/images/players/lg_lf.jpg" },
			    { team: "KT", name: "김민혁", img: "/images/players/kt_lf.jpg" },
			    { team: "SSG", name: "최준우", img: "/images/players/ssg_lf.jpg" },
			    { team: "NC", name: "권희동", img: "/images/players/nc_lf.jpg" },
			    { team: "두산", name: "정수빈", img: "/images/players/doosan_lf.jpg" },
			    { team: "키움", name: "카디네스", img: "/images/players/kiwoom_lf.jpg" },
			    { team: "삼성", name: "구자욱", img: "/images/players/samsung_lf.jpg" },
			    { team: "롯데", name: "레이예스", img: "/images/players/lotte_lf.jpg" },
			    { team: "KIA", name: "나성범", img: "/images/players/kia_lf.jpg" },
			    { team: "한화", name: "문현빈", img: "/images/players/hanwha_lf.jpg" }
			  ],
			  cf: [
			    { team: "LG", name: "박해민", img: "/images/players/lg_cf.jpg" },
			    { team: "KT", name: "배정대", img: "/images/players/kt_cf.jpg" },
			    { team: "SSG", name: "최지훈", img: "/images/players/ssg_cf.jpg" },
			    { team: "NC", name: "천재환", img: "/images/players/nc_cf.jpg" },
			    { team: "두산", name: "케이브", img: "/images/players/doosan_cf.jpg" },
			    { team: "키움", name: "임병욱", img: "/images/players/kiwoom_cf.jpg" },
			    { team: "삼성", name: "김성윤", img: "/images/players/samsung_cf.jpg" },
			    { team: "롯데", name: "윤동희", img: "/images/players/lotte_cf.jpg" },
			    { team: "KIA", name: "최원준", img: "/images/players/kia_cf.jpg" },
			    { team: "한화", name: "플로리얼", img: "/images/players/hanwha_cf.jpg" }
			  ],
			  rf: [
			    { team: "LG", name: "송찬의", img: "/images/players/lg_rf.jpg" },
			    { team: "KT", name: "로하스", img: "/images/players/kt_rf.jpg" },
			    { team: "SSG", name: "에레디아", img: "/images/players/ssg_rf.jpg" },
			    { team: "NC", name: "박건우", img: "/images/players/nc_rf.jpg" },
			    { team: "두산", name: "김인태", img: "/images/players/doosan_rf.jpg" },
			    { team: "키움", name: "이주형", img: "/images/players/kiwoom_rf.jpg" },
			    { team: "삼성", name: "김지찬", img: "/images/players/samsung_rf.jpg" },
			    { team: "롯데", name: "장두성", img: "/images/players/lotte_rf.jpg" },
			    { team: "KIA", name: "이우성", img: "/images/players/kia_rf.jpg" },
			    { team: "한화", name: "이진영", img: "/images/players/hanwha_rf.jpg" }
			  ]
  };

  // 버튼 클릭 이벤트 등록
 const swiper = new Swiper('.playerSwiper', {
  slidesPerView: 3,
  spaceBetween: 20,
  loop: true,
  autoplay: { delay: 3000 },
  pagination: { el: '.swiper-pagination', clickable: true },
});

document.querySelectorAll("button[id^='pos-']").forEach(button => {
  button.addEventListener('click', () => {
    const id = button.id.replace('pos-', '');
    const info = descriptions[id];
    const players = playerData[id];

    if (info) {
      document.getElementById('pos-title').textContent = info.title;
      document.getElementById('pos-desc').textContent = info.desc;
    }

    const wrapper = document.getElementById('player-slide-wrapper');

    // 슬라이드 초기화: 기존 swiper 슬라이드 제거 후 재생성
    swiper.removeAllSlides();

    if (players && players.length > 0) {
      players.forEach(player => {
        const slideHtml =
          '<div class="swiper-slide flex flex-col items-center">' +
          '<img src="' + player.img + '" class="w-24 h-24 rounded-full object-cover shadow" />' +
          '<p class="mt-2 text-sm text-center">' + player.name + ' (' + player.team + ')</p>' +
          '</div>';
        swiper.appendSlide(slideHtml);
      });
      swiper.update();
    }
  });
});
</script>
</section>
</body>
</html>