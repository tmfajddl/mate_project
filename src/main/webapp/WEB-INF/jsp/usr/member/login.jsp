<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="pageTitle" value="MEMBER LOGIN"></c:set>
<%@ include file="../common/head.jspf"%>


<section class="mt-8 text-xl px-4">
	<div class="mx-auto">
<form action="../member/doLogin" method="post">
<div>ID:
<input type="text" placeholder="ID" class="input input-neutral" name="loginId" required/></div>
<div>PassWord: 
<input type="text" placeholder="PassWord" class="input input-neutral" name="loginPw" required/></div>
<br>
<div><button class="btn btn-outline" type="submit">로그인</button></div>

</form>
		<div class="btns">
			<button class="btn btn-outline" type="button" onclick="history.back();">뒤로가기</button>
		</div>

	</div>
</section>



<%@ include file="../common/foot.jspf"%>



<%@ include file="../common/foot.jspf"%>