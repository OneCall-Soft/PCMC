<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="MainPage" %>

<!DOCTYPE html>

<html style="overflow: hidden;">
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
    <%--	<link rel="stylesheet" href="assets/css/slider.css">--%>
    <%--	<link rel="stylesheet" href="assets/css/a.css">--%>
    <!--Theme custom css -->
    <link rel="stylesheet" href="assets/css/style1.css">
    <%--<link rel="stylesheet" href="assets/css/style9.css">--%>

    <!--Theme Responsive css-->
    <link rel="stylesheet" href="assets/css/responsive.css" />

    <script src="assets/js/vendor/modernizr-2.8.3-respond-1.4.2.min.js"></script>

    <style>
        div.icon-launch {
            padding-top: 15px;
            padding-left: 7px;
            bottom: 25px;
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

    <script lang="javascript">



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

            //var x = document.getElementById("QuickLink");
            //if (x.style.display === "none") {
            //	x.style.display = "block";
            //} else {
            //	x.style.display = "none";
            //}
            //var x = document.getElementById("Back");
            //if (x.style.display === "none") {
            //	x.style.display = "block";
            //} else {
            //	x.style.display = "none";
            //}

        }
        function HideQuicklink() {

            //var x = document.getElementById("QuickLink");
            //if (x.style.display === "none") {
            //	x.style.display = "block";
            //} else {
            //	x.style.display = "none";
            //}


        }
    </script>

    <style>
        .btn:hover {
            background-color: RoyalBlue;
        }
    </style>

    <style>
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
                color: white;
            }

            10% {
                color: white;
            }

            20% {
                color: white;
            }

            30% {
                color: white;
            }

            40% {
                color: white;
            }

            50% {
                color: white;
            }

            60% {
                color: white;
            }

            70% {
                color: white;
            }

            80% {
                color: white;
            }

            90% {
                color: white;
            }

            100% {
                color: white;
            }
        }
    </style>

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

    <script>
       <%-- $.getJSON("https://api.ipify.org/?format=json", function (e) {
            alert(e.ip);
            $("#" + '<%=hiddenip.ClientID %>').val(e.ip);
        });--%>
    </script>
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
                width: 100%;
                height: 100%;
            }

        .title {
            text-align: center;
            margin-top: 20px;
            padding: 10px;
            text-shadow: 2px 2px #000;
            color: #FFF;
        }

        .nice_image img {
            background-color: #fff !important;
            padding: 10px !important;
            border-radius: 10px !important;
        }

        .gap a {
            padding: 0px 3%;
        }

        .nice_icon img {
            height: 52px;
            background-color: #fff;
            padding: 10px;
            border-radius: 50px;
            MARGIN-top: 10px;
        }
    </style>

   
