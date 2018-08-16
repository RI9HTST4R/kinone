<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<style>
body {
	background-color: #f1f1f1;
}
.pagetitle {
	background-color: blue;
}

</style>
<div class="pagetitle"><span>K In One 아이디/비밀번호 찾기</span></div>
<br><br>
<div>
		<table>
			<tr>
				<td>	아이디를 잊어버리셨나요?
				<br><input type="button" id="findid" value="아이디찾기">
				</td>
				<td> 비밀번호를 잊어버리셨나요?
				<br><input type="text" class="form-control" name="email" placeholder="이메일을 입력해주세요">
				<br><input type="button" id="findid" value="비밀번호 재설정">
			</tr>
			
		
		</table>
	</div>
		
<script type="text/javascript">


</script>


			
<%@ include file="footer.jsp"%>
