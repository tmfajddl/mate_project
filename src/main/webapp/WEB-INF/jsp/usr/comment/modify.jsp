<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="pageTitle" value="ARTICLE WRITE"></c:set>
<%@ include file="../common/head.jspf"%>


<section class="mt-8 text-xl px-4">
	<div class="mx-auto">
		<form action="../comment/doModify" method="POST">
			<table class="table" border="1" cellspacing="0" cellpadding="5" style="width: 100%; border-collapse: collapse;">
				<tbody>
								<tr>
						<th style="text-align: center;">게시물번호</th>
						<td style="text-align: center;">
														<input class="input input-primary input-sm" required="required" name="articleId" type="text" autocomplete="off"
								value="${article.id}" disabled/>
						</td>
					</tr>
					
													<tr>
						<th style="text-align: center;">댓글번호</th>
						<td style="text-align: center;">
														<input class="input input-primary input-sm" required="required" name="id" type="text" autocomplete="off"
								value="${article.id}" readonly/>
						</td>
					</tr>
				
					<tr>
						<th style="text-align: center;">Body</th>
						<td style="text-align: center;">
							<input class="input input-primary input-sm" required="required" name="body" value="${comment.body }" type="text"
								autocomplete="off" placeholder="새 내용" />
						</td>
					</tr>
					<tr>
						<th></th>
						<td style="text-align: center;">
							<button class="btn btn-primary">작성</button>
						</td>
					</tr>
				</tbody>
			</table>
		</form>
		<div class="btns">
			<button class="btn btn-ghost" type="button" onclick="history.back();">뒤로가기</button>
		</div>
	</div>
</section>



<%@ include file="../common/foot.jspf"%>