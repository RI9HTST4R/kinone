<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<div class="container">
	<div class="wrapper" align="center">
		<h1 id="title">시즌 정보</h1>
		<hr> 
<h2>선수 입력1</h2>
<form action="/kinone/admin/pinsert1.do" method="POST" enctype="multipart/form-data">

<table class="table table-sm">
<tr>
	<td colspan=5>선수 기본정보</td>
</tr>
<tr>
	<td>선수 이름</td>
	<td>소속 구단</td>
	<td>백넘버</td>
	<td>포지션</td>
	<td>사진</td>
</tr>
<tr>
	<td><input type="text" name="pname"></td>
	<td><input type="text" name="ccode"></td>
	<td><input type="text" name="pno"></td>
	<td><input type="text" name="position"></td>
	<td><input type="file" name="file"></td>
	
</tr>
<tr>
	<td colspan=4>선수 상세정보</td>
</tr>
<tr>
	<td>출생국</td>
	<td>생일</td>
	<td>키</td>
	<td>몸무게</td>
</tr>
<tr>
	<td><input type="text" name="nation" ></td>
	<td><input type="date" name="birthdate1" value="1980-01-01"></td>
	<td><input type="text" name="height"></td>
	<td><input type="text" name="weight"></td>
</tr>

</table>
<input type=submit value="입력" >
<input type="button" value="취소" onclick="location.href='/kinone/admin/plist.do'">
</form>

</div>
	</div>
<%@ include file="footer.jsp"%>
