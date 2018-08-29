<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>




			
			<div class="wrap_content" align="center">
				<div class="wrap_remain">
					<!-- 왼쪽 페이지 -->
					<div class="remain_left">
						<div class="left-top">
							<span>2018 K리그 순위</span>
						</div>
						<ul class="nav nav-pills nav-justified nav-rank">
							<li class="nav-item"><a
								class="nav-link active font-weight-bold" data-toggle="tab"
								href="#K1_rank">K리그 1</a></li>
							<li class="nav-item"><a class="nav-link font-weight-bold"
								data-toggle="tab" href="#K2_rank">K리그 2</a></li>
						</ul>
						<!-- 리그 순위 테이블 -->
						<div class="tab-content">
							<div id="K1_rank" class="tab-pane active">
								<table class="table rank-table">
									<thead>
										<tr>
											<th>순위</th>
											<th>클럽</th>
											<th>경기</th>
											<th>승점</th>
											<th>득점</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="k1clubseason" items="${k1ClubSeasonRankList}"
											varStatus="status">
											<tr>
												<td>${k1clubseason.rno}</td>
												<td><img src="${url}/resources/emblem/${k1clubseason.ccode}.png" title="${k1clubseason.cname_short}"/></td>
												<td>${k1clubseason.win + k1clubseason.draw + k1clubseason.lose}</td>
												<td>${k1clubseason.win * 3 + k1clubseason.draw}</td>
												<td>${k1clubseason.c_ggoal}</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
							<div id="K2_rank" class="tab-pane">
								<table class="table rank-table">
									<thead>
										<tr>
											<th>순위</th>
											<th>클럽</th>
											<th>경기</th>
											<th>승점</th>
											<th>득점</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="k2clubseason" items="${k2ClubSeasonRankList}"
											varStatus="status">
											<tr>
												<td>${k2clubseason.rno}</td>
												<td><img src="${url}/resources/emblem/${k2clubseason.ccode}.png" title="${k2clubseason.cname_short}"/></td>
												<td>${k2clubseason.win + k2clubseason.draw + k2clubseason.lose}</td>
												<td>${k2clubseason.win * 3 + k2clubseason.draw}</td>
												<td>${k2clubseason.c_ggoal}</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
						<!-- 리그 순위 테이블 끝 -->
					</div>
					<!-- 왼쪽 페이지 끝 -->
					<!-- 오른쪽 페이지 -->
					<div class="remain_right">
						
						<!-- 뉴스 -->
						<div class="right-menu recent-news">
							<div class="top news-top" align="left">
								<span class="subject" id="news-subject">K리그 소식</span><a
									class="more" href="${url}/kleagueNews.do">더보기 &gt;</a>
							</div>
							<div class="news-content" align="center">
								<c:forEach var="news" items="${news_list}">
								<div class="news">
									<div class="news-image">
										<a href="${url}/news_cont.do?bno=${news.bno}"><img src="${url}/resources/board_upload/${news.image}" title="${news.subject}"></a>
									</div>
									<div class="news-title" align="justify">
										<a href="${url}/news_cont.do?bno=${news.bno}" title="${news.subject}">${news.subject}</a>
									</div>
								</div>
								</c:forEach>
							</div>
						</div>
						<!-- 뉴스 끝 -->
						<hr>
						<!-- 현 시즌 선수 기록 -->
						<div class="right-menu player-rank">
							<!-- 리그 1 -->
							<div class="rank_wrap">
								<div class="top rank-top" align="left">
									<span class="subject">2018 K리그 1 선수 기록</span><a class="more"
										href="${url}/rank.do">더보기 &gt;</a>
								</div>
								<hr>
								<div class="rank-content" align="center">
									<div class="goal-rank">
										<ul class="rank-list">
											<li class="rank-subject">
												<div align="center">최다 득점</div>
											</li>
											<c:forEach var="k1playerseason"
												items="${k1PlayerSeasonGRankList}" varStatus="status">
												<li class="rank-detail">
													<div class="rank font-weight-bold">
														<h3>${k1playerseason.rno}</h3>
													</div>
													<div class="pimage">
														<img
															src="${url}/resources/player/${k1playerseason.ccode}/${k1playerseason.pcode}.png"
															title="${k1playerseason.pname}">
													</div>
													<div class="pinfo" align="justify">
														<div class="player">
															<strong>${k1playerseason.pname}</strong><span>(${k1playerseason.position})</span>
														</div>
														<span class="club">${k1playerseason.cname_short}</span>
														<div class="stats">${k1playerseason.p_ggoal}<img
																src="${url}/resources/images/goals.png">
														</div>
													</div>
												</li>
											</c:forEach>
										</ul>
									</div>
									<div class="assist-rank">
										<ul class="rank-list">
											<li class="rank-subject">
												<div align="center">최다 도움</div>
											</li>
											<c:forEach var="k1playerseason"
												items="${k1PlayerSeasonARankList}" varStatus="status">
												<li class="rank-detail">
													<div class="rank font-weight-bold">
														<h3>${k1playerseason.rno}</h3>
													</div>
													<div class="pimage">
														<img
															src="${url}/resources/player/${k1playerseason.ccode}/${k1playerseason.pcode}.png"
															title="${k1playerseason.pname}">
													</div>
													<div class="pinfo" align="justify">
														<div class="player">
															<strong>${k1playerseason.pname}</strong><span>(${k1playerseason.position})</span>
														</div>
														<span class="club">${k1playerseason.cname_short}</span>
														<div class="stats">${k1playerseason.p_assist}<img
																src="${url}/resources/images/assist.png">
														</div>
													</div>
												</li>
											</c:forEach>
										</ul>
									</div>
								</div>
							</div>
							<!-- 리그 1 끝 -->
							<!-- 리그 2 -->
							<div class="rank_wrap">
								<div class="top rank-top" align="left">
									<span class="subject">2018 K리그 2 선수 기록</span><a class="more"
										href="${url}/rank.do">더보기 &gt;</a>
								</div>
								<hr>
								<div class="rank-content" align="center">
									<div class="goal-rank">
										<ul class="rank-list">
											<li class="rank-subject">
												<div align="center">최다 득점</div>
											</li>
											<c:forEach var="k2playerseason"
												items="${k2PlayerSeasonGRankList}" varStatus="status">
												<li class="rank-detail">
													<div class="rank font-weight-bold">
														<h3>${k2playerseason.rno}</h3>
													</div>
													<div class="pimage">
														<img
															src="${url}/resources/player/${k2playerseason.ccode}/${k2playerseason.pcode}.png"
															title="${k2playerseason.pname}">
													</div>
													<div class="pinfo" align="justify">
														<div class="player">
															<strong>${k2playerseason.pname}</strong><span>(${k2playerseason.position})</span>
														</div>
														<span class="club">${k2playerseason.cname_short}</span>
														<div class="stats">${k2playerseason.p_ggoal}<img
																src="${url}/resources/images/goals.png">
														</div>
													</div>
												</li>
											</c:forEach>
										</ul>
									</div>
									<div class="assist-rank">
										<ul class="rank-list">
											<li class="rank-subject">
												<div align="center">최다 도움</div>
											</li>
											<c:forEach var="k2playerseason"
												items="${k2PlayerSeasonARankList}" varStatus="status">
												<li class="rank-detail">
													<div class="rank font-weight-bold">
														<h3>${k2playerseason.rno}</h3>
													</div>
													<div class="pimage">
														<img
															src="${url}/resources/player/${k2playerseason.ccode}/${k2playerseason.pcode}.png"
															title="${k2playerseason.pname}">
													</div>
													<div class="pinfo" align="justify">
														<div class="player">
															<strong>${k2playerseason.pname}</strong><span>(${k2playerseason.position})</span>
														</div>
														<span class="club">${k2playerseason.cname_short}</span>
														<div class="stats">${k2playerseason.p_assist}<img
																src="${url}/resources/images/assist.png">
														</div>
													</div>
												</li>
											</c:forEach>
										</ul>
									</div>
								</div>
							</div>
							<!-- 리그 2 끝 -->
						</div>
						<!-- 현 시즌 선수 기록 끝 -->
						
						<!-- 클럽 바로가기  -->
						<div class="right-menu team-emblem">
							<div class="top emblem-top" align="left">
								<span class="subject" id="emblem-subject">클럽 바로가기</span>
							</div>

							<div class="emblem" align="left">
								<hr>
								<c:forEach var="club" items="${clubList}">
									<a href="clubDetail.do?ccode=${club.ccode}"><img
										src="${url}/resources/emblem/${club.ccode}.png"
										title="${club.cname_short}"></a>
								</c:forEach>
							</div>
						</div>
						<!-- 클럽 바로가기  끝 -->
					</div>
				</div>
			</div>

		
		
<%@ include file="footer.jsp" %>
