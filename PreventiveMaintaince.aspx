﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PreventiveMaintaince.aspx.cs" Inherits="PreventiveMaintaince" %>

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
    <link rel="stylesheet" href="assets/css/swiper.min.css" />
    <link href="css/fontawesome.min.css" rel="stylesheet" />
    <%--	<link href="css/brands.css" rel="stylesheet" />--%>
    <%--	<link href="css/brands.min.css" rel="stylesheet" />--%>
    <%--	<link href="css/all.css" rel="stylesheet" />--%>
    <link href="css/all.min.css" rel="stylesheet" />

    <%-- <link rel="stylesheet" href="assets/css/bootstrap.min.css">--%>

    <%--   <link rel="stylesheet" href="assets/css/slider.css">--%>
    <%--   <a href="PrintReceiptNew.aspx">PrintReceiptNew.aspx</a>--%>
    <%--   <link rel="stylesheet" href="assets/css/a.css">--%>
    <!--Theme custom css -->
    <link rel="stylesheet" href="assets/css/style1.css">

    <%--	<link rel="stylesheet" href="assets/css/style9.css">--%>

    <!--Theme Responsive css-->
    <link rel="stylesheet" href="assets/css/responsive.css" />
    <script src="js/CustomeJSFile.js"></script>
    <script src="assets/js/vendor/modernizr-2.8.3-respond-1.4.2.min.js"></script>

    <style type="text/css">
        html {
            position: relative;
            min-height: 100%;
        }

        .carousel-fade .carousel-inner .item {
            opacity: 0;
            transition-property: opacity;
        }

        .carousel-fade .carousel-inner .active {
            opacity: 1;
        }

            .carousel-fade .carousel-inner .active.left,
            .carousel-fade .carousel-inner .active.right {
                left: 0;
                opacity: 0;
                z-index: 1;
            }

        .carousel-fade .carousel-inner .next.left,
        .carousel-fade .carousel-inner .prev.right {
            opacity: 1;
        }

        .carousel-fade .carousel-control {
            z-index: 2;
        }

        @media all and (transform-3d), (-webkit-transform-3d) {
            .carousel-fade .carousel-inner > .item.next,
            .carousel-fade .carousel-inner > .item.active.right {
                opacity: 0;
                -webkit-transform: translate3d(0, 0, 0);
                transform: translate3d(0, 0, 0);
            }

            .carousel-fade .carousel-inner > .item.prev,
            .carousel-fade .carousel-inner > .item.active.left {
                opacity: 0;
                -webkit-transform: translate3d(0, 0, 0);
                transform: translate3d(0, 0, 0);
            }

                .carousel-fade .carousel-inner > .item.next.left,
                .carousel-fade .carousel-inner > .item.prev.right,
                .carousel-fade .carousel-inner > .item.active {
                    opacity: 1;
                    -webkit-transform: translate3d(0, 0, 0);
                    transform: translate3d(0, 0, 0);
                }
        }

        .item:nth-child(1) {
            background: url(assets/images/origna__l.jpg) no-repeat center center fixed;
            -webkit-background-size: cover;
            -moz-background-size: cover;
            -o-background-size: cover;
            background-size: cover;
        }

        .item:nth-child(2) {
            background: url(assets/images/orignal.jpg) no-repeat center center fixed;
            -webkit-background-size: cover;
            -moz-background-size: cover;
            -o-background-size: cover;
            background-size: cover;
        }

        .item:nth-child(3) {
            background: url(assets/images/banner9.jpg) no-repeat center center fixed;
            -webkit-background-size: cover;
            -moz-background-size: cover;
            -o-background-size: cover;
            background-size: cover;
        }

        .item:nth-child(4) {
            background: url(assets/images/banner2.jpg) no-repeat center center fixed;
            -webkit-background-size: cover;
            -moz-background-size: cover;
            -o-background-size: cover;
            background-size: cover;
        }

        /*.item:nth-child(4) {
    background: url(assets/images/banner3.jpg) no-repeat center center fixed;
    -webkit-background-size: cover;
    -moz-background-size: cover;
    -o-background-size: cover;
    background-size: cover;
}*/
        .carousel {
            z-index: -99;
        }

            .carousel .item {
                position: fixed;
                width: 95%;
                height: 100%;
            }

        .title {
            text-align: center;
            margin-top: 20px;
            padding: 10px;
            text-shadow: 2px 2px #000;
            color: #FFF;
        }

        .list-group {
            padding-left: 0;
            margin-bottom: 20px;
        }

        .list-group-unbordered > .list-group-item {
            border-left: 0;
            border-right: 0;
            border-radius: 0;
            padding-left: 0;
            padding-right: 0;
        }
    </style>
    <script type="text/javascript">
        $('.carousel').carousel();
    </script>

    <script src="js/jquery-1.10.2.min.js"></script>
    <script type="text/javascript">
        var newtxt = "";
        var i = 0;
        function ascii(a) { return a.charCodeAt(0); }
        function Print() {

            var txt = "*** PIMPRI CHINCHWARD SMARTCITY KIOSK ***\r\n            " + hdnaddress.innerText + "\r\n      ----------------------------\r\na Date: " + lblTxnDate.innerText + "\r\n\r\n!                * Payment Receipt * \r\n\r\nTransaction ID:       " + lblTxnID.innerText + "\r\nPropertyTax ID:       " + lblConsumerID.innerText + "\r\nAmount:               " + lblTxnAmount.innerText + "\r\n\Payment Mode:         " + lblPaymentMode.innerText + "\r\n\Status:               " + lblStatus.innerText + "\r\n\r\n  *******************Thank You*********************\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n      i";

            debugger;

            var j = "";

            for (var i = 0; i < txt.length; i++) {
                j = ascii(txt[i]);
                if (j <= 32 || j == 47 || j == 92 || j == 127 || j == 35 || j == 37 || j == 46 || j == 63 || j == 64 || j == 126) {
                    newtxt += "@~~~" + j + "@";
                }
                else {
                    newtxt += txt[i];
                }
            }
            printer();
        }



        function printer() {
            if (newtxt.length > 25) {

                var res = newtxt.substr(0, 25);
                newtxt = newtxt.substr(25);

                var settings =
                {
                    "async": true,
                    "crossDomain": true,
                    "url": "http://127.0.0.1:1234/api/websites/2/1/" + res,
                    "method": "GET",
                    "headers":
                    {
                        "Cache-Control": "no-cache",
                        "Postman-Token": "2a8f244a-0da0-462b-8148-ffcc4b3dadcd"
                    }
                }


                $.ajax(settings).done(function (response) {
                    if (response == "MORE")
                        printer();
                });

            }
            else {
                var settings =
                {
                    "async": true,
                    "crossDomain": true,
                    "url": "http://127.0.0.1:1234/api/websites/2/0/" + newtxt,
                    "method": "GET",
                    "headers":
                    {
                        "Cache-Control": "no-cache",
                        "Postman-Token": "2a8f244a-0da0-462b-8148-ffcc4b3dadcd"
                    }
                }


                $.ajax(settings).done(function (response) {
                    //alert(response);
                });
            }

        }


    </script>


