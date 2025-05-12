<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="pageTitle" value="MEMBER LOGIN"></c:set>
<%@ include file="../common/head.jspf"%>


<section class="mt-8 text-xl px-4">
	<div class="mx-auto">
<form action="../member/doLogin" method="post">
<div>ID:
<input type="text" name="loginId" required/></div>
<div>PassWord: 
<input type="text" name="loginPw" required/></div>
<br>
<div><button type="submit">로그인</button></div>

</form>
		<div class="btns">
			<button type="button" onclick="history.back();">뒤로가기</button>
		</div>

	</div>
</section>



<%@ include file="../common/foot.jspf"%>



<%@ include file="../common/foot.jspf"%>