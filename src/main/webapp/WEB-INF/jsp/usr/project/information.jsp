<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/head.jspf"%>
<!DOCTYPE html>
<html lang="en">
<style>
.menu2 {
  display: flex;
  flex-direction: row;
  justify-content: end;
  width: 70%;
  height: 80px;
  margin: 0;
  padding: 0;
}
.menu2 > :nth-child(1) {
  width: 20%;
  height: 100%;
  border: 2px solid #4a90e2;
  border-bottom: none;
  border-radius: 10px 10px 0 0;
}
.menu2 > div {
  width: 20%;
  height: 100%;
  border: 2px solid #4a90e2;
  border-radius: 10px 10px 0 0;
}
.body {
  border-radius: 10px 0 10px 10px;
  width: 70%;
  height: 50%;
  background-color: rgba(242, 247, 247, 0.8); /* 배경색 */
  display: flex; /* Flex로 이미지/글자 정렬 */
  overflow: hidden;
}
.btn-back {
  background: none;
  border: none;
  cursor: pointer;
  color: inline-block;
  padding: 4px 10px;
  border-radius: 5px;
  background-color: #82c3f5;
}
.btn-back:hover {
  background-color: #4a90e2;
}
.ps{
background-color: #4a90e2;
padding: 30px;
border-radius: 10px;
width: 48%;
margin-top: 30px;
margin-bottom: 30px;

}
img{
height: 90%;
border-radius: 10px;
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
</style>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <script>
  const API_KEY = "a742b907a44edf2cb751b547e466583e";

  function onGeoOk(position) {
    const latitude = position.coords.latitude;
    const longitude = position.coords.longitude;

    console.log("현재 위도:", latitude);
    console.log("현재 경도:", longitude);

    const url = "https://api.openweathermap.org/data/2.5/weather?lat=" + latitude +
      "&lon=" + longitude +
      "&appid=" + API_KEY +
      "&units=metric&lang=kr";

    console.error(url);

    fetch(url)
      .then(response => {
        if (!response.ok) throw new Error("날씨 API 호출 실패");
        return response.json();
      })
      .then(data => {
        console.log("받아온 날씨 데이터:", data);
        const temperature = data.main.temp;
        const weatherMain = data.weather[0].main;
        const weatherDescription = data.weather[0].description;

        console.log("받아온 날씨 온도:", temperature);
        console.log("받아온 날씨:", weatherMain);
        console.log("받아온 날씨2:", weatherDescription);

        // "비"가 포함되면 bodySection을 보이도록 설정
        if (weatherDescription.includes("비")) {
          document.getElementById("bodySection1").style.display = "flex";
        }
        
        // "흐림"가 포함되면 bodySection을 보이도록 설정
        if (weatherDescription.includes("흐림")) {
          document.getElementById("bodySection2").style.display = "flex";
        }
        
        // "맑음"가 포함되면 bodySection을 보이도록 설정
        if (weatherDescription.includes("맑음")) {
          document.getElementById("bodySection3").style.display = "flex";
        }
      })
      .catch(error => {
        console.error("에러 발생:", error);
      });
  }

  function onGeoError() {
    alert("위치 정보를 가져올 수 없습니다.");
  }

  navigator.geolocation.getCurrentPosition(onGeoOk, onGeoError);
  </script>

<body class="m-0 h-full font-sans">

  <!-- Hero Section -->
  <section class="h-screen bg-cover bg-center bg-no-repeat bg-fixed flex flex-col items-center justify-center text-black" style="background-image: url('/images/bg.jpg');">
    <div class="menu2">
      <div style="background-color: rgba(242, 247, 247,0.8);"><a href="../project/information">날씨/준비물</a></div>
      <div style="background-color: rgba(242, 247, 247,0.8);"><a href="../project/information2">최근경기순위</a></div>
      <div style="background-color: rgba(242, 247, 247,0.8);"><a href="../project/information3">주변 맛집</a></div>
    </div>

    <div id="bodySection1" class="body shadow-lg" style="display: none;">
      <!-- 왼쪽: 이미지 (50%) -->
      <div class="w-1/2 flex items-center justify-center">
        <img src="${pageContext.request.contextPath}/images/rain.png" alt="rain" class="h-90 z-[1] object-cover" />
      </div>

      <!-- 오른쪽: 글자 (50%) -->
      <div class=" ps flex flex-col justify-center p-6 text-sm leading-relaxed overflow-y-auto" style="padding-top: 200px;">
        <div> <!-- 마진을 여기에! -->
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
    </div>
    
    <div id="bodySection2" class="body shadow-lg" style="display: none;">
      <!-- 왼쪽: 이미지 (50%) -->
      <div class="w-1/2 flex items-center justify-center">
        <img src="${pageContext.request.contextPath}/images/cloud.png" alt="cloud" class="h-90 z-[1] object-cover" />
      </div>

      <!-- 오른쪽: 글자 (50%) -->
      <div class=" ps flex flex-col justify-center p-6 text-sm leading-relaxed overflow-y-auto" style="padding-top: 20px;">
        <div> <!-- 마진을 여기에! -->
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
    </div>
    
    <div id="bodySection3" class="body shadow-lg" style="display: none;">
      <!-- 왼쪽: 이미지 (50%) -->
      <div class="w-1/2 flex items-center justify-center">
        <img src="${pageContext.request.contextPath}/images/sun.png" alt="cloud" class="h-90 z-[1] object-cover" />
      </div>

      <!-- 오른쪽: 글자 (50%) -->
      <div class=" ps flex flex-col justify-center p-6 text-sm leading-relaxed overflow-y-auto" style="padding-top: 100px;">
        <div> <!-- 마진을 여기에! -->
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
    </div>
    
                     <div class="left-controls flex items-center gap-4 mt-2 mb-4" style="justify-content:flex-start; text-align:left;">
  <button class="btn-back btn btn-ghost" type="button" onclick="history.back();">뒤로가기</button>
</div>
  </section>

</body>
</html>


