<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0 , maximum-scale=1.0, user-scalable=no" />
	<meta property="og:url" content="">
    <meta property="og:title" content="스마트마이디">
    <meta property="og:type" content="smartmyd">
    <meta property="og:image" content="">
    <meta property="og:description" content="make your dream | 스마트 마이디">
    <title>스마트마이디</title>
	<meta name="title" content="스마트마이디">
	<meta name="Subject" content="스마트마이디 광고시스템">
	<meta name="keywords" content="스마트마이디,온라인광고,모바일광고,DSP,SSP,advertisement,marketing,광고주,매체사,대행사">
	<meta name="Descript-xion" content="검증된 기술력과 다양한 광고상품을 바탕으로 모든 온라인 영역에서 광고주, 매체사, 사용자가 만족할 수 있는 최고의 마케팅 인사이트를 제공">
	<meta name="Description" content="PC&모바일&앱 광고 플랫폼으로 광고주,매체사 모두 만족할 수 있는 솔루션 제공">
	<meta name="Publisher" content="smartmyd">
	<meta name="Other Agent" content="smartmyd">
	<meta name="Distribution" content="smartmyd">
	<meta name="Copyright" content="smartmyd">
	<meta name="Author" content="smartmyd">
	<meta name="Robots" content="ALL">
	<meta name="format-detection" content="telephone=no" />
	<link rel="shortcut icon" type="image/x-icon" href="img/favicon.ico">

	<meta name="left_naver-site-verification" content="c349731bec9b45dc08ff278872c051d2008c245c">

	<!-- css -->
    <link src="css/fullpage.css">
    <link rel="stylesheet" href="./css/style.css?ver=202212211051">
    <link rel="stylesheet" href="https://unpkg.com/splitting@1.0.0/dist/splitting.css">
	
	<!-- favicon -->
	<link rel="icon" href="img/favicon.ico?ver=202212211051" sizes="16x16">
	<link rel="icon" href="img/favicon.ico?ver=202212211051" sizes="32x32">

	<!-- js -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/1.20.4/TweenMax.min.js"></script>
    <script src="./js/jquery.fullPage.js"></script>

	<!-- swiper -->
	<link rel="stylesheet" type="text/css" href="css/swiper.min.css">
	<script type="text/javascript" src="js/swiper.min.js"></script>
	
	<script>
		function onlyNumber(event) {
			event = event || window.event;
			var keyID = (event.which)
				? event.which
				: event.keyCode;
			if ((keyID >= 48 && keyID <= 57) || (keyID >= 96 && keyID <= 105) || keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39) 
				return;
			 else 
				return false;
		};
		//숫자만 입력
		function removeChar(event) {
			event = event || window.event;
			var keyID = (event.which)
				? event.which
				: event.keyCode;
			if (keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39) 
				return;
			 else 
				event.target.value = event
					.target
					.value
					.replace(/[^0-9]/g, "");
		};

    	$(document).ready(function(){
		//mobile start
			$(".container").click(function(){
				$(this).toggleClass("mobile_menu_icon_open");
				if ( $(this).is(".mobile_menu_icon_open") ) {
					$(".head_wrap").addClass("head_menu_open");
					$(".head_menu_wrap").addClass("right0");
					$(".mobile_menu_icon_bar").addClass("bar_black");
					$(".overlay").removeClass("none");
				} else {
					$(".head_wrap").removeClass("head_menu_open");
					$(".head_menu_wrap").removeClass("right0");
					$(".mobile_menu_icon_bar").removeClass("bar_black");
					$(".overlay").addClass("none");
				}
			});
			$(".head_menu ul li, .overlay").click(function(){
				$(".head_wrap").removeClass("head_menu_open");
				$(".head_menu_wrap").removeClass("right0");
				$(".container").removeClass("mobile_menu_icon_open");
				$(".overlay").addClass("none");
			});
		//mobile end
		});
		function mobile_left(){
			if (window.outerWidth <= 1280) {
				$(".wrap").addClass("left_close");
			} else {
				$(".wrap").removeClass("left_close");
			};
		};
		$(window).resize( function() {
			cont_list_height();
			mobile_left();
        });
	</script>
