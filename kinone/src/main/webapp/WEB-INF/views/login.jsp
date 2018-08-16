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
<div class="pagetitle"><span>K In One 로그인</span></div>
<br><br>

		<form action="/kinone/logincall.do" method="post">
   			 <div class="form-group">
   			   <label for="usr">이메일:</label>
   				   <input type="text" class="form-control" name="email" placeholder="이메일을 입력해주세요">
   			 </div>
   				 <div class="form-group">
    			  <label for="pwd">Password:</label>
      				<input type="password" class="form-control" name="passwd" placeholder="비밀번호를 입력해주세요">
 			  </div>
 			  <input type="submit" value="로그인">
 			  <input type="button" onclick="location.href='/join.do'" value="회원가입">
  		</form>
  			<br><a href="/kinone/find.do"> 아이디나 비밀번호를 잊으셨나요?</a>
  			
  			
	</div>
</div>

<%@ include file="footer.jsp"%>