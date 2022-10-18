<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:include page="/WEB-INF/views/admin/admin_header.jsp">
	<jsp:param value="관리자페이지" name="title"/>
</jsp:include>


		<div class="col">
		    <div id="content-warpper" style="width:100%;">
				<br>
				<h1>관리자페이지</h1>
				<div id="posts">
					<p style="color:pink;">태그</p>
					<p><a href="#">""</a></p>
					<p><a href="#">JavaScript</a></p>
					<p><a href="#">spring</a></p>
					<p><a href="#">DB</a></p>
					<p style="color:pink;">일상</p>
					<p><a href="#">알고리즘</a></p>
					<p><a href="#">코테</a></p>
		
				</div>
				<div id="side_menu">
					<p style="color:pink;">태그</p>
					<p><a href="#">Java</a></p>
					<p><a href="#">JavaScript</a></p>
					<p><a href="#">Spring</a></p>
					<p><a href="#">DB</a></p>
					<p style="color:pink;">일상</p>
					<p><a href="#">알고리즘</a></p>
					<p><a href="#">코테</a></p>
				</div>
			</div>
		</div>

<jsp:include page="/WEB-INF/views/admin/admin_footer.jsp"/>