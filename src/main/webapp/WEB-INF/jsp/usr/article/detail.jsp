<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="pageTitle" value="ARTICLE DETAIL"></c:set>
<%@ include file="../common/head.jspf"%>

<!-- 폰트어썸 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">



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
				<span class="inline-block">
  <button onclick="doUpLike(${article.id})" >
    <i class="text-4xl fa-solid fa-thumbs-up"></i>
  </button>
  <div class="text-sm" id="like-count-${article.id}">
    ${updatedLikeCount}
  </div>
</span>

		<span class="inline-block">
  <button onclick="doDownLike(${article.id})">
    <i class="text-4xl fa-solid fa-thumbs-down"></i></i>
  </button>
  <div class="text-sm" id="dislike-count-${article.id}">
    ${updatedDislikeCount}
  </div>
</span>
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
        <c:if test="${comment.memberId==LoginedMemberId}">
        <td><a class="btn btn-ghost" href="../comment/doDelete?id=${comment.id}">삭제</a></td>
        </c:if>
        <c:if test="${comment.memberId==LoginedMemberId}">
        <td><a class="btn btn-ghost" href="../comment/modify?articleId=${article.id}&id=${comment.id}">수정</a></td>
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
function doUpLike(articleId) {
	  $.ajax({
	    url: "/usr/article/upLike",
	    method: "POST",
	    data: { id: articleId },
	    success: function(res) {
	      if (res.resultCode.startsWith("S-")) {
	        alert(res.msg);
	        $("#like-count-" + articleId).text(res.data1);
	      } else {
	        alert(res.msg);
	      }
	    },
	    error: function() {
	      alert("서버 오류 발생");
	    }
	  });
	}

	function doDownLike(articleId) {
	  $.ajax({
	    url: "/usr/article/downLike",
	    method: "POST",
	    data: { id: articleId },
	    success: function(res) {
	      if (res.resultCode.startsWith("S-")) {
	        alert(res.msg);
	        $("#dislike-count-" + articleId).text(res.data1);
	      } else {
	        alert(res.msg);
	      }
	    },
	    error: function() {
	      alert("서버 통신 오류가 발생했습니다.");
	    }
	  });
	}
</script>



<%@ include file="../common/foot.jspf"%>