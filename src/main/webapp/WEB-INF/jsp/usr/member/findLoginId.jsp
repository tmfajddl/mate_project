<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link href="https://cdn.jsdelivr.net/gh/projectnoonnu/2411-3@1.0/index.css" rel="stylesheet">
<%@ include file="../common/head.jspf"%>
<!DOCTYPE html>
<html lang="en">
<style>
body {
  font-family: 'Ownglyph_ParkDaHyun', sans-serif;
}

/* input 스타일 통일 */
input.input {
  width: 90%;
  box-sizing: border-box;
  padding: 6px 10px;
  border: 1px solid #ddd;
  border-radius: 5px;
  background-color: #f7f0e9;
  color: black;
  outline: none;
}

input.input:focus {
  border-color: #f2d8b1;
  background-color: #fff;
}

/* 버튼 스타일 */
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
</style>

<script type="text/javascript">
  function MemberFindLoginId__submit(form) {
    form.name.value = form.name.value.trim();
    form.email.value = form.email.value.trim();

    if (form.name.value.length == 0) {
      alert('이름을 입력해주세요.');
      form.name.focus();
      return false;
    }
    if (form.email.value.length == 0) {
      alert('이메일을 입력해주세요.');
      form.email.focus();
      return false;
    }

    return true;
  }
</script>

<body class="m-0 " style="background-color: #f7f0e9;">
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

  <div class="mx-auto">
    <form action="../member/doFindLoginId" method="POST" onsubmit="return MemberFindLoginId__submit(this);">
      <div style="border-radius: 10px; background-color: rgb(255, 255, 255); padding: 15px;">
        <input type="hidden" name="afterFindLoginIdUri" value="${param.afterFindLoginIdUri}" />
        <table class="table" border="1" cellspacing="0" cellpadding="5"
          style="width: 100%; border-collapse: collapse;">
          <tbody>
            <tr>
              <th style="color: black;">이름</th>
              <td style="text-align: center;">
                <input class="input" name="name" autocomplete="off" type="text" placeholder="이름을 입력해주세요" />
              </td>
            </tr>
            <tr>
              <th style="color: black;">이메일</th>
              <td style="text-align: center;">
                <input class="input" name="email" autocomplete="off" type="text" placeholder="이메일을 입력해주세요" />
              </td>
            </tr>
            <tr>
              <th></th>
              <td style="text-align: center;">
                <button class="btn-back" type="submit">아이디 찾기</button>
              </td>
            </tr>
            <tr>
              <th></th>
              <td style="text-align: center;">
                <a class="btn-back" href="../member/login">로그인</a>
                <a class="btn-back" href="${rq.findLoginPwUri}">비밀번호 찾기</a>
              </td>
            </tr>
          </tbody>
        </table>
      </div>
    </form>
    <div class="btns">
      <button class="btn-back" type="button" onclick="history.back();">뒤로가기</button>
    </div>
  </div>
  </section>
</body>
</html>