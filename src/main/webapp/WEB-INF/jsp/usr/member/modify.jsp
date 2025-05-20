<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="pageTitle" value="MEMBER MODIFY"></c:set>
<%@ include file="../common/head.jspf"%>


<section class=2"mt-8 text-xl px-4">
	<div class="mx-auto">
		<form action="../member/doModify" method="POST">
			<input type="hidden" name="id" value="${member.id}" />
			<table class="table"  border="1" cellspacing="0" cellpadding="5" style="width: 100%; border-collapse: collapse;">
				<tbody>
					<tr>
						<th style="text-align: center;">ID</th>
						<td style="text-align: center;">${member.id}</td>
					</tr>
					<tr>
						<th style="text-align: center;">Registration Date</th>
						<td style="text-align: center;">${member.regDate}</td>
					</tr>
					<tr>
						<th style="text-align: center;">Update Date</th>
						<td style="text-align: center;">${member.updateDate}</td>
					</tr>
					<tr>
						<th style="text-align: center;">loginId</th>
						<td style="text-align: center;">${member.loginId}</td>
					</tr>
					<tr>
						<th style="text-align: center;">new loginPw</th>
						<td style="text-align: center;">
							<input class="input input-primary input-sm" required="required" name="loginPw" value="${member.loginPw }" type="text"
								autocomplete="off" placeholder="새 Pw" />
						</td>
					</tr>
					<tr>
						<th style="text-align: center;">new loginPw2</th>
						<td style="text-align: center;">
							<input class="input input-primary input-sm" required="required" name="loginPw2" type="text"
								autocomplete="off" placeholder="새 Pw 확인" />
						</td>
					</tr>
					<tr>
						<th style="text-align: center;">new name</th>
						<td style="text-align: center;">${member.name}</td>
					</tr>
					<tr>
						<th style="text-align: center;">new nickname</th>
						<td style="text-align: center;">
							<input class="input input-primary input-sm" required="required" name="nickname" value="${member.nickname }" type="text"
								autocomplete="off" placeholder="새 nickname" />
						</td>
					</tr>
										<tr>
						<th style="text-align: center;">new cellphoneNum</th>
						<td style="text-align: center;">
							<input class="input input-primary input-sm" required="required" name="cellphoneNum" value="${member.cellphoneNum }" type="tel"
								autocomplete="off" placeholder="새 cellphoneNum" />
						</td>
					</tr>
										<tr>
						<th style="text-align: center;">new email</th>
						<td style="text-align: center;">
							<input class="input input-primary input-sm" required="required" name="email" value="${member.email }" type="email"
								autocomplete="off" placeholder="새 email" />
						</td>
					</tr>
					<tr>
						<th></th>
						<td style="text-align: center;">
							<button class="btn btn-primary">수정</button>
						</td>
					</tr>

				</tbody>
			</table>
		</form>
		<div class="btns">
			<button class="btn btn-ghost" type="button" onclick="history.back();">뒤로가기</button>
				<a class="btn btn-ghost" href="../member/doDelete?id=${member.id}">삭제</a>
		</div>

	</div>
</section>



<%@ include file="../common/foot.jspf"%>