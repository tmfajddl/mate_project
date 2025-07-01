<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/head.jspf"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

 <!-- Tailwind CSS -->
  <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet" />

  <!-- Swiper CSS -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.css" />

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
.team-card {
      width: 320px;
      height: 400px;
      perspective: 1200px;
      cursor: pointer;
    }
    .card-inner {
      position: relative;
      width: 100%;
      height: 100%;
      border-radius: 1rem;
      box-shadow: 0 10px 20px rgba(0,0,0,0.15);
      transition: transform 0.8s;
      transform-style: preserve-3d;
      
    }
    .card-inner.flipped {
      transform: rotateY(180deg);
    }
    .card-front, .card-back {
      position: absolute;
      width: 100%;
      height: 100%;
      border-radius: 1rem;
      backface-visibility: hidden;
      overflow: hidden;
    }
    .card-front {
      background: white;
      display: flex;
      align-items: center;
      justify-content: center;
    }
    .card-front img {
      width: 100%;
      height: 100%;
      object-fit: cover;
      border-radius: 1rem;
      user-select: none;
      pointer-events: none;
    }
    .card-back {
      color: white;
      padding: 1.5rem;
      transform: rotateY(180deg);
      display: flex;
      flex-direction: column;
      justify-content: center;
      align-items: center;
      text-align: center;
      border-radius: 1rem;
    }
    .card-back h2 {
      font-size: 1.8rem;
      font-weight: 700;
      margin-bottom: 0.5rem;
    }
    .card-back p {
      font-size: 1.1rem;
      margin-bottom: 1.2rem;
      max-width: 260px;
    }
    .card-back a {
      padding: 0.6rem 1.5rem;
      border-radius: 0.5rem;
      font-weight: 600;
      text-decoration: none;
      transition: background-color 0.3s;
    }
    .btn-light {
      background-color: rgba(255, 255, 255, 0.85);
      color: #111;
    }
    .btn-light:hover {
      background-color: rgba(255, 255, 255, 1);
    }  
  </style>
