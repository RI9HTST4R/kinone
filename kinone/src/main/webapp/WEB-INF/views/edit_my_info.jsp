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
.container {
    padding: 16px;
    background-color: white;
}

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
<div class="pagetitle"><span>회원 정보 수정</span></div>
 
</head>
<body>

<form action="/kinone/edit_member.do">
  <div class="container" align="justify">
    <div align="center">
    <h1>회원 정보 수정</h1>
    <p>정보를 수정하실 수 있습니다!!</p>
    </div>
    <hr>

    <label for="email"><b>이메일(아이디)</b></label>
    <input type="text" placeholder="Enter Email" name="email" value="${member.email}" readonly >

    <label for="psw"><b>새로운 비밀번호</b></label>
    <input type="password" placeholder="새로운 비밀번호를 입력하세요" id="passwd" name="passwd" required onkeyup="passwd_check()">
    <font id="comment" size=3 color="blue"></font><br>

    <label for="psw-repeat"><b>비밀번호 확인 </b></label>
    <input type="password" placeholder="비밀번호를 확인해주세요" id="psw-repeat" required>
    <hr>
    <label for="psw-repeat"><b>이름 </b></label>
    <input type="text" placeholder="이름을 입력하세요" value="${member.mname}" name="mname" id="name" required>
    <label for="psw-repeat"><b>생년월일</b></label>
    
    <input required type="date"  placeholder="생년월일을 입력하세요." name="mbirthdate1" id="birthdate" value="${fn:substring(member.mbirthdate,0,10)}" style="width: 100%; border: lightgray; height: 50px; background: #f1f1f1; color: gray;padding-left:20px">

    <button type="submit" class="registerbtn">수정하기</button>
  </div>
  
 
</form>
<script>
var checking =0;
function passwd_check(){
	var passwd = $("#passwd").val();
	var regex2 = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/i;
	if($("#passwd").val().match(regex2)!=null){
		$("#comment").css("color","blue");
		$("#comment").html("사용 가능한 비밀번호입니다.");
		checking=1;
	}else{
		$("#comment").css("color","red");
		$("#comment").html("비밀번호는 특수문자 / 문자 / 숫자 포함 형태의 8~15자리 이내의 암호여야 합니다.");
		checking =0;
	}
	
	
}
$(function(){
	$("form").submit(function(){
	if(checking==0){
		alert("비밀번호를 올바르게 입력해주세요");
		$("#passwd").val("");
		$("#psw-repeat").val("");
		$("#passwd").focus();
		return false;
	}
	if($("#psw-repeat").val()!=$("#passwd").val()){
		alert("비밀번호가 일치하지 않습니다.");
		$("#psw-repeat").val("");
		$("#psw-repeat").focus();
		return false;
	}

	});
})

</script>



    <%@ include file="footer.jsp"%>

