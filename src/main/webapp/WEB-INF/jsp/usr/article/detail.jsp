<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@ page import="com.example.demo.vo.Article" %>
<%@ page import="com.example.demo.vo.ResultData" %>
    
<%
Article article = (Article) request.getAttribute("article");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><%=article.getId()%>번 게시글 상세보기</title>

<style>
section{
width: 30vw;
margin: 0 auto;
margin-top: 20px;
display: flex;
flex-direction: column;
}

div{
padding: 10px 0;
}

h2{
width: 80vw;
margin: 0 auto;
margin-top: 20px;
display: flex;
flex-direction: column;
align-items: center;
}

</style>
</head>
<body>
<h2><%=article.getId()%>번 게시글 상세보기</h2>
<section>
				<div>번호: <%=article.getId()%>번</div>
				<div>작성일: <%=article.getRegDate()%></div>
				<div>수정일: <%=article.getUpdateDate()%></div>
				<div>제목: <%=article.getTitle()%></div>
				<div>내용: <%=article.getBody()%></div>
				<div>작성자: <%=article.getWriter()%></div>
</section>

</body>
</html>