</head>
<body class="m-0 h-full" style="background-color: #f7f0e9;">

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

 <div class="swiper w-full max-w-5xl" style="margin-top: 50px;" >
    <div class="swiper-wrapper">

      <div class="swiper-slide team-card" tabindex="0">
        <div class="card-inner">
          <div class="card-front">
            <img src="/images/lg.png" alt="LG 트윈스" draggable="false" />
          </div>
          <div class="card-back" style="background-color: #C30452;">
            <h2>LG 트윈스</h2>
            <p>전통과 인기, 조직력 강한 명문 구단</p>
            <a href="https://www.lgtwins.com" target="_blank" rel="noopener noreferrer" class="btn-light">구단 홈페이지 바로가기</a>
          </div>
        </div>
      </div>

      <div class="swiper-slide team-card" tabindex="0">
        <div class="card-inner">
          <div class="card-front">
            <img src="/images/doosan.png" alt="두산 베어스" draggable="false" />
          </div>
          <div class="card-back" style="background-color: #1A1748;">
            <h2>두산 베어스</h2>
            <p>끈기와 팀워크, 작전 야구의 대표주자</p>
            <a href="https://www.doosanbears.com" target="_blank" rel="noopener noreferrer" class="btn-light">구단 홈페이지 바로가기</a>
          </div>
        </div>
      </div>

      <div class="swiper-slide team-card" tabindex="0">
        <div class="card-inner">
          <div class="card-front">
            <img src="/images/ssg.png" alt="SSG 랜더스" draggable="false" />
          </div>
          <div class="card-back" style="background-color: #CE0E2D;">
            <h2>SSG 랜더스</h2>
            <p>자유롭고 유쾌한 분위기의 신흥 강자</p>
            <a href="https://www.ssglanders.com" target="_blank" rel="noopener noreferrer" class="btn-light">구단 홈페이지 바로가기</a>
          </div>
        </div>
      </div>

      <div class="swiper-slide team-card" tabindex="0">
        <div class="card-inner">
          <div class="card-front">
            <img src="/images/samsung.png" alt="삼성 라이온즈" draggable="false" />
          </div>
          <div class="card-back" style="background-color: #074CA1;">
            <h2>삼성 라이온즈</h2>
            <p>전통과 클래식 야구, 묵직한 저력</p>
            <a href="https://www.samsunglions.com" target="_blank" rel="noopener noreferrer" class="btn-light">구단 홈페이지 바로가기</a>
          </div>
        </div>
      </div>

      <div class="swiper-slide team-card" tabindex="0">
        <div class="card-inner">
          <div class="card-front">
            <img src="/images/lotte.png" alt="롯데 자이언츠" draggable="false" />
          </div>
          <div class="card-back" style="background-color: #041E42;">
            <h2>롯데 자이언츠</h2>
            <p>열정과 감성, 뜨거운 팬심의 상징</p>
            <a href="https://www.giantsclub.com" target="_blank" rel="noopener noreferrer" class="btn-light">구단 홈페이지 바로가기</a>
          </div>
        </div>
      </div>

      <div class="swiper-slide team-card" tabindex="0">
        <div class="card-inner">
          <div class="card-front">
            <img src="/images/hanwha.jpg" alt="한화 이글스" draggable="false" />
          </div>
          <div class="card-back" style="background-color: #FC4E00;">
            <h2>한화 이글스</h2>
            <p>끝까지 응원받는 언더독의 대명사</p>
            <a href="https://www.hanwhaeagles.co.kr" target="_blank" rel="noopener noreferrer" class="btn-light">구단 홈페이지 바로가기</a>
          </div>
        </div>
      </div>

      <div class="swiper-slide team-card" tabindex="0">
        <div class="card-inner">
          <div class="card-front">
            <img src="/images/kia.png" alt="KIA 타이거즈" draggable="false" />
          </div>
          <div class="card-back" style="background-color: #EA0029;">
            <h2>KIA 타이거즈</h2>
            <p>우승 DNA와 전통의 자존심</p>
            <a href="https://tigers.co.kr" target="_blank" rel="noopener noreferrer" class="btn-light">구단 홈페이지 바로가기</a>
          </div>
        </div>
      </div>

      <div class="swiper-slide team-card" tabindex="0">
        <div class="card-inner">
          <div class="card-front">
            <img src="/images/nc.png" alt="NC 다이노스" draggable="false" />
          </div>
          <div class="card-back" style="background-color: #315288;">
            <h2>NC 다이노스</h2>
            <p>신생의 패기와 독특한 팀컬러</p>
            <a href="https://www.ncdinos.com" target="_blank" rel="noopener noreferrer" class="btn-light">구단 홈페이지 바로가기</a>
          </div>
        </div>
      </div>

      <div class="swiper-slide team-card" tabindex="0">
        <div class="card-inner">
          <div class="card-front">
            <img src="/images/kiwoom.png" alt="키움 히어로즈" draggable="false" />
          </div>
          <div class="card-back" style="background-color: #570514;">
            <h2>키움 히어로즈</h2>
            <p>반전 매력과 실험 정신의 젊은 팀</p>
            <a href="https://www.heroesbaseball.co.kr" target="_blank" rel="noopener noreferrer" class="btn-light">구단 홈페이지 바로가기</a>
          </div>
        </div>
      </div>

      <div class="swiper-slide team-card" tabindex="0">
        <div class="card-inner">
          <div class="card-front">
            <img src="/images/kt.png" alt="KT 위즈" draggable="false" />
          </div>
          <div class="card-back" style="background-color: #000000;">
            <h2>KT 위즈</h2>
            <p>조용히 강한 실속파 신흥 강호</p>
            <a href="https://www.ktwiz.co.kr" target="_blank" rel="noopener noreferrer" class="btn-light">구단 홈페이지 바로가기</a>
          </div>
        </div>
      </div>

    </div>

    <!-- 네비게이션 -->
  </div>
  
  <div id="quiz-container" class="w-full max-w-xl bg-white rounded-lg shadow p-6 mt-12 mx-auto transition-all duration-500">
    <h2 class="text-2xl font-bold text-center mb-6">어떤 KBO 팀이 나와 잘 맞을까?</h2>

    <form id="team-quiz" class="grid grid-cols-2 gap-6">
  <div>
    <p class="font-semibold">1. 야구장에서 당신의 모습은?</p>
    <label><input type="radio" name="q1" value="열정적으로 응원하며 함성" required /> 열정적으로 응원하며 함성</label><br/>
    <label><input type="radio" name="q1" value="차분히 경기를 관전" /> 차분히 경기를 관전</label><br/>
    <label><input type="radio" name="q1" value="선수와 전략 분석" /> 선수와 전략 분석</label>
  </div>

  <div>
    <p class="font-semibold">2. 팀 분위기를 고르자면?</p>
    <label><input type="radio" name="q2" value="팬과 함께하는 뜨거운 열정" required /> 팬과 함께하는 뜨거운 열정</label><br/>
    <label><input type="radio" name="q2" value="침착하고 전략적인 조직력" /> 침착하고 전략적인 조직력</label><br/>
    <label><input type="radio" name="q2" value="젊고 자유로운 팀 분위기" /> 젊고 자유로운 팀 분위기</label>
  </div>

  <div>
    <p class="font-semibold">3. 당신의 성격은?</p>
    <label><input type="radio" name="q3" value="도전적이고 실험정신 강함" required /> 도전적이고 실험정신 강함</label><br/>
    <label><input type="radio" name="q3" value="전통과 안정 추구" /> 전통과 안정 추구</label><br/>
    <label><input type="radio" name="q3" value="차분하고 신중한 성격" /> 차분하고 신중한 성격</label>
  </div>

  <div>
    <p class="font-semibold">4. 좋아하는 팀 컬러는?</p>
    <label><input type="radio" name="q4" value="빨강, 검정 등 강렬한 색상" required /> 빨강, 검정 등 강렬한 색상</label><br/>
    <label><input type="radio" name="q4" value="파랑, 흰색 등 차분한 색상" /> 파랑, 흰색 등 차분한 색상</label><br/>
    <label><input type="radio" name="q4" value="노랑, 주황 등 밝고 따뜻한 색상" /> 노랑, 주황 등 밝고 따뜻한 색상</label>
  </div>

  <div>
    <p class="font-semibold">5. 응원하는 이유는?</p>
    <label><input type="radio" name="q5" value="팬과의 정과 감성" required /> 팬과의 정과 감성</label><br/>
    <label><input type="radio" name="q5" value="뛰어난 실력과 성과" /> 뛰어난 실력과 성과</label><br/>
    <label><input type="radio" name="q5" value="팀워크와 협동" /> 팀워크와 협동</label>
  </div>

  <div>
    <p class="font-semibold">6. 경기 중 응원 스타일은?</p>
    <label><input type="radio" name="q6" value="크게 함성 지르며 응원" required /> 크게 함성 지르며 응원</label><br/>
    <label><input type="radio" name="q6" value="조용히 경기에 집중" /> 조용히 경기에 집중</label><br/>
    <label><input type="radio" name="q6" value="응원가에 맞춰 리듬 타기" /> 응원가에 맞춰 리듬 타기</label>
  </div>

  <div>
    <p class="font-semibold">7. 좋아하는 선수 유형은?</p>
    <label><input type="radio" name="q7" value="팀을 이끄는 스타 플레이어" required /> 팀을 이끄는 스타 플레이어</label><br/>
    <label><input type="radio" name="q7" value="협력하는 팀 플레이어" /> 협력하는 팀 플레이어</label><br/>
    <label><input type="radio" name="q7" value="젊고 패기 넘치는 선수" /> 젊고 패기 넘치는 선수</label>
  </div>

  <div>
    <p class="font-semibold">8. 가장 중요하게 생각하는 것은?</p>
    <label><input type="radio" name="q8" value="전통과 역사" required /> 전통과 역사</label><br/>
    <label><input type="radio" name="q8" value="새로운 전략과 혁신" /> 새로운 전략과 혁신</label><br/>
    <label><input type="radio" name="q8" value="팬과의 소통과 사랑" /> 팬과의 소통과 사랑</label>
  </div>

  <div>
    <p class="font-semibold">9. 응원 도구는?</p>
    <label><input type="radio" name="q9" value="응원 막대 흔들기" required /> 응원 막대 흔들기</label><br/>
    <label><input type="radio" name="q9" value="박수와 함성" /> 박수와 함성</label><br/>
    <label><input type="radio" name="q9" value="응원가 부르기" /> 응원가 부르기</label>
  </div>

  <div>
    <p class="font-semibold">10. 야구장에서 가장 기대하는 것은?</p>
    <label><input type="radio" name="q10" value="팀의 승리" required /> 팀의 승리</label><br/>
    <label><input type="radio" name="q10" value="즐거운 관람 경험" /> 즐거운 관람 경험</label><br/>
    <label><input type="radio" name="q10" value="팬들과의 친목" /> 팬들과의 친목</label>
  </div>

  <button type="submit" class="col-span-2 mt-4 bg-red-500 text-white py-2 rounded hover:bg-red-600">
    결과 보기
  </button>
