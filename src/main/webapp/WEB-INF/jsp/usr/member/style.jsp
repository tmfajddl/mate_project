<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../common/head.jspf"%>

<!DOCTYPE html>
<html lang="en">
<style>
<style>
  option {
    background-color: rgba(242, 247, 247, 0.8);
  }
  option:hover {
    background-color: #79afe8;
  }
  .btn-back {
    background: none;
    border: none;
    cursor: pointer;
    color: black;
    padding: 4px 10px;
    border-radius: 5px;
    background-color: #82c3f5;
  }

  .btn-back:hover {
    background-color: #4a90e2;
  }

  /* ✅ 각 체크박스/라디오 옵션을 한 줄에 하나씩 보이도록 */
  label {
    display: block;
    margin: 4px 0;
  }
</style>

<body class="m-0 h-full font-sans">

  <!-- Hero Section (100% 화면 채움 + 배경 이미지) -->
  <section class="h-screen bg-cover bg-center bg-no-repeat bg-fixed flex flex-col items-center justify-center text-black" style="background-image: url('/images/bg.jpg');">

    <!-- 내용 박스 -->
    <div style="width: 35%; border-radius: 10px; background-color: rgba(242, 247, 247, 0.8); padding: 15px; border: 3px dashed red;">
  <form action="process.jsp" method="post">

    <!-- ✅ 옵션이 5개인 체크박스 -->
    <div class="section">
      <h3>선호하는 좌석을 선택해주세요</h3>
      <label><input type="checkbox" name="seat" value="1" /> 내야석</label>
      <label><input type="checkbox" name="seat" value="2" /> 외야석</label>
      <label><input type="checkbox" name="seat" value="3" /> 응원석</label>
      <label><input type="checkbox" name="seat" value="4" /> 중앙탁자석</label>
      <label><input type="checkbox" name="seat" value="5" /> 외야 잔디석</label>
    </div>

    <!-- ✅ 옵션이 3개인 라디오박스 -->
    <div class="section">
      <h3>선호하는 메이트의 성별을 선택하세요</h3>
      <label><input type="radio" name="gender" value="female" /> 여자</label>
      <label><input type="radio" name="gender" value="male" /> 남자</label>
      <label><input type="radio" name="gender" value="other" /> 상관 없음</label>
    </div>

    <!-- ✅ 옵션이 4개인 체크박스 -->
    <div class="section">
      <h3>선호하는 야구관람 스타일을 선택하세요</h3>
      <label><input type="checkbox" name="style" value="1" /> 야구장은 응원가와 응원안무 따라하기지!</label>
      <label><input type="checkbox" name="style" value="2" /> 야구장은 맛있는 음식들이지!</label>
      <label><input type="checkbox" name="style" value="3" /> 야구장은 진지하게 야구관람이지!</label>
      <label><input type="checkbox" name="style" value="4" /> 야구장은 홈런볼 잡으러 가는거지!</label>
    </div>

    <div class="text-center">
      <button type="submit" class="btn-back btn btn-ghost btn-xs">제출</button>
    </div>
  </form>
    </div>
          <div class="text-center mt-4">
        <button class="btn-back btn btn-ghost" type="button" onclick="history.back()">뒤로가기</button>
      </div>

  </section>

<%@ include file="../common/foot.jspf"%>
</body>
</html>