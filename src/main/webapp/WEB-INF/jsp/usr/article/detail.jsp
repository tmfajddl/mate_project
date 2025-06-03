<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="../common/head.jspf"%>

<!-- FontAwesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">

<!-- Reaction 아이콘 색상 -->
<style>
  .like-icon.active { color: #6a71f7; }
  .dislike-icon.active { color: #fa5f81; }
  .comment-row {
    border-bottom: 2px solid #bfdbfe; /* bg-blue-200와 같은 색 */
    padding: 8px 0;
  }
  .btn-back {
  background: none;
  border: none;
  cursor: pointer;
  color: black;
  padding: 4px 10px;
  border-radius: 5px;
  background-color: #82c3f5;
}

/* 뒤로가기 버튼에 마우스 올리면 테이블 행 호버 색과 같게 */
.btn-back:hover {
background-color: #4a90e2;
}

 form input.input {
    width: 90%;
    box-sizing: border-box;
  }
</style>

<body class="m-0 h-full font-sans">

<!-- Hero Section: 배경 이미지 + 연한 하늘색 오버레이 -->
<section class="h-screen bg-cover bg-center bg-no-repeat bg-fixed relative flex items-start justify-center p-8"
         style="background-image: url('/images/bg.jpg');">

  <!-- 연한 하늘색 오버레이 -->
  <div class="absolute inset-0 bg-blue-100 bg-opacity-70"></div>

  <!-- 2-Column 레이아웃 -->
  <div class="relative flex w-full max-w-6xl">

    <!-- 왼쪽: 게시글 정보 -->
    <div class="w-1/2 p-4 flex flex-col">
      <!-- 제목과 작성자만 위쪽에 -->
      <div class="mb-4">
        <div class="text-2xl font-bold mb-1">${article.title}</div>
        <div class="text-sm text-gray-600">작성자: ${article.extra__writer}</div>
      </div>

      <!-- 본문 내용 (50% 높이, 스크롤) -->
      <div class="flex-1 bg-white bg-opacity-50 rounded-lg shadow p-4 overflow-auto" style="max-height: 50vh;">
        ${article.body}
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
          <a class="btn-back btn btn-ghost" href="../article/doDelete?id=${article.id}">삭제</a>
        </c:if>
      </div>
    </div>

    <!-- 오른쪽: 댓글 영역 -->
    <div class="w-1/2 p-4">
    <div class="text-2xl font-bold mb-1">댓글 목록</div>
      <!-- 댓글 작성 -->
      <c:if test="${LoginedMemberId != 0}">
        <form class="mb-4" action="../comment/doWrite" method="POST">
          <input type="hidden" name="articleId" value="${param.id}" />
          <input class="input input-info input-sm" required name="body" type="text" placeholder="댓글을 입력하세요" />
          <button class="btn-back btn btn-ghost">등록</button>
        </form>
      </c:if>

      <!-- 댓글 목록 -->
<div>
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
      <div class="absolute right-0 top-0 flex space-x-1 text-xs text-gray-400">
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
          <a id="editBtn-${comment.id}" class="btn-back btn btn-ghost btn-xs" href="javascript:void(0);">수정</a>
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
</script>

<%@ include file="../common/foot.jspf"%>
</body>