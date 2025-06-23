<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>KBO 선수 목록</title>
    <style>
    body {
        font-family: 'Segoe UI', sans-serif;
        padding: 20px;
    }

    h1 {
        color: #333;
        margin-bottom: 20px;
    }

    table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 10px;
        background-color: #fff;
        border-radius: 8px;
        overflow: hidden;
        box-shadow: 0 2px 6px rgba(0,0,0,0.1);
    }

    th, td {
        border-bottom: 1px solid #ddd;
        padding: 10px 12px;
        text-align: center;
    }

    tr:hover:not(#chartRow):not(#noDataRow) {
        background-color: #f5f5f5;
        cursor: pointer;
    }

    form.inline {
        display: inline;
        margin-right: 10px;
    }

    .btn {
        padding: 8px 14px;
        margin-right: 6px;
        background-color: #f0f0f0;
        border: 1px solid #aaa;
        border-radius: 6px;
        cursor: pointer;
        transition: all 0.2s;
    }

    .btn:hover {
        background-color: #ddd;
    }

    .btn.active {
        background-color: #007BFF;
        color: white;
        border-color: #0056b3;
        font-weight: bold;
    }

    .pagination {
        margin-top: 20px;
        text-align: center;
    }

    .pagination a, .pagination strong {
        margin: 0 5px;
        font-size: 16px;
    }

    #nameSearch {
        margin: 15px 0;
        padding: 8px 12px;
        border-radius: 4px;
        border: 1px solid #ccc;
        width: 200px;
    }

    #chartRow {
        background-color: #fafafa;
        transition: all 0.3s;
    }

    #noDataRow {
        color: red;
        font-weight: bold;
    }
</style>
</head>
<body>

    <h1>KBO 선수 목록</h1>

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
<form method="get" action="/usr/home/test" class="inline">
    <input type="hidden" name="teamIndex" value="${teamIndex}" />
    <input type="hidden" name="type" value="타자" />
    <input type="hidden" name="page" value="1" />
    <input type="hidden" name="keyword" id="hiddenKeyword1" />
    <button type="submit" class="btn ${type == '타자' ? 'active' : ''}">타자</button>
</form>

<!-- 투수 버튼 -->
<form method="get" action="/usr/home/test" class="inline">
    <input type="hidden" name="teamIndex" value="${teamIndex}" />
    <input type="hidden" name="type" value="투수" />
    <input type="hidden" name="page" value="1" />
    <input type="hidden" name="keyword" id="hiddenKeyword2" />
    <button type="submit" class="btn ${type == '투수' ? 'active' : ''}">투수</button>
</form>

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
                    <canvas id="playerChart" height="100"></canvas>
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
            <a href="/usr/home/test?teamIndex=${teamIndex}&type=${type}&page=${startPage - 1}">이전</a>
        </c:if>

        <c:forEach var="i" begin="${startPage}" end="${endPage}">
            <c:choose>
                <c:when test="${i == page}">
                    <strong>${i}</strong>
                </c:when>
                <c:otherwise>
                    <a href="/usr/home/test?teamIndex=${teamIndex}&type=${type}&page=${i}">${i}</a>
                </c:otherwise>
            </c:choose>
        </c:forEach>

        <c:if test="${endPage < totalPages}">
            <a href="/usr/home/test?teamIndex=${teamIndex}&type=${type}&page=${endPage + 1}">다음</a>
        </c:if>
    </div>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script>
  const allPlayers = ${allPlayersJson};
</script>

<script>
let chartInstance = null;
let currentOpenPlayerId = null;
let filteredPlayers = [];
let currentSearchPage = 1;
const ITEMS_PER_PAGE = 20;

const tableBody = document.getElementById('playerTableBody');
const pagination = document.querySelector('.pagination');
const chartRow = document.getElementById('chartRow');
const noDataRow = document.getElementById('noDataRow');

function loadPlayerStats(playerId, type, rowElement) {
  if (currentOpenPlayerId === playerId) {
    chartRow.style.display = 'none';
    noDataRow.style.display = 'none';
    currentOpenPlayerId = null;
    return;
  }

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
          responsive: true,
          plugins: {
        	  legend: {
        		  display: true,
        		  onClick: (e, legendItem, legend) => {
        		    const ci = legend.chart;
        		    const index = legendItem.datasetIndex;
        		    
        		    // 기존 hidden 토글 대신 안정적인 메서드 사용
        		    const isVisible = ci.isDatasetVisible(index);
        		    ci.setDatasetVisibility(index, !isVisible);
        		    
        		    // 스케일 재계산 함수
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
            y: {
              position: 'left',
              title: { display: true },
              beginAtZero: false
            },
            y1: {
              position: 'right',
              grid: { drawOnChartArea: false },
              title: { display: true},
              beginAtZero: false
            }
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

