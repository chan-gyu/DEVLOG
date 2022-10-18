<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/WEB-INF/views/admin/admin_header.jsp">
	<jsp:param value="관리자페이지" name="title"/>
</jsp:include>

<div id="content-wrapper" style="width:80%;">
	<div class="col">
	    <div id="content-warpper" style="width:100%;">
			<br>
			<h1>게시판 상세보기</h1>
			<div id="View_posts">
				<h1><c:out value="${board.boardTitle }"/></h1>
				${board.boardContent }
			</div>
		</div>
	</div>
</div>


<jsp:include page="/WEB-INF/views/admin/admin_footer.jsp"/>