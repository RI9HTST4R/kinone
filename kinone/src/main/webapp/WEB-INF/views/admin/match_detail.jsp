<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<style>
.anchor-btn, .anchor-btn:hover {
text-decoration: none;
background-color: white;
color: black;
border: 1px solid lightgray;
padding: 5px 10px 5px 10px;
font-size: 10pt;
cursor: pointer;
width: 50px;
text-align: center;
}
.anchor-btn:hover {
background-color: lightgray;
color: white;
}
.lineup-container {
  display: inline-block;
  /* border: 1px solid red; */
  margin: 0 20px;
}
.clubname {
  text-align: center;
}
.lineup-content {
  padding: 10px;
  border: 1px solid lightgray;
  display: table;
  background-color: lightgray;
}
.playerlist, .lineup-wrapper {
  display: inline-block;
}
.lineup, .deletebtn {
  display: table;
  width: 100%;
  /* border: 1px solid green; */
}
.deletebtn {
	margin: 15px 0 15px 0;
	text-align: right;
}
.delbtn, .delbtn:hover {
	font-size: 8pt;
}
.selectbtn, .selectbox {
  display: table-cell;
}
.selectbox {
  width: 200px;
  /* border: 1px solid blue; */
}
.selectbtn {
  width: 50px;
  /* border: 1px solid blue; */
  vertical-align: middle;
  text-align: center;
}
/* -------------여기까지 라인업------------------ */
/* -------------여기부터 스코어------------------ */
#scorenstatus {
  /* border: 1px solid red; */
  /* height: 200px; */
  margin: 40px 0px 20px 20px;
}
.score {
  width: 50px;
  margin: 0 5px;
  height: 22px;
}
.scoreform-container {
  margin-top: 10px;
}
.slist {
	list-style: none;
	vertical-align: middle;
	line-height: 30px;
}
.slist > li > form {
	margin:0;
}
.slist > li > form > * {
	display: inline-block;
	vertical-align: middle;
}
#hscorer, #ascorer {
	/* border: 1px solid red; */
}
.delline {
	border-radius: 50px;
	padding: 1px 3px 7px 3px;
	font-size: 12px;
	width: 19px;
    height: 19px;
}
.chxbox {
	margin: 0;
}
.resultinput {
	width: 80px;
	padding: 5px 10px 5px 10px;
}
#mask {
  position:fixed;  
  z-index:9000; 
  background-color:#000;
  opacity: 0.5;  
  display: none;  
  background-image: url("/kinone/resources/images/loading2.gif");
  background-repeat: no-repeat;
  background-position: center;
}
</style>

