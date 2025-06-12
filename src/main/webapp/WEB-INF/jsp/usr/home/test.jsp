<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/head.jspf"%>
<link href="https://cdn.jsdelivr.net/gh/projectnoonnu/2411-3@1.0/index.css" rel="stylesheet">
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <style>
    #map-container {
      position: relative;
      width: 600px;
      height: auto;
      margin: 20px auto;
    }

    #map {
      width: 100%;
      display: block;
    }

    #flag {
      position: absolute;
      width: 40px;
      transition: all 0.5s ease;
      left: 0;
      top: 0;
      z-index: 10; /* 깃발이 버튼 위로 나오도록 */
      pointer-events: none; /* 깃발에 클릭 안 되도록 */
    }

    /* 지도 위 버튼 스타일 */
    .stadium-btn {
      position: absolute;
      width: 10px;
      height: 10px;
      border-radius: 50%; /* 동그라미 */
      background-color: #007BFF;
      cursor: pointer;
      font-size: 0px;
      color: #007BFF;
      font-weight: bold;
      display: flex;
      align-items: center;
      justify-content: center;
      user-select: none;
      transition: background-color 0.3s ease, color 0.3s ease;
      z-index: 5; /* 깃발보다 낮게 */
    }

    .stadium-btn:hover {
      background-color: #007BFF;
      color: white;
    }

    /* 날씨 정보 영역 */
    #weather-info {
      width: 600px;
      margin: 20px auto;
      font-size: 18px;
      text-align: center;
      min-height: 24px;
      color: #333;
      font-weight: 600;
    }

    /* 기존 버튼 컨테이너 숨김 */
    .button-container {
      display: none;
    }
  </style>
</head>
<body class="m-0 h-full" style="background-color: #f7f0e9;">

  <!-- Hero Section -->
    <c:choose>
    <c:when test="${rq.loginedTeam == null}">
        <section class="bg-cover bg-center bg-no-repeat bg-fixed flex flex-col items-center justify-center text-black"
                 style="background-image: url('/images/bg12.png');  cursor: url('/images/cursor0.png') 25 25, auto;">
    </c:when>
    <c:when test="${rq.loginedTeam eq '한화 이글스'}">
        <section class="bg-cover bg-center bg-no-repeat bg-fixed flex flex-col items-center justify-center text-black"
                 style="background-image: url('/images/bg21.png'); cursor: url('/images/cursor2.png') 25 25, auto;">
    </c:when>
    <c:when test="${rq.loginedTeam eq '두산 베어스'}">
        <section class="bg-cover bg-center bg-no-repeat bg-fixed flex flex-col items-center justify-center text-black"
                 style="background-image: url('/images/bg22.png') cursor: url('/images/cursor3.png') 25 25, auto;;">
    </c:when>
        <c:when test="${rq.loginedTeam eq '롯데 자이언츠'}">
        <section class="bg-cover bg-center bg-no-repeat bg-fixed flex flex-col items-center justify-center text-black"
                 style="background-image: url('/images/bg23.png') cursor: url('/images/cursor4.png') 25 25, auto;;">
    </c:when>
        <c:when test="${rq.loginedTeam eq 'LG 트윈스'}">
        <section class="bg-cover bg-center bg-no-repeat bg-fixed flex flex-col items-center justify-center text-black"
                 style="background-image: url('/images/bg24.png'); cursor: url('/images/cursor5.png') 25 25, auto;">
    </c:when>
        <c:when test="${rq.loginedTeam eq '삼성 라이온즈'}">
        <section class="bg-cover bg-center bg-no-repeat bg-fixed flex flex-col items-center justify-center text-black"
                 style="background-image: url('/images/bg25.png'); cursor: url('/images/cursor6.png') 25 25, auto;">
    </c:when>
        <c:when test="${rq.loginedTeam eq '키움 히어로즈'}">
        <section class="bg-cover bg-center bg-no-repeat bg-fixed flex flex-col items-center justify-center text-black"
                 style="background-image: url('/images/bg26.png'); cursor: url('/images/cursor7.png') , auto;">
    </c:when>
        <c:when test="${rq.loginedTeam eq 'SSG 랜더스'}">
        <section class="bg-cover bg-center bg-no-repeat bg-fixed flex flex-col items-center justify-center text-black"
                 style="background-image: url('/images/bg27.png'); cursor: url('/images/cursor1.png') 25 25, auto;">
    </c:when>
        <c:when test="${rq.loginedTeam eq 'NC 다이노스'}">
        <section class="bg-cover bg-center bg-no-repeat bg-fixed flex flex-col items-center justify-center text-black"
         style="background-image: url('/images/bg28.png'); cursor: url('/images/cursor8.png') 25 25, auto;">
    </c:when>
        <c:when test="${rq.loginedTeam eq 'KT 위즈'}">
        <section class="bg-cover bg-center bg-no-repeat bg-fixed flex flex-col items-center justify-center text-black"
                 style="background-image: url('/images/bg29.png'); cursor: url('/images/cursor9.png') 25 25, auto;">
    </c:when>
        <c:when test="${rq.loginedTeam eq 'KIA 타이거즈'}">
        <section class="bg-cover bg-center bg-no-repeat bg-fixed flex flex-col items-center justify-center text-white"
                 style="background-image: url('/images/bg30.png'); cursor: url('/images/cursor10.png') 25 25, auto;">
    </c:when>
