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
      <table class="table" cellpadding="5" style="width: 90%; color: black; margin: 0 auto;">
        <tbody style="text-align: center;">
          <tr>
            <th>가입일</th>
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
            <th>회원정보 수정</th>
            <td>
              <a href="../member/checkPw" class="btn-back btn btn-ghost btn-xs">수정</a>
            </td>
          </tr>
        </tbody>
      </table>

    </div>
      <div class="text-center mt-4">
        <button class="btn-back btn btn-ghost" type="button" onclick="history.back()">뒤로가기</button>
      </div>
  </section>

<%@ include file="../common/foot.jspf"%>
</body>
</html>