<div class="container">
	<div class="wrapper">
		<h1 id="title">매치 편집</h1>
		<hr>
		<div id="lineedit">
			<div class="lineup-container" align="left">
				<h3>홈 라인업 설정</h3>
				<br/>
				<br/>
				<h4 class="clubname">${match.cname_short_h}</h4>
				<div class="lineup-content" align="left">
					<div class="playerlist">
						<select class="selectbox homeplayer" multiple size="22">
							<optgroup label="GK">
						<c:forEach var="player" items="${pList_home}">
							<c:if test='${player.position == "GK"}'>
								<option value="${player.pcode}">(No.${player.pno})${player.pname}</option>
							</c:if>
						</c:forEach>
							</optgroup>
							<optgroup label="DF">
						<c:forEach var="player" items="${pList_home}">
							<c:if test='${player.position == "DF"}'>
								<option value="${player.pcode}">(No.${player.pno})${player.pname}</option>
							</c:if>
						</c:forEach>
							</optgroup>
							<optgroup label="MF">
						<c:forEach var="player" items="${pList_home}">
							<c:if test='${player.position == "MF"}'>
								<option value="${player.pcode}">(No.${player.pno})${player.pname}</option>
							</c:if>
						</c:forEach>
							</optgroup>
							<optgroup label="FW">
						<c:forEach var="player" items="${pList_home}">
							<c:if test='${player.position == "FW"}'>
								<option value="${player.pcode}">(No.${player.pno})${player.pname}</option>
							</c:if>
						</c:forEach>
							</optgroup>
						</select>
					</div>
					<div class="lineup-wrapper">
						<div class="lineup starting-lineup" style="margin-bottom: 5px;">
							<div class="selectbtn">
								<a class="anchor-btn" onClick="selected(this)">&gt;&gt;</a>
							</div>
							<select class="selectbox starting" id="homestarting" multiple size="12">
								<optgroup label="선발 목록">
							<c:forEach var="starting" items="${lu.hStarting}">
								<option value="${starting.pcode}">(No.${starting.pno})${starting.pname}</option>
							</c:forEach>
								</optgroup>
							</select>
						</div>
						<div class="deletebtn">
							<a class="delbtn anchor-btn" onClick="delAllList('starting',this)">선발 삭제</a>
							<a class="delbtn anchor-btn" onClick="delAllList('substitute',this)">후보 삭제</a>
							<a class="delbtn anchor-btn" onClick="delPlayer(this)">선택 삭제</a>
						</div>
						<div class="lineup substitute-lineup">
							<div class="selectbtn">
								<a class="anchor-btn" onClick="selected(this)">&gt;&gt;</a>
							</div>
							<select class="selectbox substitute" id="homesub" multiple size="7">
								<optgroup label="후보 목록">
							<c:forEach var="substitute" items="${lu.hSubstitute}">
								<option value="${substitute.pcode}">(No.${substitute.pno})${substitute.pname}</option>
							</c:forEach>
								</optgroup>
							</select>
						</div>
					</div>
				</div>
			</div>

			<div class="lineup-container" align="left">
				<h3>어웨이 라인업 설정</h3>
				<br/>
				<br/>
				<h4 class="clubname">${match.cname_short_a}</h4>
				<div class="lineup-content" align="left">
					<div class="playerlist">
						<select class="selectbox awayplayer" multiple size="22">
							<optgroup label="GK">
						<c:forEach var="player" items="${pList_away}">
							<c:if test='${player.position == "GK"}'>
								<option value="${player.pcode}">(No.${player.pno})${player.pname}</option>
							</c:if>
						</c:forEach>
							</optgroup>
							<optgroup label="DF">
						<c:forEach var="player" items="${pList_away}">
							<c:if test='${player.position == "DF"}'>
								<option value="${player.pcode}">(No.${player.pno})${player.pname}</option>
							</c:if>
						</c:forEach>
							</optgroup>
							<optgroup label="MF">
						<c:forEach var="player" items="${pList_away}">
							<c:if test='${player.position == "MF"}'>
								<option value="${player.pcode}">(No.${player.pno})${player.pname}</option>
							</c:if>
						</c:forEach>
							</optgroup>
							<optgroup label="FW">
						<c:forEach var="player" items="${pList_away}">
							<c:if test='${player.position == "FW"}'>
								<option value="${player.pcode}">(No.${player.pno})${player.pname}</option>
							</c:if>
						</c:forEach>
							</optgroup>
						</select>
					</div>
					<div class="lineup-wrapper">
						<div class="lineup starting-lineup" style="margin-bottom: 5px;">
							<div class="selectbtn">
								<a class="anchor-btn" onClick="selected(this)">&gt;&gt;</a>
							</div>
							<select class="selectbox starting" id="awaystarting" multiple size="12">
								<optgroup label="선발 목록">
							<c:forEach var="starting" items="${lu.aStarting}">
								<option value="${starting.pcode}">(No.${starting.pno})${starting.pname}</option>
							</c:forEach>
								</optgroup>
							</select>
						</div>
						<div class="deletebtn">
							<a class="delbtn anchor-btn" onClick="delAllList('starting',this)">선발 삭제</a>
							<a class="delbtn anchor-btn" onClick="delAllList('substitute',this)">후보 삭제</a>
							<a class="delbtn anchor-btn" onClick="delPlayer(this)">선택 삭제</a>
						</div>
						<div class="lineup substitute-lineup">
							<div class="selectbtn">
								<a class="anchor-btn" onClick="selected(this)">&gt;&gt;</a>
							</div>
							<select class="selectbox substitute" id="awaysub" multiple size="7">
								<optgroup label="후보 목록">
							<c:forEach var="substitute" items="${lu.aSubstitute}">
								<option value="${substitute.pcode}">(No.${substitute.pno})${substitute.pname}</option>
							</c:forEach>
								</optgroup>
							</select>
						</div>
					</div>
				</div>
			</div>
		</div>
		<br/>
		<br/>
		<a class="anchor-btn" style="margin-left:20px;" onClick="save('${match.mcode}')">라인업 저장</a>
		<input type="hidden" id="focusObj"/>
		<hr>
		<div id="scorenstatus">
			<input type="hidden" id="mstatus" value="${match.mstatus}"/>
			<h3>매치 상태 설정 및 스코어 입력</h3>
		<c:if test="${empty lu.hStarting or empty lu.hSubstitute or empty lu.aStarting or empty lu.aSubstitute}">
			<span style="font-size: 10pt; color: red; font-weight: bold; font-style: italic;">라인업 등록 후 가능합니다.</span>
		</c:if>
			
			<br /> 
	<c:if test="${match.mstatus == 0}"><!-- 경기전 -->
		<c:if test="${empty lu.hStarting or empty lu.hSubstitute or empty lu.aStarting or empty lu.aSubstitute}">
			<input type="checkbox" id="status" name="status" disabled />
		</c:if>
		<c:if test="${not empty lu.hStarting and not empty lu.hSubstitute and not empty lu.aStarting and not empty lu.aSubstitute}">
			<input type="checkbox" id="status" name="status" />
		</c:if>
	</c:if>
		<c:if test="${match.mstatus == 1}"><!-- 경기종료 -->
			<input type="checkbox" id="status" name="status" disabled checked />
		</c:if>
			<label for="status">경기 종료</label> <span
				style="font-style: italic; color: gray; font-size: 10pt;">경기
				종료 체크 후 스코어 입력 가능합니다.</span>
			<div class="scoreform-container">
				<input type="hidden" name="mcode" value="${match.mcode}"/>
				${match.cname_short_h}(home) <input class="score" type="number" id="hscore" name="homescore" min="0" 
				<c:if test="${empty match.homescore}">value="0"</c:if>
				<c:if test="${not empty match.homescore}">value="${match.homescore}"</c:if> >:<input
					class="score" type="number" id="ascore" name="awayscore" min="0"
				<c:if test="${empty match.awayscore}">value="0"</c:if>
				<c:if test="${not empty match.awayscore}">value="${match.awayscore}"</c:if> > ${match.cname_short_a}(away)
				<br/>
				<br/>
				<br/>
			
				<div id="hscorer">
					<h4 style="font-weight: bold;">${match.cname_short_h} 득점자</h4> &nbsp;&nbsp; <button type="button" class="btn btn-info" onClick="addScorer(this)">+추가</button><br/><br/>
					<div class="homescorer">
					<c:if test="${match.mstatus == 1 and not empty scoreInfo}">
						<ul style="list-style: decimal; font-size: 12pt; font-style: italic;">
							<c:forEach var="score" items="${scoreInfo}">
							<c:if test='${score.ccode == match.ccode_home}'>
							<li>
								<span style="color: red; font-weight: bold;">${score.goaltime}'</span> ${score.pname}
								<c:if test="${not empty score.isas}">
								(<span style="color: red; font-weight: bold;">as</span>.${score.asname})
								</c:if>
							</li>
							</c:if>
							</c:forEach>
						</ul>
					</c:if>
					<c:if test="${match.mstatus == 0 and empty scoreinfo}">
						<ul class="slist">
							<li class="scoreinfolist" id="hscorer1">
								<form>
									<button type="button" class="btn btn-danger delline" onClick="delScorer(this)">x</button>&nbsp;&nbsp;
									<select class="selbox" id="hscore1" name="pcode">
								<c:forEach var="hs" items="${pList_home}">
									<c:if test='${hs.position != "GK"}'>
										<option value="${hs.pcode}">${hs.pname}</option>
									</c:if>
								</c:forEach>
									</select>
									<input type="hidden" name="mcode" value="${match.mcode}"/>
									<input type="hidden" name="ccode" value="${match.ccode_home}"/>
								<c:forEach var="starting" items="${lu.aStarting}">
									<c:if test='${starting.position == "GK"}'>
									<input type="hidden" name="gkcode" value="${starting.pcode}"/>
									</c:if>
								</c:forEach>
									<span>득점 시간</span> &nbsp;&nbsp;
									<input type="number" class="score" id="hgoal1" name="goaltime" min="0" max="120"/>분 &nbsp;&nbsp;
									<input type="checkbox" class="chxbox" id="hisAssist1" onChange="addAssist(this, this.checked)"/> <label class="chxbox">도움 여부</label> &nbsp;&nbsp;
								</form>
							</li>
						</ul>
					</c:if>
					</div>
					
				</div>
				<hr style="border-style: dashed; border-color: black;">
				<div id="ascorer">
					<h4 style="font-weight: bold;">${match.cname_short_a} 득점자</h4> &nbsp;&nbsp; <button type="button" class="btn btn-info" onClick="addScorer(this)">+추가</button><br/><br/>
					<div class="awayscorer">
					<c:if test="${match.mstatus == 1 and not empty scoreInfo}">
						<ul style="list-style: decimal; font-size: 12pt; font-style: italic;">
							<c:forEach var="score" items="${scoreInfo}">
							<c:if test='${score.ccode == match.ccode_away}'>
							<li>
								<span style="color: red; font-weight: bold;">${score.goaltime}'</span> ${score.pname}
								<c:if test="${not empty score.isas}">
								(<span style="color: red; font-weight: bold;">as</span>.${score.asname})
								</c:if>
							</li>
							</c:if>
							</c:forEach>
						</ul>
					</c:if>
					<c:if test="${match.mstatus == 0 and empty scoreinfo}">
						<ul class="slist">
							<li class="scoreinfolist" id="ascorer1">
								<form>
									<button type="button" class="btn btn-danger delline" onClick="delScorer(this)">x</button>&nbsp;&nbsp;
									<select class="selbox" id="ascore1" name="pcode">
								<c:forEach var="as" items="${pList_away}">
									<c:if test='${as.position != "GK"}'>
										<option value="${as.pcode}">${as.pname}</option>
									</c:if>
								</c:forEach>
									</select>
									<input type="hidden" name="mcode" value="${match.mcode}"/>
									<input type="hidden" name="ccode" value="${match.ccode_away}"/>
								<c:forEach var="starting" items="${lu.hStarting}">
									<c:if test='${starting.position == "GK"}'>
									<input type="hidden" name="gkcode" value="${starting.pcode}"/>
									</c:if>
								</c:forEach>
									<span>득점 시간</span> &nbsp;&nbsp;
									<input type="number" class="score" id="agoal1" name="goaltime" min="0" max="120"/>분 &nbsp;&nbsp;
									<input type="checkbox" class="chxbox" id="aisAssist1" onChange="addAssist(this, this.checked)"/> <label class="chxbox">도움 여부</label> &nbsp;&nbsp;
								</form>
							</li>
						</ul>
					</c:if>
					</div>
				</div>
			</div>
			<br/>
			<br/>
			<c:if test="${match.mstatus == 0 and not empty lu.hStarting and not empty lu.hSubstitute and not empty lu.aStarting and not empty lu.aSubstitute}">
				<a class="anchor-btn" id="scorebtn" onClick="saveScore('${match.mcode}')">저장</a>
			</c:if>
				<a class="anchor-btn" onClick="location.href='/kinone/admin/matchList.do'">목록</a>
		</div>
	</div>
