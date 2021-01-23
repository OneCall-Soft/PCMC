<%@ Page Title="" Language="C#" AutoEventWireup="true" CodeFile="PrintReceiptOld.aspx.cs" Inherits="PropertyTax" %>


<!DOCTYPE html>

<html>
<head runat="server">
     <meta name="google" content="notranslate">
	<meta charset="utf-8">
	<title></title>
	<meta name="description" content="">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="icon" type="image/png" href="favicon.ico">

	<!--Google Font link-->
	<%-- <link href="https://fonts.googleapis.com/css?family=Ubuntu:300,300i,400,400i,500,500i,700,700i" rel="stylesheet">--%>

	<link href="css/fontawesome.css" rel="stylesheet" />
<%--	<link rel="stylesheet" href="assets/css/swiper.min.css" />--%>
	<link href="css/fontawesome.min.css" rel="stylesheet" />
<%--	<link href="css/brands.css" rel="stylesheet" />
	<link href="css/brands.min.css" rel="stylesheet" />
	<link href="css/all.css" rel="stylesheet" />
	<link href="css/all.min.css" rel="stylesheet" />--%>

	<%-- <link rel="stylesheet" href="assets/css/bootstrap.min.css">--%>

<%--	<link rel="stylesheet" href="assets/css/slider.css">--%>

<%--	<link rel="stylesheet" href="assets/css/a.css">--%>
	<!--Theme custom css -->
	<link rel="stylesheet" href="assets/css/style.css">
	<link rel="stylesheet" href="assets/css/style9.css">

	<!--Theme Responsive css-->
	<link rel="stylesheet" href="assets/css/responsive.css" />
     <script src="js/CustomeJSFile.js"></script>
	<script src="assets/js/vendor/modernizr-2.8.3-respond-1.4.2.min.js"></script>

</head>
<body data-spy="scroll" data-target=".navbar-collapse">
	<form id="form1" runat="server" autocomplete="off">

