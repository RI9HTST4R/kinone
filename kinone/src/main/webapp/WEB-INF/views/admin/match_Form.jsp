<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>

<style>
.container {
	display: block;
	padding: 0;
	margin: 0;
}

h1#title {
	margin-top: 0px;
}

#selleague {
	margin-top: 30px;
	margin-left: 20px;
}

#lcode {
	width: 100px;
	margin-bottom: 30px;
}

.txtcontainer {
	margin-left: 20px;	
}

.txt {
	margin: 5px 20px 50px 0px;
	position: relative;
	display: inline-block;
}

.txtarea {
	resize: none;
}

.confirmline {
	position: absolute;
	left: 0px;
}

.line {
	color: red;
	font-weight: bold;
}

.sbtn {
	margin-top: 30px;
}
</style>
<script>
	// 정규식을 통해 각 데이터를 점검하여 양식에 맞는 값을 넣었는지 체크
	function regTest(arr, regex){
		for(var idx in arr){
			if(arr[idx].trim() != ""){
				if(!regex.test(arr[idx]))
				return false;
			}
		}
		return true;
	}
	
	$(function(){
		$("#submitbtn").on("click", function(){
			$("#submitbtn").attr('disabled', true);
			
			var mdatelist = $.trim($("#mdatelist").val());
			var mroundlist = $.trim($("#mroundlist").val());
			var homelist = $.trim($("#homelist").val());
			var awaylist = $.trim($("#awaylist").val());
			
			if(mdatelist == "" || mroundlist == "" || homelist == "" || awaylist == ""){
				alert("입력하지 않은 데이터가 있습니다.");
				$("#submitbtn").removeAttr('disabled');
				return false;
			}
			
			var testarr = [$("#line1").text(), $("#line2").text(), $("#line3").text(), $("#line4").text()];
		//	alert(testarr.toString());
			var temp = 0;
			for(var idx in testarr){
				if(idx == 0){
					temp = testarr[idx];
				}else {
					if(temp !== testarr[idx]){
						alert("데이터의 갯수가 맞지 않습니다.");
						$("#submitbtn").removeAttr('disabled');
						return false;
					}
				}
			}
			 
			// 매치 일시 정규식
			var mdateRegex = /^(19|20)\d{2}(0[1-9]|1[012])(0[1-9]|[12][0-9]|3[0-1])\s([1-9]|[01][0-9]|2[0-3]):([0-5][0-9])$/;
			var mdatearr = mdatelist.split("\n");
			
			if(!regTest(mdatearr, mdateRegex)){
				alert("[경기 일시] 형식이 맞지 않습니다.");
				$("#submitbtn").removeAttr('disabled');
				return false;
			}
			
			// 1~50 라운드 정규식
			var mroundRegex = /(^[1-9]{1}$|^[1-4]{1}[0-9]{1}$|^50$)/;
			var mroundarr = mroundlist.split("\n");
			
			if(!regTest(mroundarr, mroundRegex)){
				alert("[라운드] 형식이 맞지 않습니다.");
				$("#submitbtn").removeAttr('disabled');
				return false;
			}
			
			var homearr = homelist.split("\n");
			var awayarr = awaylist.split("\n");
		//	alert(homearr);
		//	alert(awayarr);
			var concArr = homearr.concat(awayarr);

			// ajax로 배열 데이터를 넘기기 위한 설정
			jQuery.ajaxSettings.traditional = true;
			$.ajax({
				url:"/kinone/admin/checkClub.do",
				data: {"data":concArr},
				type: "post",
				dataType: "text",
				success:function(bool){
				//	alert(bool);
					
					if(bool == "false"){
						alert("입력하신 데이터에 존재하지 않는 구단이 있습니다.");
						$("#submitbtn").removeAttr('disabled');
					}else {
						$("#addForm").submit();
					}
				}
			});
			return false;
		});
		
		// 각 textarea 마다 입력된 데이터의 줄 수를 계산
		$(".txtarea").each(function(){
			$(this).keyup(function(){
				var text = $(this).val();
				var countArr = text.split("\n");
				var count = 0;
				for(var idx in countArr){
					if(countArr[idx].trim() != ""){
						count += 1;
					}
				}
				$(this).parent().find(".line").text(count);
			});
		});
	});
	
</script>

<div class="container">
	<form id="addForm" action="${url}/admin/insertMatch.do" method="post">
		<div class="wrapper">
			<h1 id="title">매치 일정 등록</h1>
			<hr>
			<div id="selleague">
				리그 : <select name="lcode" id="lcode">
					<option>K1</option>
					<option>K2</option>
				</select>
			</div>
			<div class="txtcontainer">
				<div class="txt">
					<span class="title">[경기 일시]</span><br /> <span class="ex">입력양식)
						20180804 19:30</span><br /> <br />
					<textarea class="txtarea" name="mdatelist" id="mdatelist" cols="25"
						rows="10"></textarea>
					<div class="confirmline">
						<span>입력한 라인수 : </span><span class="line" id="line1">0</span>
					</div>
				</div>
				<div class="txt">
					<span class="title">[라운드]</span><br /> <span class="ex">입력양식)
						10</span><br /> <br />
					<textarea class="txtarea" name="mroundlist" id="mroundlist"
						cols="18" rows="10"></textarea>
					<div class="confirmline">
						<span>입력한 라인수 : </span><span class="line" id="line2">0</span>
					</div>
				</div>
				<div class="txt">
					<span class="title">[홈 팀 코드]</span><br /> <span class="ex">입력양식)
						K01</span><br /> <br />
					<textarea class="txtarea" name="homelist" id="homelist"
						cols="18" rows="10"></textarea>
					<div class="confirmline">
						<span>입력한 라인수 : </span><span class="line" id="line3">0</span>
					</div>
				</div>
				<div class="txt">
					<span class="title">[어웨이 팀 코드]</span><br /> <span class="ex">입력양식)
						K05</span><br /> <br />
					<textarea class="txtarea" name="awaylist" id="awaylist"
						cols="18" rows="10"></textarea>
					<div class="confirmline">
						<span>입력한 라인수 : </span><span class="line" id="line4">0</span>
					</div>
				</div>
				<br/>
				<div class="sbtn" align="left">
					<input type="button" id="submitbtn" value="데이터 입력">
				</div>
			</div>
		</div>

	</form>

</div>



<%@ include file="footer.jsp"%>