</div>

<script>
// 선발, 후보 라인업 전체 삭제
function delAllList(listname, obj){
	$(obj).parents().eq(1).find("."+listname).children().empty();
}

// 선택한 선수 목록 삭제
function delPlayer(btn){
	var onFocusObj = $("#focusObj").val();
//	alert(onFocusObj);
	
	var delarea = $(btn).parents().eq(1).find("."+onFocusObj);
	if($(delarea).attr('class') != undefined){
		$(delarea).find("option:selected").remove();
	}
	
}

// 셀렉트박스 포커스 될때 포커스 된 셀렉트박스 이름 저장
function addFocusObj(obj){
	$obj = $(obj);
	var classes = $obj.attr('class');
	var focusClass = classes.slice(10);
	$("#focusObj").val(focusClass);
}

// 선수를 라인업에 넣기
function selected(obj){
	var plist = $(obj).parents().eq(3).find(".selectbox"); // 선수리스트
	var lineupObj = $(obj).parents().eq(1).find(".selectbox > optgroup"); // 라인업리스트
	
	// 선택된 선수의 pcode
	var plistArr = plist.val();
	var plistText = [];
	plist.find("option:selected").each(function(){
		plistText.push($(this).text());
	});
	for(var i=0; i<plistArr.length; i++){
		lineupObj.append("<option value='"+plistArr[i]+"'>"+plistText[i]+"</option>");
	}	
}