</head>
<body>
    <form id="form1" runat="server">
        <div class="container-fluid">
            <input type="hidden" id="hiddenip" runat="server" />
            <div class="row" style="background-color: #6ECA07;">
                <div class="col-xl-9 col-md-9 col-sm-12" style="padding: 20px;">
                    <p class="awesome" style="font-size: 3vw;"><%=Resources.Resource.Smartcityline %></p>
                </div>
                <div class="col-xl-3 col-md-3 col-sm-12 btn-group" style="padding: 10px;">
                    <asp:Button runat="server" CssClass="btn" Style="background-color: rgba(123, 72, 209, 0.8); font-size: larger;" UseSubmitBehavior="false" OnClick="Marathi_click" ID="btnMarathi" value="hi" class="btn btn button arrow" Text="मराठी"></asp:Button>
                    <asp:Button runat="server" CssClass="btn" Style="background-color: rgba(238, 174, 2, 0.8); font-size: larger;" UseSubmitBehavior="false" ID="btnEnglish" OnClick="Marathi_click" value="en-us" class="btn btn button english" Text="English"></asp:Button>
                    <asp:Button runat="server" CssClass="btn" Style="background-color: rgba(0, 139, 219, 0.8); font-size: larger;" UseSubmitBehavior="false" ID="btnHindi" OnClick="Marathi_click" value="hi" class="btn btn button hindi" Text="हिन्दी"></asp:Button>
                </div>
            </div>

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
            <%-- <section id="home" class="home" style="height: 587px;">--%>

            <%--header Images--%>

            <div class="row " style="background-color: #6ECA07;">

                <div class="col-xl-3 col-md-6 col-sm-6 nice_image" style="text-align: center; margin-bottom: 5px;">
                    <img class="img-fluid" src="images/pcmclogo.jpg" />
                </div>

                <div class="col-xl-3 col-md-6 col-sm-6 nice_image" style="text-align: center; margin-bottom: 5px;">
                    <img class="img-fluid" src="images/smart.jpg" />
                </div>

                <div class="col-xl-3 col-md-6 col-sm-6 nice_image" style="text-align: center; margin-bottom: 5px;">
                    <img class="img-fluid" src="images/smart2.jpg" />
                </div>

                <div class="col-xl-3 col-md-6 col-sm-6 nice_image" style="text-align: center;">
                    <img class="img-fluid" src="images/digitalindia.jpg" />
                </div>
                <%--	<div class="col-md-2" style="margin-top:5px">					

					</div>--%>
            </div>

            <%--Div to show the data--%>

            <div class="row text-center" style="background-color: #6ECA07; height: auto; border-radius: 0px 0px 0px 0px;">
                <div class="col-md-2 col-sm-3 ">
                    <a href="Entertainment1.aspx" style="color: #000;">
                        <div class="nice_icon">
                            <span class="imgSpan" style="position: relative; position: center;">
                                <img src="images/enta.png" style="" />
                            </span>
                            <div>
                                <span style="font-family: 'Segoe UI'; font-size: 14px; color: #FFFFFF;">
                                    <%=Resources.Resource.entertainment %>
                                </span>
                            </div>
                        </div>
                    </a>
                </div>
                <div class="col-md-2 col-sm-3">
                    <a href="GVFeedback1.aspx" style="color: #000;">
                        <div class="nice_icon">
                            <span class="imgSpan" style="position: relative; position: center;">
                                <img src="images/grivence.png" style="" />
                            </span>
                            <div>
                                <span style="font-family: 'Segoe UI'; font-size: 14px; color: #FFFFFF;">
                                    <%=Resources.Resource.GrievanceFeedback %>
                                </span>
                            </div>
                        </div>
                    </a>
                </div>
                <div class=" col-md-2 col-sm-3">
                    <a href="InfoServices1.aspx" style="color: #000;">
                        <div class="nice_icon">
                            <span class="imgSpan" style="position: relative; position: center;">
                                <img src="images/it.png" style="" />
                            </span>
                            <div>
                                <span style="font-family: 'Segoe UI'; font-size: 14px; color: #FFFFFF;">
                                    <%=Resources.Resource.InformationServices %>
                                </span>
                            </div>
                        </div>
                    </a>
                </div>

                <div class="col-sm-3 col-md-2">
                    <a href="PaymentServices1.aspx" style="color: #000;">
                        <div class="nice_icon">
                            <span class="imgSpan" style="position: relative; position: center;">
                                <img src="images/paymentservices.png" style="" />
                            </span>
                            <div>
                                <span style="font-family: 'Segoe UI'; font-size: 14px; color: #FFFFFF;">
                                    <%=Resources.Resource.PaymentServices %>
                                </span>
                            </div>
                        </div>
                    </a>
                </div>
                <div class="col-sm-3 col-md-2">
                    <a href="PublicTransport1.aspx" style="color: #000;">
                        <div class="nice_icon">
                            <span class="imgSpan" style="position: relative; position: center;">
                                <img src="images/transport3.png" style="" />
                            </span>
                            <div>
                                <span style="font-family: 'Segoe UI'; font-size: 14px; color: #FFFFFF;">
                                    <%=Resources.Resource.transport %>
                                </span>
                            </div>
                        </div>
                    </a>
                </div>
                <div class="col-md-2 col-sm-3">
                    <a href="Default2.aspx" style="color: #000;">
                        <div class="nice_icon">
                            <span class="imgSpan" style="position: relative; position: center;">
                                <img src="images/rts.png" style="" />
                            </span>
                            <div>
                                <span style="font-family: 'Segoe UI'; font-size: 14px; color: #FFFFFF;">
                                    <%=Resources.Resource.ESeverices %>
                                </span>
                            </div>
                        </div>
                    </a>
                </div>
            </div>

            <div class="row">
                <img src="assets/images/Background.png" style="height: 100%; width: 100%; margin: 0px; overflow: hidden; position: relative;" />
            </div>

            <%-- Bottom sticky footer --%>
            <div class="row fixed-bottom" style="background-color: #cdcdcd;">
                <div class="col-md-2 col-sm-12 col-xs-12 " style="margin-top: 37px; padding-left: 55px">
                    <h5><span style="color: darkgreen; font: bold; font-size: 20px;"><%=Resources.Resource.quicklinks %></span></h5>
                </div>
                <div class="col-md-9 col-sm-12 col-xs-12 " style="margin-left: 0px; margin-top: 1%">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-md-2 col-sm-6">
                                <a href="Ambulance2.aspx" class="carouselPointers" onclick="HideQuicklink();"><span class="imgSpan" style="position: relative; background-color: #f8f9fa">
                                    <img src="images/Ambulance.png" style="margin-bottom: 25px; text-align: center; height: 60px; margin-top: -8px;" /></span><br />
                                    <%=Resources.Resource.Ambulance %></a>
                            </div>
                            <div class="col-md-2 col-sm-6">
                                <a href="BloodBank1.aspx" class="carouselPointers" onclick="HideQuicklink();"><span class="imgSpan" style="position: relative; background-color: #f8f9fa">
                                    <img src="images/bloodbank.png" /></span><br />
                                    <%=Resources.Resource.Blood %> <%=Resources.Resource.Bank %></a>
                            </div>
                            <div class="col-md-2 col-sm-6">
                                <a href="FireBrigde1.aspx" class="carouselPointers" onclick="HideQuicklink();"><span class="imgSpan" style="position: relative; background-color: #f8f9fa">
                                    <img src="images/fire.png" style="height: 30px; margin-top: 5px;" /></span><br />
                                    <%=Resources.Resource.Fire %> <%=Resources.Resource.Brigade %></a>
                            </div>
                            <div class="col-md-2 col-sm-6">
                                <a href="Hospital1.aspx" class="carouselPointers" onclick="HideQuicklink();"><span class="imgSpan" style="position: relative; background-color: #f8f9fa">
                                    <img src="images/hospital.png" style="height: 31px; margin-top: 5px;" /></span><br />
                                    <%=Resources.Resource.Hospitals %></a>
                            </div>
                            <div class="col-md-2 col-sm-6">
                                <a href="Police1.aspx" class="carouselPointers" onclick="HideQuicklink();"><span class="imgSpan" style="position: relative; background-color: #f8f9fa">
                                    <img src="images/police.png" style="height: 40px" /></span><br />
                                    <%=Resources.Resource.Police %></a>
                            </div>
                            <div class="col-md-2 col-sm-6">
                                <a href="Chemist1.aspx" class="carouselPointers" onclick="HideQuicklink();"><span class="imgSpan" style="position: relative; background-color: #f8f9fa">
                                    <img src="images/chemist.png" style="height: 35px; margin-top: 2px;" /></span><br />
                                    <%=Resources.Resource.Chemist %></a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-1 col-sm-12 col-xs-12">
                    <a href="http://www.pcmchelpline.in/helpline/english/help-dashboard.php">
                        <div class="icon-launch"></div>
                    </a>
                    <p style="margin-top: 127%; margin-left: 25%">V1.0.0.4</p>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
