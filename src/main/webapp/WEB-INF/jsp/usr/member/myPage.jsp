<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../common/head.jspf"%>

<!DOCTYPE html>
<html lang="en">
<style>
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

/* 뒤로가기 버튼에 마우스 올리면 테이블 행 호버 색과 같게 */
.btn-back:hover {
background-color: #f2d8b1;
}
</style>

<body class="m-0 h-full font-sans" style="background-color: #f7f0e9;">

  <!-- Hero Section (100% 화면 채움 + 배경 이미지) -->
   <c:choose>
    <c:when test="${rq.loginedTeam == null}">
        <section class="h-screen bg-cover bg-center bg-no-repeat bg-fixed flex flex-col items-center justify-center text-black"
                 style="background-image: url('/images/bg12.png') cursor: url('/images/cursor0.png') 25 25, auto;;">
    </c:when>
    <c:when test="${rq.loginedTeam eq '한화 이글스'}">
        <section class="h-screen bg-cover bg-center bg-no-repeat bg-fixed flex flex-col items-center justify-center text-black"
                 style="background-image: url('/images/bg21.png'); cursor: url('/images/cursor2.png') 25 25, auto;">
    </c:when>
    <c:when test="${rq.loginedTeam eq '두산 베어스'}">
        <section class="h-screen bg-cover bg-center bg-no-repeat bg-fixed flex flex-col items-center justify-center text-black"
                 style="background-image: url('/images/bg22.png') cursor: url('/images/cursor3.png') 25 25, auto;;">
    </c:when>
        <c:when test="${rq.loginedTeam eq '롯데 자이언츠'}">
        <section class="h-screen bg-cover bg-center bg-no-repeat bg-fixed flex flex-col items-center justify-center text-black"
                 style="background-image: url('/images/bg23.png') cursor: url('/images/cursor4.png') 25 25, auto;;">
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
<div class=" text-2xl font-bold mb-4">마이페이지</div>
    <!-- 내용 박스 -->
<div style="width: 30%; border-radius: 10px; background-color: rgb(242, 247, 247); padding: 15px; border: 3px dashed red;">

  <div style="display: flex; gap: 20px;">

    <!-- 왼쪽: 이미지와 자기소개 묶음 -->
    <div style="min-width: 120px; display: flex; flex-direction: column; align-items: center;">
      <c:choose>
        <c:when test="${not empty rq.loginedMember.profileImg}">
          <img src="${rq.loginedMember.profileImg}" style="width: 100px; height: 100px; border-radius: 50%; object-fit: cover; border: 2px solid #555;">
        </c:when>
        <c:otherwise>
          <img src="/images/ball.jpg" style="width: 100px; height: 100px; border-radius: 50%; object-fit: cover; border: 2px solid #555;">
        </c:otherwise>
      </c:choose>

      <div style="margin-top: 10px; text-align: center; width: 100%;">
        <strong>자기소개</strong>
        <p style="margin: 5px 0 0 0; font-size: 0.9rem; color: #333;">
          ${rq.loginedMember.introduce}
        </p>
      </div>
    </div>

    <!-- 오른쪽: 나머지 회원 정보 -->
    <table class="table" cellpadding="5" style="flex-grow: 1; color: black;">
      <tbody style="text-align: left;">
        <tr>
          <th style="width: 100px;">가입일</th>
          <td>${rq.loginedMember.regDate}</td>
        </tr>
        <tr>
          <th>아이디</th>
          <td>${rq.loginedMember.loginId}</td>
        </tr>
        <tr>
          <th>이름</th>
          <td>${rq.loginedMember.name}</td>
        </tr>
        <tr>
          <th>성별</th>
          <td>${rq.loginedMember.gender}</td>
        </tr>
        <tr>
          <th>응원팀</th>
          <td>${rq.loginedMember.team}</td>
        </tr>
        <tr>
          <th>닉네임</th>
          <td>${rq.loginedMember.nickname}</td>
        </tr>
        <tr>
          <th>이메일</th>
          <td>${rq.loginedMember.email}</td>
        </tr>
        <tr>
          <th>전화번호</th>
          <td>${rq.loginedMember.cellphoneNum}</td>
        </tr>
        <tr>
          <td>
            <a href="../member/checkPw" class="btn-back btn btn-ghost btn-xs">수정</a>
          </td>
        </tr>
      </tbody>
    </table>

  </div>

</div>
      <div class="text-center mt-4">
        <button class="btn-back btn btn-ghost" type="button" onclick="history.back()">뒤로가기</button>
      </div>
  </section>

<%@ include file="../common/foot.jspf"%>
</body>
</html>