// 저장 버튼을 눌러 편집 완료
function save(mcode){
	var hStartArr = new Array();
	var hSubArr = new Array();
	var aStartArr = new Array();
	var aSubArr = new Array();
	
	$("#homestarting option").each(function(index, item){
		hStartArr.push(item.value);
	});
	$("#homesub option").each(function(index, item){
		hSubArr.push(item.value);
	});
	$("#awaystarting option").each(function(index, item){
		aStartArr.push(item.value);
	});
	$("#awaysub option").each(function(index, item){
		aSubArr.push(item.value);
	});
	
	var hLineup = "";
	var aLineup = "";
	
	if(hStartArr.length == 11){
		if(hSubArr.length > 7){
			alert("홈팀의 후보 라인업 선수 숫자가 맞지 않습니다.");
			return;
		}else {
			hLineup += hStartArr.join(",");
			hLineup += "/";
			hLineup += hSubArr.join(",");
		}
	}else if(hStartArr.length > 0 && hStartArr.length < 11){
		alert("홈팀의 선발 라인업 선수 숫자가 맞지 않습니다.");
		return;
	}else if(hStartArr.length == 0){
		if(hSubArr.length > 0){
			alert("선발/후보 라인업을 모두 입력하세요.");
			return;
		}
	}
	
	
	if(aStartArr.length == 11){
		if(aSubArr.length > 7){
			alert("홈팀의 후보 라인업 선수 숫자가 맞지 않습니다.");
			return;
		}else {
			aLineup += aStartArr.join(",");
			aLineup += "/";
			aLineup += aSubArr.join(",");
		}
	}else if(aStartArr.length > 0 && aStartArr.length < 11){
		alert("홈팀의 선발 라인업 선수 숫자가 맞지 않습니다.");
		return;
	}else if(aStartArr.length == 0){
		if(aSubArr.length > 0){
			alert("선발/후보 라인업을 모두 입력하세요.");
			return;
		}
	}
	
	$.ajax({
		url: "/kinone/admin/updateMatchDetail.do",
		data: {"mcode":mcode, "homelineup":hLineup, "awaylineup":aLineup},
		dataType: "text",
		type: "post",
		success: function(data){
		//	alert(data);
			var result = parseInt($.trim(data));
			if(result === 1){
				alert("수정되었습니다.");
			}else {
				alert("실패..");
			}
			location.reload();
		}
	});	
}

