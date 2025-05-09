<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@ page import="com.example.demo.vo.Article" %>
<%@ page import="com.example.demo.vo.ResultData" %>
    
<%
List<Article> articles = (List<Article>) request.getAttribute("articles");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 목록</title>
<style>
body {
	  margin: 0;
  padding: 0;
  min-height: 100vh;
  min-width: 100vw;

}
a{
  color: inherit;
  text-decoration: inherit;
}
table,h2{
width: 80vw;
margin: 0 auto;
margin-top: 14px;
}

h2{
display:block;
padding:20px;
}

a:hover{
  color: #f76887;
}

</style>
</head>
<body>
<h2>게시물 목록</h2>
	<table style="border-collapse: collapse; border-color: black;"
		border="1px">
<thead>
			<tr>
				<th>번호</th>
				<th>날짜</th>
				<th>업데이트날짜</th>
				<th>제목</th>
				<th>내용</th>
				<th>작성자</th>
			</tr>
		</thead>
		<tbody>
<%for(Article article : articles){ %>
			<tr style="text-align: center;">
				<td><%=article.getId()%></td>
				<td><%=article.getRegDate()%></td>
				<td><%=article.getUpdateDate()%></td>
				<td><a href="../article/detail?id=<%=article.getId()%>"><%=article.getTitle()%></a></td>
				<td><%=article.getBody()%></td>
				<td><%=article.getWriter()%></td>
			<%
} %>
</tbody>
</table>
</body>
</html>