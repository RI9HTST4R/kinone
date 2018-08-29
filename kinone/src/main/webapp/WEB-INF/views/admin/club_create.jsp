<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<style>
</style>
<div class="container">
	<div class="wrapper">
		<h1 id="title">새로운 클럽 생성</h1>
		<hr> 
<form action="${url}/admin/create_club_ok.do" enctype="multipart/form-data" method="post">
		<table class="table" style="border: 1px solid lightgray; width: 50%;">
			<tr>
				<th width="250px">클럽명(풀네임)</th>
				<td colspan="2" align="left"><input type="text" id="cname" name="cname">
				</td>
			</tr>
			<tr>
				<th width="250px">클럽명(줄임)</th>
				<td colspan="2" align="left"><input type="text" id="cname_short"
					name="cname_short"></td>
			</tr>
			<tr>
				<th width="250px">엠블럼</th>
				<td colspan="2" align="left"><input type="file" id="emblem" name="file"
					></td>
			</tr>
			<tr>
				<th width="250px">감독명</th>
				<td colspan="2" align="left"><input type="text" id="cmanager"
					name="cmanager"></td>
			</tr>
			<tr>
				<th width="250px">경기장명</th>
				<td colspan="2" align="left"><input type="text" id="sname" name="sname">
				</td>
			</tr>
			<tr>
				<th width="250px">경기장 위치</th>
				<td colspan="2" align="left">위도<br/><input type="number" step="any" id="lat" name="lat"><br/>경도<br/><input type="number" step="any" id="lon" name="lon">
				</td>
			</tr>
			<tr>
				<th width="250px">수용 가능 인원</th>
				<td colspan="2" align="left"><input type="text" id="capacity"
					name="capacity" value="120"></td>
			</tr>

		</table>
		<input type="submit" id="createbtn" name="createbtn" value="클럽 생성">
	</form>
	</div>
</div>
<%@ include file="footer.jsp"%>