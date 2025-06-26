<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ include file="../common/head.jspf"%>
<link href="https://cdn.jsdelivr.net/gh/projectnoonnu/2411-3@1.0/index.css" rel="stylesheet">

<!DOCTYPE html>
<html lang="en">
<style>
body {
  font-family: 'Ownglyph_ParkDaHyun', sans-serif;
}
  option {
    background-color: #f7ecdc;
  }
  option:hover {
    background-color: #f2d8b1;
  }
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
  label {
    display: block;
    margin: 4px 0;
  }
  
 /* 배경 흐림 오버레이 */
        section {
            min-height: 100vh;
            position: relative;
            z-index: 0;
        }
        .section-overlay {
            position: absolute;
            inset: 0;
            background-color: rgba(255, 255, 255, 0.4);
            z-index: 1;
        }
        section > *:not(.section-overlay) {
            position: relative;
            z-index: 2;
        }
</style>

<body class="m-0 h-full" style="background-color: #f7f0e9;">

  <c:choose>
    <c:when test="${rq.loginedTeam == null}">
        <section class="bg-cover bg-repeat flex flex-col justify-center items-center"
                 style="background-image: url('/images/bg12.png'); cursor: url('/images/cursor0.png') 25 25, auto; background-repeat: repeat; background-size: auto; min-width: 100vw;
  min-height: 100vh;">
    </c:when>
    <c:when test="${rq.loginedTeam eq '한화 이글스'}">
        <section class="bg-cover bg-repeat flex flex-col justify-center items-center"
                 style="background-image: url('/images/bg21.png'); cursor: url('/images/cursor2.png') 25 25, auto; background-repeat: repeat; background-size: auto;min-width: 100vw;
  min-height: 100vh;">
    </c:when>
    <c:when test="${rq.loginedTeam eq '두산 베어스'}">
        <section class="bg-cover bg-repeat flex flex-col justify-center items-center"
                 style="background-image: url('/images/bg22.png') cursor: url('/images/cursor3.png') 25 25, auto; background-repeat: repeat; background-size: auto; min-width: 100vw;
  min-height: 100vh;">
    </c:when>
        <c:when test="${rq.loginedTeam eq '롯데 자이언츠'}">
        <section class="bg-cover bg-repeat flex flex-col justify-center items-center"
                 style="background-image: url('/images/bg23.png') cursor: url('/images/cursor4.png') 25 25, auto; background-repeat: repeat; background-size: auto; min-width: 100vw;
  min-height: 100vh;">
    </c:when>
        <c:when test="${rq.loginedTeam eq 'LG 트윈스'}">
        <section class="bg-cover bg-repeat flex flex-col justify-center items-center"
                 style="background-image: url('/images/bg24.png'); cursor: url('/images/cursor5.png') 25 25, auto; background-repeat: repeat; background-size: auto; min-width: 100vw;
  min-height: 100vh;">
    </c:when>
        <c:when test="${rq.loginedTeam eq '삼성 라이온즈'}">
        <section class="bg-cover bg-repeat flex flex-col justify-center items-center"
                 style="background-image: url('/images/bg25.png'); cursor: url('/images/cursor6.png') 25 25, auto; background-repeat: repeat; background-size: auto; min-width: 100vw;
  min-height: 100vh;">
    </c:when>
        <c:when test="${rq.loginedTeam eq '키움 히어로즈'}">
        <section class="bg-cover bg-repeat flex flex-col justify-center items-center" 
                 style="background-image: url('/images/bg26.png'); cursor: url('/images/cursor7.png') , auto; background-repeat: repeat; background-size: auto; min-width: 100vw;
  min-height: 100vh;">
    </c:when>
        <c:when test="${rq.loginedTeam eq 'SSG 랜더스'}">
        <section class="bg-cover bg-repeat flex flex-col justify-center items-center"
                 style="background-image: url('/images/bg27.png'); cursor: url('/images/cursor1.png') 25 25, auto; background-repeat: repeat; background-size: auto; min-width: 100vw;
  min-height: 100vh; ">
    </c:when>
        <c:when test="${rq.loginedTeam eq 'NC 다이노스'}">
        <section class="bg-cover bg-repeat flex flex-col justify-center items-center" 
         style="background-image: url('/images/bg28.png'); cursor: url('/images/cursor8.png') 25 25, auto; background-repeat: repeat; background-size: auto; min-width: 100vw;
  min-height: 100vh;">
    </c:when>
        <c:when test="${rq.loginedTeam eq 'KT 위즈'}">
        <section class="bg-cover bg-repeat flex flex-col justify-center items-center"
                 style="background-image: url('/images/bg29.png'); cursor: url('/images/cursor9.png') 25 25, auto; background-repeat: repeat; background-size: auto; min-width: 100vw;
  min-height: 100vh;">
    </c:when>
        <c:when test="${rq.loginedTeam eq 'KIA 타이거즈'}">
        <section class="bg-cover bg-repeat flex flex-col justify-center items-center" 
                 style="background-image: url('/images/bg30.png'); cursor: url('/images/cursor10.png') 25 25, auto; background-repeat: repeat; background-size: auto; min-width: 100vw;
  min-height: 100vh;">
    </c:when>
