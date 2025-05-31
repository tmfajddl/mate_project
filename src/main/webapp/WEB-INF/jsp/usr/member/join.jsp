<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/head.jspf"%>
<!DOCTYPE html>
<html lang="en">
<style>
option{
background-color: rgba(242, 247, 247,0.8);
}
option:hover{
background-color: #79afe8;
}
</style>

  <body class="m-0 h-full font-sans">

    <!-- Hero Section (100% 화면 채움 + 배경 이미지) -->
    <section class="h-screen bg-cover bg-center bg-no-repeat bg-fixed flex flex-col items-center justify-center text-black" style="background-image: url('/images/bg.jpg');">
      <div style="width: 30%; border-radius: 10px; background-color: rgba(242, 247, 247,0.8); padding: 15px; border: 3px; border-color: red; border-style: dashed;">
      <form action="action="../member/doJoin" method="POST"">
      <table class="table" cellpadding="3" style="width: 90%; color: black; margin: 0 auto;">
      <select cellpadding="5" style="	font-weight: 700; width: 50%; color: black; margin: 0 auto; border: 3px; border-radius: 10px; border-color: red; border-style: dashed;"" name="team" id="team">
      <option value="1">한화 이글스</option>
      <option value="2">LG 트윈스</option>
      <option value="3">롯데 자이언츠</option>
      <option value="4">NC 다이노스</option>
      <option value="5">두산 베어스</option>
      <option value="6">KIA 타이거즈</option>
      <option value="7">삼성 라이온즈</option>
      <option value="8">키움 히어로즈</option>
      <option value="9">KT 위즈</option>
      <option value="10">SSG 랜더스</option>
      </select>
				<tbody style="text-align: center;">
					<tr>
						<th>아이디</th>
						<td style="text-align: center;">
							<input class="input input-info input-sm" name="loginId" autocomplete="off" type="text" placeholder="아이디 입력" />
						</td>
					</tr>
					<tr>
						<th>비밀번호</th>
						<td style="text-align: center;">
							<input class="input input-info input-sm" name="loginPw" autocomplete="off" type="text" placeholder="비밀번호 입력" />
						</td>
					</tr>
					<tr>
						<th>이름</th>
						<td style="text-align: center;">
							<input class="input input-info input-sm" name="name" autocomplete="off" type="text" placeholder="이름 입력" />
						</td>
					</tr>
					<tr>
						<th>성별</th>
						<td style="text-align: center; 	font-weight: 700;">
							<input checked name="gender" autocomplete="off" type="radio" />여자
							<input name="gender" autocomplete="off" type="radio" />남자
						</td>
					</tr>
					<tr>
						<th>닉네임</th>
						<td style="text-align: center;">
							<input class="input input-info input-sm" name="nickname" autocomplete="off" type="text" placeholder="닉네임 입력" />
						</td>
					</tr>
					<tr>
						<th>전화번호</th>
						<td style="text-align: center;">
							<input class="input input-info input-sm" name=cellphoneNum autocomplete="off" type="text" placeholder="전화번호 입력" />
						</td>
					</tr>
					<tr>
						<th>이메일</th>
						<td style="text-align: center;">
							<input class="input input-info input-sm" name="email" autocomplete="off" type="text" placeholder="이메일 입력" />
						</td>
					</tr>


					<tr>
						<th></th>
						<td style="text-align: center;">
							<button class="mt-2 px-2 py-2 bg-blue-500 hover:bg-blue-600 rounded text-white font-semibold transition" class="btn btn-ghost">로그인</button>
						</td>
					</tr>

				</tbody>
			</table>
			</form>
			</div>
    </section>

  </body>
</html>