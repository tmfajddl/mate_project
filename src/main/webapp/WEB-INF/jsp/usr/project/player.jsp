<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link href="https://cdn.jsdelivr.net/gh/projectnoonnu/2411-3@1.0/index.css" rel="stylesheet">
<%@ include file="../common/head.jspf"%>
<!DOCTYPE html>
<html lang="en">
<style>
/* 기본 폰트 및 배경 색상 */
body {
  font-family: 'Ownglyph_ParkDaHyun', sans-serif;
  background-color: #f7f0e9;
  margin: 0;
  padding: 0;
  color: #333;
  min-height: 100vh;
}

/* 입력 필드 스타일 */
input.input,
#nameSearch,
select {
  width: 200px;
  padding: 8px 12px;
  margin: 10px 5px 10px 0;
  border: 1px solid #ccc;
  border-radius: 6px;
  background-color: #fdf8f2;
  color: #333;
  font-size: 14px;
  box-sizing: border-box;
}

input.input:focus,
#nameSearch:focus,
select:focus {
  border-color: #f2d8b1;
  background-color: #fff;
  outline: none;
}

/* 버튼 스타일 */
.btn,
.btn-back {
  padding: 8px 14px;
  border: none;
  border-radius: 6px;
  background-color: #f7ecdc;
  color: #333;
  cursor: pointer;
  font-size: 14px;
  transition: background-color 0.2s, color 0.2s;
}

.btn:hover,
.btn-back:hover {
  background-color: #f2d8b1;
}

.btn.active {
  background-color: #cfa96f;
  color: white;
  font-weight: bold;
}

/* 뒤로가기 버튼 특화 */
.btn-back {
  padding: 6px 12px;
  margin-top: 10px;
}

/* 제목 */
h1 {
  color: #333;
  margin-bottom: 20px;
  font-size: 28px;
  text-align: center;
}

/* 테이블 전체 */
table {
   width: 80%;
        border-collapse: collapse;
        background-color: white;
        border-radius: 10px; /* 리스트 가장자리 라운드 */
        overflow: hidden; /* 라운드 유지 */
}

/* 테이블 헤더 및 셀 */
th, td {
  text-align: center;
        padding: 10px;
}
 thead {
        background-color: #f7ecdc;
      }
/* 마우스 hover 시 행 */
tr:hover:not(#chartRow):not(#noDataRow) {
  background-color: #f2d8b1;
  cursor: pointer;
}

/* 인라인 폼 (버튼 그룹 등) */
form.inline {
  display: inline-block;
  margin: 0 10px 10px 0;
}

/* 페이징 영역 */
.pagination {
  text-align: center;
  margin: 20px 0;
  font-size: 16px;
}

.pagination a,
.pagination strong {
  margin: 0 6px;
  text-decoration: none;
  color: #333;
}

/* 차트 행 스타일 */
#chartRow {
  background-color: #fafafa;
  transition: all 0.3s;
}

/* 데이터 없을 때 메시지 */
#noDataRow {
  color: #d9534f;
  font-weight: bold;
  background-color: #fff3f3;
  text-align: center;
}

/* 반응형 (선택적으로 사용 가능) */
@media (max-width: 768px) {
  table, th, td {
    font-size: 12px;
  }

  .btn, .btn-back, input.input, #nameSearch, select {
    width: 100%;
    margin-bottom: 10px;
  }

  form.inline {
    display: block;
  }
}

.filter-bar {
  display: flex;
  flex-wrap: wrap;
  align-items: center;
  gap: 10px;
  margin-bottom: 20px;
}

.filter-bar label {
  margin-right: 5px;
  font-weight: bold;
  font-size: 14px;
}

.filter-bar input,
.filter-bar select,
.filter-bar button {
  font-size: 14px;
}
section {
  min-height: 100vh;
}

tr.selected {
  background-color: #f2d8b1 !important;
}

