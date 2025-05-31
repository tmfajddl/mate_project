<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="../common/head.jspf"%>
<!DOCTYPE html>
<html lang="en">

  <body class="m-0 h-full font-sans">

    <!-- Hero Section (100% 화면 채움 + 배경 이미지) -->
    <section class="h-screen bg-cover bg-center bg-no-repeat bg-fixed flex flex-col items-center justify-center text-black" style="background-image: url('/images/bg.jpg');">
      
      <div class="mx-auto">
		<form action="../member/doLogin" method="POST">
		
		<div style="border-radius: 10px; background-color: rgba(242, 247, 247,0.8); padding: 15px; border: 3px; border-color: red; border-style: dashed;">
		<table cellpadding="5">
				<tbody>
					<tr>
						<th style="color: black;">아이디</th>
						<td style="text-align: center;">
							<input class="input input-info input-sm" name="loginId" autocomplete="off" type="text" placeholder="아이디 입력" />
						</td>
					</tr>
					<tr>
						<th style="color: black;">비밀번호</th>
						<td style="text-align: center;">
							<input class="input input-info input-sm" name="loginPw" autocomplete="off" type="text" placeholder="비밀번호 입력" />
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
		</div>
		</form>
		<div class="btns">
			<button class="mt-2 px-2 py-2 bg-blue-500 hover:bg-blue-600 rounded text-white font-semibold transition" onclick="history.back();" >뒤로가기</button>

		</div>
	</div>
    </section>

  </body>
</html>