// 스코어 등록
function saveScore(mcode){
	if(confirm("경기 종료 처리 및 스코어 등록을 하시겠습니까?")){
		var scorearr = $(".score");
	//	alert(scorearr.length);
		$.each(scorearr, function(idx, item){
			if($.trim($(item).val()) == ""){
			//	alert(idx);
				alert("스코어 및 득점 정보를 모두 입력하세요");
				return false;
			}else if($.trim($(item).val()) > 120 || $.trim($(item).val()) < 0){
				alert("잘못된 값이 입력되었습니다.");
				return false;
			}
			if(idx == (scorearr.length-1)){
				wrapMask();
			//	alert("마지막!");
				var hscorecnt = $("#hscorer").find(".score").length;
				var ascorecnt = $("#ascorer").find(".score").length;
			//	alert("홈:"+hscorecnt+" 어웨이:"+ascorecnt);
				if(parseInt($("#hscore").val()) != hscorecnt || parseInt($("#ascore").val()) != ascorecnt){
					alert("스코어와 득점자 수가 일치하지 않습니다.");
					return false;
				}else {
					updateScore(mcode);
				}
			}
		});
		
	}else {
		return;
	}
}
////////////////////////////////////////////////////////////////////////////////////
var hlineEle;
var alineEle;
function addAssist(obj, bool){
//	alert(bool);
	if(bool){
		var $li = $(obj).parents().eq(1);
		var selbox = $li.find("select").first().clone();
		var where = $li.attr("id").substring(0,1);
		var idx = $li.attr("id").substring(7);
		selbox.attr("id", where+"assist"+idx).attr("name", "isas");
		
	//	alert(selbox.attr("id"));
		$(obj).parent().append(selbox);
	}else {
		$(obj).next().next().remove();
	}
}