</head>
<body style="overflow: hidden;">


     <form id="form1" runat="server">

    <%--		<section id="home" class="home" style="height: 587px;">--%>


    <hr style="border: 1px solid #eb0029; margin-top: 0rem;">

    <div style="height: 100%;">

        <%--Div to show the data--%>

        <div class="row" style="margin-top: 8%; text-align: center; margin-left: 0px; margin-right: 0px;">

            <div class="col-sm-12" style="border: #000; width: 100%; margin-right: 0px; margin-top: -8%;">
                <div style="border-radius: 10px; height: auto; background: rgba(255, 255, 255, 0.51);">
                    <div class="row" style="background-color: #0c529c;">
                        <div class="col-sm-4" style="text-align: left; margin-top: 2%">
                        </div>

                        <div class="col-sm-4" style="margin-top: 20px;">
                            <span style="margin-top: 15px; text-align: center; color: whitesmoke; font-size: 30px; font-family: 'Source Sans Pro',sans-serif">Preventive Maintance</span>
                        </div>
                        <div class="col-sm-4" style="margin: 11px 12px 75px 20px; height: 77px; max-width: 30%; text-align: right;">
                            <a href="Default.aspx">
                                <div style="position: relative">
                                    <p style="top: 21px; position: absolute; right: 21px; font-size: larger; color: white; font-weight: 600">
                                      Go Home
                                    </p>
                                    <img src="images/back.png" style="width: 100px; height: 60px; margin-top: 1%;" />
                                </div>
                            </a>
                        </div>
                    </div>
                </div>
                &nbsp;&nbsp;&nbsp;&nbsp;                
            </div>
        </div>

        <%--Div to show the data--%>

        <div class="row" style="text-align: center; padding-left: 15px;">
            <div style="position: absolute; border: solid 1px #f00; width: 100%; margin-top: -7%; background: #eee; border-radius: 10px; text-align: center; height: 100%;">


                <div class="row " runat="server" id="div" visible="true">
                    <div class="col-md-3">
                    </div>
                    <div class="col-md-6" style="padding-right: 0px;">
                        <div class="col-md-11" style="text-align: left; margin: 0px 0px 0px 20px; border: solid 1px #b5b0b0;">
                            <div style="border-bottom: solid 1px #b5b0b0;">
                                <h5 style="font-family: 'Segoe UI'; padding-top: 5px;">Select Performed PM Activities:</h5>
                            </div>
                            <div class="row" style="margin: 0px">
                                <div class="col-md-12" style="border-bottom: solid 1px #b5b0b0;">
                                    <input type="checkbox" id="id1" runat="server" name="id2" value="1">
                                    <label style="font-family: 'Segoe UI'; padding-top: 5px;">Touch Screen Cleaned and calibration done</label>
                                </div>
                           
                            </div>
                            <div class="row" style="margin: 0px">
                                 <div class="col-md-12" style="border-bottom: solid 1px #b5b0b0;">
                                    <input type="checkbox" id="id2" name="id2" runat="server" value="2">
                                    <label style="font-family: 'Segoe UI'; padding-top: 5px;">Removed paper dust from the Receipt printer </label>
                                </div>
                            </div>
                            <div class="row" style="margin: 0px">
                                <div class="col-md-12" style="border-bottom: solid 1px #b5b0b0;">
                                    <input type="checkbox" id="id3" name="id3" runat="server" value="3">
                                    <label style="font-family: 'Segoe UI'; padding-top: 5px;"> Statement printer Cleanup </label>
                                </div>
                            </div>
                            <div class="row" style="margin: 0px">
                                 <div class="col-md-12" style="border-bottom: solid 1px #b5b0b0;">
                                    <input type="checkbox" id="id4" name="id4" runat="server" value="4">
                                    <label style="font-family: 'Segoe UI'; padding-top: 5px;">Cleaned RAM/Mother Board/Cooling Fan/SMPS</label>
                                </div>
                            </div>
                            <div class="row" style="margin: 0px">
                                <div class="col-md-12" style="border-bottom: solid 1px #b5b0b0;">
                                    <input type="checkbox" id="id5" name="id5" runat="server" value="5">
                                    <label style="font-family: 'Segoe UI'; padding-top: 5px;">Cleaned RAM/Mother Board/Cooling Fan/SMPS</label>
                                </div>
                            </div>
                            <div class="row" style="margin: 0px">
                               <div class="col-md-12" style="border-bottom: solid 1px #b5b0b0;">
                                    <input type="checkbox" id="id6" name="id6" runat="server" value="6">
                                    <label style="font-family: 'Segoe UI'; padding-top: 5px;">System Cleanup(Recycle Bin,C-Drive etc)</label>
                                </div>
                            </div>
                             <div class="row" style="margin: 0px">
                               <div class="col-md-12" style="border-bottom: solid 1px #b5b0b0;">
                                    <input type="checkbox" id="id7" name="id7" runat="server" value="7">
                                    <label style="font-family: 'Segoe UI'; padding-top: 5px;">Logs Collected</label>
                                </div>
                            </div>
                             <div class="row" style="margin: 0px">
                               <div class="col-md-12" style="border-bottom: solid 1px #b5b0b0;">
                                    <input type="checkbox" id="id8" name="id8" runat="server" value="8">
                                    <label style="font-family: 'Segoe UI'; padding-top: 5px;">KIOSK Date and Time is up to date</label>
                                </div>
                            </div>

                            <div class="row" style="margin: 15px">
                                <div class="col-md-3" style="text-align: center;">
                                </div>
                                <div class="col-md-6" style="text-align: center;">
                                  <%--   <asp:Button runat="server" ID="btnPrintReceipt" Width="130px" CssClass="btn btn-primary"  OnClick="btnPrintReceipt_Click" Text="Submit Applied PM Activities" />--%>

                                    <asp:Button ID="Button1" runat="server" Width="250px" CssClass="btn btn-primary"  OnClick="btnPrintReceipt_Click" Text="Submit Applied PM Activities" />

                                </div>
                                <div class="col-md-3" style="text-align: center;">
                                </div>
                            </div>
                        </div>

                        <asp:Label ID="Label1" runat="server" Text="" ForeColor="green"></asp:Label>
                    </div>
                    <div class="col-md-3">
                    </div>
                </div>

            </div>
        </div>
    </div>
 <style>
        div.icon-launch {
            padding-top: 15px;
            padding-left: 7px;
            bottom: 15px;
            right: 30px;
            position: fixed;
            color: orangered;
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
            text-align: center;
            color: #000;
            -webkit-transition: all 0.5s;
        }

            .carouselPointers span.imgSpan {
                background: #cb3906;
                padding: 10px 8px;
                display: inline-block;
                width: 76px;
                height: 60px;
                vertical-align: middle;
                border-radius: 50px 50px 50px 50px;
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


    <style>    .carouselPointers1 {
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
            border: 3px solid #cb 9 font- ize: 14px;
            t-transform uppercas;
            fot-weig 0;
            letter spaing 1p;
            at: left : 178px;
            hei 0px;
            /transtion: al;
            */ - ebkit ition: all 0.5s
        }
</style>

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
        function ShowQuicklink() {

        }
        function HideQuicklink() {

        }
    </script>
    <style>        .btn {
            backgr olor: R yalBl
        }
	</style>




    <style>         {
			text-align: center
        		font-family: Tahoma, Aria s-serif;
        	r: #06D85F;
			m rgin: 80px
        
        
		.box {
			width: 40%
        		margin: 0 auto;
			backg  # b
            
			paddin : 25px;
            border: 1px olid #ff;
		border-radi
            px/50p ;
			ba
            und-cli : padi
        o

        	tex -
            : cent r;            
            
		.bu tn {            
            nt-size: 1. em;
			ng: 10px
            			: #fff;
            		borde: 2px
            d #eb0029;
		border-ra
             20px/50px;
			ext-decorati
            one;
			cu sor: po
        r

        transit o
            l 0.3s eas -out;            

			.b tton:
             {
			back
            d: #06D 5F;
			}

		.ov
             {
			positio : fixed;            
            p: 0;
			bottom  0;            
            ft: 0;            			right
            
			backgro nd: rgba0, 0, 0, 
        ;

        ansition: opa i
            ms;
			vis bility: 
        n

        opacity: 0
            }

			. verlay
            et {
            	sibilit : 
            le;            
            		ity: 1            
            

		.popup {
			mrgn: 70px 
            
			paddin : 20px;
			ba
            und: #fff;            			bord
            dius: 5p ;        w

        5%;
			positio :
            ive;
			tr nsition:
            s ease-i -o
        	
        			.po u
            {
				argi-top:
            				colo : #33
            			font-fam ly: T
            , Arial, sans- erif
            	}
            
            		.p
            .close {            				posit
            absolute;            
            			op 20px;
				t

                
				ra s
             all 200ms;
            	t-size  30px
            	font-weight  bold;            				tet-decoratio
        n

        	color #333;
            
				.po up .close
             {            
            				c
            #06D85 ;            
		
			.popup conent  {            ax-height: 30%;            verflow: aut ;
				@media screen nd (m
            th: 70 px) {
        .

        			widh: 70%;
			            popup 
				wi
        0

        }
		}
    </style>

    <style type="text/css">
		.center {
			margin: 0 auto;
		}

		.awesome {
			font-family: 'Segoe UI';
			font-style: normal;
			width: 100%;
			margin: 0 auto;
			text-align: center;
			color: #313131;
			font-size: 40px;
			font-weight: bold;
			position: absolute;
			-webkit-animation: colorchange 50s infinite alternate;
		}

		@-webkit-keyframes colorchange {
			0% {
				color: blue;
			}

			10% {
				color: lime;
			}

			20% {
				color: darkorange;
			}

			30% {
				color: blue;
			}

			40% {
				color: lime;
			}

			50% {
				color: darkorange;
			}

			60% {
				color: blue;
			}

			70% {
				color: lime;
			}

			80% {
				color: darkorange;
			}

			90% {
				color: blue;
			}

			100% {
				color: lime;
			}
		}
	</style>

    <link href="assets/css/modal.css" rel="stylesheet" />
    <script src="js/jquery-1.10.2.min.js"></script>
    <%-- <script src="assets/js/vendor/jquery-1.11.2.min.js"></script>--%>
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