</head>
<body>
    <!-- cursor start-->
    <div class="cursor"></div>
    <div class="cursor-ring"></div>
    <!-- cursor end-->

    <div class="chap_list_wrap robo pc">
		<ul>
			<li class="chap_list on">
				<span></span>
				<div class="chap_list_wrap_title">
					<!-- Smart MyD -->
				</div>
			</li>
			
			<li class="chap_list">
				<span></span>
				<div class="chap_list_wrap_title">
					<!-- Smart MyD Info -->
				</div>
			</li>
			<li class="chap_list">
				<span></span>
				<div class="chap_list_wrap_title">
					<!-- Smart MyD About -->
				</div>
			</li>
			<li class="chap_list">
				<span></span>
				<div class="chap_list_wrap_title">
					<!-- Smart MyD 2.0 -->
				</div>
			</li>
			<li class="chap_list">
				<span></span>
				<div class="chap_list_wrap_title">
					<!-- Commerce MyD -->
				</div>
			</li>
			<li class="chap_list">
				<span></span>
				<div class="chap_list_wrap_title">
					<!-- Commerce MyD -->
				</div>
			</li>
			<li class="chap_list">
				<span></span>
				<div class="chap_list_wrap_title">
					<!-- Contact Us -->
				</div>
			</li>
			<li class="chap_list">
				<span></span>
				<div class="chap_list_wrap_title">
					<!-- Footer -->
				</div>
			</li>
		</ul>
	</div>

    <div class="wrap">
		<div class="head_wrap">
			<div class="head">
				<div class="head_cont_wrap">
					<div class="head_cont_logo">
						<a href="/">
							<img class="nomalLogo" src="./img/logo_w.png" class="head_top_logo">
							<img class="inverterLogo" src="./img/logo_b.png" class="head_top_logo">
						</a>
					</div>
					<div class="mobile_menu_icon_wrap">
						<div class="table0">
							<div class="cell">
								<div class="container">
                                    <div class="menu">
                                      <div class="hambergerIcon">
                                        
                                    </div>
                                </div>
							</div>
						</div>
					</div>
				</div>
                <div class="head_menu_wrap robo">
					<div class="head_menu_box">
						<div class="head_menu">
							<ul>
								<li>
									<a href="#1">
										Smart MyD
									</a>
								</li>
								<li>
									<a href="#4">
										Smart MyD 2.0
									</a>
								</li>
								<li>
									<a href="#5">
										Commerce MyD
									</a>
								</li>
								<li>
									<a href="#7">
										Contact Us
									</a>
								</li>
							</ul>
						</div>
					</div>
				</div>
				</div>
			</div>
		</div>
    </div>

	<div class="scroll">
		scroll Down
	</div>

	<div class="rightBtn">
		<a class="icon"  href="#7">
			<div href="#7" class="icon_1">
				<img src="./img/icon2.png" alt="icon"><span>제휴문의</span>
			</div>
		</a>
	</div>
	
    <div id="fullpage"> <!-- fullpage start-->
        <div class="section" id="section1"> 
			<div class="video1">
                <video src="./img/video1.mp4" autoplay loop muted data-keepplaying playsinline></video>
            </div>
            <div class="text">
                <h1 class="spread-out" data-splitting>smart myd</h1>
                <h3>AD-Tech</h3>
            </div>
        </div>

        <div class="section" id="section2">
            <div class="mainTxt2">
				<h1>Advertising is<br> now a technology</h1>

				<h3>AD-Tech 기업 <span>SMART MYD</span>의<br>강력한 Targeting 기술력으로 잠재고객에게 보다 빠르게 도달하세요.</h3>

				<p>스마트하게 분석한 데이터로 당신의 고객을 찾아 연결 해드립니다.</p>
			</div>
        </div>
        
        <div class="section" id="section3">
			<div class="wrap1">
				<div class="mainTxt3">
					<h1>all about ad</h1>
				</div>
				<div class="cont_text_wrap mo">
					<div class="diagram">
						<ul>
							<li>
								<div class="check">
									<div class="table0">
										<div class="cell">
											<div class="cont_text cont_text_inner cont_text_title ">
												광고주
											</div>
											<div class="cont_text cont_text_inner mt4">
												Advertiser
											</div>
										</div>
									</div>
								</div>
							</li>
							<li>
								<div class="check1 diagram_logo">
									<div class="table0 dot0">
										<div class="cell">
											<div class="cont_text cont_text_inner cont_text_title">
												<img src="./img/logo_w.png">
											</div>
										</div>
									</div>
								</div>
							</li>
							<li>
								<div class="check">
									<div class="table0">
										<div class="cell">
											<div class="cont_text cont_text_inner cont_text_title">
												고객(소비자)
											</div>
											<div class="cont_text cont_text_inner mt4">
												customer
											</div>
										</div>
									</div>
								</div>
							</li>
						</ul>
						<ul>
							<li>
								<ul>
									<li>
										<a>
											<div class="cont_text cont_text_inner cont_text_title">
												<span class="diagram_text diagram_text1">
													AD OPS
												</span>
												<span class="diagram_text diagram_text2">
													마이디 애즈
												</span>
											</div>
											<div class="cont_text cont_text_inner">
												
												<div class="cont_text_info cont_text_inner">
													마케팅자동화 플랫폼
												</div>
											</div>
										</a>
									</li>
									<li>
										<a>
											<div class="cont_text cont_text_inner cont_text_title">
												<span class="diagram_text diagram_text1">
													DMP
												</span>
												<span class="diagram_text diagram_text2">
													SKP DMP / 마이디 DMP
												</span>
											</div>
											<div class="cont_text cont_text_inner">
												
												<div class="cont_text_info cont_text_inner">
													데이터 관리 플랫폼
												</div>
											</div>
										</a>
									</li>
									<li>
										<a>
											<div class="cont_text cont_text_inner cont_text_title">
												<span class="diagram_text diagram_text1">
													DSP
												</span>
												<span class="diagram_text diagram_text2">
													스마트마이디2.0 / 커머스마이디
												</span>
											</div>
											<div class="cont_text cont_text_inner">
												
												<div class="cont_text_info cont_text_inner">
													광고 사이트 구매 플랫폼
												</div>
											</div>
										</a>
										<ul>
											<li>
												<a>
													<div class="cont_text cont_text_inner cont_text_title">
														<span class="diagram_text diagram_text1">
															ADX
														</span>
														<span class="diagram_text diagram_text2">
															마이디 exchange
														</span>
													</div>
													<div class="cont_text cont_text_inner">
														
														<div class="cont_text_info cont_text_inner">
															광고 중개 플랫폼
														</div>
													</div>
												</a>
												<ul>
													<li>
														<a>
															<div class="cont_text cont_text_inner cont_text_title">
																<span class="diagram_text diagram_text1">
																	SSP
																</span>
																<span class="diagram_text diagram_text2">
																	마이디 SSP
																</span>
															</div>
															<div class="cont_text cont_text_inner">
																
																<div class="cont_text_info cont_text_inner">
																	광고지면 판매 플랫폼
																</div>
															</div>
														</a>
														<ul>
															<li>
																<div class="check">
																	<div class="table0">
																		<div class="cell">
																			<div class="cont_text cont_text_inner cont_text_title">
																				매체
																			</div>
																			<div class="cont_text cont_text_inner mt4">
																				Publisher
																			</div>
																		</div>
																	</div>
																</div>
															</li>
														</ul>
													</li>
												</ul>
											</li>
										</ul>
									</li>	
								</ul>
							</li>
						</ul>
					</div>
				</div>

				<div class="cont_text_wrap pc">
					<div class="diagram">
						<ul>
							<li>
								<div class="check">
									<div class="table0">
										<div class="cell">
											<div class="cont_text cont_text_inner cont_text_title ">
												광고주
											</div>
											<div class="cont_text cont_text_inner mt4">
												Advertiser
											</div>
										</div>
									</div>
								</div>
							</li>
							<li style="padding-left:630px;">
								<div class="check1 diagram_logo">
									<div class="table0 dot0">
										<div class="cell">
											<div class="cont_text cont_text_inner cont_text_title">
												<img src="./img/logo_w.png">
											</div>
										</div>
									</div>
								</div>
							</li>
							<li style="padding-left:100px;">
								<div class="check">
									<div class="table0">
										<div class="cell">
											<div class="cont_text cont_text_inner cont_text_title">
												고객(소비자)
											</div>
											<div class="cont_text cont_text_inner mt4">
												customer
											</div>
										</div>
									</div>
								</div>
							</li>
						</ul>
						<ul>
							<li>
								<ul>
									<li>
										<a>
											<div class="cont_text cont_text_inner cont_text_title">
												<span class="diagram_text diagram_text1">
													AD OPS
												</span>
												<span class="diagram_text diagram_text2">
													마이디 애즈
												</span>
											</div>
											<div class="cont_text cont_text_inner">
												Advertisement Operation
												<div class="cont_text_info cont_text_inner">
													마케팅자동화 플랫폼
												</div>
											</div>
										</a>
									</li>
									<li>
										<a>
											<div class="cont_text cont_text_inner cont_text_title">
												<span class="diagram_text diagram_text1">
													DMP
												</span>
												<span class="diagram_text diagram_text2">
													SKP DMP / 마이디 DMP
													</span>
											</div>
											<div class="cont_text cont_text_inner">
												Data Management Platform
												<div class="cont_text_info cont_text_inner">
													데이터 관리 플랫폼
												</div>
											</div>
										</a>
									</li>
									<li>
										<a>
											<div class="cont_text cont_text_inner cont_text_title">
												<span class="diagram_text diagram_text1">
													DSP
												</span>
												<span class="diagram_text diagram_text2">
													스마트마이디2.0 / 커머스마이디
												</span>
											</div>
											<div class="cont_text cont_text_inner">
												Demand Side Platform
												<div class="cont_text_info cont_text_inner">
													광고 사이트 구매 플랫폼
												</div>
											</div>
										</a>
										<ul>
											<li>
												<a>
													<div class="cont_text cont_text_inner cont_text_title">
														<span class="diagram_text diagram_text1">
															ADX
														</span>
														<span class="diagram_text diagram_text2">
															마이디 exchange
														</span>
													</div>
													<div class="cont_text cont_text_inner">
														AD Exchange
														<div class="cont_text_info cont_text_inner">
															광고 중개 플랫폼
														</div>
													</div>
												</a>
												<ul>
													<li>
														<a>
															<div class="cont_text cont_text_inner cont_text_title">
																<span class="diagram_text diagram_text1">
																	SSP
																</span>
																<span class="diagram_text diagram_text2">
																	마이디 SSP
																</span>
															</div>
															<div class="cont_text cont_text_inner">
																Supply Side Platform
																<div class="cont_text_info cont_text_inner">
																	광고지면 판매 플랫폼
																</div>
															</div>
														</a>
														<ul>
															<li>
																<div class="check">
																	<div class="table0">
																		<div class="cell">
																			<div class="cont_text cont_text_inner cont_text_title">
																				매체
																			</div>
																			<div class="cont_text cont_text_inner mt4">
																				Publisher
																			</div>
																		</div>
																	</div>
																</div>
															</li>
														</ul>
													</li>
												</ul>
											</li>
										</ul>
									</li>	
								</ul>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>


		<div class="section" id="section4">
			<div class="wrap4">
				<div class="mainTxt4">
					<div class="left">
						<h1>Smart MyD 2.0</h1>
						<h3>당신의 상품을 콘텐츠화 하여 구매 잠재 고객을 사로 잡으세요!</h3>
						<p>고객의 시그널을 캐치하여, 최적의 타이밍에 최고의 소비자에게<br class="textPc">
							당신의 콘텐츠를 노출하는 콘텐츠 디스커버리 플랫폼 입니다.</p>
					</div>
					<div class="right">
						<a href="https://ads.smartmyd.com/" target="_blank">광고주 센터 바로가기</a>
					</div>
				</div>
				<div class="subsection4">
					<div class="leftContent">
						<img src="./img/img1.png">
					</div>
					<div class="rightContent">
						<img src="./img/img2.jpg">

					</div>
				</div>
			</div>
		</div>
		
		<div class="section" id="section5">
			<div class="wrap5">
				<div class="mainTxt5">
						<h1>Commerce MyD</h1>
						<h3>당신의 트래픽을 수익화 하세요!</h3>
						<p>높은 수익을 올릴 수 있는 최고의 수익 모델로 서비스UI를 해치지 않으며,<br class="textPc">
							단기간 내에 wep, app 서비스 구분없이 구축이 가능한 자사 전용 맞춤형 광고 플랫폼 솔루션 입니다.</p>
				</div>
				<div class="subsection5 pc">
					<ul>
						<li class="squere1">
							<div>
								<h3><span>LITE</span> version</h3>
								<p>· 상품과 연관된 키워드 자동 매칭<br>
									· 광고 등록 프로세스 간소화<br>
									· 광고 관리 리소스 감소<br>
									· 클릭당 과금(CPC)
								</p>
							</div>
						</li>
						<li class="squere2">
							<div>
								<h3><span>FULL</span> version</h3>
								<p>· 원하는 키워드를 직접 선택<br>
									· 롱테일 키워드 활용 가능<br>
									· 클릭당 과금(CPC)
								</p>
							</div>
						</li>
						<li class="squere3">
							<div>
								<h3><span>AI</span> version</h3>
								<p>· 정교한 타겟팅<br>
									· 다양한 지면 활용<br>
									· 클릭당 과금(CPC)
								</p>
							</div>
						</li>
					</ul>
				</div>

				<div class="subsection5">
					<div class="swiper mySwiper mo">
						<ul class="swiper-wrapper">
								<li class="squere1 swiper-slide">
									<div>
										<h3><span>LITE</span> version</h3>
										<p>· 상품과 연관된 키워드 자동 매칭<br>
											· 광고 등록 프로세스 간소화<br>
											· 광고 관리 리소스 감소<br>
											· 클릭당 과금(CPC)
										</p>
									</div>
								</li>
								<li class="squere2 swiper-slide">
									<div>
										<h3><span>FULL</span> version</h3>
										<p>· 원하는 키워드를 직접 선택<br>
											· 롱테일 키워드 활용 가능<br>
											· 클릭당 과금(CPC)
										</p>
									</div>
								</li>
								<li class="squere3 swiper-slide">
									<div>
										<h3><span>AI</span> version</h3>
										<p>· 정교한 타겟팅<br>
											· 다양한 지면 활용<br>
											· 클릭당 과금(CPC)
										</p>
									</div>
								</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	
		<div class="section" id="section6">
			<div class="wrap6">
				<div class="mainTxt6">
					<h1>Commerce MyD</h1>
					<h3>1석3조 효과를 기대하세요!</h3>
					<p>
						1.광고수익 발생, 2.GMV 상승, 3.마케팅 비용 절감 효과와 <br class="textPc">
						서비스사, 판매자, 소비자 모두의 NEEDS를 충족 시키면서 서비스의 성장을 기대할 수 있습니다.</p>
				</div>
				<div class="posses">
					<p>제휴 프로세스</p>
					<div class="object">
						<img class="pc" src="./img/object12.png" alt="object">
						<img class="mo" src="./img/object12_m.png" alt="object">
					</div>
				</div>
			</div>
		</div>

		<div class="section" id="section7">
			<div class="wrap7">
				<section>
					<div>
					<section class="news-message">
							<img src="./img/b_logo1.png" alt="">
							<img src="./img/b_logo2.png" alt="">
							<img src="./img/b_logo3.png" alt="">
							<img src="./img/b_logo4.png" alt="">
							<img src="./img/b_logo5.png" alt="">
							<img src="./img/b_logo6.png" alt="">
							<img src="./img/b_logo7.png" alt="">
							<img src="./img/b_logo8.png" alt="">
							<img src="./img/b_logo9.png" alt="">
						</section>
						<section class="news-message">
							<img src="./img/b_logo1.png" alt="">
							<img src="./img/b_logo2.png" alt="">
							<img src="./img/b_logo3.png" alt="">
							<img src="./img/b_logo4.png" alt="">
							<img src="./img/b_logo5.png" alt="">
							<img src="./img/b_logo6.png" alt="">
							<img src="./img/b_logo7.png" alt="">
							<img src="./img/b_logo8.png" alt="">
							<img src="./img/b_logo9.png" alt="">
						</section>
					</div>
				</section>

				<div class="mainTxt7">
					<h1>Contant us</h1>
					<h3>스마트마이디의 서비스가 궁금하신가요? 부담없이 문의 주시면 24시간 이내 답변 드리겠습니다.</h3>
					<p>스마트마이디는 당신의 성공적인 파트너가 확실합니다.</p>
				</div>
				<form id="frmcontant" name="frmcontant" type="POST">
				<div class="cont_text_wrap">
					<div class="db_wrap">
						<div class="input_row">
							<div class="input_select_wrap input_wrap3">
								<select name="GUBUN" id="GUBUN">
									<option value="">문의유형</option>
									<option value="광고관련">광고관련</option>
									<option value="파트너관련">파트너관련</option>
									<option value="기타">기타</option>
								</select>
							</div>
						</div>
						<div class="input_row">
							<div class="input_text_wrap input_wrap3">
								<label>
									<input type="text" name="COMPANY" id="COMPANY">
									<span>회사명</span>
								</label>
							</div>
						</div>
						<div class="input_row">
							<div class="input_text_wrap input_wrap3">
								<label>
									<input type="text" name="U_NAME" id="U_NAME"  maxlength="50">
									<span>담당자명</span>
								</label>
							</div>
						</div>
						<div class="input_row">
							<div class="input_text_wrap input_wrap3">
								<label>
									<input type="text" name="EMAIL" id="EMAIL">
									<span>이메일</span>
								</label>
							</div>
						</div>
						<div class="input_row">
							<div class="select_wrap">
								<div class="input_select_wrap input_wrap3">
									<select name="tel_1" id="tel_1" onkeydown="return onlyNumber(event)" onkeyup="removeChar(event)">
										<option value="010">010</option>
										<option value="011">011</option>
										<option value="016">016</option>
										<option value="017">017</option>
										<option value="018">018</option>
										<option value="019">019</option>
									</select>
								</div>
								<div class="input_text_wrap input_wrap3">
									<label>
										<input type="tel" name="tel_2" id="tel_2" onkeydown="return onlyNumber(event)" onkeyup="removeChar(event)" maxlength="4" placeholder=" ">
										<span>앞자리</span>
									</label>
								</div>
								<div class="input_text_wrap input_wrap3">
									<label>
										<input type="tel" name="tel_3" id="tel_3" onkeydown="return onlyNumber(event)" onkeyup="removeChar(event)" maxlength="4" placeholder=" ">
										<span>뒷자리</span>
									</label>
								</div>
							</div>
						</div>
					</div>
					<div class="db_wrap2">
						<div class="input_row">
							<div class="input_textarea_wrap input_wrap3">
								<label>
									<textarea name="contents" id="contents" class=""></textarea>
									<span>문의내용</span>
								</label>
							</div>
						</div>
						<div class="input_row">
							<div class="input_btn_wrap input_wrap3">
								<input type="button" value="상담신청" class="btn btn1 btn_ani" id="submit_bnt">
							</div>
						</div>
					</div>
				</div>
				</form>
			</div>
		</div>	
	
		<div class="section" id="section8">
			<div class="topButton">
				<img src="./img/topbutton.png" alt="topbutton">
			</div>
			<div class="wrap8">
				<div class="sectionLeft">
					<ul>
						<li>
							<a href="#1">smart myd</a>
						</li>
						<li>
							<a href="#4">smart myd 2.0</a>
						</li>
						<li>
							<a href="#5">commerce myd</a>
						</li>
						<li>
							<a href="#7">contact us</a>
						</li>
					</ul>
				</div>
				<div class="sectionright">
					<ul>
						<li>
							<h3>adress.</h3>
							<p>서울특별시 구로구 디지털로 26길 111, JNK디지털타워 403호</p>
						</li>
						<li>
							<h3>email.</h3>
							<p>test@smartmyd.co.kr</p>
						</li>
						<li>
							<h3>tel.</h3>
							<p>02.786-8258</p>
						</li>
						<li>
							<h3>fax.</h3>
							<p>02.786-8259</p>
						</li>
					</ul>
					<div class="line"></div>
				</div>
				<footer>
					<div class="logo">
						<img src="./img/logo_g.png" alt="footerlogo">
					</div>
					<div class="footerText">
						<p class="pc">스마트 마이디 | 대표자 장동환 | 대표번호 02.786.8258 | 사업자등록번호 704-88-00605</p>
						<p class="mo">스마트 마이디<br>대표자 장동환 | 대표번호 02.786.8258 | 사업자등록번호 704-88-00605</p>
						<p>Copyrightⓒ2022 스마트마이디 Co.,Ltd. All Rights Reserved.</p>
					</div>
				</footer>
			</div>
		</div>	

	</div><!-- fullpage end-->

	<!-- js -->
	<script src="https://unpkg.com/splitting@1.0.0/dist/splitting.js"></script>
	<script src="js/script.js?ver=1111"></script>  

	<script>
	$(function(){

		var swiper = new Swiper(".mySwiper", {
		  slidesPerView: "auto",
		  pagination: {
			clickable: true,
		  },
		});
			
		var ChapList = $(".chap_list_wrap ul li");
		$('#fullpage').fullpage({
			autoScrolling:true,
			scrollHorizontally:false,
			lockAnchors:false,
			navigation:true,
			
			navigationPosition: 'left',
			anchors: ["1","2", "3", "4", "5", "6", "7", "8"],
			afterRender: function(anchorLink, index){
				$("html, body").css("opacity","1");
			},
			onLeave: function(index, nextIndex, direction){
				ChapList.removeClass("on");
				ChapList.eq(nextIndex-1).addClass("on");
				if ( nextIndex == 1 ) {
					
				} else {
					
				}
				if ( nextIndex == 2 ) {
					$("#section2 .mainTxt2 h1").addClass("on");
					$(".scroll").addClass("on");
					$(".hambergerIcon").addClass("on");
					$(".nomalLogo").css("display","none");
					$(".inverterLogo").css("display","block");
				} else {
					$("#section2 .mainTxt2 h1").removeClass("on");
					$(".scroll").removeClass("on");
					$(".hambergerIcon").removeClass("on");
					$(".nomalLogo").css("display","block");
					$(".inverterLogo").css("display","none");
				}

				if ( nextIndex == 4 ) {
					$(".scroll").addClass("on");
					$(".hambergerIcon").addClass("on");
					$(".nomalLogo").css("display","none");
					$(".inverterLogo").css("display","block");
				} 
	
				if ( nextIndex == 6 ) {
					$(".scroll").addClass("on");
					$(".hambergerIcon").addClass("on");
					$(".nomalLogo").css("display","none");
					$(".inverterLogo").css("display","block");
				} else {

				}

				if ( nextIndex == 8 ) {
					$(".scroll").css("display","none");
					$(".mobile_menu_icon_wrap").css("display","none");
					$(".rightBtn").css("display","none");
					$(".nomalLogo").css("display","none");
					$(".inverterLogo").css("display","block");
				} else {
					$(".scroll").css("display","block");
					$(".mobile_menu_icon_wrap").css("display","block");
					$(".rightBtn").css("display","block");
				}
			},
		});	
	});

		var bSend_ing = false;
		$(document).on("click","#submit_bnt",function(){
			if( $("select[name=GUBUN]").val()==""){
				alert("문의유형을 선택해주세요.");
				return false;
			}

			if( $("input[name=COMPANY]").val()==""){
				alert("회사명을 입력해주세요.");
				return false;
			}
			if( $("input[name=U_NAME]").val()==""){
				alert("담당자명을 입력해주세요.");
				return false;
			}
			if( $("input[name=EMAIL]").val() == ""){
			  alert("이메일을 입력해주세요.");
			  return false;
			}
			if (!$("input[name=EMAIL]").val().match("@")) {
				alert("정상적인 이메일을 입력해주세요.");
				return false;
			}
			if( $("select[name=tel_1]").val().replace(/(^\s*)|(\s*$)/gi, "") ==""){
			  alert("연락처를 입력하세요.");
			  return false;
			}
			if( $("input[name=tel_2]").val().replace(/(^\s*)|(\s*$)/gi, "") ==""){
			  alert("연락처를 입력하세요.");
			  return false;
			}
			if( $("input[name=tel_3]").val().replace(/(^\s*)|(\s*$)/gi, "") ==""){
			  alert("연락처를 입력하세요.");
			  return false;
			}
			if( $("textarea[name=contents]").val()==""){
				alert("문의내용을 입력해주세요.");
				return false;
			}

			if (bSend_ing) {
				return false;
			}
			bSend_ing = true;
			$.ajax({
				type: "POST",
				url: "/proc/contant_write.proc.asp",
				data: $("form[name=frmcontant]").serialize(),
				success: function(data) {
					bSend_ing = false;
					if (data == "1"){
					alert("문의 접수되었습니다.");
					location.reload();
					}

				},
				error: function(){
					bSend_ing = false;
					alert('실패하였습니다. 잠시 후에 다시 시도해주세요.');
				}
			});

		});
	</script>
</body>
</html>