<%--		<div class="row">		
			<div class="col-md-10" style="margin-left: -15px;">
			</div>
			<div class="col-md-1" style="margin-top:2%;margin-left:40px">
				
								<asp:Button runat="server"   style="background-color:#3f94bf; font-size:larger;min-width:80px"  value="hi" class="btn btn button arrow" Text="Home"></asp:Button>
				                &nbsp;&nbsp;&nbsp;&nbsp;

			</div>

		</div>--%>


			<div id="loading">
			<div id="loading-center">
				<div id="loading-center-absolute">
					<div class="object" id="object_one"></div>
					<div class="object" id="object_two"></div>
					<div class="object" id="object_three"></div>
					<div class="object" id="object_four"></div>
				</div>
			</div>
		</div>
		<section id="home" class="home" style="height: 540px;">
			<div class="main_home">


	<div class="row" style="background-color:#f9f9f9">
					<%--header--%>
					<div class="col-md-12"></div>
					
					<div class="col-md-2 offset-1">
						<img src="images/smart2.jpg" />
					</div>
					<div class="col-md-2 offset-1">
						<img src="images/pcmclogo.jpg" />
					</div>
					<div class="col-md-2 offset-1">
						<img src="images/smart.jpg" />
					</div>
					<div class="col-md-2 offset-1">
						<img src="images/digitalindia.jpg" />
					</div>	

				</div>
				
				<hr style="border: 1px solid #eb0029;margin-top: 0rem;">

				<%--Div to show the data--%>

			<div style="background-color: #ff8f8f; padding: 20px; border: #000;min-height:700px;margin-top:-1%">

				<div class="row">
					<div class="col-md-12">
							<div class="col-md-2 offset-10" style="margin-top: -21px;">
							<a href="PaymentServices.aspx" style="border-bottom: 1px solid blue; font-size: x-large; margin-top:-100px; font: bold;"><%=Resources.Resource.Back %></a>
								&nbsp;&nbsp;&nbsp;&nbsp;
			        <a href="MainPage.aspx" id="btnMarathi" style="border-bottom: 1px solid blue;font-size:x-large;font:bold;margin-top:-100px"><%=Resources.Resource.Home %></a>

						</div>
					</div>
				</div>

				<div class="row"  style="margin-top:25px">		
					<table style="padding: 10px; text-align: left;">
							<tr>
								<td >
									<label style="color:white; font-size:xx-large; font-style: normal; margin-left:400px">Please wait your receipt is printing.....</label>
								</td>
								<br />
							</tr>
						</table>
				</div>

					


				<div class="row" id="ResPropertyTax" runat="server">

					<div class="col-md-3 offset-4" style="background-color:white;">

						<table style="padding: 10px; text-align: left;">
							<tr style="border-style:hidden;">
								<td style="border-style:hidden;" >
									<label style="color: black; font-size:large; font-style: normal;">ConsumerID :</label>
								</td>
								<td style="border-style:hidden;">
									<label runat="server" id="lblConsumerID" style="font-size:large; width:100%; font-style: normal;">2222222</label>
									<br />
								</td>
							</tr>
							<tr style="border-style:hidden;">
								<td>
									<label style="color: black; font-size:large; font-style: normal;">TransactionID :</label>
								</td>
								<td style="border-style:hidden;">
									<label runat="server" id="lblTransactionID" style="font-size:large; width:100%; font-style: normal;">2222222</label>
									<br />
								</td>
							</tr>

							<tr style="border-style:hidden;">
								<td>
									<label style="color: black; font-size:large; font-style: normal;">Biller TransactionID :</label>
								</td>
								<td style="border-style:hidden;">
									<label runat="server" id="lblBillerTxnID" style="font-size:large; font-style: normal;">2222222</label>
									<br />
								</td>
							</tr>


							<tr style="border-style:hidden;">
								<td>
									<label style="color: black; font-size:large; font-style: normal;">Biller ReceiptNumber :	</label>
								</td>
								<td style="border-style:hidden;">
									<label runat="server" id="lblReceiptNumber" style="font-size:large;  font-style: normal;">2222222</label>
									<br />
								</td>
							</tr>							
						</table>
						<br />

				<!-- Modal -->

			</div>
					</div>

						<div class="row" style="margin-top:15px">

					<div class="col-md-12">
						<div class="col-md-2 offset-4">						
						    <asp:Button ID="btnmakepayment" OnClick="btn_MakePayment" runat="server" CssClass="btn btn" style="margin-left:70px; background-color:darkgreen;font:bold;font-size:large; border:none;color:whitesmoke;width:150px" Text="<%$Resources:Resource,MakePayment %>" />
			            </div>
					</div>
						</div>			

				</div>

				</div>
		</section>


			<div class="QuickLink">
			<div class="fixed-bottom">
				<div class="row fixed-row-bottom" id="QuickLink">
					<%--Footer--%>
					<div class="col-md-12"></div>
					<div class="col-md-1"></div>

					<div class="col-md-2" style="margin-top:37px;padding-left:55px">
						<h5><span style="color: darkgreen;font:bold;font-size:larger"><%=Resources.Resource.quicklinks %></span></h5>
					</div>
					<div class="col-md-8" style="margin-left: 0px;">
						<a href="#popupambulance" class="carouselPointers" onclick="HideQuicklink();"><span class="imgSpan" style="position: relative; background-color: lime">
							<img src="images/Ambulance.png" style="margin-bottom: 25px" /></span><span class="carouselPointersText" style="border: 3px solid lime;"><%=Resources.Resource.Ambulance %></span></a>
						<a href="#popupbloodbank" class="carouselPointers" onclick="HideQuicklink();"><span class="imgSpan" style="position: relative; background-color: lime">
							<img src="images/bloodbank.png" /></span><span class="carouselPointersText" style="border: 3px solid lime;"><%=Resources.Resource.Blood %> <%=Resources.Resource.Bank %></span></a>
						<a href="#popupfire" class="carouselPointers" onclick="HideQuicklink();"><span class="imgSpan" style="position: relative; background-color: lime">
							<img src="images/fire.png" style="height: 30px" /></span><span class="carouselPointersText" style="border: 3px solid lime;"><%=Resources.Resource.Fire %> <%=Resources.Resource.Brigade %></span></a><br />
						<a href="#popuphospital" class="carouselPointers" onclick="HideQuicklink();"><span class="imgSpan" style="position: relative; background-color: lime">
							<img src="images/hospital.png" style="height: 30px" /></span><span class="carouselPointersText" style="border: 3px solid lime;"><%=Resources.Resource.Hospitals %></span></a>
						<a href="#popuppolice" class="carouselPointers" onclick="HideQuicklink();"><span class="imgSpan" style="position: relative; background-color: lime">
							<img src="images/police.png" style="height: 30px" /></span><span class="carouselPointersText" style="border: 3px solid lime;"><%=Resources.Resource.Police %></span></a>
						<a href="#popupchemist" class="carouselPointers" onclick="HideQuicklink();"><span class="imgSpan" style="position: relative; background-color: lime">
							<img src="images/chemist.png" style="height: 30px" /></span><span class="carouselPointersText" style="border: 3px solid lime;"><%=Resources.Resource.Chemist %></span></a>

					</div>
					<div class="col-md-1">
						<a href="#popupsarathi" onclick="HideQuicklink();">
							<div class="icon-launch"></div>
						</a>
					</div>
				</div>
			</div>
		</div>
		<style>
			div.icon-launch {
				  padding-top:15px;
                padding-left:7px;
        		bottom: 15px;
        		right: 30px;
        		position: fixed;
                color:orangered;
        		height: 60px;
        		width: 60px;
        		border-radius: 50%;
        		background-image: url(../PCMC/images/Sarathi.png);
        		background-size: cover;
        		border-style: solid;
        		border-color: #b30059;
        		cursor: pointer;
			}
		</style>




			<style>
				.carouselPointers {
					display: inline-block;
					border-radius: 8px;
					text-align: left;
					color: #000;
					-webkit-transition: all 0.5s;
				}

					.carouselPointers span.imgSpan {
						background: #cb3906;
						padding: 10px 10px;
						display: inline-block;
						width: 70px;
						height: 50px;
						vertical-align: middle;
						border-radius: 8px 0px 0px 8px;
						float: left;
						text-align: center;
						position: relative;
						/*transition: all 0.5s;*/
						-webkit-transition: all 0.5s;
					}

					.carouselPointers span.carouselPointersText {
						display: inline-block;
						background: rgba(255, 255, 255, 0.81);
						border-radius: 0px 8px 8px 0px;
						padding: 10px;
						text-align: left;
						border: 3px solid #cb3906;
						font-size: 14px;
						text-transform: uppercase;
						font-weight: 500;
						letter-spacing: 1px;
						float: left;
						width: 135px;
						height: 50px;
						/*transition: all 0.5s;*/
						-webkit-transition: all 0.5s;
					}
			</style>


		<style>
			.carouselPointers1 {
				display: inline-block;
				border-radius: 8px;
				text-align: left;
				color: #000;
				-webkit-transition: all 0.5s;
			}

				.carouselPointers1 span.imgSpan {
					background: #cb3906;
					padding: 10px 10px;
					display: inline-block;
					width: 70px;
					height: 70px;
					vertical-align: middle;
					border-radius: 8px 0px 0px 8px;
					float: left;
					text-align: center;
					position: relative;
					/*transition: all 0.5s;*/
					-webkit-transition: all 0.5s;
				}

				.carouselPointers1 span.carouselPointersText1 {
					display: inline-block;
					background: rgba(255, 255, 255, 0.81);
					border-radius: 0px 8px 8px 0px;
					padding: 15px;
					text-align: left;
					border: 3px solid #cb3906;
					font-size: 14px;
					text-transform: uppercase;
					font-weight: 500;
					letter-spacing: 1px;
					float: left;
					width: 178px;
					height: 70px;
					/*transition: all 0.5s;*/
					-webkit-transition: all 0.5s;
				}
		</style>

		<script type="text/javascript">
			function doLogout() {
				var backlen = history.length;
				history.go(-backlen);
				window.location.replace("MainPage.aspx");
			}
		</script>


		<script type="text/javascript">
			function PropeetyTaxRedirect() {
				var backlen = history.length;
				history.go(-backlen);
				window.location.replace("PropertyTax.aspx");
			}
		</script>
		
		<script type="text/javascript">
			function WaterTaxRedirect() {
				var backlen = history.length;
				history.go(-backlen);
				window.location.replace("WaterTax.aspx");
			}
		</script>


			<script type="text/javascript">
				function ShowEditableBalance() {

					var x = document.getElementById("lblbalance");
					if (x.style.display === "none") {
						x.style.display = "block";
					} else {
						x.style.display = "none";
					}
					var x = document.getElementById("txtbalance");
					if (x.style.display === "none") {
						x.style.display = "block";
					} else {
						x.style.display = "none";
					}

				}


				<script type="text/javascript">
					function ShowQuicklink() {

				var x = document.getElementById("QuickLink");
				if (x.style.display === "none") {
						x.style.display = "block";
					} else {
						x.style.display = "none";
					}
					var x = document.getElementById("Back");
				if (x.style.display === "none") {
						x.style.display = "block";
					} else {
						x.style.display = "none";
					}
	
				}
			function HideQuicklink() {

				var x = document.getElementById("QuickLink");
				if (x.style.display === "none") {
						x.style.display = "block";
					} else {
						x.style.display = "none";
				}
	
	
				}
		</script>
		<style>
			.btn:hover {
				background-color: RoyalBlue;
			}
		</style>
		<script>
			!function (d, s, id) { var js, fjs = d.getElementsByTagName(s)[0]; if (!d.getElementById(id)) {js = d.createElement(s); js.id = id; js.src = 'https://weatherwidget.io/js/widget.min.js'; fjs.parentNode.insertBefore(js, fjs); } }(document, 'script', 'weatherwidget-io-js');
		</script>

		  <script language="javascript">
		  var popupWindow = null;
		  function centeredPopup(url, winName, w, h, scroll) {
			  LeftPosition = (screen.width) ? (screen.width - w) / 2 : 0;
			  TopPosition = (screen.height) ? (screen.height - h) / 2 : 0;
			  settings =
				  'height=' + h + ',width=' + w + ',top=' + TopPosition + ',left=' + LeftPosition + ',scrollbars=' + scroll + ',minimizable=0,titlebar=0,resizable=0e'
			  popupWindow = window.open(url, winName, settings)
		  }
