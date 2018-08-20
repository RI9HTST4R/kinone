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
.registerbtn {
    background-color: #4CAF50;
    color: white;
    padding: 16px 20px;
    margin: 8px 0;
    border: none;
    cursor: pointer;
    width: 100%;
    opacity: 0.9;
}

</style>
<div class="pagetitle"><span>K In One 아이디/비밀번호 찾기</span></div>
<br><br>
<h3>아이디/비밀번호 찾기</h3>
	<div style="float: left; width: 45%;">
			<h5>아이디를 잊어버리셨나요?</h5>
		<br><input type="button" id="findid" value="아이디찾기" class="registerbtn" onclick="emailfind();">
	</div>
	<div style=" float: right; width: 45%;">
		<h5> 비밀번호를 잊어버리셨나요?</h5>
		<br><input type="button" id="findid" value="비밀번호 재설정" class="registerbtn" onclick="passwdfind();">
		
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