</c:choose>

<div class="box-rounded schedule"> 
  <div class="section-title">오늘 야구 일정</div>
  <table class="player-table">
    <thead>
      <tr>
        <c:forEach var="column" items="${naverBaseballSchedule[0].keySet()}">
          <th><c:out value="${column}" /></th>
        </c:forEach>
      </tr>
    </thead>
    <tbody>
      <c:choose>
        <c:when test="${empty naverBaseballSchedule}">
          <tr>
            <td colspan="4">오늘 야구 일정이 없습니다.</td>
          </tr>
        </c:when>
        <c:otherwise>
          <c:forEach var="row" items="${naverBaseballSchedule}">
            <tr>
              <c:forEach var="column" items="${row.keySet()}">
                <td><c:out value="${row[column]}" /></td>
              </c:forEach>
            </tr>
          </c:forEach>
        </c:otherwise>
      </c:choose>
    </tbody>
  </table>
</div>

<div style="width: 80%; margin: 20px auto 0 auto;">
  <h2 style="font-size: 3em; font-weight: bold; color: #918c84; text-align: left; margin-left: 1%;">구장 별 날씨</h2>
</div>

  <div id="map-container">
    <img src="/images/map.png" id="map" alt="한국 지도">
    <img src="/images/flag.png" id="flag" alt="깃발">

    <!-- 지도 위에 위치한 동그라미 버튼 -->
    <button class="stadium-btn" style="left: 230px; top: 110px;" onclick="onStadiumClick('jamshil')" title="잠실야구장">잠</button>
    <button class="stadium-btn" style="left: 220px; top: 160px;" onclick="onStadiumClick('suwon')" title="수원KT위즈파크">수</button>
    <button class="stadium-btn" style="left: 215px; top: 410px;" onclick="onStadiumClick('gwangju')" title="광주기아챔피언스필드">광</button>
    <button class="stadium-btn" style="left: 220px; top: 130px;" onclick="onStadiumClick('gochug')" title="고척스카이돔">고</button>
    <button class="stadium-btn" style="left: 260px; top: 270px;" onclick="onStadiumClick('daejeon')" title="대전한화생명">대</button>
    <button class="stadium-btn" style="left: 380px; top: 330px;" onclick="onStadiumClick('daegu')" title="대구삼성라이온즈파크">대</button>
    <button class="stadium-btn" style="left: 380px; top: 380px;" onclick="onStadiumClick('changwon')" title="창원NC파크">창</button>
    <button class="stadium-btn" style="left: 440px; top: 370px;" onclick="onStadiumClick('busan')" title="사직야구장">사</button>
    <button class="stadium-btn" style="left: 200px; top: 130px;" onclick="onStadiumClick('inchun')" title="인천SSG랜더스필드">인</button>
  </div>
  
  <div id="checklist" class="ps flex flex-col justify-center p-6 text-sm leading-relaxed overflow-y-auto" style="display:none; position:absolute; top:100px; right: 100px; width: 300px; background: rgba(255,255,255,0.9); border-radius: 8px; box-shadow: 0 0 10px rgba(0,0,0,0.1);">
  <div>
    🎒 준비물 체크리스트<br />
    1. 우비 or 우산<br />
    우비 추천: 경기장에서는 우산을 펼치면 뒷사람 시야를 가릴 수 있어 우비가 더 좋습니다.<br />
    1회용 우비도 좋지만, 방수 잘 되는 튼튼한 우비를 챙기면 더 편해요.<br />
    2. 방수포/돗자리<br />
    좌석이 젖어 있을 수 있으니 방수되는 작은 돗자리나 일회용 방석을 챙기면 좋아요.<br />
    3. 방수 신발 or 여분 양말<br />
    신발이 젖으면 매우 불편하므로 방수 신발이나 슬리퍼 + 여분 양말을 준비하세요.<br />
    4. 비닐봉지 or 지퍼백<br />
    젖은 물건, 쓰레기, 전자기기 보호용으로 다양하게 쓸 수 있어요.<br />
    5. 따뜻한 옷 or 담요<br />
    비 오면 기온이 떨어질 수 있어서 긴팔, 얇은 패딩, 담요도 추천합니다.<br />
    6. 모자 or 캡모자<br />
    비와 햇빛을 동시에 가릴 수 있어 유용해요.<br />
    7. 간단한 간식 & 물<br />
    비 오는 날엔 부스가 붐빌 수 있어서 간단한 간식 챙기면 좋아요.
  </div>