</script>

<%--		<style type="text/css">
			h1 {
				text-align: center;
				font-family: Tahoma, Arial, sans-serif;
				color: #06D85F;
				margin: 80px 0;
			}

			.box {
				width: 40%;
				margin: 0 auto;
				background: #eb0029;
				padding: 25px;
				border: 1px solid #fff;
				border-radius: 5px/50px;
				background-clip: padding-box;
				text-align: center;
			}

			.button {
				font-size: 1.4em;
				padding: 10px;
				color: #fff;
				border: 2px solid #eb0029;
				border-radius: 20px/50px;
				text-decoration: none;
				cursor: pointer;
				transition: all 0.3s ease-out;
			}

				.button:hover {
					background: #06D85F;
				}

			.overlay {
				position: fixed;
				top: 0;
				bottom: 0;
				left: 0;
				right: 0;
				background: rgba(0, 0, 0, 0.7);
				transition: opacity 500ms;
				visibility: hidden;
				opacity: 0;
			}

				.overlay:target {
					visibility: visible;
					opacity: 1;
				}

			.popup {
				margin: 70px auto;
				padding: 20px;
				background: #fff;
				border-radius: 5px;
				width: 85%;
				position: relative;
				transition: all 5s ease-in-out;
			}

				.popup h2 {
					margin-top: 0;
					color: #333;
					font-family: Tahoma, Arial, sans-serif;
				}

				.popup .close {
					position: absolute;
					top: 20px;
					right: 30px;
					transition: all 200ms;
					font-size: 30px;
					font-weight: bold;
					text-decoration: none;
					color: #333;
				}

					.popup .close:hover {
						color: #06D85F;
					}

				.popup .content {
					max-height: 30%;
					overflow: auto;
				}

			@media screen and (max-width: 700px) {
				.box {
					width: 70%;
				}

				.popup {
					width: 70%;
				}
			}
		</style>--%>
		<link href="assets/css/modal.css" rel="stylesheet" />

		<script src="assets/js/vendor/jquery-1.11.2.min.js"></script>
		<script src="assets/js/vendor/bootstrap.min.js"></script>
		<link href="css/bootstrap.min.css" rel="stylesheet" />
		<%--<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>--%>

	<%--	<script src="assets/js/jquery.magnific-popup.js"></script>
		<script src="assets/js/jquery.easing.1.3.js"></script>
		<script src="assets/js/swiper.min.js"></script>--%>
		<script src="assets/js/jquery.collapse.js"></script>
		<script src="assets/js/bootsnav.js"></script>

		<script src="assets/js/plugins.js"></script>
		<script src="assets/js/main.js"></script>
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	</form>
</body>
</html>
