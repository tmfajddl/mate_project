
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="pageTitle" value="${board.code } LIST"></c:set>
<%@ include file="../common/head.jspf"%>

<%
int pageLimit = (int) request.getAttribute("pageLimit");
int cpage = (int) request.getAttribute("cpage");
int totalPageNumber = (int) request.getAttribute("totalPageNumber");
String keywords = (String) request.getAttribute("keywords");
%>

		<div>
			<form class = "search_bar" action="../article/search" name="search_bar">검색
	<select name="search" id="search">
								<option value="1" selected>제목</option>
								<option value="2">내용</option>
								<option value="3">닉네임</option>
	</select>
	<input type="text" name="keyword" value="<%=keywords %>"/>
	</form>
		</div>
	</div>
	
<section class="mt-8 text-xl px-4">
	<div class="mx-auto">
		<div>${articlesCount }개</div>
		<table class="table" border="1" cellspacing="0" cellpadding="5" style="width: 100%; border-collapse: collapse;">

			<thead>
				<tr>
					<th style="text-align: center;">ID</th>
					<th style="text-align: center;">Registration Date</th>
					<th style="text-align: center;">Title</th>
					<th style="text-align: center;">Writer</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="article" items="${articles }">
					<tr class="hover:bg-base-300">
						<td style="text-align: center;">${article.id}</td>
						<td style="text-align: center;">${article.regDate.substring(0,10)}</td>
						<td style="text-align: center;">
							<a class="hover:underline" href="detail?id=${article.id }">${article.title }</a>
						</td>
						<td style="text-align: center;">${article.extra__writer }</td>
					</tr>
				</c:forEach>

				<c:if test="${empty articles }">
					<tr>
						<td colspan="4" style="text-align: center;">게시글이 없습니다</td>
					</tr>
				</c:if>
			</tbody>
		</table>
<div style="text-align: center;">
		<% if(totalPageNumber <= pageLimit){
			for(int i = 1; i <= totalPageNumber; i++){%>
				<a class="hover:underline" href="../article/search?search=${param.search}&keyword=<%=keywords %>&page=<%=i%>"><%=i%></a>
			<% }
		}
		else{
			if(cpage<6){
			for(int i = 1; i <= pageLimit; i++){%>
			<a class="hover:underline" href="../article/search?search=${param.search}&keyword=<%=keywords %>&page=<%=i%>"><%=i%></a>	
			<%}%>
			<a class="hover:underline" href="../article/search?search=${param.search}&keyword=<%=keywords %>&page=<%=totalPageNumber%>">마지막</a>
			<%}
			else{%>
			<a class="hover:underline" href="../article/search?search=${param.search}&keyword=<%=keywords %>&page=1">처음</a>
			<%if(cpage<totalPageNumber-4){
				for(int i = cpage-4; i <= cpage+4; i++){%>
				<a class="hover:underline" href="../article/search?search=${param.search}&keyword=<%=keywords %>&page=<%=i%>"><%=i%></a>	
				<%}%>
			<a class="hover:underline" href="../article/search?search=${param.search}&keyword=<%=keywords %>&page=<%=totalPageNumber%>">마지막</a>
			<% }
			else{
				for(int i = totalPageNumber-7; i <= totalPageNumber; i++){%>
				<a class="hover:underline" href="../article/search?search=${param.search}&keyword=<%=keywords %>&page=<%=i%>"><%=i%></a>	
				<%}
			}
				
			}
		}%>
		</div>
</section>



<%@ include file="../common/foot.jspf"%>