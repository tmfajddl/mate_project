<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/head.jspf"%>
<link href="https://cdn.jsdelivr.net/gh/projectnoonnu/2411-3@1.0/index.css" rel="stylesheet">

<!DOCTYPE html>
<html lang="en">
<head>
    <title>야구 통계 쉽게 보기</title>
    <link rel="stylesheet" href="css/style.css">
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <style>
        body {
            font-family: 'Ownglyph_ParkDaHyun', sans-serif;
            padding:0;
            background-color: #f5f5f5;
        }
        h1, h2 {
            text-align: center;
            margin-bottom: 20px;
        }
        .ranking-wrapper {
            display: flex;
            justify-content: center;
            margin-bottom: 40px;
        }
        .chart-container {
            background: #f7ecdc;
            padding: 15px;
            border-radius: 10px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
            width: 100%;
            max-width: 500px;
            margin: 10px;
        }
        .chart-grid {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 20px;
        }
        canvas {
            max-width: 100%;
            height: 200px !important;
        }
        #buttonGroup {
            text-align: center;
            margin-bottom: 30px;
        }
        #buttonGroup button {
            padding: 10px 25px;
            margin: 0 15px;
            font-size: 18px;
            font-weight: 600;
            color: #fff;
            background: linear-gradient(135deg, #4a90e2, #357ABD);
            border: none;
            border-radius: 30px;
            box-shadow: 0 4px 10px rgba(54, 110, 240, 0.6);
            cursor: pointer;
            transition: background 0.3s ease, transform 0.2s ease;
            user-select: none;
        }
        #buttonGroup button:hover {
            background: linear-gradient(135deg, #357ABD, #1E3A8A);
            transform: translateY(-3px);
            box-shadow: 0 6px 14px rgba(30, 58, 138, 0.8);
        }
        #buttonGroup button:active {
            transform: translateY(1px);
            box-shadow: 0 3px 6px rgba(30, 58, 138, 0.6);
        }
    </style>
</head>
<body>

<body class="m-0 h-full" style="background-color: #f7f0e9;">

    <c:choose>
    <c:when test="${rq.loginedTeam == null}">
        <section class="bg-cover bg-center bg-no-repeat bg-fixed flex flex-col items-center justify-center text-black"
                 style="background-image: url('/images/bg12.png'); cursor: url('/images/cursor0.png') 25 25, auto;">
    </c:when>
    <c:when test="${rq.loginedTeam eq '한화 이글스'}">
        <section class="bg-cover bg-center bg-no-repeat bg-fixed flex flex-col items-center justify-center text-black"
                 style="background-image: url('/images/bg21.png'); cursor: url('/images/cursor2.png') 25 25, auto;">
    </c:when>
    <c:when test="${rq.loginedTeam eq '두산 베어스'}">
        <section class="bg-cover bg-center bg-no-repeat bg-fixed flex flex-col items-center justify-center text-black"
                 style="background-image: url('/images/bg22.png') cursor: url('/images/cursor3.png') 25 25, auto;;">
    </c:when>
        <c:when test="${rq.loginedTeam eq '롯데 자이언츠'}">
        <section class="bg-cover bg-center bg-no-repeat bg-fixed flex flex-col items-center justify-center text-black"
                 style="background-image: url('/images/bg23.png') cursor: url('/images/cursor4.png') 25 25, auto;;">
    </c:when>
        <c:when test="${rq.loginedTeam eq 'LG 트윈스'}">
        <section class="bg-cover bg-center bg-no-repeat bg-fixed flex flex-col items-center justify-center text-black"
                 style="background-image: url('/images/bg24.png'); cursor: url('/images/cursor5.png') 25 25, auto;">
    </c:when>
        <c:when test="${rq.loginedTeam eq '삼성 라이온즈'}">
        <section class="bg-cover bg-center bg-no-repeat bg-fixed flex flex-col items-center justify-center text-black"
                 style="background-image: url('/images/bg25.png'); cursor: url('/images/cursor6.png') 25 25, auto;">
    </c:when>
        <c:when test="${rq.loginedTeam eq '키움 히어로즈'}">
        <section class="bg-cover bg-center bg-no-repeat bg-fixed flex flex-col items-center justify-center text-black"
                 style="background-image: url('/images/bg26.png'); cursor: url('/images/cursor7.png') , auto;">
    </c:when>
        <c:when test="${rq.loginedTeam eq 'SSG 랜더스'}">
        <section class="bg-cover bg-center bg-no-repeat bg-fixed flex flex-col items-center justify-center text-black"
                 style="background-image: url('/images/bg27.png'); cursor: url('/images/cursor1.png') 25 25, auto;">
    </c:when>
        <c:when test="${rq.loginedTeam eq 'NC 다이노스'}">
        <section class="bg-cover bg-center bg-no-repeat bg-fixed flex flex-col items-center justify-center text-black"
         style="background-image: url('/images/bg28.png'); cursor: url('/images/cursor8.png') 25 25, auto;">
    </c:when>
        <c:when test="${rq.loginedTeam eq 'KT 위즈'}">
        <section class="bg-cover bg-center bg-no-repeat bg-fixed flex flex-col items-center justify-center text-black"
                 style="background-image: url('/images/bg29.png'); cursor: url('/images/cursor9.png') 25 25, auto;">
    </c:when>
        <c:when test="${rq.loginedTeam eq 'KIA 타이거즈'}">
        <section class="bg-cover bg-center bg-no-repeat bg-fixed flex flex-col items-center justify-center text-white"
                 style="background-image: url('/images/bg30.png'); cursor: url('/images/cursor10.png') 25 25, auto;">
    </c:when>
