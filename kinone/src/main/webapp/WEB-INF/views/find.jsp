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
				<br><input type="button" id="findid" value="아이디찾기" onclick="emailfind();">
				</td>
				<td> 비밀번호를 잊어버리셨나요?
				<br><input type="button" id="findid" value="비밀번호 재설정" onclick="passwdfind();">
			</tr>
			
		
		</table>
	</div>
		
<script type="text/javascript">
/* $('.findid').click(function(event)){
	console.log('click');
	emailfind();
} */
function emailfind(){
	var url="/kinone/emailfindform.do";
	var pname="이메일 찾기"
	window.open(url, pname, "width=700, height=600, left=800, top=600");
}
function passwdfind(){
	var url="/kinone/passwdfindform.do";
	var pname="비밀번호 찾기"
	window.open(url, pname, "width=700, height=600, left=800, top=600");
}


</script>


			
<%@ include file="footer.jsp"%>
