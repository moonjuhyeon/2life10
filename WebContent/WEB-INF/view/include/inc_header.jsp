<%@page import="com.cl.util.HttpUtil"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page import= "com.cl.util.SessionUtil"%>
<%@ page import= "com.cl.util.CmmUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String uri = CmmUtil.nvl(request.getRequestURI().split("//")[1]);
	
	Cookie[] cookies = request.getCookies();
	
	Map<String, String> cookieMap = new HashMap<>();
	if(cookies != null){
		for (int i = 0; i < cookies.length; i++) {
			cookieMap.put(cookies[i].getName(), cookies[i].getValue());
		} 
	}
	
	if (uri.equals("appli/appli_form.jsp")) {
		String uType = HttpUtil.getUtype(request);
		if (!"".equals(uType)) {
			if (!cookieMap.containsKey("visitID")) {
				SimpleDateFormat sd = new SimpleDateFormat("yyyyMMddHHmmss");
				Cookie info = new Cookie("visitID", uType + sd.format(new Date()));
				//info.setMaxAge(365 * 24 * 60 * 60);
				info.setPath("/");
				response.addCookie(info);
			}
		}
	}else{
		if(cookieMap.containsKey("visitID")){
			
			HashMap<String, String> hashmapJson = new HashMap<String, String>();
			HashMap<String, Object> hashmapRes = new HashMap<String, Object>();
			
			try{
				hashmapJson.put("visitID", cookieMap.get("visitID"));
				hashmapJson.put("URL", uri);
				String charSet = "UTF-8";
				HashMap<String, String> hashmapResponse = (HashMap<String, String>) HttpUtil.callURL("http://www.4christian.co.kr/visitStatistics/visit.do", null, hashmapJson, charSet);
				if ("200".equals(hashmapResponse.get("httpStatus"))){
					//통신성공
				}else{
					//통신 실패
				}
			}catch(Exception e){
				
			}
			
		}
	}
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>:크리스찬상조(주):</title>
<style>
.my-tooltip{
	max-width:300px;
}

@media screen and (max-width:800px){
	.my-tooltip{
		max-width:150px;
	}
}


#counsel .psyBtnDefaultForm {
    width: 160px;
    margin-right: 0;
    padding: 15px 30px;
}
.btnArea a, .btnArea button {
    margin-right: 6px;
}
.psyBtnDefaultForm, a.psyBtnDefaultForm {
    display: inline-block;
    padding: 10px 15px;
    background-color: #105d99;
    font-size: 1.5rem;
    color: #fff;
    border: none;
    border-radius: 3px;
    margin-top: 5px;
}



</style>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width" />
<link type="text/css" rel="stylesheet" href="/public/css/default.css" />
<link type="text/css" rel="stylesheet" href="/public/css/layout_kor.css" />
<link type="text/css" rel="stylesheet" href="/public/css/sub_kor.css" />
<script type="text/javascript" src="/public/js/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="/public/js/TweenMax.min.js"></script>
<script type="text/javascript" src="/public/js/common.js"></script>
<script type="text/javascript" src="/public/js/contents.js"></script>
<script type="text/javascript" src="/public/js/jquery.form.js"></script>
<script type="text/javascript" src="/public/js/jquery.rss.js"></script>

<!--[if lt IE 9]>
	<script src="/js/html5.js"></script>
	<script src="/js/respond.js"></script>
<![endif]-->
<script type="text/javascript">
</script>
<body>
<div id="skipnavi">
	<a href="#contentsWrap">본문 바로가기</a>
