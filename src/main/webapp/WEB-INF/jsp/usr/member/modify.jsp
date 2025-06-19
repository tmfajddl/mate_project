<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
  
    /* input 통일 스타일 */
  input.input {
    width: 90%;
    box-sizing: border-box;
    padding: 6px 10px;
    border: 1px solid #ddd;
    border-radius: 5px;
    background-color: #f7f0e9; /* 배경색 통일 */
    color: black; /* 글자색 통일 */
    outline: none;
  }

  input.input:focus {
    border-color: #f2d8b1; /* 포커스 시 테두리 색상 */
    background-color: #fff; /* 포커스 시 배경색 살짝 밝게 */
  }
</style>

<script>
  // 비밀번호 확인 AJAX
  function checkPasswordMatch() {
  const pw1 = document.querySelector('input[name="loginPw"]');
  const pw2 = document.querySelector('input[name="loginPw2"]');
  const result = document.getElementById('pwMatchResult');

  if (!pw1 || !pw2) {
    result.innerText = '';
    return;
  }

  if (pw1.value === '' && pw2.value === '') {
    result.innerText = '';  // 입력이 비어있으면 경고 메시지 없음
    return;
  }

  if (pw1.value === pw2.value) {
    result.innerText = '비밀번호가 일치합니다.';
    result.style.color = 'green';
  } else {
    result.innerText = '비밀번호가 일치하지 않습니다.';
    result.style.color = 'red';
  }
}

</script>

<body class="m-0 h-full" style="background-color: #f7f0e9;">

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

<div class="text-center text-2xl font-bold mb-4">회원정보 수정</div>
    <div style="width: 50%; border-radius: 10px; background-color: rgb(242, 247, 247); padding: 15px; border: 3px dashed red;">
      
      <!-- 수정: enctype="multipart/form-data" 추가 -->
      <form action="../member/doModify" method="POST" enctype="multipart/form-data" style="display: flex; gap: 20px; align-items: flex-start;">
  <input type="hidden" name="id" value="${member.id}" />
  
  <!-- 왼쪽: 이미지 + 자기소개 -->
  <div style="min-width: 130px; display: flex; flex-direction: column; align-items: center;">
    <c:choose>
      <c:when test="${not empty member.profileImg}">
        <img id="previewImg" src="${member.profileImg}" style="width: 100px; height: 100px; border-radius: 50%; object-fit: cover; border: 2px solid #555;">
      </c:when>
      <c:otherwise>
        <img id="previewImg" src="/images/ball.jpg" style="width: 100px; height: 100px; border-radius: 50%; object-fit: cover; border: 2px solid #555;">
      </c:otherwise>
    </c:choose>
    
    <script>
  function previewProfileImage(input) {
    if (input.files && input.files[0]) {
      const reader = new FileReader();

      reader.onload = function(e) {
        document.getElementById('previewImg').src = e.target.result;
      };

      reader.readAsDataURL(input.files[0]);
    }
  }
  
  function togglePasswordFields() {
	  const passwordFields = document.getElementById("passwordFields");

	  if (passwordFields.style.display === "none" || passwordFields.style.display === "") {
	    passwordFields.style.display = "block";

	    // input 필드가 없으면 추가
	    if (!document.querySelector('input[name="loginPw"]')) {
	      const pw1 = document.createElement("input");
	      pw1.className = "input input-sm w-full mb-2";
	      pw1.name = "loginPw";
	      pw1.type = "password";
	      pw1.placeholder = "새 비밀번호";
	      pw1.autocomplete = "new-password";  // 추가
	      pw1.onkeyup = checkPasswordMatch;

	      const pw2 = document.createElement("input");
	      pw2.className = "input input-sm w-full";
	      pw2.name = "loginPw2";
	      pw2.type = "password";
	      pw2.placeholder = "새 비밀번호 확인";
	      pw2.autocomplete = "new-password";  // 추가
	      pw2.onkeyup = checkPasswordMatch;

	      passwordFields.appendChild(pw1);
	      passwordFields.appendChild(pw2);
	    }

	  } else {
	    passwordFields.style.display = "none";

	    // 숨길 경우 입력 필드 제거
	    const pw1 = document.querySelector('input[name="loginPw"]');
	    const pw2 = document.querySelector('input[name="loginPw2"]');
	    if (pw1) pw1.remove();
	    if (pw2) pw2.remove();

	    document.getElementById('pwMatchResult').innerText = '';
	  }
	}
</script>
    
    <div class="text-center mb-4" style="overflow-x: auto; max-width: 100%;">
  <input type="file" name="profileImgFile" accept="image/*" onchange="previewProfileImage(this)" style="max-width: 100%;"/>
</div>
    
    <div style="margin-top: 15px; width: 100%; text-align: center;">
      <strong>자기소개</strong>

          <input class="input input-sm w-full" name="introduce" value="${member.introduce}" type="text" autocomplete="off" placeholder="자기소개 입력" />
      </p>
    </div>
  </div>
  
  <!-- 오른쪽: 나머지 정보 (테이블) -->
  <table class="table" cellpadding="5" style="flex-grow: 1; color: black;">
    <tbody style="text-align: center;">
      <tr>
        <th>ID</th>
        <td>${member.id}</td>
      </tr>
      <tr>
        <th>가입일</th>
        <td>${member.regDate}</td>
      </tr>
      <tr>
        <th>수정일</th>
        <td>${member.updateDate}</td>
      </tr>
      <tr>
        <th>아이디</th>
        <td>${member.loginId}</td>
      </tr>
<tr>
  <th>새 비밀번호</th>
  <td>
    <!-- 새 비밀번호 변경 버튼 -->
    <button type="button" class="btn-back" onclick="togglePasswordFields()">변경</button>

    <!-- 비밀번호 입력창 -->
    <div id="passwordFields" style="display: none; margin-top: 10px;">
      <div id="pwMatchResult" style="margin-top: 5px; font-size: 0.9em;"></div>
    </div>
  </td>
</tr>
      <tr>
        <th>이름</th>
        <td>${member.name}</td>
      </tr>
      <tr>
        <th>성별</th>
        <td>${member.gender}</td>
      </tr>
      <tr>
        <th>응원팀</th>
        <td>${member.team}</td>
      </tr>
      <tr>
        <th>새 닉네임</th>
        <td>
          <input class="input input-sm w-full" required name="nickname" value="${member.nickname }" type="text" autocomplete="off" placeholder="새 닉네임" />
        </td>
      </tr>
      <tr>
        <th>새 전화번호</th>
        <td>
          <input class="input input-sm w-full" required name="cellphoneNum" value="${member.cellphoneNum }" type="tel" autocomplete="off" placeholder="새 전화번호" />
        </td>
      </tr>
      <tr>
        <th>새 이메일</th>
        <td>
          <input class="input input-sm w-full" required name="email" value="${member.email }" type="email" autocomplete="off" placeholder="새 이메일" />
        </td>
      </tr>
      <tr>
        <th></th>
        <td>
          <button type="submit" class="btn-back btn btn-ghost btn-xs">수정</button>
        </td>
      </tr>
    </tbody>
  </table>
</form>
    </div>
    
    <div class="text-center mt-4">
      <button class="btn-back btn btn-ghost" type="button" onclick="history.back()">뒤로가기</button>
      <a onclick="confirmDeleteAjax(${member.id})" class="btn-back btn btn-ghost">삭제</a>
    </div>

  </section>

<%@ include file="../common/foot.jspf"%>
</body>
</html>