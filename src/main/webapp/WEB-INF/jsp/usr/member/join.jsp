<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/head.jspf"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <!-- jQuery 로드 -->
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <style>
    option {
      background-color: rgba(242, 247, 247, 0.8);
    }
    option:hover {
      background-color: #79afe8;
    }
  </style>
</head>

<body class="m-0 h-full font-sans">
  <section class="h-screen bg-cover bg-center bg-no-repeat bg-fixed flex flex-col items-center justify-center text-black" style="background-image: url('/images/bg.jpg');">
    <div style="width: 30%; border-radius: 10px; background-color: rgba(242, 247, 247,0.8); padding: 15px; border: 3px dashed red;">
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
                <input id="loginIdInput" class="input input-info input-sm" name="loginId" autocomplete="off" type="text" placeholder="아이디 입력" />
                <br>
                <span id="idCheckMsg" style="font-size: 0.9rem;"></span>
              </td>
            </tr>
            <tr>
              <th>비밀번호</th>
              <td>
                <input class="input input-info input-sm" name="loginPw" autocomplete="off" type="text" placeholder="비밀번호 입력" />
              </td>
            </tr>
            <tr>
  <th>비밀번호 확인</th>
  <td>
    <input class="input input-info input-sm" name="loginPw2" autocomplete="off" type="text" placeholder="비밀번호 확인" />
    <br>
    <span id="pwCheckMsg" style="font-size: 0.9rem;"></span>
  </td>
</tr>
            <tr>
              <th>이름</th>
              <td>
                <input class="input input-info input-sm" name="name" autocomplete="off" type="text" placeholder="이름 입력" />
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
                <input class="input input-info input-sm" name="nickname" autocomplete="off" type="text" placeholder="닉네임 입력" />
              </td>
            </tr>
            <tr>
              <th>전화번호</th>
              <td>
                <input class="input input-info input-sm" name="cellphoneNum" autocomplete="off" type="text" placeholder="전화번호 입력" />
              </td>
            </tr>
            <tr>
              <th>이메일</th>
              <td>
                <input class="input input-info input-sm" name="email" autocomplete="off" type="text" placeholder="이메일 입력" />
              </td>
            </tr>
            <tr>
              <th></th>
              <td>
                <button type="submit" class="mt-2 px-2 py-2 bg-blue-500 hover:bg-blue-600 rounded text-white font-semibold transition">회원가입</button>
              </td>
            </tr>
          </tbody>
        </table>
      </form>
    </div>
  </section>

  <script>
    $(document).ready(function() {
      $('#loginIdInput').on('keyup', function() {
        var loginId = $(this).val().trim();

        if (loginId === '') {
          $('#idCheckMsg').text('');
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
      function checkPasswordMatch() {
    	    var pw = $('input[name="loginPw"]').val();
    	    var pw2 = $('input[name="loginPw2"]').val();

    	    if (pw === '' && pw2 === '') {
    	      $('#pwCheckMsg').text('');
    	      return;
    	    }

    	    if (pw === pw2) {
    	      $('#pwCheckMsg').text('비밀번호가 일치합니다.').css('color', 'green');
    	    } else {
    	      $('#pwCheckMsg').text('비밀번호가 일치하지 않습니다.').css('color', 'red');
    	    }
    	  }

    	  $('input[name="loginPw"], input[name="loginPw2"]').on('keyup', checkPasswordMatch);
    	});
  </script>
</body>
</html>