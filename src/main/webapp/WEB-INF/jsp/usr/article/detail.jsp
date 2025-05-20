<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="pageTitle" value="ARTICLE DETAIL"></c:set>
<%@ include file="../common/head.jspf"%>

<!-- 폰트어썸 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">
<style>
.btn-like.active i {
  color: #6a71f7;
}

.btn-dislike.active i {
  color: #fa5f81; 
}</style>
<section class="mt-8 text-xl px-4">
	<div class="mx-auto">
		<table class="table" border="1" cellspacing="0" cellpadding="5" style="width: 100%; border-collapse: collapse;">
			<tbody>
				<tr>
					<th style="text-align: center;">ID</th>
					<td style="text-align: center;">${article.id}</td>
				</tr>
				<tr>
					<th style="text-align: center;">Registration Date</th>
					<td style="text-align: center;">${article.regDate}</td>
				</tr>
				<tr>
					<th style="text-align: center;">Update Date</th>
					<td style="text-align: center;">${article.updateDate}</td>
				</tr>
				<tr>
					<th style="text-align: center;">Writer</th>
					<td style="text-align: center;">${article.extra__writer }</td>
				</tr>
				<tr>
					<th style="text-align: center;">BoardId</th>
					<td style="text-align: center;">${article.boardId }</td>
				</tr>

				<tr>
					<th style="text-align: center;">SUM</th>
					<td style="text-align: center;">${updatedLikeCount-updatedDislikeCount}</td>
				</tr>
				<tr>
					<th style="text-align: center;">Title</th>
					<td style="text-align: center;">${article.title }</td>
				</tr>
				<tr>
					<th style="text-align: center;">Body</th>
					<td style="text-align: center;">${article.body }</td>
				</tr>
				<tr>
					<th style="text-align: center;">view</th>
					<td style="text-align: center;">${article.view}</td>
				</tr>
			</tbody>
		</table>
<div style="text-align: center;">
  <a href="javascript:void(0);"
     onclick="doGoodReaction('article', ${param.id}, '${rq.currentUri}')"
     class="btn ${userCanReaction == 1 ? 'btn-success' : 'btn-outline btn-success'}">
    👍${article.extra__goodReactionPoint}
  </a>

  <a href="javascript:void(0);"
     onclick="doBadReaction('article', ${param.id}, '${rq.currentUri}')"
     class="btn ${userCanReaction == -1 ? 'btn-error' : 'btn-outline btn-error'}">
    👎${-article.extra__badReactionPoint}
  </a>
</div>
</div>
		
		<div class="btns">
			<button class="btn btn-ghost" type="button" onclick="history.back();">뒤로가기</button>
			<c:if test="${article.userCanModify }">
				<a class="btn btn-ghost" href="../article/modify?id=${article.id}">수정</a>
			</c:if>
			<c:if test="${article.userCanDelete }">
				<a class="btn btn-ghost" href="../article/doDelete?id=${article.id}">삭제</a>
			</c:if>
		</div>
	</div>
</section>


			 <c:if test="${LoginedMemberId != 0}">
			 <form style="text-align: center;" action="../comment/doWrite" method="POST">
					<span style="text-align: center;">게시물번호<span>
					<input class="input input-primary input-sm" required="required" name="articleId" type="text" autocomplete="off"
							value="${param.id}" readonly/>
					<span style="text-align: center;">내용</span>
						<input class="input input-primary input-sm" required="required" name="body" type="text" autocomplete="off"
								placeholder="내용" />
						<button class="btn">댓글작성</button>
		</form>
        </c:if>