// 득점선수 추가
function addScorer(obj){
	var $ul = $(obj).parent().find(".slist")
	var $li = $ul.find("li").last();
	
	if($li.attr("id") == undefined){
		if($ul.parent().attr("class").substring(0,1) == "h"){
			$ul.append(hlineEle);
		}else {
			$ul.append(alineEle);
		}
	}else {
		var where = $li.attr("id").substring(0,1);
	//	alert("where:"+where)
		var liidx = parseInt($li.attr("id").substring(7))+1;
	//	alert("liidx:"+liidx)
		var $liclone = $li.clone();
		$liclone.attr("id", where+"scorer"+liidx);
		var $firstselect = $liclone.find("select").first();
		$firstselect.attr("id", where+"score"+liidx).attr("name", "pcode");
		$liclone.find(".score").attr("id", where+"goal"+liidx).attr("name", "goaltime").val("");
		var $chxbox = $liclone.find(".chxbox");
		$chxbox.attr("id", where+"isAssist"+liidx);
		if($chxbox.is(":checked")){
			$liclone.find("select").last().remove();
			$chxbox.prop("checked", false);
		}
		
		$ul.append($liclone);
	}
	
}

// 득점선수 삭제
function delScorer(obj){
	var $li = $(obj).parents().eq(1);
	var $chxbox = $li.find(".chxbox");
	if($li.attr("id").substring(7) == "1"){
		if($chxbox.is(":checked")){
			$li.find("select").last().remove();
			$chxbox.prop("checked", false);
		}
		if($li.attr("id").substring(0,1) == "h"){
			hlineEle = $li.detach();
		}else {
			alineEle = $li.detach();
		}
	}else {
		$li.remove();
	}	
}

// 스코어 업데이트
function updateScore(mcode){
	var homescore = $("#hscore").val();
	var awayscore = $("#ascore").val();
	   
	$.ajax({
		url: "/kinone/admin/matchEnd.do",
		data: {"mcode":mcode, "homescore":homescore, "awayscore":awayscore},
		dataType: "text",
		type: "post",
		success: function(data){
		//	alert(data);
			var result = parseInt($.trim(data));
			if(result === 1){
				var arr = $(".scoreinfolist");
				serialForm(arr, 0);
				alert("스코어가 수정되었습니다.");
			}else {
				alert("실패..");
			}
		}
	});
}

// 득점 및 도움 입력
function serialForm(arr, idx){
	if(arr.length == 0){
	//	alert("득점자가 없네?!");
		location.reload();
		unwrapMask();
		return;
	}else {
		var e = arr[idx];
		var dataForm = $(e).find("form");
		var dataObj = dataForm.serialize();
		
		$.ajax({
			url: "/kinone/admin/scoreInsert.do",
			data: dataObj,
			dataType: "text",
			type: "post",
			success: function(data){
			//	alert(data);
				if(idx == (arr.length-1)){
					location.reload();
					unwrapMask();
					alert("편집 완료");
					return false;
				}else {
					serialForm(arr, (idx+1));
				}
			},
			error : function(request,status,error) {
	        	alert("code:"+request.status+"\n\n"+"message:"+request.responseText+"\n\n"+"error:"+error);
	        	alert($(request.responseText.replace(/(\r\n|\n|\r)/gm,"")).text());
	        	return false;
			}
		});
	}
	
}

function wrapMask(){
	// 화면의 높이와 너비를 구한다.
	var maskWidth  = document.body.scrollWidth;
	var maskHeight = document.body.scrollHeight;
	
	// 마스크의 높이와 너비를 화면 것으로 만들어 전체 화면을 채운다.
	$('#mask').css({'width':maskWidth,'height':maskHeight, 'display':'block', 'left':'0', 'top': '0'});
}

function unwrapMask(){
	$('#mask').css("display","none");
}
/////////////////////////////////////////////////////////////////////////////////////

$(function(){
	$(".scoreform-container").css("display","none");
	$("select").attr('onfocus','addFocusObj(this)');
	
	// 매치가 이미 종료되었으면 스코어 수정할 수 없도록 한다.
	var mstatus = $("#mstatus").val();
	if(mstatus == 1){
		$(".score").prop("readOnly", true);
		$("#scorebtn").prop("disabled", true);
		$(".btn").prop("disabled", true);
		$(".scoreform-container").show();
	}
	
	// 체크박스를 통해 스코어 등록할 수 있도록
	$("#status").change(function(){
		var bool = $("#status").is(":checked");
	//	alert(bool);
		if(bool){
			$(".scoreform-container").css("display","block");
		}else {
			$(".scoreform-container").css("display","none");
		}
	});
})
</script>

<%@ include file="footer.jsp"%>