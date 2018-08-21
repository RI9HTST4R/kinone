<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="header.jsp"%>
<style>
.pagetitle {
	background-color: violet;
}
body {
    font-family: Arial, Helvetica, sans-serif;
}

* {
    box-sizing: border-box;
}

/* Add padding to containers */

/* Full-width input fields */
input[type=text], input[type=password] {
    width: 100%;
    padding: 15px;
    margin: 5px 0 22px 0;
    display: inline-block;
    border: none;
    background: #f1f1f1;
}

input[type=text]:focus, input[type=password]:focus {
    background-color: #ddd;
    outline: none;
}

/* Overwrite default styles of hr */
hr {
    border: 1px solid #f1f1f1;
    margin-bottom: 25px;
}

/* Set a style for the submit button */
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

.registerbtn:hover {
    opacity: 1;
}

/* Add a blue text color to links */
a {
    color: dodgerblue;
}

/* Set a grey background color and center the text of the "sign in" section */
.signin {
    background-color: #f1f1f1;
    text-align: center;
}
</style>
<div class="pagetitle"><span>비밀번호 확인</span></div>
 
</head>
<body>
<div style="position:fixed;top:55%;left:4%;background:white;width:200px;height:200px;border:solid lightgray 1px;border-radius:10px">
<br>
<a href="mypage.do">결제 내역</a><br>
<hr>
<c:if test="${status=='edit'}">
회원 정보 수정
<hr>
<a href="update_check.do?status=delete">회원 탈퇴</a>
</c:if>
<c:if test="${status=='delete'}">
<a href="update_check.do?status=edit">회원 정보 수정</a>
<hr>
회원 탈퇴
</c:if>
</div>
<form action="/kinone/checking_psswd.do">
  <div class="container" style="padding: 16px; background-color: white;" align="justify">
    <div align="center">
    <h1>
 <c:if test="${status=='edit'}">수정 </c:if><c:if test="${status=='delete'}">회원 탈퇴 </c:if> 전에 비밀번호를 체크하셔야 합니다.</h1>
    </div>
    <hr>

      <label for="psw"><b>기존 비밀번호</b></label>
    <input type="password" placeholder="기존 비밀번호를 입력하세요" id="passwd" name="passwd">
    <button type="submit" class="registerbtn">수정/탈퇴하러 가기</button>
    <input type="hidden" name="status" value="${status}">
  </div>
  
 
</form>
<script>


</script>



    <%@ include file="footer.jsp"%>

