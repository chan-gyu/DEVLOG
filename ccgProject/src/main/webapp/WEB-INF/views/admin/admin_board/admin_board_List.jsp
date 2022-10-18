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
			<h1>관리자페이지</h1>
			<div id="posts">
			</div>
			<div id="side_menu">
			</div>
		</div>
	</div>
</div>

<script>
$(function(){
	let categoryName=null;
	$.ajax({
		url:"${path}/admin/admin_board_List.do",
		type:"POST",
		data:{categoryName:categoryName},
		success: function(data){
			var Categorylist = data.Categorylist;
			var Boardlist = data.Boardlist;
			var Datelist = data.Datelist;
			
			//side_menu
			var side_menu="<p style='color:pink;'>게시판 목록</p>";
			side_menu+="<p><a href='#' onClick='top.location=\"javascript:location.reload()\"'>All</a></p>"
			$.each(Categorylist,(index,obj)=>{
				side_menu+="<p><a href=# onClick='CategoryAjax(\""+obj.categoryName+"\")'>"+obj.categoryName+"("+obj.cnt+")</a></p>";
			});
			$("#side_menu").html(side_menu);
			
			
			//posts
			var posts="<table id='board_table'>";
			$.each(Boardlist, (index,obj)=>{
				posts+="<tr>";
				posts+="<td>";
				posts+="<a href='${path}/board/Board_View.do?boardIdx="+obj.boardIdx+"'>";
				posts+="<p>"+Datelist[index]+"</p>";
				posts+="<h1>"+obj.boardTitle+"</h1>";
				posts+="<p>"+obj.writer+"</p>";
				posts+="</a>";
				posts+="</td>";
				posts+="</tr>";
				
			});
			
			$("#posts").html(posts);
			
		},	
		error:function(){
			console.log("error");
		}
	});
});

function CategoryAjax(categoryName){
	$.ajax({
		url:"${path}/admin/admin_board_List.do",
		type:"POST",
		data:{categoryName:categoryName},
		success: function(data){
			var Categorylist = data.Categorylist;
			var Boardlist = data.Boardlist;
			var Datelist = data.Datelist;
			
			//side_menu
			var side_menu="<p style='color:pink;'>게시판 목록</p>";
			side_menu+="<p><a href='#' onClick='top.location=\"javascript:location.reload()\"'>All</a></p>"
			$.each(Categorylist,(index,obj)=>{
				side_menu+="<p><a href=# onClick='CategoryAjax(\""+obj.categoryName+"\")'>"+obj.categoryName+"("+obj.cnt+")</a></p>";
			});
			$("#side_menu").html(side_menu);
			
			
			//posts
			var posts="<table id='board_table'>";
			$.each(Boardlist, (index,obj)=>{
				posts+="<tr>";
				posts+="<td>"
				posts+="<a href='${path}/board/Board_View.do?boardIdx="+obj.boardIdx+"'>";
				posts+="<p>"+Datelist[index]+"</p>";
				posts+="<h1>"+obj.boardTitle+"</h1>";
				posts+="<p>"+obj.writer+"</p>";
				posts+="</a>";
				posts+="</td>";
				posts+="</tr>";
				
			});
			
			$("#posts").html(posts);
			
		},	
		error:function(){
			console.log("error");
		}
	});
}
</script>

<jsp:include page="/WEB-INF/views/admin/admin_footer.jsp"/>