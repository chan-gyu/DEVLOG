<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="메인페이지" name="title"/>
</jsp:include>

	<div id="Main-Wrapper">
		<div id="content-wrapper">
			<div id="posts">
			</div>
			<div id="profil">
				<img src="/img/icon/icons-admin-wolf.png" style="width:70px; height:70px; border:1px solid white; border-radius:50%; margin-top:25px;"><br/><br/>
				<p>Web Developer 최찬규</p><br/>
				<a href="https://github.com/chan-gyu" target="_blank"><img src="/img/icon/icons8-github__50.png" style="width:50px; height:50px;"></a>
				<a href="https://ccg-service.com/Parking/" target="_blank"><img src="/img/icon/icons8-car-50.png" style="width:50px; height:50px;"></a>
				<img src="/img/icon/icons-admin-wolf.png" style="width:50px; height:50px;">
				
			</div>
			<div id="side_menu" style="margin-top:50px">
			</div>
		</div>
	</div>

<script>
$(function(){
	let categoryName=null;
	let cPage=null;
	$.ajax({
		url:"${path}/index_board_List.do",
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
				posts+="<a href='${path}/board/index_Board_View.do?boardIdx="+obj.boardIdx+"'>";
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
});

function CategoryAjax(categoryName){
	$.ajax({
		url:"${path}/index_board_List.do",
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
				posts+="<a href='${path}/board/index_Board_View.do?boardIdx="+obj.boardIdx+"'>";
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

function pagebarMove(cPage){
	$.ajax({
		url:"${path}/index_board_List.do",
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
				posts+="<a href='${path}/board/index_Board_View.do?boardIdx="+obj.boardIdx+"'>";
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

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>