<table class="table" border="1" cellspacing="0" cellpadding="5" style="width: 100%; border-collapse: collapse;">
  <thead>
    <tr>
      <th colspan="4" style="text-align: center; font-weight: bold; padding: 10px;">
        댓글목록
      </th>
    </tr>
    <tr>
      <th style="text-align: center;">작성자</th>
      <th style="text-align: center;">작성일</th>
      <th style="text-align: center;">내용</th>
      <th style="text-align: center;">LIKE</th>
      <c:if test="${comment.memberId==LoginedMemberId}">
      <th>삭제</th>
      <th>수정</th>
      </c:if>
    </tr>
  </thead>
  <tbody>
    <c:forEach var="comment" items="${comments}">
      <tr style="cursor: default;">
        <td style="text-align: center;">${comment.extra__writer}</td>
        <td style="text-align: center;">${comment.regDate}</td>
        <td style="text-align: center;">${comment.body}</td>
        <td style="text-align: center;">
          <a href="javascript:void(0);"
     onclick="doGoodReaction('comment', ${comment.id}, '${rq.currentUri}')"
     class="btn ${comment.usercommentCanReaction == 1 ? 'btn-success' : 'btn-outline btn-success'}">
    👍${comment.extra__goodReactionPoint}
  </a>

  <a href="javascript:void(0);"
     onclick="doBadReaction('comment', ${comment.id}, '${rq.currentUri}')"
     class="btn ${comment.usercommentCanReaction == 1 ? 'btn-error' : 'btn-outline btn-error'}">
    👎${-comment.extra__badReactionPoint}
  </a>
        </td>
        <c:if test="${comment.memberId==LoginedMemberId}">
        <td><a class="btn btn-ghost" href="../comment/doDelete?id=${comment.id}">삭제</a></td>
        </c:if>
        <c:if test="${comment.memberId==LoginedMemberId}">
<td>
  <a id="editBtn" class="btn btn-ghost" href="javascript:void(0);">수정</a>

  <form id="editForm" style="text-align: center; display: none;" action="../comment/doModify" method="POST">
    <span style="text-align: center;">댓글번호</span>
    <input class="input input-primary input-sm" required="required" name="id" type="text" autocomplete="off"
           value="${comment.id}" readonly/>
    <span style="text-align: center;">내용</span>
    <input class="input input-primary input-sm" required="required" name="body" type="text" autocomplete="off"
           value="${comment.body}" />
    <button class="btn">댓글수정</button>
  </form>
</td>
        </c:if>
      </tr>
    </c:forEach>

    <c:if test="${empty comments}">
      <tr>
        <td colspan="4" style="text-align: center; padding: 15px; font-style: italic; color: #999;">
          댓글이 없습니다
        </td>
      </tr>
    </c:if>
  </tbody>
</table>


<script>
  const editBtn = document.getElementById('editBtn');
  const editForm = document.getElementById('editForm');

  editBtn.addEventListener('click', () => {
    editBtn.style.display = 'none';  // 수정 버튼 숨기기
    editForm.style.display = 'block'; // 폼 보이기
  });
</script>

<script>
function doGoodReaction(relTypeCode, relId, replaceUri) {
	  $.ajax({
	    url: '/usr/reactionPoint/doGoodReaction',
	    type: 'POST',
	    dataType: 'json',
	    data: { relTypeCode, relId, replaceUri },
	    success: function(response) {
	      if(response.replaceUri) {
	        window.location.href = response.replaceUri;
	      }
	    },
	    error: function(xhr, status, error) {
	    	alert('로그인 후 이용');
	    	location.replace('/usr/member/login');
	    }
	  });
	}

	function doBadReaction(relTypeCode, relId, replaceUri) {  // 함수명 변경!!
	  $.ajax({
	    url: '/usr/reactionPoint/doBadReaction',
	    type: 'POST',
	    dataType: 'json',
	    data: { relTypeCode, relId, replaceUri },
	    success: function(response) {
	      if(response.replaceUri) {
	        window.location.href = response.replaceUri;
	      }
	    },
	    error: function(xhr, status, error) {
	      alert('로그인 후 이용');
	      location.replace('/usr/member/login');
	    }
	  });
	}</script>
	
	<script>
function doCommentGoodReaction(relTypeCode, relId, replaceUri) {
	  $.ajax({
	    url: '/usr/reactionPoint/doCommentGoodReaction',
	    type: 'POST',
	    dataType: 'json',
	    data: { relTypeCode, relId, replaceUri },
	    success: function(response) {
	      if(response.replaceUri) {
	        window.location.href = response.replaceUri;
	      }
	    },
	    error: function(xhr, status, error) {
	    	alert('로그인 후 이용');
	    	location.replace('/usr/member/login');
	    }
	  });
	}

	function doCommentBadReaction(relTypeCode, relId, replaceUri) {  // 함수명 변경!!
	  $.ajax({
	    url: '/usr/reactionPoint/doCommentBadReaction',
	    type: 'POST',
	    dataType: 'json',
	    data: { relTypeCode, relId, replaceUri },
	    success: function(response) {
	      if(response.replaceUri) {
	        window.location.href = response.replaceUri;
	      }
	    },
	    error: function(xhr, status, error) {
	      alert('로그인 후 이용');
	      location.replace('/usr/member/login');
	    }
	  });
	}</script>



<%@ include file="../common/foot.jspf"%>