<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>경기 리스트</title>
</head>
<body>
<h2>경기 리스트</h2>

<c:if test="${not empty error}">
    <p style="color:red;">${error}</p>
</c:if>

<ul>
    <c:forEach var="game" items="${games}">
        <li>
            경기장: ${game.stadium} / 시간: ${game.time} <br>
            원정팀: ${game.awayTeam} (선발: ${game.awayPitcher}) <br>
            홈팀: ${game.homeTeam} (선발: ${game.homePitcher})
        </li>
    </c:forEach>
</ul>
</body>
</html>