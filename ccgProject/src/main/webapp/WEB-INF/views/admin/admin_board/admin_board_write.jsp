<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/admin/admin_header.jsp">
	<jsp:param value="관리자페이지" name="title"/>
</jsp:include>

<div id="content-wrapper" style="width:80%;">
	<form id="board_form" action="${path }/board/insert.do" method="post" enctype="multipart/form-data">
		<table id="admin_board_table">
			<tr>
				<td style="height:20px; text-align:center; background-color:#ccc; color:white;">글쓰기</td>
			</tr>
			<tr>
				<td>
					<table id="admin_board_table2">
						<tr>
							<td>작성자</td>
							<td><input type="text" id="writer_name" name="writer_name" value="${loginUser.userid }" readonly> </td>
						</tr>
						<tr>
							<td>카테고리</td>
							<td>
								<select name="category" id="categorySelect">
								</select>
							</td>
						</tr>
						<tr>
							<td>제목</td>
							<td><input type="text" id="board_title" name="board_title" required></td>
						</tr>
						<tr style="height: 750px;">
							<td>내용</td>
							<td>
							<textarea id="txtContent" name="txtContent" rows="20" cols="100" style="width: 90%;" required></textarea>
							<!-- editor -->
							<script>
								var ckeditor_config = {
									resize_enaleb: true,
									enterMode : CKEDITOR.ENTER_BR,
									shiftEnterMode : CKEDITOR.ENTER_P,
									filebrowserUploadMethod :'form',
									filebrowserUploadUrl: "${path}/admin/post/imageUpload",
									height: 750,
						           	 };
						        
						        CKEDITOR.replace("txtContent", ckeditor_config);
							</script>
							
							</td>
						</tr>
						<tr>
							<td>첨부파일</td>
							<td><input type="file" id="files" name="files" multiple="multiple"/></td>
						</tr>
					</table>
					<div id="board_form_submit_btn">
						<!-- <input type="button" onclick="board_form_submit_btn();" value="등록">-->
						<input type="submit" value="등록">
						<input type="button" value="인쇄하기" id="print" onclick="window.print()"/>
					</div>
				</td>
			</tr>
		</table>
	</form>

</div>
<!-- <script>
	$("#gdsImg").change(function(){
		if(this.files && this.files[0]) {
			var reader = new FileReader;
			reader.onload = function(data) {
				$(".select_img img").attr("src", data.target.result).width(500);								
			}
			reader.readAsDataURL(this.files[0]);
		}
	});
</script> -->
<!-- <script type="text/javascript">

	function board_form_submit_btn(){
		let writer_name = document.getElementById('writer_name').value;
		let board_select = document.getElementById('board_select').value;
		let board_title = document.getElementById('board_title').value;
		//let txtContent = document.getElementById('txtContent').value;
		let txtContent = document.getElementsByClassName('txtContent').value;
		let password = document.getElementById('password').value;
		
		console.log(writer_name + " " + board_select + " " + board_title + " " + txtContent + " " + password);
	}
</script> -->
<script>
$(function(){
	
	let categorySelect = document.getElementById('categorySelect');
	
	$.ajax({
		url:"${path}/board/selectCategory.do",
		type:"GET",
		success: function(data){
			$.each(data,(index, obj)=>{
				let newOption = document.createElement('option');
				newOption.setAttribute('value', obj.categoryName);
				newOption.innerHTML = obj.categoryName;
				
				categorySelect.appendChild(newOption);
			});
		},
		errer:function(){
			console.log("error");
		}
	});
});

</script>

<jsp:include page="/WEB-INF/views/admin/admin_footer.jsp"/>