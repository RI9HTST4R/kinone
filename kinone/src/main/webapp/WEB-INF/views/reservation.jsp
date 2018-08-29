<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<style>
	a.arrow, a.arrow:hover {
		color: black;
		cursor: pointer;
	}
	a.disabled:not([href]):not([tabindex]) {
		color: lightgray;
		cursor: default;
	}
	.pagetitle {
		background-color: orange;
		position: relative;
	}
	#seasoncode {
		height: 30px;
	    position: absolute;
	    bottom: 10px;
	    right: 10px;
	}
	.page-content {
		/* border: 1px solid red; */
		height: auto;
		width: 100%;
		padding-bottom: 20px;
		overflow: auto;
	}
	.matchInMonth {
		height: 90px;
		line-height: 90px;
		font-size: 30pt;
		margin-bottom: 10px;
	}
	.matchInMonth > * {
		margin: 0px 10px;
	}
	.month-day {
		/* border: 1px solid blue; */
		height: 50px;
		background-color: lightgray;
		color: black;
	}
	.match-day {
		line-height: 50px;
		font-size: 15pt;
	}
	.dayMatchList {
		width: 100%;
		height: auto;
		color: black;
		margin-bottom: 10px;
	}
	.dayMatchList td {
		vertical-align: middle;
	}
	.match_round {
		width: 20%;
		text-align: center;
	}
	.match_team {
		width: 30%;
		text-align: center;
	}
	.matchtime, .matchscore {
		font-weight: bold;
	}
	.match_team > img {
		width: 50px;
		height: 50px;
	}
	.match_stadium {
		width: 25%;
		text-align: justify;
	}
	.match_btn {
		width: 25%;
	}
	.match_btn > .btn {
		font-size: 0.9rem;
		background-color: white;
		width: 95px;
		height: 45px;
		margin-right: 5px;
	}
	.match_btn > .btn[disabled] {
		color: gray;
		background-color: lightgray;
		border-color: lightgray;
	}
	.match_btn > .btn-warning {
		color: #eea236;
	}
	.match_btn > .btn-warning:hover:not([disabled]) {
		background-color: #f0ad4e;
		color: white;
	}
	.match_btn > .btn-info {
		color: #46b8da;
	}
	.match_btn > .btn-info:hover:not([disabled]) {
		background-color: #46b8da;
		color: white;
	}
	.match_btn > .btn-danger {
		color: #d43f3a;
	}
	.match_btn > .btn-danger:hover:not([disabled]) {
		background-color: #d9534f;
		color: white;
	}
</style>

<div class="pagetitle">
	<span><i class="fas fa-ticket-alt"></i> ${seasonList[0]} 시즌 경기 예매</span><br/>
	<a class="smenu menuselected" onClick="moveLeague(this,'K1')" style="color:white;cursor:pointer;">K리그 1</a>
	<a class="smenu" onClick="moveLeague(this,'K2')" style="color:white;cursor:pointer;">K리그 2</a>
</div>
<div class="page-content">
	<%-- 예매버튼을 오늘 날짜와 비교하여 나타내도록 하기 위해서  --%>
	<jsp:useBean id="toDay" class="java.util.Date"/>
	<fmt:formatDate var="nowMonth" value="${toDay}" pattern="M"/>
	
	<!-- 월 별 매치 일정 -->
	<div class="matchInMonth">
		<a id="leftarrow" class="arrow"><i class="fas fa-caret-left"></i></a><span id="month">${nowMonth}월</span><a id="rightarrow" class="arrow"><i class="fas fa-caret-right"></i></a>
	</div>
	
	<div id="matchlist-container"></div>
	<hr>
</div> <!-- page-content end -->

<form id="list-condition">
	<input type="hidden" id="matchlist-lcode" name="lcode" value="K1"/>
	<input type="hidden" id="matchlist-month" name="month" value="${nowMonth}"/>
