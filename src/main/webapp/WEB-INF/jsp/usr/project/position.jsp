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
  <h1 style="margin-top: 50px;" class="text-3xl font-bold mb-6">야구 포지션 한눈에 보기</h1>

    <div class="flex flex-col md:flex-row w-full max-w-screen-xl mx-auto gap-6 justify-center">
    <!-- 구장 + 버튼 -->
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
  <p id="pos-desc" class="text-gray-600 text-center px-2">
    야구장에서 각 포지션 버튼을 눌러 기본 역할을 확인해보세요.
  </p>

  <h3 class="text-xl font-semibold mt-6 text-center text-gray-600">대표 선수</h3>
  <div class="swiper playerSwiper mt-4 w-full">
    <div class="swiper-wrapper" id="player-slide-wrapper" style="min-height: 150px;">
      <!-- 동적 슬라이드 삽입 -->
    </div>
    <!-- 페이지 네비게이션, 필요 시 -->
    <div class="swiper-pagination"></div>
  </div>
</div>

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