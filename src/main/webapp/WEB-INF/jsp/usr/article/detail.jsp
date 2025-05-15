<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="pageTitle" value="ARTICLE DETAIL"></c:set>
<%@ include file="../common/head.jspf"%>



<section class="mt-8 text-xl px-4">
	<div class="mx-auto">
		<table class="table" border="1" cellspacing="0" cellpadding="5" style="width: 100%; border-collapse: collapse;">
			<tbody>
				<tr>
					<th style="text-align: center;">ID</th>
					<td style="text-align: center;">${article.id}</td>
				</tr>
				<tr>
					<th style="text-align: center;">Registration Date</th>
					<td style="text-align: center;">${article.regDate}</td>
				</tr>
				<tr>
					<th style="text-align: center;">Update Date</th>
					<td style="text-align: center;">${article.updateDate}</td>
				</tr>
				<tr>
					<th style="text-align: center;">Writer</th>
					<td style="text-align: center;">${article.extra__writer }</td>
				</tr>
				<tr>
					<th style="text-align: center;">BoardId</th>
					<td style="text-align: center;">${article.boardId }</td>
				</tr>
				<tr>
					<th style="text-align: center;">Title</th>
					<td style="text-align: center;">${article.title }</td>
				</tr>
				<tr>
					<th style="text-align: center;">Body</th>
					<td style="text-align: center;">${article.body }</td>
				</tr>
				<tr>
					<th style="text-align: center;">view</th>
					<td style="text-align: center;">${article.view}</td>
				</tr>
			</tbody>
		</table>
		<div style="text-align: center;">
<button id="heartBtn" class="btn btn-square">
  <!-- 비어 있는 하트 (기본 상태) -->
  <svg id="heartEmpty" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="2.5" stroke="currentColor" class="size-[1.5em]">
    <path stroke-linecap="round" stroke-linejoin="round" d="M21 8.25c0-2.485-2.099-4.5-4.688-4.5-1.935 0-3.597 1.126-4.312 2.733-.715-1.607-2.377-2.733-4.313-2.733C5.1 3.75 3 5.765 3 8.25c0 7.22 9 12 9 12s9-4.78 9-12Z" />
  </svg>

  <!-- 채워진 하트 (숨겨져 있음) -->
  <svg id="heartFilled" xmlns="http://www.w3.org/2000/svg" class="hidden size-[1.5em] text-red-500" fill="currentColor" viewBox="0 0 24 24">
    <path d="M12 21.35l-1.45-1.32C5.4 15.36 2 12.28 2 8.5 2 5.42 
             4.42 3 7.5 3c1.74 0 3.41 0.81 4.5 2.09C13.09 3.81 
             14.76 3 16.5 3 19.58 3 22 5.42 
             22 8.5c0 3.78-3.4 6.86-8.55 
             11.54L12 21.35z"/>
  </svg>
</button>
		</div>
		<div class="btns">
			<button class="btn btn-ghost" type="button" onclick="history.back();">뒤로가기</button>
			<c:if test="${article.userCanModify }">
				<a class="btn btn-ghost" href="../article/modify?id=${article.id}">수정</a>
			</c:if>
			<c:if test="${article.userCanDelete }">
				<a class="btn btn-ghost" href="../article/doDelete?id=${article.id}">삭제</a>
			</c:if>
		</div>

	</div>
</section>

<script>
  const btn = document.getElementById("heartBtn");
  const empty = document.getElementById("heartEmpty");
  const filled = document.getElementById("heartFilled");

  btn.addEventListener("click", () => {
    empty.classList.toggle("hidden");
    filled.classList.toggle("hidden");
  });
</script>



<%@ include file="../common/foot.jspf"%>