</c:choose>
<div class="section-overlay"></div>
<div style="width: 80%; margin: 20px auto 0 auto;">
  <h2 style="font-size: 3em; font-weight: bold; color: black; text-align: left; margin-left: 28%;">응원 스타일 등록/수정</h2>
  <h2 style="font-size: 1em; font-weight: bold; color: black; text-align: left; margin-left: 28%;">응원 스타일을 등록하고 마음이 통하는 친구를 찾아보는건 어떠신가요?</h2>
</div>

    <div style="width: 35%; border-radius: 10px; background-color: rgb(242, 247, 247); padding: 15px; border: 3px dashed red;">
      <form action="/usr/member/insertStyle" method="post">

        <!-- ✅ 옵션이 5개인 체크박스 -->
        <div class="section">
          <h3>선호하는 좌석을 선택해주세요</h3>
          <label><input type="checkbox" name="seat" value="내야석"
              <c:if test="${fn:contains(survey.seatPreference, '내야석')}">checked</c:if> /> 내야석</label>
          <label><input type="checkbox" name="seat" value="외야석"
              <c:if test="${fn:contains(survey.seatPreference, '외야석')}">checked</c:if> /> 외야석</label>
          <label><input type="checkbox" name="seat" value="응원석"
              <c:if test="${fn:contains(survey.seatPreference, '응원석')}">checked</c:if> /> 응원석</label>
          <label><input type="checkbox" name="seat" value="중앙탁자석"
              <c:if test="${fn:contains(survey.seatPreference, '중앙탁자석')}">checked</c:if> /> 중앙탁자석</label>
          <label><input type="checkbox" name="seat" value="외야 잔디석"
              <c:if test="${fn:contains(survey.seatPreference, '외야 잔디석')}">checked</c:if> /> 외야 잔디석</label>
        </div>

        <!-- ✅ 옵션이 3개인 라디오박스 -->
        <div class="section">
          <h3>선호하는 메이트의 성별을 선택하세요</h3>
          <label><input type="radio" name="gender" value="여자"
              <c:if test="${survey.mateGender eq '여자'}">checked</c:if> /> 여자</label>
          <label><input type="radio" name="gender" value="남자"
              <c:if test="${survey.mateGender eq '남자'}">checked</c:if> /> 남자</label>
          <label><input type="radio" name="gender" value="상관없음"
              <c:if test="${survey.mateGender eq '상관없음'}">checked</c:if> /> 상관없음</label>
        </div>

        <!-- ✅ 옵션이 4개인 체크박스 -->
        <div class="section">
          <h3>선호하는 야구관람 스타일을 선택하세요</h3>
          <label><input type="checkbox" name="style" value="응원"
              <c:if test="${fn:contains(survey.cheeringStyle, '응원')}">checked</c:if> /> 야구장은 응원가와 응원안무 따라하기지!</label>
          <label><input type="checkbox" name="style" value="음식"
              <c:if test="${fn:contains(survey.cheeringStyle, '음식')}">checked</c:if> /> 야구장은 맛있는 음식들이지!</label>
          <label><input type="checkbox" name="style" value="관람"
              <c:if test="${fn:contains(survey.cheeringStyle, '관람')}">checked</c:if> /> 야구장은 진지하게 야구관람이지!</label>
          <label><input type="checkbox" name="style" value="홈런볼"
              <c:if test="${fn:contains(survey.cheeringStyle, '홈런볼')}">checked</c:if> /> 야구장은 홈런볼 잡으러 가는거지!</label>
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