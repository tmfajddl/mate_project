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
padding-top: 200px;
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

<body class="m-0 h-full font-sans">

  <!-- Hero Section -->
  <section class="h-screen bg-cover bg-center bg-no-repeat bg-fixed flex flex-col items-center justify-center text-black" style="background-image: url('/images/bg.jpg');">
    <div class="menu2">
      <div style="background-color: rgba(242, 247, 247,0.8);"><a href="../project/information">날씨/준비물</a></div>
      <div style="background-color: rgba(242, 247, 247,0.8);"><a href="../project/information2">최근경기순위</a></div>
      <div style="background-color: rgba(242, 247, 247,0.8);"><a href="../project/information3">주변 맛집</a></div>
    </div>

    <div class="body shadow-lg">
      <!-- 왼쪽: 이미지 (50%) -->
      <div class="w-1/2 flex items-center justify-center">
        <img src="${pageContext.request.contextPath}/images/rain.png" alt="rain" class="h-90 z-[1] object-cover" />
      </div>

      <!-- 오른쪽: 글자 (50%) -->
      <div class=" ps flex flex-col justify-center p-6 text-sm leading-relaxed overflow-y-auto">
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
    
                     <div class="left-controls flex items-center gap-4 mt-2 mb-4" style="justify-content:flex-start; text-align:left;">
  <button class="btn-back btn btn-ghost" type="button" onclick="history.back();">뒤로가기</button>
</div>
  </section>

</body>
</html>