</form>

    <div id="result" class="hidden text-center text-white text-xl font-bold p-6 rounded-lg mt-6"></div>
  </div>



</section>
<script src="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.js"></script>
<script>
//슬라이더 초기화
  const swiper = new Swiper('.swiper', {
    effect: 'coverflow',
    grabCursor: true,
    centeredSlides: true,
    slidesPerView: 'auto',
    coverflowEffect: {
      rotate: 30,
      stretch: 0,
      depth: 250,
      modifier: 1,
      slideShadows: true,
    },
    loop: true,
    autoplay: {
      delay: 3000,
      disableOnInteraction: false,
    },
    pagination: {
      el: '.swiper-pagination',
      clickable: true,
    },
    navigation: {
      nextEl: '.swiper-button-next',
      prevEl: '.swiper-button-prev',
    },
  });

  swiper.on('slideChange', () => {
    document.querySelectorAll('.card-inner').forEach(cardInner => {
      cardInner.classList.remove('flipped');
    });
  });

  document.querySelectorAll('.team-card').forEach(card => {
    card.addEventListener('click', () => {
      const inner = card.querySelector('.card-inner');
      inner.classList.toggle('flipped');
    });
  });

  // 팀별 슬라이드 인덱스 (0부터)
  const teamSlideIndexMap = {
    LG: 0,
    두산: 1,
    SSG: 2,
    삼성: 3,
    롯데: 4,
    한화: 5,
    KIA: 6,
    NC: 7,
    키움: 8,
    KT: 9
  };

  // 설문 제출 이벤트
  document.getElementById('team-quiz').addEventListener('submit', function(e) {
    e.preventDefault();

    const formData = new FormData(this);
    const answers = {};
    formData.forEach((val, key) => answers[key] = val);

    let score = {
      LG: 0, 두산: 0, SSG: 0, 삼성: 0, 롯데: 0,
      한화: 0, KIA: 0, NC: 0, 키움: 0, KT: 0
    };

    // 문항별 선택지에 따라 점수 부여 (한 팀에만 2점 부여, 균등 배분)
if (answers.q1) {
  switch (answers.q1) {
    case "열정적으로 응원하며 함성":
      score["롯데"] += 2;
      score["한화"] += 1;
      break;
    case "차분히 경기를 관전":
      score["두산"] += 2;
      score["KT"] += 1;
      break;
    case "선수와 전략 분석":
      score["키움"] += 2;
      score["NC"] += 1;
      break;
  }
}

if (answers.q2) {
  switch (answers.q2) {
    case "팬과 함께하는 뜨거운 열정":
      score["한화"] += 2;
      score["KIA"] += 1;
      break;
    case "침착하고 전략적인 조직력":
      score["두산"] += 2;
      score["삼성"] += 1;
      break;
    case "젊고 자유로운 팀 분위기":
      score["SSG"] += 2;
      score["NC"] += 1;
      break;
  }
}

if (answers.q3) {
  switch (answers.q3) {
    case "도전적이고 실험정신 강함":
      score["키움"] += 2;
      score["SSG"] += 1;
      break;
    case "전통과 안정 추구":
      score["LG"] += 2;
      score["삼성"] += 1;
      break;
    case "차분하고 신중한 성격":
      score["KT"] += 2;
      score["NC"] += 1;
      break;
  }
}

if (answers.q4) {
  switch (answers.q4) {
    case "빨강, 검정 등 강렬한 색상":
      score["KIA"] += 1;
      score["SSG"] += 1;
      score["KT"] += 1;
      score["LG"] += 1;
      score["키움"] += 1;
      break;
    case "파랑색처럼 청량한 색상":
      score["두산"] += 1;
      score["삼성"] += 1;
      score["롯데"] += 1;
      score["NC"] += 1;
      break;
    case "노랑, 주황 등 밝고 따뜻한 색상":
      score["한화"] += 1;
      break;
  }
}

if (answers.q5) {
  switch (answers.q5) {
    case "팬과의 정과 감성":
      score["롯데"] += 2;
      score["한화"] += 1;
      break;
    case "뛰어난 실력과 성과":
      score["LG"] += 2;
      score["KIA"] += 1;
      break;
    case "팀워크와 협동":
      score["두산"] += 2;
      score["KT"] += 1;
      break;
  }
}

if (answers.q6) {
  switch (answers.q6) {
    case "크게 함성 지르며 응원":
      score["SSG"] += 2;
      score["롯데"] += 1;
      break;
    case "조용히 경기에 집중":
      score["삼성"] += 2;
      score["KT"] += 1;
      break;
    case "응원가에 맞춰 리듬 타기":
      score["LG"] += 2;
      score["NC"] += 1;
      break;
  }
}

if (answers.q7) {
  switch (answers.q7) {
    case "팀을 이끄는 스타 플레이어":
      score["두산"] += 1;
      score["KIA"] += 3;
      score["LG"] += 2;
      score["키움"] += 1;
      break;
    case "협력하는 팀 플레이어":
      score["KT"] += 2;
      score["롯데"] += 2;
      score["NC"] += 3;
      score["SSG"] += 1;
      break;
    case "젊고 패기 넘치는 선수":
      score["한화"] += 2;
      score["삼성"] += 1;
      break;
  }
}

if (answers.q8) {
  switch (answers.q8) {
    case "전통과 역사":
      score["삼성"] += 2;
      score["LG"] += 1;
      score["KIA"] += 3;
      score["SSG"] += 1;
      break;
    case "새로운 전략과 혁신":
      score["KT"] += 2;
      score["NC"] += 3;
      score["키움"] += 1;
      break;
    case "팬과의 소통과 사랑":
      score["롯데"] += 2;
      score["한화"] += 3;
      score["두산"] += 1;
      break;
  }
}

if (answers.q9) {
  switch (answers.q9) {
    case "응원봉 흔들기":
      score["한화"] += 2;
      score["KIA"] += 2;
      score["롯데"] += 3;
      score["NC"] += 1;
      break;
    case "박수와 함성":
      score["SSG"] += 1;
      score["삼성"] += 3;
      score["키움"] += 2;
      break;
    case "응원가 부르기":
      score["LG"] += 3;
      score["KT"] += 1;
      score["두산"] += 2;
      break;
  }
}

if (answers.q10) {
  switch (answers.q10) {
    case "팀의 승리":
      score["KIA"] += 3;
      score["LG"] += 2;
      score["삼성"] += 1;
      break;
    case "즐거운 관람 경험":
      score["SSG"] += 2;
      score["한화"] += 3;
      score["NC"] += 1;
      break;
    case "팬들과의 친목":
      score["롯데"] += 3;
      score["KT"] += 1;
      score["두산"] += 2;
      break;
  }
}
console.log("최종 점수 분포:", score);
    // 점수 내림차순 정렬
    const sorted = Object.entries(score).sort((a,b) => b[1] - a[1]);
    const topTeam = sorted[0] ? sorted[0][0] : null;
    console.log("topTeam:", topTeam);
    const teamInfo = {
      LG: { color: "#C30452", desc: "전통과 인기를 겸비한 서울의 중심!" },
      두산: { color: "#1A1748", desc: "작전야구와 끈끈한 팀워크의 정석!" },
      SSG: { color: "#CE0E2D", desc: "스타일과 자유로움의 아이콘!" },
      삼성: { color: "#074CA1", desc: "KBO의 클래식, 묵직한 전통 명가!" },
      롯데: { color: "#041E42", desc: "팬심으로 뭉친 열정의 도시!" },
      한화: { color: "#FC4E00", desc: "언제나 응원받는 열정의 언더독!" },
      KIA: { color: "#EA0029", desc: "우승 DNA가 살아있는 전통 강호!" },
      NC: { color: "#315288", desc: "젊음과 도전정신의 상징!" },
      키움: { color: "#570514", desc: "데이터 야구, 도전의 실험정신!" },
      KT: { color: "#000000", desc: "조용하지만 강한 실속파!" }
    };

    const resultBox = document.getElementById('result');
    this.style.display = 'none';
    resultBox.classList.remove('hidden');

    if (topTeam && teamInfo[topTeam]) {
      resultBox.style.backgroundColor = teamInfo[topTeam].color;
      resultBox.innerHTML =
        '당신과 잘 맞는 팀은 <span class="underline">' + topTeam + '</span>!<br/>' +
        '<span class="block mt-4">' + teamInfo[topTeam].desc + '</span>';

      // 슬라이더 이동 및 자동재생 멈춤
      const targetIndex = teamSlideIndexMap[topTeam];
      if (typeof targetIndex !== 'undefined') {
        swiper.autoplay.stop();
        swiper.slideToLoop(targetIndex, 800);
      }
    } else {
      resultBox.innerHTML = "죄송합니다. 결과를 확인할 수 없습니다.";
    }
  });
</script>
</body>
</html>