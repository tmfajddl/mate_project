<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../common/head.jspf"%>

<!DOCTYPE html>
<html lang="en">
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

/* 뒤로가기 버튼에 마우스 올리면 테이블 행 호버 색과 같게 */
.btn-back:hover {
background-color: #4a90e2;
}
</style>

<body class="m-0 h-full font-sans">

  <!-- Hero Section (100% 화면 채움 + 배경 이미지) -->
  <section class="h-screen bg-cover bg-center bg-no-repeat bg-fixed flex flex-col items-center justify-center text-black" style="background-image: url('/images/bg.jpg');">
<div class=" text-2xl font-bold mb-4">마이페이지</div>
    <!-- 내용 박스 -->
<div style="width: 30%; border-radius: 10px; background-color: rgba(242, 247, 247, 0.8); padding: 15px; border: 3px dashed red;">

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