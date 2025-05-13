<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="pageTitle" value="MEMBER JOIN"></c:set>
<%@ include file="../common/head.jspf"%>


<section class="mt-8 text-xl px-4">
	<div class="mx-auto">
<form action="../member/doJoin" method="post">
<div>아이디:
<input type="text" placeholder="아이디" class="input input-neutral" name="loginId" required/></div>
<div>비밀번호: 
<input type="text" placeholder="비밀번호" class="input input-neutral" name="loginPw" required/></div>
<div>비밀번호 확인: 
<input type="text" placeholder="비밀번호 확인" class="input input-neutral" name="loginPw2" required/></div>
<div>이름: 
<input type="text" placeholder="이름" class="input input-neutral" name="name" required/></div>
<div>닉네임: 
<input type="text" placeholder="닉네임" class="input input-neutral" name="nickname" required/></div>
<div>전화번호: 
<input type="tel" placeholder="전화번호" class="input input-neutral" name="cellphoneNum" required/></div>
<div>E-mail: 
<input type="email" placeholder="E-mail" class="input input-neutral" name="email" required/></div>
<br>
<div><button class="btn btn-outline" type="submit">회원가입</button></div>

</form>
		<div class="btns">
			<button class="btn btn-outline" type="button" onclick="history.back();">뒤로가기</button>
		</div>

	</div>
</section>



<%@ include file="../common/foot.jspf"%>



<%@ include file="../common/foot.jspf"%>