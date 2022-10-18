<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  
<jsp:include page="/WEB-INF/views/admin/admin_header.jsp">
	<jsp:param value="관리자페이지" name="title"/>
</jsp:include>


<div class="col">
    <div id="content-wrapper" style="width:100%;">
		<h1 id="view_title">User List</h1>
		<div id="userList_Post" class="table-responsive">
			<table class="table table-primary table-sm caption-top">
				<tr class="table-primary" style="border-bottom:2px solid black;">
					<th scope="col">이름</th>
					<th scope="col">닉네임</th>
					<th scope="col">아이디</th>
					<th scope="col">이메일</th>
					<th scope="col">주소</th>
					<th scope="col">전화번호</th>
				</tr>
				<c:choose>
					<c:when test="${not empty list }">
						<c:forEach var="l" items="${list }">
						<tr>
							<td><c:out value="${l.username }"/></td>
							<td><c:out value="${l.nickname }"/></td>
							<td><c:out value="${l.userid }"/></td>
							<td><c:out value="${l.email }"/></td>
							<td><c:out value="${l.address }"/></td>
							<td><c:out value="${l.phone }"/></td>
						</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
	                   		<td colspan="6">조회된 유저가 없습니다</td>
	                   </tr>
					</c:otherwise>
				</c:choose>
			</table>
		</div>
	</div>
</div>

<jsp:include page="/WEB-INF/views/admin/admin_footer.jsp"/>