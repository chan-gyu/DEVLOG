<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/WEB-INF/views/admin/admin_header.jsp">
	<jsp:param value="관리자 게시글 상세보기" name="title"/>
</jsp:include>
	<div id="content-wrapper" style="width:70%; margin-left:6.5%;">
		<div class="col">
		    <div id="content-warpper" style="width:100%;">
		    	<div id="admin_board_btn">
		    		<button  type="button" class="btn btn-warning" id="board_update_btn" onClick="location.href='${path}/admin/board_update_page.do?boardIdx=${board.boardIdx }'">게시물 수정</button>
		    		<button  type="button" class="btn btn-warning" id="board_delete_btn" onClick="board_delete('${board.boardIdx}')">게시물 삭제</button>
	    		</div>
				<div id="view_posts">
					<h3><c:out value="${formatDate }"/></h3><br/>
					<h3 style="text-align:left; color:#f0506e;">[<c:out value="${board.categoryName }"/>]</h3>
					<h1 id="view_posts_title"><c:out value="${board.boardTitle }"/></h1>
					<h3 style="text-align:right;"><c:out value="${board.writer }"/></h3>
				</div>
				
				<div id="view_posts_content">
					${board.boardContent }
				</div>
				<div id="file" style="border-top: 1px solid white; margin-top:5%; padding-top:2%;">
					<p>첨부파일</p>
				</div>
			</div>
		</div>
	</div>
<script>
function board_delete(boardIdx){
	if(confirm(boardIdx+'번 게시물을 삭제하시겠습니까?')){
		//true
		location.href="${path}/admin/board_delete.do?boardIdx="+boardIdx;
	}
}
</script>
<jsp:include page="/WEB-INF/views/admin/admin_footer.jsp"/>