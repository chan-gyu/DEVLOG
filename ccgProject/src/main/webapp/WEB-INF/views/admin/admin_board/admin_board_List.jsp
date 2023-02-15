<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/WEB-INF/views/admin/admin_header.jsp">
	<jsp:param value="관리자 게시글 리스트" name="title"/>
</jsp:include>

<div id="content-wrapper" style="width:80%;">
	<div class="col">
	    <div id="content-warpper" style="width:100%;">
			<br>
			<h1>관리자 게시글 페이지</h1>
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
			var totalData = data.totalData;
			var pageBar = data.pageBar;
			
			//side_menu
			var side_menu="<p style='color:pink;'>게시판 목록</p>";
			side_menu+="<p><a href='#' onClick='top.location=\"javascript:location.reload()\"'>All</a></p>"
			$.each(Categorylist,(index,obj)=>{
				side_menu+="<p><a href=# onClick='CategoryAjax(\""+obj.categoryName+"\")'>"+obj.categoryName+"("+obj.cnt+")</a></p>";
			});
			$("#side_menu").html(side_menu);
			
			
			//posts
			var posts="<div>";
			$.each(Boardlist, (index,obj)=>{
				posts+="<div id='post_board_list'>"
				posts+="<a href='${path}/board/Board_View.do?boardIdx="+obj.boardIdx+"'>";
				posts+="<p id='board_list_date'>"+Datelist[index]+"</p>";
				posts+="<h1>"+obj.boardTitle+"</h1>";
				posts+="<p id='board_list_writer'>"+obj.writer+"</p>";
				posts+="</a>";
				posts+="</div>"
				
			});
			posts+="<div id='pagebar-container'>";
			posts+=pageBar;
			posts+="</div>";
			posts+="</div>";
			
			posts+="</div>";
			
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
			var totalData = data.totalData;
			var pageBar = data.pageBar;
			
			//side_menu
			var side_menu="<p style='color:pink;'>게시판 목록</p>";
			side_menu+="<p><a href='#' onClick='top.location=\"javascript:location.reload()\"'>All</a></p>"
			$.each(Categorylist,(index,obj)=>{
				side_menu+="<p><a href=# onClick='CategoryAjax(\""+obj.categoryName+"\")'>"+obj.categoryName+"("+obj.cnt+")</a></p>";
			});
			$("#side_menu").html(side_menu);
			
			
			//posts
			var posts="<div>";
			$.each(Boardlist, (index,obj)=>{
				posts+="<div id='post_board_list'>"
				posts+="<a href='${path}/board/Board_View.do?boardIdx="+obj.boardIdx+"'>";
				posts+="<p id='board_list_date'>"+Datelist[index]+"</p>";
				posts+="<h1>"+obj.boardTitle+"</h1>";
				posts+="<p id='board_list_writer'>"+obj.writer+"</p>";
				posts+="</a>";
				posts+="</div>"
				
			});
			posts+="<div id='pagebar-container'>";
			posts+=pageBar;
			posts+="</div>";
			posts+="</div>";
			
			posts+="</div>";
			
			$("#posts").html(posts);
			
		},	
		error:function(){
			console.log("error");
		}
	});
}

function pagebarMove(cPage){
	$.ajax({
		url:"${path}/admin/admin_board_List.do",
		type:"POST",
		data:{cPage:cPage},
		success: function(data){
			var Categorylist = data.Categorylist;
			var Boardlist = data.Boardlist;
			var Datelist = data.Datelist;
			var totalData = data.totalData;
			var pageBar = data.pageBar;
			
			//side_menu
			var side_menu="<p style='color:pink;'>게시판 목록</p>";
			side_menu+="<p><a href='#' onClick='top.location=\"javascript:location.reload()\"'>All</a></p>"
			$.each(Categorylist,(index,obj)=>{
				side_menu+="<p><a href=# onClick='CategoryAjax(\""+obj.categoryName+"\")'>"+obj.categoryName+"("+obj.cnt+")</a></p>";
			});
			$("#side_menu").html(side_menu);
			
			
			//posts
			var posts="<div>";
			$.each(Boardlist, (index,obj)=>{
				posts+="<div id='post_board_list'>"
				posts+="<a href='${path}/board/Board_View.do?boardIdx="+obj.boardIdx+"'>";
				posts+="<p id='board_list_date'>"+Datelist[index]+"</p>";
				posts+="<h1>"+obj.boardTitle+"</h1>";
				posts+="<p id='board_list_writer'>"+obj.writer+"</p>";
				posts+="</a>";
				posts+="</div>"
				
			});
			posts+="<div id='pagebar-container'>";
			posts+=pageBar;
			posts+="</div>";
			posts+="</div>";
			
			$("#posts").html(posts);
			
		},	
		error:function(){
			console.log("error");
		}
	});
}
</script>

<jsp:include page="/WEB-INF/views/admin/admin_footer.jsp"/>