</div>

<div id="checklist2" class="ps flex flex-col justify-center p-6 text-sm leading-relaxed overflow-y-auto" style="display:none; position:absolute; top:100px; right: 100px; width: 300px; background: rgba(255,255,255,0.9); border-radius: 8px; box-shadow: 0 0 10px rgba(0,0,0,0.1);">
  <div>
    🎒 준비물 체크리스트<br />
          1. 얇은 겉옷 (바람막이/가디건)<br />
          흐린 날엔 바람이 불거나 기온이 내려갈 수 있어요.<br />
          2. 모자 or 캡모자<br />
          햇볕이 살짝 비칠 수 있으니 준비해두면 좋아요.<br />
          3. 방석 or 작은 담요<br />
          좌석이 차가울 수 있어서 방석이나 작은 담요를 챙기면 좋아요.<br />
          4. 물 & 간단한 간식<br />
          부스가 붐비거나 줄이 길어질 수 있으니 간단히 먹을 걸 챙기면 편해요.<br />
          5. 보조 배터리 & 카메라<br />
          경기 중 사진/영상 찍거나 폰 배터리가 빨리 닳을 수 있으니 보조 배터리 준비!<br />
          6. 휴지 & 물티슈<br />
          간식 먹을 때나 자리를 정리할 때 필요해요.<br />
  </div>
</div>

<div id="checklist3" class="ps flex flex-col justify-center p-6 text-sm leading-relaxed overflow-y-auto" style="display:none; position:absolute; top:100px; right: 100px; width: 300px; background: rgba(255,255,255,0.9); border-radius: 8px; box-shadow: 0 0 10px rgba(0,0,0,0.1);">
  <div>
    🎒 준비물 체크리스트<br />
          1. 모자 or 캡모자<br />
          햇볕이 강하니까 얼굴/머리를 보호해줘요.<br />
          2. 선글라스<br />
          눈부심 방지, 자외선으로부터 눈을 보호해요.<br />
          3. 자외선 차단제<br />
          장시간 야외에 있으면 피부가 금방 타니까 꼭 발라줘요.<br />
          4. 물 & 음료<br />
          햇볕 아래 있으면 탈수될 수 있어요. 충분한 수분 보충!<br />
          5. 시원한 옷 (반팔, 통풍 잘 되는 옷)<br />
          더울 수 있으니 시원한 옷으로 준비해요.<br />
          6. 작은 부채 or 휴대용 선풍기<br />
          더위 식히는 데 도움돼요.<br />
          7. 방석 or 작은 담요<br />
          좌석이 뜨겁거나 불편할 수 있어서 챙기면 좋아요.<br />
          8. 간단한 간식<br />
          경기 중간중간 허기질 수 있으니까 준비해두면 좋아요.<br />
          9. 보조 배터리 & 카메라<br />
          사진 찍고 폰 충전용!<br />
  </div>
