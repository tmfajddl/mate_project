<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
int id = (int) request.getAttribute("id");
String title = (String) request.getAttribute("title");
String body = (String) request.getAttribute("body");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><%=id%>번 게시글 수정</title>
<style>
body {
	  margin: 0;
  padding: 0;
  font-size: 1rem;
  font-weight: bold;
}
a{
  color: inherit;
  text-decoration: inherit;
}
.title{
font-size: 3rem;
}

h2{
width: 80vw;
margin: 0 auto;
margin-top: 20px;
display: flex;
flex-direction: column;
align-items: center;
}

form{
width: 20vw;
margin: 0 auto;
margin-top: 20px;
display: flex;
flex-direction: column;
}

input{
  display: block;
  width: 200px;
  height: 30px;
  border: none;
background-color: rgba(168, 172, 173,0.3);
  border-radius: 10px;s
}
div{
padding: 10px 0;
}
button:hover{
border: 2px solid #fa6e8c;
color: #fa6e8c;
}

</style>
</head>
<body>
<h2 class = "title"><%=id%>번 게시글 수정</h2>

<form action="../article/modify2" method="post">
<div>번호: <input type="text" name = "id" value=<%=id%> readonly/></div>
<div>기존 제목: <%=title%></div>
<div>기존 내용: <%=body%></div>
<div>바꿀 제목:
<input type="text" name="title" required/></div>
<div>바꿀 내용: 
<input type="text" name="body" required/></div>
<br>
<div><button type="submit">확인</button></div>

</form>
</body>
</html>