/* 3. 페이지 번호 강조 */
.pagination strong {
  font-weight: bold;
  color: #cfa96f;
  font-size: 18px;
  padding: 0 8px;
  bord
</style>


 <body style="background-color: #f7f0e9;">

  <!-- Hero Section (100% 화면 채움 + 배경 이미지) -->
 <c:choose>
    <c:when test="${rq.loginedTeam == null}">
        <section class="h-screen bg-cover bg-center bg-no-repeat bg-fixed flex flex-col items-center justify-center text-black"
                 style="background-image: url('/images/bg12.png'); cursor: url('/images/cursor0.png') 25 25, auto;">
    </c:when>
    <c:when test="${rq.loginedTeam eq '한화 이글스'}">
        <section class="h-screen bg-cover bg-center bg-no-repeat bg-fixed flex flex-col items-center justify-center text-black"
                 style="background-image: url('/images/bg21.png'); cursor: url('/images/cursor2.png') 25 25, auto;">
    </c:when>
    <c:when test="${rq.loginedTeam eq '두산 베어스'}">
        <section class="h-screen bg-cover bg-center bg-no-repeat bg-fixed flex flex-col items-center justify-center text-black"
                 style="background-image: url('/images/bg22.png') cursor: url('/images/cursor3.png') 25 25, auto;;">
    </c:when>
        <c:when test="${rq.loginedTeam eq '롯데 자이언츠'}">
        <section class="h-screen bg-cover bg-center bg-no-repeat bg-fixed flex flex-col items-center justify-center text-black"
                 style="background-image: url('/images/bg23.png') cursor: url('/images/cursor4.png') 25 25, auto;;">
    </c:when>
        <c:when test="${rq.loginedTeam eq 'LG 트윈스'}">
        <section class="h-screen bg-cover bg-center bg-no-repeat bg-fixed flex flex-col items-center justify-center text-black"
                 style="background-image: url('/images/bg24.png'); cursor: url('/images/cursor5.png') 25 25, auto;">
    </c:when>
        <c:when test="${rq.loginedTeam eq '삼성 라이온즈'}">
        <section class="h-screen bg-cover bg-center bg-no-repeat bg-fixed flex flex-col items-center justify-center text-black"
                 style="background-image: url('/images/bg25.png'); cursor: url('/images/cursor6.png') 25 25, auto;">
    </c:when>
        <c:when test="${rq.loginedTeam eq '키움 히어로즈'}">
        <section class="h-screen bg-cover bg-center bg-no-repeat bg-fixed flex flex-col items-center justify-center text-black"
                 style="background-image: url('/images/bg26.png'); cursor: url('/images/cursor7.png') , auto;">
    </c:when>
        <c:when test="${rq.loginedTeam eq 'SSG 랜더스'}">
        <section class="h-screen bg-cover bg-center bg-no-repeat bg-fixed flex flex-col items-center justify-center text-black"
                 style="background-image: url('/images/bg27.png'); cursor: url('/images/cursor1.png') 25 25, auto;">
    </c:when>
        <c:when test="${rq.loginedTeam eq 'NC 다이노스'}">
        <section class="h-screen bg-cover bg-center bg-no-repeat bg-fixed flex flex-col items-center justify-center text-black"
         style="background-image: url('/images/bg28.png'); cursor: url('/images/cursor8.png') 25 25, auto;">
    </c:when>
        <c:when test="${rq.loginedTeam eq 'KT 위즈'}">
        <section class="h-screen bg-cover bg-center bg-no-repeat bg-fixed flex flex-col items-center justify-center text-black"
                 style="background-image: url('/images/bg29.png'); cursor: url('/images/cursor9.png') 25 25, auto;">
    </c:when>
        <c:when test="${rq.loginedTeam eq 'KIA 타이거즈'}">
        <section class="h-screen bg-cover bg-center bg-no-repeat bg-fixed flex flex-col items-center justify-center text-white"
                 style="background-image: url('/images/bg30.png'); cursor: url('/images/cursor10.png') 25 25, auto;">
    </c:when>
</c:choose>

    <h1>KBO 선수 목록</h1>

    <!-- 검색 및 필터 영역 감싸기 -->
<div class="filter-bar">
  <!-- 이름 검색 -->
  <label for="nameSearch">이름 검색:</label>
  <input type="text" id="nameSearch" name="keyword" placeholder="이름을 입력하세요" value="${param.keyword}" />

  <!-- 팀 선택 -->
  <form method="get" action="/usr/home/test" class="inline">
    <input type="hidden" name="type" value="${type}" />
    <input type="hidden" name="page" value="1" />
    <label for="teamSelect">팀 선택:</label>
    <select name="teamIndex" id="teamSelect" onchange="this.form.submit()">
      <c:forEach var="entry" items="${teamNames}">
        <option value="${entry.value}" ${entry.value == teamIndex ? 'selected' : ''}>${entry.key}</option>
      </c:forEach>
    </select>
  </form>

  <!-- 타자 버튼 -->
  <form method="get" action="/usr/project/player" class="inline">
    <input type="hidden" name="teamIndex" value="${teamIndex}" />
    <input type="hidden" name="type" value="타자" />
    <input type="hidden" name="page" value="1" />
    <input type="hidden" name="keyword" id="hiddenKeyword1" />
    <button type="submit" class="btn ${type == '타자' ? 'active' : ''}">타자</button>
  </form>

  <!-- 투수 버튼 -->
  <form method="get" action="/usr/project/player" class="inline">
    <input type="hidden" name="teamIndex" value="${teamIndex}" />
    <input type="hidden" name="type" value="투수" />
    <input type="hidden" name="page" value="1" />
    <input type="hidden" name="keyword" id="hiddenKeyword2" />
    <button type="submit" class="btn ${type == '투수' ? 'active' : ''}">투수</button>
  </form>
</div>

    <!-- 선수 표 -->
    <table>
        <thead>
            <tr>
                <th>등번호</th>
                <th>이름</th>
                <th>팀</th>
                <th>포지션</th>

            </tr>
        </thead>
        <tbody id="playerTableBody">
            <c:forEach var="p" items="${players}">
                <tr onclick="loadPlayerStats('${p.playerId}', '${type}', this)">
                    <td>${p.backNumber}</td>
                    <td>${p.name}</td>
                    <td>${p.team}</td>
                    <td>${p.position}</td>
                </tr>
            </c:forEach>

            <!-- 차트 표시용 행 -->
            <tr id="chartRow" style="display:none;">
                <td colspan="5">
                    <canvas id="playerChart" height="50"></canvas>
                </td>
            </tr>

            <!-- 데이터 없을 경우 표시 -->
            <tr id="noDataRow" style="display:none;">
                <td colspan="5" style="text-align:center; color:red;">KBO 공식 기록이 없습니다</td>
            </tr>
        </tbody>
    </table>

    <!-- 페이징 -->
    <div class="pagination">
        <c:if test="${startPage > 1}">
            <a href="/usr/project/player?teamIndex=${teamIndex}&type=${type}&page=${startPage - 1}">이전</a>
        </c:if>

        <c:forEach var="i" begin="${startPage}" end="${endPage}">
            <c:choose>
                <c:when test="${i == page}">
                    <strong>${i}</strong>
                </c:when>
                <c:otherwise>
                    <a href="/usr/project/player?teamIndex=${teamIndex}&type=${type}&page=${i}">${i}</a>
                </c:otherwise>
            </c:choose>
        </c:forEach>

        <c:if test="${endPage < totalPages}">
            <a href="/usr/project/player?teamIndex=${teamIndex}&type=${type}&page=${endPage + 1}">다음</a>
        </c:if>
    </div>
      
    </section>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script>
  const allPlayers = ${allPlayersJson};
</script>

<script>
let chartInstance = null;
let currentOpenPlayerId = null;
let filteredPlayers = [];
let currentSearchPage = 1;
const ITEMS_PER_PAGE = 10;

const tableBody = document.getElementById('playerTableBody');
const pagination = document.querySelector('.pagination');
const chartRow = document.getElementById('chartRow');
const noDataRow = document.getElementById('noDataRow');

let selectedRow = null;

function loadPlayerStats(playerId, type, rowElement) {
  if (currentOpenPlayerId === playerId) {
    chartRow.style.display = 'none';
    noDataRow.style.display = 'none';
    currentOpenPlayerId = null;

    if (selectedRow) {
      selectedRow.classList.remove('selected');
      selectedRow = null;
    }
    return;
  }

  if (selectedRow) {
    selectedRow.classList.remove('selected');
  }
  rowElement.classList.add('selected');
  selectedRow = rowElement;

  fetch('/usr/player/stats?playerId=' + playerId + '&type=' + type)
    .then(res => res.json())
    .then(data => {
      if (!data || data.length === 0) {
        chartRow.style.display = 'none';
        noDataRow.style.display = '';
        rowElement.parentNode.insertBefore(noDataRow, rowElement.nextSibling);
        currentOpenPlayerId = playerId;
        return;
      }

      noDataRow.style.display = 'none';
      chartRow.style.display = '';
      rowElement.parentNode.insertBefore(chartRow, rowElement.nextSibling);
      currentOpenPlayerId = playerId;

      const years = data.map(d => d.year);
      let datasets = [];

      if (type === '타자') {
        datasets = [
          { label: '타율', data: data.map(d => parseFloat(d.avg)), borderColor: 'blue', backgroundColor: 'rgba(0,0,255,0.1)', yAxisID: 'y', fill: false, hidden: false },
          { label: '안타(H)', data: data.map(d => parseInt(d.h)), borderColor: 'green', backgroundColor: 'rgba(0,255,0,0.1)', yAxisID: 'y1', fill: false, hidden: true },
          { label: '장타율(SLG)', data: data.map(d => parseFloat(d.slg)), borderColor: 'orange', backgroundColor: 'rgba(255,165,0,0.1)', yAxisID: 'y', fill: false, hidden: true },
          { label: '출루율(OBP)', data: data.map(d => parseFloat(d.obp)), borderColor: 'purple', backgroundColor: 'rgba(128,0,128,0.1)', yAxisID: 'y', fill: false, hidden: true }
        ];
      } else {
        datasets = [
          { label: '평균자책점(ERA)', data: data.map(d => parseFloat(d.era)), borderColor: 'red', backgroundColor: 'rgba(255,0,0,0.1)', yAxisID: 'y', fill: false, hidden: false },
          { label: '승률(WPCT)', data: data.map(d => parseFloat(d.wpct)), borderColor: 'blue', backgroundColor: 'rgba(0,0,255,0.1)', yAxisID: 'y1', fill: false, hidden: true },
          { label: '피안타(H)', data: data.map(d => parseInt(d.h)), borderColor: 'gray', backgroundColor: 'rgba(128,128,128,0.1)', yAxisID: 'y', fill: false, hidden: true },
          { label: '삼진(SO)', data: data.map(d => parseInt(d.so)), borderColor: 'green', backgroundColor: 'rgba(0,255,0,0.1)', yAxisID: 'y', fill: false, hidden: true }
        ];
      }

      if (chartInstance) chartInstance.destroy();

      const ctx = document.getElementById('playerChart').getContext('2d');
      chartInstance = new Chart(ctx, {
    	  type: 'line',
    	  data: { labels: years, datasets: datasets },
    	  options: {
    	    plugins: {
    	      legend: {
    	        labels: {
    	          // 범례 글자 색상을 데이터셋 visible 여부에 따라 동적으로 변경
    	          color: function(context) {
    	            const ci = context.chart;
    	            const index = context.datasetIndex;
    	            return ci.isDatasetVisible(index) ? context.dataset.borderColor : 'gray';
    	          },
    	          font: {
    	            size: 14,
    	            weight: 'bold'
    	          },
    	          padding: 20,// 범례 항목 간 간격
    	        },
    	        onHover: function(e, legendItem, legend) {
    	          e.native.target.style.cursor = 'pointer';
    	        },
    	        onLeave: function(e, legendItem, legend) {
    	          e.native.target.style.cursor = 'default';
    	        },
    	        onClick: (e, legendItem, legend) => {
    	          const ci = legend.chart;
    	          const index = legendItem.datasetIndex;

    	          const isVisible = ci.isDatasetVisible(index);
    	          ci.setDatasetVisibility(index, !isVisible);

    	          // 색상 토글
    	          ci.data.datasets.forEach((ds, i) => {
    	            if (!ds.originalBorderColor) {
    	              ds.originalBorderColor = ds.borderColor;
    	              ds.originalBackgroundColor = ds.backgroundColor;
    	            }
    	            if (ci.isDatasetVisible(i)) {
    	              ds.borderColor = ds.originalBorderColor;
    	              ds.backgroundColor = ds.originalBackgroundColor;
    	            } else {
    	              ds.borderColor = 'rgba(128,128,128,0.5)';
    	              ds.backgroundColor = 'rgba(200,200,200,0.2)';
    	            }
    	          });

    	          // 스케일 재계산
    	          function recalcScale(axisId) {
    	            const visibleData = [];
    	            ci.data.datasets.forEach((ds, i) => {
    	              if (ci.isDatasetVisible(i) && ds.yAxisID === axisId) {
    	                ds.data.forEach(val => {
    	                  const parsed = parseFloat(val);
    	                  if (!isNaN(parsed)) visibleData.push(parsed);
    	                });
    	              }
    	            });
    	            if (visibleData.length > 0) {
    	              const min = Math.min(...visibleData);
    	              const max = Math.max(...visibleData);
    	              ci.options.scales[axisId].min = min * 0.9;
    	              ci.options.scales[axisId].max = max * 1.1;
    	            } else {
    	              ci.options.scales[axisId].min = undefined;
    	              ci.options.scales[axisId].max = undefined;
    	            }
    	          }
    	          recalcScale('y');
    	          recalcScale('y1');

    	          ci.update();
    	        }
    	      }
    	    },
    	    scales: {
    	      y: { position: 'left', beginAtZero: false },
    	      y1: { position: 'right', grid: { drawOnChartArea: false }, beginAtZero: false }
    	    }
    	  }
    	});
    });
}

function renderSearchPage(page) {
  [...tableBody.querySelectorAll('tr')].forEach(tr => {
    if (!tr.id || (tr.id !== 'chartRow' && tr.id !== 'noDataRow')) {
      tr.remove();
    }
  });

  const start = (page - 1) * ITEMS_PER_PAGE;
  const end = start + ITEMS_PER_PAGE;
  const pageItems = filteredPlayers.slice(start, end);

  pageItems.forEach(p => {
    const tr = document.createElement('tr');
    tr.onclick = function () {
      loadPlayerStats(p.playerId, '${type}', tr);
    };
    tr.innerHTML =
      '<td>' + p.backNumber + '</td>' +
      '<td>' + p.name + '</td>' +
      '<td>' + p.team + '</td>' +
      '<td>' + p.position + '</td>';
    tableBody.insertBefore(tr, chartRow);
  });

  tableBody.appendChild(chartRow);
  tableBody.appendChild(noDataRow);
  chartRow.style.display = 'none';
  noDataRow.style.display = 'none';
  currentOpenPlayerId = null;

  renderSearchPagination(filteredPlayers.length, page);
}

function renderSearchPagination(totalItems, currentPage) {
  pagination.innerHTML = '';
  const totalPages = Math.ceil(totalItems / ITEMS_PER_PAGE);
  if (totalPages <= 1) return;

  if (currentPage > 1) {
    const prev = document.createElement('a');
    prev.href = '#';
    prev.textContent = '이전';
    prev.addEventListener('click', e => {
      e.preventDefault();
      currentSearchPage--;
      renderSearchPage(currentSearchPage);
    });
    pagination.appendChild(prev);
  }

  for (let i = 1; i <= totalPages; i++) {
    if (i === currentPage) {
      const strong = document.createElement('strong');
      strong.textContent = i;
      pagination.appendChild(strong);
    } else {
      const a = document.createElement('a');
      a.href = '#';
      a.textContent = i;
      a.addEventListener('click', e => {
        e.preventDefault();
        currentSearchPage = i;
        renderSearchPage(currentSearchPage);
      });
      pagination.appendChild(a);
    }
  }

  if (currentPage < totalPages) {
    const next = document.createElement('a');
    next.href = '#';
    next.textContent = '다음';
    next.addEventListener('click', e => {
      e.preventDefault();
      currentSearchPage++;
      renderSearchPage(currentSearchPage);
    });
    pagination.appendChild(next);
  }

  pagination.style.display = 'block';
}

document.getElementById('nameSearch').addEventListener('keyup', function () {
	  const searchValue = this.value.trim().toLowerCase();

	  filteredPlayers = allPlayers.filter(function(p) {
	    return p.name.toLowerCase().includes(searchValue);
	  });

	  if (filteredPlayers.length === 0) {
	    [...tableBody.querySelectorAll('tr')].forEach(tr => {
	      if (!tr.id || (tr.id !== 'chartRow' && tr.id !== 'noDataRow')) {
	        tr.remove();
	      }
	    });
	    noDataRow.style.display = '';
	    chartRow.style.display = 'none';
	    pagination.style.display = 'none';
	    tableBody.appendChild(noDataRow);
	    tableBody.appendChild(chartRow);
	    return;
	  }

	  currentSearchPage = 1;
	  renderSearchPage(currentSearchPage);
	});

function applyKeywordToForms() {
  const keyword = document.getElementById('nameSearch').value;
  document.getElementById('hiddenKeyword1').value = keyword;
  document.getElementById('hiddenKeyword2').value = keyword;
}

document.querySelectorAll("form.inline").forEach(form => {
  form.addEventListener("submit", applyKeywordToForms);
});

window.addEventListener('DOMContentLoaded', function () {
  const keyword = document.getElementById('nameSearch').value.trim();
  if (keyword !== '') {
    document.getElementById('nameSearch').dispatchEvent(new Event('keyup'));
  }
});
</script>
  </body>
</html>