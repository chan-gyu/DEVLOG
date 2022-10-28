<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="게시판 뷰" name="title"/>
</jsp:include>

<div id="content-wrapper" style="width:70%; margin-left:15%;">
	<div class="col">
	    <div id="content-warpper" style="width:100%;">
			<div id="view_posts">
				<h3><c:out value="${formatDate }"/></h3><br/>
				<h3 style="text-align:left;">[<c:out value="${board.categoryName }"/>]</h3>
				<h1 id="view_posts_title"><c:out value="${board.boardTitle }"/></h1>
				<h3 style="text-align:right;"><c:out value="${board.writer }"/></h3>
			</div>
			
			<div id="view_posts_content">
				${board.boardContent }
			</div>
		</div>
	</div>
</div>


<jsp:include page="/WEB-INF/views/common/footer.jsp"/>