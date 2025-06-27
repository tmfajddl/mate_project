<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/head.jspf"%>
<link href="https://cdn.jsdelivr.net/gh/projectnoonnu/2411-3@1.0/index.css" rel="stylesheet">
<!DOCTYPE html>
<html lang="en">
<head>
  <!-- jQuery 로드 -->
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <style>
  body {
  font-family: 'Ownglyph_ParkDaHyun', sans-serif;
  min-width: 100vw;
  min-height: 100vh;
}
    option {
      background-color: #f7ecdc;
    }
    option:hover {
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
</head>

 <body class="m-0 h-full" style="background-color: #f7f0e9;">

  <!-- Hero Section (100% 화면 채움 + 배경 이미지) -->
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

<div style="width: 80%; margin: 20px auto 0 auto;">
  <h2 style="font-size: 3em; font-weight: bold; color: black; text-align: left; margin-left: 32%;">회원가입</h2>
</div>
    <div style="width: 30%; border-radius: 10px; background-color: rgb(242, 247, 247); padding: 15px; border: 3px dashed red;">
      <form action="../member/doJoin" method="POST">
        <table class="table" cellpadding="3" style="width: 90%; color: black; margin: 0 auto;">
          <tbody style="text-align: center;">
            <tr>
              <th colspan="2">
                <select style="font-weight: 700; width: 50%; color: black; border: 3px dashed red; border-radius: 10px;" name="team" id="team">
                  <option value="한화 이글스">한화 이글스</option>
                  <option value="LG 트윈스">LG 트윈스</option>
                  <option value="롯데 자이언츠">롯데 자이언츠</option>
                  <option value="NC 다이노스">NC 다이노스</option>
                  <option value="두산 베어스">두산 베어스</option>
                  <option value="KIA 타이거즈">KIA 타이거즈</option>
                  <option value="삼성 라이온즈">삼성 라이온즈</option>
                  <option value="키움 히어로즈">키움 히어로즈</option>
                  <option value="KT 위즈">KT 위즈</option>
                  <option value="SSG 랜더스">SSG 랜더스</option>
                </select>
              </th>
            </tr>
            <tr>
              <th>아이디</th>
              <td>
                <input id="loginIdInput" class="input input-sm" name="loginId" autocomplete="off" type="text" placeholder="아이디 입력" />
                <br>
                <span id="idCheckMsg" style="font-size: 0.9rem;"></span>
              </td>
            </tr>
            <tr>
              <th>비밀번호</th>
              <td>
                <input class="input input-sm" name="loginPw" autocomplete="off" type="text" placeholder="비밀번호 입력" />
              </td>
            </tr>
            <tr>
  <th>비밀번호 확인</th>
  <td>
    <input class="input input-sm" name="loginPw2" autocomplete="off" type="text" placeholder="비밀번호 확인" />
    <br>
    <span id="pwCheckMsg" style="font-size: 0.9rem;"></span>
  </td>
</tr>
            <tr>
              <th>이름</th>
              <td>
                <input class="input input-sm" name="name" autocomplete="off" type="text" placeholder="이름 입력" />
              </td>
            </tr>
            <tr>
              <th>성별</th>
              <td style="font-weight: 700;">
                <input checked name="gender" autocomplete="off" type="radio" value="여자" />여자
                <input name="gender" autocomplete="off" type="radio" value="남자" />남자
              </td>
            </tr>
            <tr>
              <th>닉네임</th>
              <td>
                <input id="nicknameInput" class="input input-sm" name="nickname" autocomplete="off" type="text" placeholder="닉네임 입력" />
                <br>
                <span id="nicknameCheckMsg" style="font-size: 0.9rem;"></span>
              </td>
            </tr>
            <tr>
              <th>전화번호</th>
              <td>
                <input class="input input-sm" name="cellphoneNum" autocomplete="off" type="tel" placeholder="전화번호 입력" />
              </td>
            </tr>
            <tr>
              <th>이메일</th>
              <td>
                <input class="input input-sm" name="email" autocomplete="off" type="email" placeholder="이메일 입력" />
              </td>
            </tr>
            <tr>
              <th></th>
              <td>
                <button type="submit" class="btn-back">회원가입</button>
              </td>
            </tr>
          </tbody>
        </table>
      </form>
    </div>
  </section>

  <script>
  $(document).ready(function() {
    // 아이디 입력 검사
    $('#loginIdInput').on('keyup', function() {
      var loginId = $(this).val().trim();

      if (loginId.length < 6) {
        $('#idCheckMsg').text('아이디는 6자 이상이어야 합니다.').css('color', 'red');
        return;
      }

      $.ajax({
        url: '../member/checkLoginId',
        type: 'GET',
        data: { loginId: loginId },
        success: function(response) {
          if (response === 'duplicated') {
            $('#idCheckMsg').text('이미 사용 중인 아이디입니다.').css('color', 'red');
          } else if (response === 'available') {
            $('#idCheckMsg').text('사용 가능한 아이디입니다.').css('color', 'green');
          } else {
            $('#idCheckMsg').text('오류 발생').css('color', 'orange');
          }
        },
        error: function() {
          $('#idCheckMsg').text('서버 오류').css('color', 'orange');
        }
      });
    });

    // 닉네임 입력 검사
    $('#nicknameInput').on('keyup', function() {
      var nickname = $(this).val().trim();

      if (nickname.length < 2) {
        $('#nicknameCheckMsg').text('닉네임은 2자 이상이어야 합니다.').css('color', 'red');
        return;
      }

      $.ajax({
        url: '../member/checkNickname',
        type: 'GET',
        data: { nickname: nickname },
        success: function(response) {
          if (response === 'duplicated') {
            $('#nicknameCheckMsg').text('이미 사용 중인 닉네임입니다.').css('color', 'red');
          } else if (response === 'available') {
            $('#nicknameCheckMsg').text('사용 가능한 닉네임입니다.').css('color', 'green');
          } else {
            $('#nicknameCheckMsg').text('오류 발생').css('color', 'orange');
          }
        },
        error: function() {
          $('#nicknameCheckMsg').text('서버 오류').css('color', 'orange');
        }
      });
    });

    // 비밀번호 검사
    function checkPasswordMatch() {
      var pw = $('input[name="loginPw"]').val();
      var pw2 = $('input[name="loginPw2"]').val();
      var specialCharPattern = /[!@#$%^&*(),.?":{}|<>]/;

      if (pw === '' && pw2 === '') {
        $('#pwCheckMsg').text('');
        return;
      }

      if (pw.length < 8) {
        $('#pwCheckMsg').text('비밀번호는 8자 이상이어야 합니다.').css('color', 'red');
        return;
      }

      if (!specialCharPattern.test(pw)) {
        $('#pwCheckMsg').text('비밀번호에 특수문자를 포함해야 합니다.').css('color', 'red');
        return;
      }

      if (pw !== pw2) {
        $('#pwCheckMsg').text('비밀번호가 일치하지 않습니다.').css('color', 'red');
      } else {
        $('#pwCheckMsg').text('비밀번호가 일치합니다.').css('color', 'green');
      }
    }

    $('input[name="loginPw"], input[name="loginPw2"]').on('keyup', checkPasswordMatch);
  });
</script>
</body>
</html>