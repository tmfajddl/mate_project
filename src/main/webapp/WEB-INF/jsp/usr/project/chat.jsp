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

  <!-- 2-Column 레이아웃 (댓글 왼쪽, 본문 오른쪽으로 순서 변경) -->
  <div class="relative flex w-full max-w-6xl">

    <!-- 왼쪽: 댓글 영역 -->
    <div class="w-1/2 p-4">
      <div class="text-2xl font-bold mb-1">댓글 목록</div>

      <!-- 댓글 목록 -->
      <div>
        <c:forEach var="comment" items="${comments}">
          <div class="comment-row flex justify-between items-center">
            <div class="text-sm font-semibold">${comment.extra__writer}</div>
            <div id="comment-body-${comment.id}" class="flex-1 px-4">${comment.body}</div>

            <!-- 수정/삭제 버튼 (본인 댓글만) -->
              <div class="flex space-x-1 ml-2">
                <a class="btn-back btn btn-ghost btn-xs" href="../comment/doDelete?id=${comment.id}">삭제</a>
              </div>
          </div>
        </c:forEach>

        <c:if test="${empty comments}">
          <div class="text-center text-gray-500 italic p-2">채팅이 없습니다</div>
        </c:if>
      </div>
    </div>

    <!-- 오른쪽: 게시글 정보 -->
    <div class="w-1/2 p-4 flex flex-col">
      <!-- 제목과 작성자 -->
      <div class="mb-4">
        <div class="text-2xl font-bold mb-1">닉네임</div>
      </div>

<!-- 본문 내용 (50% 높이 고정) -->
<div class="flex-1 bg-white bg-opacity-50 rounded-lg shadow p-4 overflow-auto"
     style="height: 50%;">
</div>




            <!-- 채팅 작성 -->
      <c:if test="${LoginedMemberId != 0}">
        <form class="mb-4" action="../comment/doWrite" method="POST">
          <input type="hidden" name="articleId" value="${param.id}" />
          <input class="input input-info input-sm" required name="body" type="text" placeholder="댓글을 입력하세요" />
          <button class="btn-back btn btn-ghost">등록</button>
        </form>
      </c:if>
    </div>
  </div>
  
</section>

<%@ include file="../common/foot.jspf"%>
</body>