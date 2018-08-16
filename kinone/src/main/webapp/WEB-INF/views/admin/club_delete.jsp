<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<div class="container">
	<div class="wrapper">
		<h1 id="title">클럽 삭제</h1>
		<hr>
		<form action="${url}/admin/delete_club_ok.do">
			<input type="hidden" name="ccode" value="${ccode}"/>
			<table border=1px class="table table-sm">
				<tr>
					<th>클럽명(풀네임)</th>
					<td colspan="2"><input type="text" id="cname" name="cname">
					</td>
				</tr>
				<tr>
					<th>감독명</th>
					<td colspan="2"><input type="text" id="cmanager"
						name="cmanager"></td>
				</tr>
			</table>
			<input type="submit" id="deletebtn" name="deletebtn" value="클럽 삭제">
		</form>
	</div>
</div>
