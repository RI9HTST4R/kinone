<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<style>
	.table {
		width: auto;
	}
	.table>tbody>tr>td, .table>tbody>tr>th,
	.table>tfoot>tr>td, .table>tfoot>tr>th,
	.table>thead>tr>td, .table>thead>tr>th {
		vertical-align: middle;
		text-align: center;
	}
	select.form-control {
	display: inline-block;
	width: 118px;
	padding: 0px;
	border-radius: 2px;
	margin-bottom: 1rem;
	height: 30px;
	}
</style>
<div class="container">
	<div class="wrapper">
		<h1 id="title">선수 등록</h1>
		<hr>
		<br/>
		<br/>
		<form action="/kinone/admin/pinsert1.do" method="POST"
			enctype="multipart/form-data">

			<h3>선수 기본 정보</h3>
			<table class="table table-sm table-bordered">
				<tr>
					<th>선수 이름</th>
					<th>소속팀</th>
					<th>백넘버</th>
					<th>포지션</th>
					<th>사진</th>
				</tr>
				<tr>
					<td><input type="text" name="pname"></td>
					<td><select name="ccode" class="form-control">
							<option value="">팀 선택</option>
							<c:forEach var="i" items="${cn}">
								<option value="${i.key }">${i.value }</option>
							</c:forEach>
					</select></td>
					<td><input type="text" name="pno"></td>
					<td><select name="position" class="form-control">
							<option value="">포지션 선택</option>
							<option value="GK">GK</option>
							<option value="DF">DF</option>
							<option value="MF">MF</option>
							<option value="FW">FW</option>
					</select></td>
					<td><input type="file" name="file"></td>

				</tr>
			</table>
			<br/>
			<h3>선수 상세 정보</h3>
			<table class="table table-bordered">
				<tr>
					<th>출생국</th>
					<th>생일</th>
					<th>키</th>
					<th>몸무게</th>
				</tr>
				<tr>
					<td><input type="text" name="nation"></td>
					<td><input type="date" name="birthdate1" value="1980-01-01"></td>
					<td><input type="text" name="height"></td>
					<td><input type="text" name="weight"></td>
				</tr>

			</table>
			<input type=submit value="입력"> <input type="button"
				value="취소" onclick="location.href='/kinone/admin/plist.do'">
		</form>

	</div>
</div>
<%@ include file="footer.jsp"%>
