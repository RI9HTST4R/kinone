<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>

<html>
<head>
<meta content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<style>
* {
	box-sizing: border-box;
}
.pagetitle {
	width: 100%;
	height: 100px;
	/* border: 1px solid red; */
	text-align: left;
	margin-top: 20px;
	padding: 0 20px;
	font-family: Jua;
}
.pagetitle > span {
	color: white;
	font-size: 25pt;
	line-height: 120px;
}

body {
	background-color: #f1f1f1;
}

#regForm {
	background-color: #ffffff;
	margin: 100px auto;
	font-family: Righteous;
	padding: 40px;
	width: 70%;
	min-width: 300px;
}

h1 {
	text-align: center;
}

input {
	padding: 10px;
	width: 100%;
	font-size: 17px;
	font-family: Raleway;
	border: 1px solid #aaaaaa;
}

/* Mark input boxes that gets an error on validation: */
input.invalid {
	background-color: #ffdddd;
}

/* Hide all steps by default: */
.tab {
	display: none;
}


#prevBtn {
	background-color: #bbbbbb;
}

/* Make circles that indicate the steps of the form: */
.step {
	height: 15px;
	width: 15px;
	margin: 0 2px;
	background-color: #bbbbbb;
	border: none;
	border-radius: 50%;
	display: inline-block;
	opacity: 0.5;
}

.step.active {
	opacity: 1;
}

/* Mark the steps that are finished and valid: */
.step.finish {
	background-color: #4CAF50;
}

.pagetitle {
	background-color: green;
}
hr {
	margin: 20px 0 30px 0;
}
</style>
<script type="text/javascript">
$(function(){
	$(".tab1").show();
	$(".tab2").hide();
	$(".tab3").hide();
	$("#next2").hide();
});
</script>

<body>
<div class="pagetitle"><span>K In One 비밀번호 찾기</span></div>
<br>
<form>

가입 이메일을 알려주세요

<div class="tab1">
	<h3>가입 이메일 입력</h3>
		<p>
			<input placeholder="로그인에 사용하실 이메일을 입력하세요" id="register_email"
				oninput="this.className = ''" name="email" onkeyup="checking()">
		</p>

</div>

	<div class="tab2">
		<h3>인증 번호 입력</h3>
			<p>
				<input type="text" name="putemailnumber">
			</p>
	</div>

	<div class="tab3">
		<h3>재설정할 비밀번호를 입력</h3>
			<p>
				<input type="text" name=passwd>
			</p>
	</div>

	<div id="next1" style="overflow: auto;">
		<div style="float: right;">
			<!-- <button type="button" id="prevBtn" onclick="nextPrev(-1)">Previous</button> -->
			<button type="button" id="nextBtn" onclick="check_contract()">Next</button>
		</div>
	</div>
	<div id="next2" style="overflow: auto;">
		<div style="float: right;">
			<button type="button" id="prevBtn2" onclick="nextPrev2()">Previous</button>
			<button type="button" id="nextBtn2" onclick="validateForm()">Next</button>
		</div>
	</div>
	<div style="text-align: center; margin-top: 40px;">
		<span id="step1" class="step finish"></span> <span id="step2"
			class="step"></span> <span id="step3" class="step"></span><span
			id="step4" class="step"></span>
	</div>

</form>
<script type="text/javascript">

/* function validateEmail(){
	if($("#putemailnumber").val()==$("#emailnumber")){
		$ajax({
			type:"POST",
			url:"passwd_ok.do",
			data:{"email":$("#emial").val()},
			success : function(data){
				if(data>0){
					alert("인증 완료"); 
					location.href="newpass.do";
				}else{
					alert("인증실패");
				}
			}
		});
		return true;
	}else{
		alert("인증용 번호가 다릅니다.");
		return false;
	}
} */

</script>

</body>
</html>