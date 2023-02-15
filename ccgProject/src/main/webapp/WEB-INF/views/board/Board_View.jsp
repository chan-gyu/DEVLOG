<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="게시판 뷰" name="title"/>
</jsp:include>
<div id="Main-Wrapper">
	<div id="content-wrapper" style="width:70%; ">
		<div class="col">
		    <div id="content-warpper" style="width:100%;">
				<div id="view_posts">
					<div id="view_date_div">
						<h3><c:out value="${formatDate }"/></h3>
						<c:if test="${not empty formatUpdateDate }">
							<h5 id="updateDate">(<c:out value="${formatUpdateDate }"/> 수정됨)</h5>
						</c:if>
					</div>
					<br/>
					<h3 style="text-align:left;">[<c:out value="${board.categoryName }"/>]</h3>
					<h1 id="view_posts_title"><c:out value="${board.boardTitle }"/></h1>
					<h3 style="text-align:right;"><c:out value="${board.writer }"/></h3>
				</div>
				
				<div id="view_posts_content">
					${board.boardContent }
				</div>
				<hr/>
				<c:choose>
					<c:when test="${not empty board.fileList }">
						<p style="display:flex;">[첨부 파일]</p>
						<c:forEach var="l" items="${board.fileList }">
							<a class="a_downFile" href="${path }/board/downloadBoardFile.do?tidx=${l.tidx}&boardIdx=${l.boardIdx}"><c:out value="${l.originalFileName }(${l.fileSize }KB)"/></a><br/>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<p>첨부된 파일이 없습니다.</p>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</div>
</div>


<jsp:include page="/WEB-INF/views/common/footer.jsp"/>