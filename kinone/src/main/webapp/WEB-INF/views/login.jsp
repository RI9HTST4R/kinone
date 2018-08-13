<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<div class="container">
	<div class="wrapper">
		<h1 id="title">시즌 정보</h1>
		<hr> 
		<form action="/kinone/logincall.do" method="post">
				가입 email <input type="text" name="email"	>
		<br>비밀번호<input type="password" name="passwd">
		<br>
			<input type="submit" value="로그인">
			<input type="button" onclick="location.href='/signin.do'">"
		</form>
	</div>
</div>
<%@ include file="footer.jsp"%>