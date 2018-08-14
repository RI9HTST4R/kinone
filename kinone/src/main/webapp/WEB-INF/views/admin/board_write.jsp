<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<style>
	.form-container {
		width: 80%;
	}
	.table>tbody>tr>td, .table>tbody>tr>th,
	.table>tfoot>tr>td, .table>tfoot>tr>th,
	.table>thead>tr>td, .table>thead>tr>th {
		border: none;
		line-height: 20px;
	}
	input, textarea {
		width: 100%;
	}
	#content {
		resize: none;
	}
	#writebtn {
		border: 1px solid lightgray;
		padding: 5px 10px 5px 10px;
		text-decoration: none;
		color: black;
		border-radius: 0;
		cursor: pointer;
	}
	#writebtn:hover {
		color: white;
		background-color: lightgray;
	}
</style>

<div class="container">
	<div class="wrapper">
		<h1 id="title">게시판 글 작성</h1>
		<hr>
		<div class="form-container" align="right">
			<form action="${url}/admin/board_insert.do" method="post" enctype="multipart/form-data">
				<table class="table" >
					<tr>
						<td>제목</td>
						<td><input type="text" id="subject" name="subject" /></td>
					</tr>
					<tr>
						<td>대표이미지</td>
						<td><input type="file" id="image" name="image"/></td>
					</tr>
					<tr>
						<td>내용</td>
						<td><textarea rows="20" cols="70" id="content" name="content"></textarea></td>
					</tr>
				</table>
				<a id="writebtn">글 작성</a>
			</form>
		</div>
	</div>
</div>

<script>
	$(function(){
		$("#writebtn").on("click", function(){
			var subject = $.trim($("#subject").val());
			var image = $("#image").val();
			var content = $("#content").val();
			
			if(subject == "") {
				alert("글 제목을 입력하세요.");
				$("#subject").val("").focus();
				return;
			}
			if(image == "") {
				alert("이미지를 첨부해야 글 작성 가능합니다.");
				$("#image").focus();
				return;
			}
			if(content == "") {
				alert("내용을 입력하세요.");
				$("#content").val("").focus();
				return;
			}
			
		});
		
		
		
	});
</script>

<%@ include file="footer.jsp" %>