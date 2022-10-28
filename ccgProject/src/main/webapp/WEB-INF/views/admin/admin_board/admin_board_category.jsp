<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/WEB-INF/views/admin/admin_header.jsp">
	<jsp:param value="카테고리 수정 페이지" name="title"/>
</jsp:include>

<div id="content-wrapper" style="width:80%;">
	<div class="col">
	    <div id="content-warpper" style="width:100%;">
			<br>
			<h1>관리자 카테고리 관리 페이지</h1>
			<div id="category_content">
				<div id="categroyList_box">
				
				</div>
				<div id="category_update_box">
					<input type="text" id="addCategory"/>
					<button id="category_btn2" onClick="addCategory()">+</button>
				</div>
			</div>
		</div>
	</div>
</div>

<script>
$(function(){
	$.ajax({
		url:"${path}/admin/categoryList.do",
		type:"GET",
		success: function(data){
			var Categorylist = data.Categorylist;
			var Boardlist = data.Boardlist;
			var Datelist = data.Datelist;
			
			var categoryList=""
			$.each(data, (index,obj)=>{
				categoryList+="<p>"+obj.categoryName+"<button id='category_btn' onClick='deleteCategory(\""+obj.categoryName+"\")'>-</button></p>";
			})
		
			$("#categroyList_box").html(categoryList);
			
		},	
		error:function(){
			console.log("error");
		}
	});
});

function addCategory(){
	let addCate = document.getElementById("addCategory").value;
	if(addCate != null){
		$.ajax({
			url:"${path}/admin/addCategory.do",
			type:"POST",
			data: {addCate,addCate},
			success: function(data){
				alert("Add Success");
				window.location.reload();
			},
			error:function(){
				console.log("error");
			}
		});
	}
}

function deleteCategory(deleteCate){
	$.ajax({
		url:"${path}/admin/deleteCategory.do",
		type:"POST",
		data:{deleteCate,deleteCate},
		success:function(data){
			alert("Delete Success");
			window.location.reload();
		},
		error:function(){
			console.log("error");
		}
	});
}

</script>

<jsp:include page="/WEB-INF/views/admin/admin_footer.jsp"/>