</form>
<script>
	var today = new Date();
	var weekday = ['일','월','화','수','목','금','토'];
	var doubleSubmitFlag = false; // 더블클릭방지 변수
	function doubleSubmitCheck(){
	    if(doubleSubmitFlag){
	        return doubleSubmitFlag;
	    }else{
	        doubleSubmitFlag = true;
	        return false;
	    }
	}
	
	// 월별 매치 리스트
	function moveMonth(direction){
		$(".arrow").addClass("disabled");
		var text = $("#month").text();
		var month = text.substring(0,text.indexOf("월"));
		var newMonth = 0;
		if(direction == "p"){ // 이전달
			newMonth = parseInt(month)-1;
		}else if(direction == "n"){ // 다음달
			newMonth = parseInt(month)+1;
		}
		$("#matchlist-month").val(newMonth);
		getMatchList();
		$("#month").text(newMonth+"월");
		if(newMonth > (today.getMonth()+1)){
			$("#leftarrow").removeClass("disabled");
		}
		if(newMonth != 12){
			$("#rightarrow").removeClass("disabled");
		}
		
	}
	
	// 리그 변경
	function moveLeague(obj, lcode){
	//	alert(lcode);
		$("#matchlist-lcode").val(lcode);
		$("#seasoncode, #matchlist-seasoncode").val($("#topseason").val());
		
		getMatchList();
		$(obj).addClass("menuselected");
		if(lcode == "K1"){
			$(obj).next().removeClass("menuselected");
		}else if(lcode == "K2"){
			$(obj).prev().removeClass("menuselected");
		}
		
	}
	
	// 두개의 날짜를 비교하여 차이를 알려준다.
	function dateDiff(_date1, _date2) {
	    var diffDate_1 = _date1 instanceof Date ? _date1 : new Date(_date1);
	    var diffDate_2 = _date2 instanceof Date ? _date2 : new Date(_date2);
	 
	    diffDate_1 = new Date(diffDate_1.getFullYear(), diffDate_1.getMonth()+1, diffDate_1.getDate());
	    diffDate_2 = new Date(diffDate_2.getFullYear(), diffDate_2.getMonth()+1, diffDate_2.getDate());
	    
	    var diff = diffDate_2.getTime() - diffDate_1.getTime();
	    diff = Math.ceil(diff / (1000 * 3600 * 24));
	 
	    return diff;
	}
	
	// 조건에 맞는 리스트 가져와서 보여주는 메소드
	function getMatchList(){
		var $container = $("#matchlist-container");
		$container.empty().html("<img src='/kinone/resources/images/loading.gif' style='width:32px; height:32px;' />");
		var submitData = $("#list-condition").serialize();
		$.post("/kinone/matchListAjax.do",submitData,function(data){
			var dayarr = data.day; // String 배열
			var matcharr = data.match; // Object 배열
			var content = '';
			
			if(dayarr.length == 0 && matcharr.length == 0){
				$container.html('<h4>매치 일정이 없습니다.</h4>');
				doubleSubmitFlag = false;
			}
			$.each(dayarr, function(idx, value){
				content += '<div class="month-day">';
				
				var mdate = new Date(value); // 매치가 있는 날
				var yyyy = mdate.getFullYear();
				var MM = mdate.getMonth()+1 < 10 ? "0"+(mdate.getMonth()+1) : ""+(mdate.getMonth()+1);
				var dd = mdate.getDate() < 10 ? "0"+mdate.getDate(): ""+mdate.getDate();
				var e = weekday[mdate.getDay()];
				
				content += '<span class="match-day">'+yyyy+'/'+MM+'/'+dd+' ('+e+')</span><br/></div>';
				var day = MM + dd;
				$.each(matcharr, function(idx2, value2){
					var matchMdateNum = value2.mdate;
					var matchMdate = new Date(matchMdateNum);
					
					var yyyy2 = matchMdate.getFullYear();
					var MM2 = matchMdate.getMonth()+1 < 10 ? "0"+(matchMdate.getMonth()+1) : ""+(matchMdate.getMonth()+1);
					var dd2 = matchMdate.getDate() < 10 ? "0"+matchMdate.getDate(): ""+matchMdate.getDate();
					var day2 = MM2 + dd2;
					if(day == day2){
						var e2 = weekday[matchMdate.getDay()];
						var HH = matchMdate.getHours() < 10 ? "0"+matchMdate.getHours(): ""+matchMdate.getHours();
						var mm = matchMdate.getMinutes() < 10 ? "0"+matchMdate.getMinutes(): ""+matchMdate.getMinutes();
						
						content += '<table id="'+value2.mcode+'" class="table dayMatchList"><tr>';
						content += '<td class="match_round">제 '+value2.mround+'라운드</td>';
						content += '<td class="match_team">';
						content += value2.cname_short_h+' <img src="/kinone/resources/emblem/'+value2.ccode_home+'.png" />';
						
						if(value2.mstatus == 0){
							content += '<span class="matchtime">'+HH+':'+mm+'</span>';
						}else if(value2.mstatus == 1){
							content += '<span class="matchscore">'+value2.homescore+':'+value2.awayscore+'</span>';
						}
						content += ' <img src="/kinone/resources/emblem/'+value2.ccode_away+'.png" /> '+value2.cname_short_a+' </td>';
						content += '<td class="match_stadium">'+value2.sname+'</td>';
						content += '<td class="match_btn" align="right">';
						
						if(value2.mstatus == 0){
							content += '<button class="btn btn-info" type="button" ';
							var datediff = dateDiff(today, matchMdate);
							if(datediff < 1 || datediff > 14){ /* 경기 하루 전이나 이주 이상 남은 경기는 예매 못하도록 */
								content += 'disabled ';
							}
							content += '>경기예매 &gt;</button>';
							
						}else {
							content += '<button class="btn btn-danger"type="button" disabled>경기종료</button>';
						}
						content += '</td></tr></table>';
					}
					$container.html(content);
					doubleSubmitFlag = false;
				});	/* inner $.each end */
			}); /* outer $.each end */
		});/* post end */
	} /* getMatchList() end */
	
	$(function(){
		$("#leftarrow").addClass("disabled");
		getMatchList();
		
		$(".arrow").on("click", function(){
			if(doubleSubmitCheck()) return;
			var bool = $(this).hasClass("disabled");
			if(!bool){
				var id = $(this).attr("id");
				if(id == "leftarrow"){
					moveMonth("p");
				}else if(id == "rightarrow"){
					moveMonth("n");
				}
			}
		});
		
		$(document).on("click", ".btn", function(){
			var $this = $(this);
			var mcode = $this.parents().eq(3).attr("id");
		//	alert(mcode);
			location.href="reserve.do?mcode="+mcode;
		});
	})
</script>

<%@ include file="footer.jsp"%>