</div>

  <!-- 날씨 정보 표시 영역 -->
  <div id="weather-info"></div>

<script>
document.addEventListener("DOMContentLoaded", function () {
  const API_KEY = "a742b907a44edf2cb751b547e466583e";

  const stadiumPositions = {
    jamshil: { x: 232, y: 103 },
    suwon: { x: 222, y: 153 },
    gwangju: { x: 217, y: 403 },
    gochug: { x: 222, y: 123 },
    daejeon: { x: 262, y: 263 },
    daegu: { x: 382, y: 323 },
    changwon: { x: 382, y: 373 },
    busan: { x: 442, y: 363 },
    inchun: { x: 202, y: 123 }
  };

  const stadiums = {
    jamshil: { name: "jamshil", lat: 37.5131, lon: 127.0726 },
    suwon: { name: "suwon", lat: 37.2999, lon: 127.0095 },
    gwangju: { name: "gwangju", lat: 35.1683, lon: 126.8889 },
    gochug: { name: "gochug", lat: 37.4981, lon: 126.8672 },
    daejeon: { name: "daejeon", lat: 36.3171, lon: 127.428 },
    daegu: { name: "daegu", lat: 35.8414, lon: 128.5883 },
    changwon: { name: "changwon", lat: 35.2224, lon: 128.583 },
    busan: { name: "busan", lat: 35.1796, lon: 129.0756 },
    inchun: { name: "inchun", lat: 37.435, lon: 126.698 }
  };

  function moveFlagTo(stadium) {
    const flag = document.getElementById("flag");
    const pos = stadiumPositions[stadium];
    if (pos) {
      // 깃발 위치를 동그라미 버튼 중앙에 맞추기 위해 좌표 보정 (버튼 30px, 깃발 40px 고려)
      flag.style.left = (pos.x + 15 - 20) + "px"; // 버튼 왼쪽 + 반(버튼 너비/2) - 반(깃발 너비/2)
      flag.style.top = (pos.y + 15 - 40) + "px";  // 버튼 위 + 반(버튼 높이/2) - 깃발 높이(깃발을 버튼 위로 살짝 띄움)
    }
  }

  window.onStadiumClick = async function (stadiumKey) {
    console.log("클릭됨:", stadiumKey);
    moveFlagTo(stadiumKey);

    const stadium = stadiums[stadiumKey];
    if (!stadium) {
      console.error("stadium 정보 없음:", stadiumKey);
      
      return;
    }

    const weatherSpan = document.getElementById('weather-info');
    weatherSpan.textContent = "날씨 정보 로딩 중...";

    const url = `https://api.openweathermap.org/data/2.5/weather?lat=`
      + stadium.lat +
      `&lon=`
      + stadium.lon +
      `&appid=`
      + API_KEY +
      `&units=metric&lang=kr`;

    try {
      const res = await fetch(url);
      if (!res.ok) throw new Error("네트워크 응답 실패");

      const data = await res.json();
      const temp = data.main.temp;
      const desc = data.weather[0].description;
      const rain = data.rain && data.rain["1h"] ? data.rain["1h"] : 0;

      weatherSpan.textContent = '🌡'+temp+'°C / '+desc+' / 강수량: '+rain+'mm';
      
      if(desc.includes("비" || "눈" || "우박")) {
          checklist.style.display = "block";
          checklist2.style.display = "none";
          checklist3.style.display = "none";
        } 
      else if(desc.includes("흐림" || "구름")){
    	  checklist2.style.display = "block";
    	  checklist.style.display = "none";
    	  checklist3.style.display = "none";
      }
      else if(desc.includes("맑음")){
    	  checklist3.style.display = "block";
    	  checklist2.style.display = "none";
    	  checklist.style.display = "none";
      }
      else {
          checklist.style.display = "none";
        }
    } catch (err) {
      weatherSpan.textContent = "날씨 정보를 불러올 수 없음";
      console.error("fetch 에러:", err);
    }
  };

  // 초기 깃발 위치와 날씨 표시
  moveFlagTo('jamshil');
  onStadiumClick('jamshil');
});
</script>
</section>
</body>
</html>