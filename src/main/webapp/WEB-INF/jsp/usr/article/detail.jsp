<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link href="https://cdn.jsdelivr.net/gh/projectnoonnu/2411-3@1.0/index.css" rel="stylesheet">
<%@ include file="../common/head.jspf"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!-- FontAwesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">

<!-- Reaction 아이콘 색상 -->
<style>
body {
  font-family: 'Ownglyph_ParkDaHyun', sans-serif;
}
  .like-icon.active { color: #6a71f7; }
  .dislike-icon.active { color: #fa5f81; }
  .comment-row {
    border-bottom: 2px solid #f2d8b1; /* bg-blue-200와 같은 색 */
    padding: 8px 0;
  }
  .btn-back {
  background: none;
  border: none;
  cursor: pointer;
  color: black;
  padding: 4px 10px;
  border-radius: 5px;
  background-color: #f7ecdc;
}

/* 뒤로가기 버튼에 마우스 올리면 테이블 행 호버 색과 같게 */
.btn-back:hover {
background-color: #f2d8b1;
}

  /* input 통일 스타일 */
  input.input {
    width: 90%;
    box-sizing: border-box;
    padding: 6px 10px;
    border: 1px solid #ddd;
    border-radius: 5px;
    background-color: #f7f0e9; /* 배경색 통일 */
    color: black; /* 글자색 통일 */
    outline: none;
  }

  input.input:focus {
    border-color: #f2d8b1; /* 포커스 시 테두리 색상 */
    background-color: #fff; /* 포커스 시 배경색 살짝 밝게 */
  }
</style>

 <body class="m-0" style="background-color: #f7f0e9;">
     <c:choose>
    <c:when test="${rq.loginedTeam == null}">
        <section class="h-screen bg-cover bg-center bg-no-repeat bg-fixed flex flex-col items-center text-black"
                 style="background-image: url('/images/bg12.png'); position: relative; cursor: url('/images/cursor0.png') 25 25, auto;">
    </c:when>
    <c:when test="${rq.loginedTeam eq '한화 이글스'}">
        <section class="h-screen bg-cover bg-center bg-no-repeat bg-fixed flex flex-col items-center text-black"
                 style="background-image: url('/images/bg21.png'); cursor: url('/images/cursor2.png') 25 25, auto; position: relative;">
    </c:when>
    <c:when test="${rq.loginedTeam eq '두산 베어스'}">
        <section class="h-screen bg-cover bg-center bg-no-repeat bg-fixed flex flex-col items-center text-black"
                 style="background-image: url('/images/bg22.png') cursor: url('/images/cursor3.png') 25 25, auto; position: relative;">
    </c:when>
        <c:when test="${rq.loginedTeam eq '롯데 자이언츠'}">
        <section class="h-screen bg-cover bg-center bg-no-repeat bg-fixed flex flex-col items-center text-black"
                 style="background-image: url('/images/bg23.png') cursor: url('/images/cursor4.png') 25 25, auto; position: relative;">
    </c:when>
        <c:when test="${rq.loginedTeam eq 'LG 트윈스'}">
        <section class="h-screen bg-cover bg-center bg-no-repeat bg-fixed flex flex-col items-center text-black"
                 style="background-image: url('/images/bg24.png'); cursor: url('/images/cursor5.png') 25 25, auto;">
    </c:when>
        <c:when test="${rq.loginedTeam eq '삼성 라이온즈'}">
        <section class="h-screen bg-cover bg-center bg-no-repeat bg-fixed flex flex-col items-center text-black"
                 style="background-image: url('/images/bg25.png'); cursor: url('/images/cursor6.png') 25 25, auto; position: relative;">
    </c:when>
        <c:when test="${rq.loginedTeam eq '키움 히어로즈'}">
        <section class="h-screen bg-cover bg-center bg-no-repeat bg-fixed flex flex-col items-center text-black"
                 style="background-image: url('/images/bg26.png'); cursor: url('/images/cursor7.png') 25 25, auto; position: relative;">
    </c:when>
        <c:when test="${rq.loginedTeam eq 'SSG 랜더스'}">
        <section class="h-screen bg-cover bg-center bg-no-repeat bg-fixed flex flex-col items-center text-black"
                 style="background-image: url('/images/bg27.png'); cursor: url('/images/cursor1.png') 25 25, auto; position: relative;">
    </c:when>
        <c:when test="${rq.loginedTeam eq 'NC 다이노스'}">
        <section class="h-screen bg-cover bg-center bg-no-repeat bg-fixed flex flex-col items-center text-black"
         style="background-image: url('/images/bg28.png'); cursor: url('/images/cursor8.png') 25 25, auto; position: relative;" >
    </c:when>
        <c:when test="${rq.loginedTeam eq 'KT 위즈'}">
        <section class="h-screen bg-cover bg-center bg-no-repeat bg-fixed flex flex-col items-center text-black"
                 style="background-image: url('/images/bg29.png'); cursor: url('/images/cursor9.png') 25 25, auto; position: relative;">
    </c:when>
        <c:when test="${rq.loginedTeam eq 'KIA 타이거즈'}">
        <section class="h-screen bg-cover bg-center bg-no-repeat bg-fixed flex flex-col items-center text-white"
                 style="background-image: url('/images/bg30.png'); cursor: url('/images/cursor10.png') 25 25, auto; position: relative;">
    </c:when>
</c:choose>

  <!-- 연한 하늘색 오버레이 -->
  <div class="absolute inset-0" style = "background-color: rgba(247, 246, 245, 0.6);"></div>
  

  <!-- 2-Column 레이아웃 -->
  <div class="relative flex w-full max-w-6xl">

    <!-- 왼쪽: 게시글 정보 -->
    <div class="w-1/2 p-4 flex flex-col">
      <!-- 제목과 작성자만 위쪽에 -->
      <div class="mb-4">
        <div class="text-2xl font-bold mb-1">${article.title}</div>
        <div class="text-sm text-black-600">작성자: ${article.extra__writer}</div>
      </div>

      <!-- 본문 내용 (50% 높이, 스크롤) -->
<div class="flex-1 bg-white rounded-lg shadow p-4 overflow-auto" style="color: black; max-height: 50vh;">
  <c:out value="${article.body}" escapeXml="false" />
</div>

      <!-- 좋아요/싫어요 아이콘만 -->
      <div class="text-center mt-4 space-x-4 text-2xl">
        <a href="javascript:void(0);"
           onclick="doGoodReaction('article', ${param.id}, '${rq.currentUri}')"
           class="like-icon ${userCanReaction == 1 ? 'active' : 'text-gray-400'}">
          <i class="fas fa-thumbs-up"></i>
          ${article.extra__goodReactionPoint}
        </a>
        <a href="javascript:void(0);"
           onclick="doBadReaction('article', ${param.id}, '${rq.currentUri}')"
           class="dislike-icon ${userCanReaction == -1 ? 'active' : 'text-gray-400'}">
          <i class="fas fa-thumbs-down"></i>
          ${-article.extra__badReactionPoint}
        </a>
      </div>

      <!-- 뒤로가기/수정/삭제 버튼 -->
      <div class="btns mt-4">
        <button class="btn-back btn btn-ghost" type="button" onclick="history.back();">뒤로가기</button>
        <c:if test="${article.userCanModify}">
          <a class="btn-back btn btn-ghost" href="../article/modify?id=${article.id}">수정</a>
        </c:if>
        <c:if test="${article.userCanDelete}">
          <a class="btn-back btn btn-ghost" onclick="confirmDeleteAjax(${article.id})">삭제</a>
        </c:if>
      </div>
    </div>

    <!-- 오른쪽: 댓글 영역 -->
    <div class="w-1/2 p-4">
    <div class="text-2xl font-bold mb-1">댓글 목록</div>
      <!-- 댓글 작성 -->
      <c:if test="${LoginedMemberId != 0}">
        <form class="mb-4" action="../comment/doWrite" method="POST" style="color: black;">
          <input type="hidden" name="articleId" value="${param.id}" />
          <input class="input input-sm" required name="body" type="text" placeholder="댓글을 입력하세요" />
          <button class="btn-back btn btn-ghost">등록</button>
        </form>
      </c:if>

      <!-- 댓글 목록 -->
<div style="background-color:white; border-radius: 5px;">
  <c:forEach var="comment" items="${comments}">
    <div class="comment-row flex items-start space-x-2 relative">
      <!-- 왼쪽: 프로필 이미지 -->
      <div class="flex-shrink-0">
        <img src="${comment.extra__writerProfileImgUrl}" class="rounded-full w-10 h-10 object-cover"/>
      </div>

      <!-- 오른쪽: 닉네임 + 내용 -->
      <div class="flex-1">
        <div class="flex items-center space-x-2">
          <span class="text-sm font-semibold">${comment.extra__writer}</span>
        </div>
        <div id="comment-body-${comment.id}" class="text-sm mt-1">${comment.body}</div>
      </div>

      <!-- 좋아요/싫어요 (오른쪽 상단) -->
      <div class="absolute right-0 bottom-0 flex space-x-1 text-xs text-gray-400">
        <a href="javascript:void(0);"
           onclick="doGoodReaction('comment', ${comment.id}, '${rq.currentUri}')"
           class="like-icon ${comment.usercommentCanReaction == 1 ? 'active' : 'text-gray-400'}">
          <i class="fas fa-thumbs-up"></i> ${comment.extra__goodReactionPoint}
        </a>
        <a href="javascript:void(0);"
           onclick="doBadReaction('comment', ${comment.id}, '${rq.currentUri}')"
           class="dislike-icon ${comment.usercommentCanReaction == -1 ? 'active' : 'text-gray-400'}">
          <i class="fas fa-thumbs-down"></i> ${-comment.extra__badReactionPoint}
        </a>
      </div>

      <!-- 수정/삭제 버튼 (본인 댓글만) -->
      <c:if test="${comment.memberId == LoginedMemberId}">
        <div class="flex space-x-1 ml-2">
          <a class="btn-back btn btn-ghost btn-xs" href="../comment/doDelete?id=${comment.id}">삭제</a>
          <a style="margin-right: 10px;" id="editBtn-${comment.id}" class="btn-back btn btn-ghost btn-xs" href="javascript:void(0);">수정</a>
        </div>
      </c:if>
    </div>

    <!-- 댓글 수정 폼 (숨김) -->
    <form id="editForm-${comment.id}" class="mt-2 hidden flex space-x-2" action="../comment/doModify" method="POST">
      <input type="hidden" name="id" value="${comment.id}" />
      <input class="input input-info input-sm" style="width: 80%;" required name="body" type="text" value="${comment.body}" />
      <button class="btn-back btn btn-ghost btn-xs" type="submit">수정</button>
    </form>

    <script>
      document.getElementById("editBtn-${comment.id}")?.addEventListener("click", () => {
        document.getElementById("editBtn-${comment.id}").style.display = "none";
        document.getElementById("editForm-${comment.id}").style.display = "flex";
      });
    </script>
  </c:forEach>

  <c:if test="${empty comments}">
    <div class="text-center text-gray-500 italic p-2">댓글이 없습니다</div>
  </c:if>
</div>
    </div>
  </div>
</section>

<!-- JavaScript: 댓글 수정 토글 & 좋아요/싫어요 -->
<script>
  const editBtn = document.getElementById('editBtn');
  const editForm = document.getElementById('editForm');

  editBtn.addEventListener('click', () => {
    editBtn.style.display = 'none';  // 수정 버튼 숨기기
    editForm.style.display = 'block'; // 폼 보이기
  });

  function doGoodReaction(relTypeCode, relId, replaceUri) {
    $.ajax({
      url: '/usr/reactionPoint/doGoodReaction',
      type: 'POST',
      dataType: 'json',
      data: { relTypeCode, relId, replaceUri },
      success: function(response) {
        if (response.replaceUri) {
          window.location.href = response.replaceUri;
        }
      },
      error: function() {
        alert('로그인 후 이용하세요!');
        location.replace('/usr/member/login');
      }
    });
  }

  function doBadReaction(relTypeCode, relId, replaceUri) {
    $.ajax({
      url: '/usr/reactionPoint/doBadReaction',
      type: 'POST',
      dataType: 'json',
      data: { relTypeCode, relId, replaceUri },
      success: function(response) {
        if (response.replaceUri) {
          window.location.href = response.replaceUri;
        }
      },
      error: function() {
        alert('로그인 후 이용하세요!');
        location.replace('/usr/member/login');
      }
    });
  }
  
  function confirmDeleteAjax(articleId) {
	  if (!confirm("정말 삭제하시겠습니까?")) {
	    return;
	  }

	  $.ajax({
	    url: '/usr/article/doDelete',
	    method: 'POST',
	    data: { id: articleId },
	    success: function(response) {
	      location.replace('/usr/article/list');
	    },
	    error: function() {
	      alert("삭제 중 오류가 발생했습니다.");
	    }
	  });
	}
</script>

<%@ include file="../common/foot.jspf"%>
</body>