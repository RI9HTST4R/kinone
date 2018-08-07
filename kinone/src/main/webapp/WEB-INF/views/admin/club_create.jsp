<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<div class="container">
	<div class="wrapper">
		<h1 id="title">새로운 클럽 생성</h1>
		<hr> 
<form action="${url}/admin/create_club_ok.do" enctype="multipart/form-data" method="post">
		<table border=1px class="table table-sm">
			<tr>
				<th>클럽명(풀네임)</th>
				<td colspan="2"><input type="text" id="cname" name="cname">
				</td>
			</tr>
			<tr>
				<th>클럽명(줄임)</th>
				<td colspan="2"><input type="text" id="cname_short"
					name="cname_short"></td>
			</tr>
			<tr>
				<th>엠블럼</th>
				<td colspan="2"><input type="file" id="emblem" name="file"
					></td>
			</tr>
			<tr>
				<th>감독명</th>
				<td colspan="2"><input type="text" id="cmanager"
					name="cmanager"></td>
			</tr>
		</table>
		<table>
			<tr>
				<th>경기장</th>
				<td colspan="2"><input type="text" id="sname" name="sname">
				</td>
			</tr>
			<tr>
				<th>경기장 사진</th>
				<td colspan="2"><input type="file" id="sphoto" name="file">
				</td>
			</tr>
			<tr>
				<th>수용 가능 인원</th>
				<td colspan="2"><input type="text" id="capacity"
					name="capacity"></td>
			</tr>

		</table>
		<input type="submit" id="createbtn" name="createbtn" value="클럽 생성">
	</form>
	</div>
</div>
<%@ include file="footer.jsp"%>