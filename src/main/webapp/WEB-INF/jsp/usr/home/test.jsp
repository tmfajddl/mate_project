<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <style>
        body {
            font-family: Arial, sans-serif;
            width: 600px;
            margin: 20px auto;
        }
        #stadiumButtons {
            text-align: center;
            margin: 20px 0;
        }
        #stadiumButtons button {
            margin: 5px;
            padding: 8px 12px;
            cursor: pointer;
        }
        .game {
            border: 1px solid #999;
            padding: 12px 16px;
            margin-bottom: 12px;
            border-radius: 8px;
            background-color: #f9f9f9;
            white-space: pre-line; /* 줄바꿈 유지 */
        }
        .stadium-name {
            font-weight: bold;
            font-size: 1.3em;
            margin-bottom: 6px;
        }
        .teams {
            font-size: 1.1em;
            margin-bottom: 4px;
        }
        .pitchers {
            color: #555;
            font-family: monospace;
        }
        #noGamesMessage {
            text-align: center;
            font-weight: bold;
            color: red;
            margin-top: 20px;
            display: none;
        }
    </style>
</head>
<body>

<div id="stadiumButtons">
    <button onclick="filterStadium('전체')">전체</button>
    <button onclick="filterStadium('잠실')">잠실</button>
    <button onclick="filterStadium('대전(신)')">대전(신)</button>
    <button onclick="filterStadium('사직')">사직</button>
    <button onclick="filterStadium('고척')">고척</button>
    <button onclick="filterStadium('수원')">수원</button>
    <button onclick="filterStadium('창원')">창원</button>
    <button onclick="filterStadium('인천')">인천</button>
    <button onclick="filterStadium('광주')">광주</button>
    <button onclick="filterStadium('문학')">문학</button>
</div>

<div id="gamesContainer">
    <%-- 전체 경기 초기 렌더링: 모두 보여줌 --%>
    <c:forEach var="row" items="${scheduleList}">
        <div class="game" data-stadium="${row['구장']}" style="display: block;">
            <div class="stadium-name">${row['구장']}</div>
            <div class="teams">${row['왼쪽팀명']} VS ${row['오른쪽팀명']}</div>
            <div class="pitchers">${row['왼쪽상태및투수']}   ${row['오른쪽상태및투수']}</div>
            <div style="margin-top:6px; font-size:0.9em; color:#666;">시간: ${row['시간']}</div>
        </div>
    </c:forEach>
</div>

<div id="noGamesMessage">선택한 구장에 경기가 없습니다.</div>

<script>
    function filterStadium(stadium) {
        const games = document.querySelectorAll("#gamesContainer .game");
        let anyVisible = false;

        games.forEach(game => {
            const gameStadium = game.getAttribute("data-stadium");
            if (stadium === "전체" || gameStadium === stadium) {
                game.style.display = "block";
                anyVisible = true;
            } else {
                game.style.display = "none";
            }
        });

        const noGamesMsg = document.getElementById("noGamesMessage");
        noGamesMsg.style.display = anyVisible ? "none" : "block";
    }

    window.onload = function() {
        filterStadium('전체'); // 초기에는 전체 경기 보여주기
    }
</script>

</body>
</html>