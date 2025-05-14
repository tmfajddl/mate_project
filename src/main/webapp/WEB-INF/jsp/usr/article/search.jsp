<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="pageTitle" value="${board.code } LIST"></c:set>
<%@ include file="../common/head.jspf"%>

<%
int limit = (int) request.getAttribute("limit");
int cpage = (int) request.getAttribute("cpage");
int totalPageNumber = (int) request.getAttribute("totalPageNumber");
int pageStartArticleNumber = (int) request.getAttribute("pageStartArticleNumber");
int pageEndArticleNumber = (int) request.getAttribute("pageEndArticleNumber");
%>


<section class="mt-24 text-xl px-4">
	<div class="mx-auto">
		<table class="table" border="1" cellspacing="0" cellpadding="5" style="width: 100%; border-collapse: collapse;">

			<thead>
				<tr>
					<th style="text-align: center;">ID</th>
					<th style="text-align: center;">Registration Date</th>
					<th style="text-align: center;">Title</th>
					<th style="text-align: center;">Writer</th>
					<th style="text-align: center;">Board</th>
				</tr>
			</thead>
			<tbody>
<c:forEach var="article" items="${articles}">
	<c:if test="${article.board__code == board.code}">
		<tr class="hover:bg-base-300">
			<td style="text-align: center;">${article.id}</td>
			<td style="text-align: center;">${article.regDate.substring(0,10)}</td>
			<td style="text-align: center;">
				<a class="hover:underline" href="detail?id=${article.id}">${article.title}</a>
			</td>
			<td style="text-align: center;">${article.extra__writer}</td>
			<td style="text-align: center;">${article.board__code}</td>
		</tr>
	</c:if>
</c:forEach>
			</tbody>
		</table>
		
		<div style="text-align: center;">
		<% if(totalPageNumber <= 9){
			for(int i = 1; i <= totalPageNumber; i++){%>
				<a class="hover:underline" href="../article/list?boardId=${board.id}&page=<%=i%>"><%=i%></a>
			<% }
		}
		else{
			if(cpage<5){
			for(int i = 1; i <= 9; i++){%>
			<a class="hover:underline" href="../article/list?boardId=${board.id}&page=<%=i%>"><%=i%></a>	
			<%}
			}
			else{
				for(int i = cpage-4; i <= cpage+4; i++){%>
				<a class="hover:underline" href="../article/list?boardId=${board.id}&page=<%=i%>"><%=i%></a>	
				<%}
			}
		}%>
		</div>
		
		<div style="text-align: center;">
		</div>
		<div style="text-align: center;">
			<form class = "search_bar" action="../article/search" name="search_bar">검색
            <select id="type" name="type">
                <option value="title">제목</option>
                <option value="body">내용</option>
                <option value="nickname">닉네임</option>
            </select>
	<input type="text" name="keyword"/>
	</form> 
		</div>
	</div>
</section>