</div>
<div class="wrap">
	<div class="header">
		<div class="container">
			
			<header>
				<h1 class="logo">
					<a href="/main.do"><img src="/public/img/common/t_logo_new.png" alt="크리스찬라이프" /></a>
					
				</h1>

				<div class="topMenuWrap">
					<ul>
						<li><a href="/appli/appliForm.do">온라인가입신청</a></li>
						<%if("".equals((String)session.getAttribute("ss_member_no"))||session.getAttribute("ss_member_no")!=null){%>
							<li><a href="/member/chgPass.do">회원정보변경</a></li>
							<li><a href="/member/logout.do">로그아웃</a></li>
							<%if( ("A".equals((String)session.getAttribute("ss_member_auth")) || "CEO".equals((String)session.getAttribute("ss_member_auth"))) ){%>
								<li><a href="/Lmin/notice/noticeList.do">관리자페이지</a></li>
							<%}%>
						<%}else{%>
							<li><a href="/member/login.do">로그인</a></li>
							<li><a href="/member/joinStep.do">회원가입</a></li>
						<%}%>
					</ul>
				</div>
				<button type="button" class="btnMenuView"><span>전체메뉴 열기</span></button> <!-- .btnMenuView 클릭시 megaMenu에 다중클래스 open, .menuWrap .depth01 li:first-child에 클래스 on 추가 -->
				
				<div class="lnb">
					<div class="megaMenu">
						<div class="container">
							<section>
								<h2>전체메뉴</h2>
								<button type="button" class="btnMenuClose"><span>전체메뉴 닫기</span></button>
								<div class="menuWrap">
									<nav>
										<ul class="depth01">
											<li> <!-- 1depth: a에 클릭시 클래스 on 추가 -->
												<a href="javascript:">회사소개</a>
												<div class="depthWrap">
													<div class="depthArea">
														<div class="overviewArea">
															<aside>
																<strong><img src="/public/img/gnb/img_online.png" alt="온라인상품가입" /></strong>
																<div class="btnArea">
																	<a href="javascript:goMenu('/appli/appliForm.do', 'MN10100');" class="btnDefault">바로가기<span class="iconGoArrow"></span></a>
																</div>
															</aside>
														</div>

														<div class="depth02">
															<ul class="sub_depth">
																<li><a href="javascript:goMenu('/company/overView.do', 'MN10100');">인사말</a></li>
																<li><a href="javascript:goMenu('/company/organ.do', 'MN10200');">조직도및연혁</a></li>
																<!-- <li><a href="javascript:goMenu('/company/branchList.do', 'MN10300');">전국지사안내</a></li>
																<li><a href="javascript:goMenu('/company/adviceList.do', 'MN10400');">상담사조회</a></li> -->
																<li><a href="javascript:goMenu('/company/cyberList.do', 'MN10500');">사이버홍보실</a></li>
																<li><a href="javascript:goMenu('/company/road.do', 'MN10600');">오시는길</a></li>
															</ul>
														</div>
													</div>
												</div>
											</li>
											<li>
												<a href="javascript:">상조상품안내</a>
												<div class="depthWrap">
													<div class="depthArea">
														<div class="depth02">
															<ul class="sub_depth">
																<li><a href="javascript:goMenu('/info/proInfo.do', 'MN20100');">상조상품특징</a></li>
																<li><a href="javascript:goMenu('/info/joinStep.do', 'MN20200');">가입절차</a></li>
																<li><a href="javascript:goMenu('/info/catalogue.do', 'MN20300');">웹카다로그</a></li>
																<li><a href="javascript:goMenu('/info/endPro.do', 'MN20400');">단종상품안내</a></li>
															</ul>
														</div>
													</div>
												</div>
											</li>
											<li>
												<a href="javascript:">장례상품</a>
												<div class="depthWrap">
													<div class="depthArea">
														<div class="depth02">
															<ul class="sub_depth">
																<li id="MO30100"><a href="javascript:goMenu('/funeral/funeralMark.do', 'MO30100');">장례상품특징</a></li>
																<li id="MO31100"><a href="javascript:goMenu('/funeral/funeralList_b.do', 'MO31100');">장례상품</a></li>
																<li id="MO30200"><a href="javascript:goMenu('/funeral/funeralInfo_a.do', 'MO30200');">장례정보</a></li>
																<li id="MO30300"><a href="javascript:goMenu('/funeral/funeralNoticeList.do', 'MO30300');">부고알림</a></li>
															</ul>
														</div>
													</div>
												</div>
											</li>
											<li>
												<a href="javascript:">웨딩상품</a>
												<div class="depthWrap">
													<div class="depthArea">
														<div class="depth02">
															<ul class="sub_depth">
			                                                    <li><a href="javascript:goMenu('/marry/marryMark.do', 'MN40100');">웨딩상품특징</a></li>
			                                                    <li><a href="javascript:goMenu('/marry/marryList_d.do', 'MN40200');">웨딩상품</a></li>
															</ul>
														</div>
													</div>
												</div>
											</li>
											<li>
												<a href="javascript:">크루즈상품</a>
												<div class="depthWrap">
													<div class="depthArea">
														<div class="depth02">
															<ul class="sub_depth">
			                                                    <li><a href="javascript:goMenu('/cruise/cruiseMark.do', 'MN50200');">크루즈상품특징</a></li>
																<li><a href="javascript:goMenu('/cruise/cruisePro.do', 'MN50200');">크루즈성지순례상품</a></li>
			                                                    <li><a href="javascript:goMenu('/cruise/cruiseScheduleList.do', 'MN50300');">크루즈일정</a></li>
															</ul>
														</div>
													</div>
												</div>
											</li>
											<li>
												<a href="javascript:">고객센터</a>
												<div class="depthWrap">
													<div class="depthArea">
														<div class="depth02">
															<ul class="sub_depth">
																<li id="MO60100"><a href="javascript:goMenu('/notice/noticeList.do', 'MO60100');">공지사항</a></li>
									                            <li id="MO60200"><a href="javascript:goMenu('/qna/qnaList.do', 'MO60200');">자주하는질문</a></li>
									                            <li id="MO60300"><a href="javascript:goMenu('/counsel/counselWrite.do', 'MO60300');">1:1상담</a></li>
									                            <li id="MO60400"><a href="javascript:goMenu('/infomation/infomation_a.do', 'MO60400');">주요정보고시사항</a></li>
									                            <li id="MO60500"><a href="javascript:goMenu('/regulation/regulationList.do', 'MO60500');">상조관련법규</a></li>
									                            <li id="MO60600"><a href="javascript:goMenu('/agreement/agreementList.do', 'MO60600');">이용약관</a></li>
									                            <li id="MO60700"><a href="javascript:goMenu('/inquiry/inquiryList.do', 'MO60700');">납부조회</a></li>
									                            <li id="MO60800"><a href="javascript:goMenu('/appli/appliForm.do', 'MO60800');">가입상담신청</a></li>
									                            <%if("".equals(CmmUtil.nvl((String)session.getAttribute("ss_member_no")))){%>
										                            <li id="MO60900"><a href="javascript:goMenu('/member/login.do', 'MO60900');">로그인</a></li>
									                            <% }else{%>
									                            	<li id="MO60900"><a href="javascript:goMenu('/member/logout.do', 'MO60900');">로그아웃</a></li>
									                            	<%if( ("A".equals((String)session.getAttribute("ss_member_auth")) || "CEO".equals((String)session.getAttribute("ss_member_auth"))) ){%>
																		<li id="MO61000"><a href="javascript:goMenu('/Lmin/notice/noticeList.do', 'MO61000');">관리자페이지</a></li>
																	<%}%>									                            	
									                            <% } %>
												                            
															</ul>
														</div>
													</div>
												</div>
											</li>
										</ul>
										
									</nav>
								</div>
							</section>
						</div>
						<button type="button" class="btnGnbClose"><span>전체메뉴 닫기</span></button>
						<div class="dim"></div>
						<!--<div class="utility">-->
							<!--<ul>-->
								<!--<li class="eng"><a href="../index.jsp">Home</a></li>-->
								<!--<li><a href="../etc/sitemap.jsp">Sitemap</a></li>-->
							<!--</ul>-->
						<!--</div>-->
					</div>
				</div>
			</header>
		</div>
	</div> <!-- // header -->