</c:choose>

    <!-- 팀 순위 -->
    <div class="ranking-wrapper">
        <div class="chart-container">
            <h2>🏆 KBO 팀 순위</h2>
            <canvas id="rankingChart"></canvas>
        </div>
    </div>

    <!-- 타자/투수 버튼 -->
    <div id="buttonGroup">
        <button id="batterBtn">타자</button>
        <button id="pitcherBtn">투수</button>
    </div>

    <!-- TOP5 선수 그래프 -->
    <div class="chart-grid">
        <div class="chart-container">
            <h2 id="chartTitle1">타율</h2>
            <canvas id="avgChart"></canvas>
        </div>
        <div class="chart-container">
            <h2 id="chartTitle2">홈런</h2>
            <canvas id="hrChart"></canvas>
        </div>
        <div class="chart-container">
            <h2 id="chartTitle3">평균자책점</h2>
            <canvas id="eraChart"></canvas>
        </div>
        <div class="chart-container">
            <h2 id="chartTitle4">승리</h2>
            <canvas id="winChart"></canvas>
        </div>
    </div>

    <script>
        // 팀별 대표 색상
        const teamColors = {
            "LG": "#C30452",
            "두산": "#1A1748",
            "SSG": "#CE0E2D",
            "삼성": "#074CA1",
            "롯데": "#041E42",
            "한화": "#FC4E00",
            "KIA": "#EA0029",
            "NC": "#315288",
            "키움": "#570514",
            "KT": "#000000"
        };

        // 팀 순위 데이터
        const teamLabels = [
            <c:forEach var="row" items="${teamRankings}" varStatus="loop">
                "${row[1]}"<c:if test="${!loop.last}">,</c:if>
            </c:forEach>
        ];
        const teamWins = [
            <c:forEach var="row" items="${teamRankings}" varStatus="loop">
                ${row[2]}<c:if test="${!loop.last}">,</c:if>
            </c:forEach>
        ];

        // 팀 순위 색상
        const rankingColors = teamLabels.map(team => teamColors[team] || 'rgba(54, 162, 235, 0.6)');
        const rankingBorderColors = rankingColors.map(c => c.replace('0.6', '1'));

        // 팀 순위 차트 생성
        new Chart(document.getElementById('rankingChart'), {
            type: 'bar',
            data: {
                labels: teamLabels,
                datasets: [{
                    label: '승률',
                    data: teamWins,
                    backgroundColor: rankingColors,
                    borderColor: rankingBorderColors,
                    borderWidth: 1
                }]
            },
            options: {
                responsive: true,
                devicePixelRatio: 2,
                scales: {
                    y: {
                        beginAtZero: true,
                        title: { display: true, text: '승률' }
                    }
                }
            }
        });

        // top5Players 데이터 JSP에서 받아옴
        const top5Players = [
            <c:forEach var="entry" items="${top5Players}" varStatus="status">
                {
                    first: "${entry.first}",
                    second: "${entry.second}",
                    third: "${entry.third}",
                    fourth: "${entry.fourth}",
                    fifth: "${entry.fifth}"
                }<c:if test="${!status.last}">,</c:if>
            </c:forEach>
        ];

        function getTeamColor(info) {
            const parts = info.split(" ");
            if(parts.length < 2) return '#ccc';
            const team = parts[1];
            return teamColors[team] || '#ccc';
        }

        // 기존 차트 변수 유지(글로벌)
        let avgChart, hrChart, eraChart, winChart;

        // 차트 생성 함수
        function createChart(canvasId, label, players, isReverse=false, prevChart=null) {
            const names = players.map(p => p.split(" ")[0]);
            const values = players.map(p => parseFloat(p.split(" ")[2]));
            const colors = players.map(p => getTeamColor(p));

            const ctx = document.getElementById(canvasId).getContext('2d');
            if(prevChart) prevChart.destroy();

            return new Chart(ctx, {
                type: 'bar',
                data: {
                    labels: names,
                    datasets: [{
                        label: label,
                        data: values,
                        backgroundColor: colors,
                        borderColor: colors,
                        borderWidth: 1
                    }]
                },
                options: {
                    responsive: true,
                    devicePixelRatio: 2,
                    indexAxis: 'y',
                    scales: {
                        x: {
                            beginAtZero: true,
                            reverse: false // reverse 옵션 제거
                        }
                    },
                    plugins: {
                        legend: { display: false },
                        tooltip: {
                            callbacks: {
                                label: ctx => `${label}: ${ctx.raw}`
                            }
                        }
                    }
                }
            });
        }

        function showBatterCharts() {
            document.getElementById("chartTitle1").textContent = "타율";
            document.getElementById("chartTitle2").textContent = "홈런";
            document.getElementById("chartTitle3").textContent = "타점";
            document.getElementById("chartTitle4").textContent = "도루";

            avgChart = createChart("avgChart", "타율", Object.values(top5Players[0]), false, avgChart);
            hrChart = createChart("hrChart", "홈런", Object.values(top5Players[1]), false, hrChart);
            eraChart = createChart("eraChart", "타점", Object.values(top5Players[2]), false, eraChart);
            winChart = createChart("winChart", "도루", Object.values(top5Players[3]), false, winChart);
        }

        function showPitcherCharts() {
            document.getElementById("chartTitle1").textContent = "평균자책점";
            document.getElementById("chartTitle2").textContent = "승리";
            document.getElementById("chartTitle3").textContent = "세이브";
            document.getElementById("chartTitle4").textContent = "홀드";

            // pitcher 데이터는 top5Players[15~18]로 가정 (API 혹은 JSP 데이터에 맞게 조정 필요)
            avgChart = createChart("avgChart", "평균자책점", Object.values(top5Players[15]), true, avgChart);
            hrChart = createChart("hrChart", "승리", Object.values(top5Players[16]), false, hrChart);
            eraChart = createChart("eraChart", "세이브", Object.values(top5Players[17]), false, eraChart);
            winChart = createChart("winChart", "홀드", Object.values(top5Players[19]), false, winChart);
        }

        // 기본 차트는 타자 데이터로 초기화
        showBatterCharts();

        // 버튼 이벤트 등록
        document.getElementById("batterBtn").addEventListener("click", showBatterCharts);
        document.getElementById("pitcherBtn").addEventListener("click", showPitcherCharts);

    </script>
     </section>
</body>
</html>