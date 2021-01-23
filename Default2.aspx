<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default2.aspx.cs" Inherits="Default2" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <meta name="google" content="notranslate">
    <meta charset="utf-8">
    <title></title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <script src="js/CustomeJSFile.js"></script>
    <link rel="icon" type="image/png" href="favicon.ico">
    <%-- <link href="https://fonts.googleapis.com/css?family=Ubuntu:300,300i,400,400i,500,500i,700,700i" rel="stylesheet">--%>
    <link href="css/fontawesome.css" rel="stylesheet" />
    <link rel="stylesheet" href="assets/css/swiper.min.css" />
    <link href="css/fontawesome.min.css" rel="stylesheet" />
    <link href="css/all.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="assets/css/style1.css">
    <link rel="stylesheet" href="assets/css/responsive.css" />
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

        .gap a {
            padding: 0px 3%;
        }

        .fixed-bottom {
            right: -1% !important
        }
    </style>
    <script type="text/javascript">
      
    </script>
</head>
<body style="overflow: hidden">
    <form id="form1" runat="server">
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
        <div class="row" style="margin-right: 0px; margin-left: 0px; display: none;">
            <div class="col-md-12"></div>
            <div class="col-md-3" style="text-align: center;">
                <img src="images/pcmclogo.jpg" />
            </div>
            <div class="col-md-3" style="text-align: center;">
                <img src="images/smart.jpg" />
            </div>
            <div class="col-md-3" style="text-align: center;">
                <img src="images/smart2.jpg" />
            </div>
            <div class="col-md-3" style="text-align: center;">
                <img src="images/digitalindia.jpg" />
            </div>
        </div>
        <hr style="border: 1px solid #eb0029; margin-top: 0rem;">
        <div style="background-color: #ff8f00; height: 213px;">
            <div class="row" style="margin-top: 8%; text-align: center; margin-left: 0px; margin-right: 0px;">
                <div class="col-sm-12" style="border: #000; width: 100%; margin-right: 0px; margin-top: -8%;">
                    <div style="border-radius: 10px; height: auto; background: rgba(255, 255, 255, 0.51);">
                        <div class="row" style="background-color: #ff8f00;">
                            <div class="col-sm-4" style="text-align: left; margin-top: 2%">
                            </div>
                            <div class="col-sm-4" style="margin-top: 20px;">
                                <span style="margin-top: 15px; text-align: center; color: whitesmoke; font-size: 30px; font-family: 'Source Sans Pro',sans-serif"><%=Resources.Resource.ESeverices %></span>
                            </div>
                            <div class="col-sm-4" style="margin: 11px 12px 75px 20px; height: 77px; max-width: 30%; text-align: right;">
                                <a href="Default.aspx">
                                    <div style="position: relative">
                                        <p style="top: 21px; position: absolute; right: 24px; font-size: larger; color: white; font-weight: 600">
                                            <%=Resources.Resource.goback %>
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
            <script src="Content/JQuery/jquery-3.4.1.min.js"></script>
            <link href="Content/Bootstrap4/bootstrap.min.css" rel="stylesheet" />
            <script src="Content/Bootstrap4/bootstrap.min.js"></script>
            <script src="js/CustomeJSFile.js" crossorigin="anonymous" type="text/javascript"></script>
           
            <div class="row">
                <div class="" style=""></div>
            </div>
            <div class="row" style="text-align: center;">
                <div class="" style="position: absolute; width: 101%; /* left: 15%; */ margin-top: -7%; background: #eee; /* border-radius: 10px; */ text-align: center; height: 85%; /* box-shadow: 0px 6px 20px 0px #000000c7; */">
                    <div class="col-sm-12">
                        <div class="row" style="text-align: center; margin-top: 7%;">
                            <div class="col-sm-2"></div>
                            <div class="col-sm-2" style="margin: 20px 20px 20px 80px; height: 132px; background: #FFFFFF; border: 1px solid #ff8f00; padding: 10px; border-radius: 10px;">
                                <a href="https://www.pcmcindia.gov.in/rts_e.php">
                                    <span class="imgSpan" style="position: relative; position: center;">
                                        <i class="fa fa-cogs fa-5x" style="color: #ff8f00;"></i>
                                    </span>
                                    <br />
                                    <span style="font-family: 'Segoe UI'; font-size: 20px; text-decoration: none; color: #ff8f00;">
                                        <%=Resources.Resource.RTSServices %>
                                    </span>
                                </a>
                            </div>
                            <div class="col-sm-2" style="margin: 20px 20px; height: 132px; background: #FFFFFF; border: 1px solid #ff8f00; padding: 10px; border-radius: 10px;">
                                <a href="https://www.pcmcindia.gov.in/TP_info.php">
                                    <span class="imgSpan" style="position: relative; position: center;">
                                        <i class="fa fa-car fa-5x" style="color: #ff8f00;"></i>
                                    </span>
                                    <br />
                                    <span style="font-family: 'Segoe UI'; font-size: 18px; text-decoration:none; color: #ff8f00;">
                                        <%=Resources.Resource.PPZD %> 
                                    </span>
                                </a>
                            </div>
                            <div class="col-sm-2 birthcertificatestyle" id="birthcertificate" runat="server" style="margin: 20px 20px; border: 1px solid #ff8f00; padding: 10px; height: 132px; background: #FFFFFF; border-radius: 10px;">
                                <a href="BNDCertificate.aspx">
                                    <span class="imgSpan" style="position: relative; position: center;">
                                        <img style="height: 80px;" src="images/BirthCertificate1.png" />
                                    </span>
                                    <br />
                                    <span style="font-family: 'Segoe UI'; font-size: 20px; text-decoration: none; color: #ff8f00;">
                                        <%=Resources.Resource.birthcertificate %>
                                    </span>
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-12">
                        <div class="row" style="text-align: center; margin-top: -1%;">
                            <div class="col-sm-2"></div>
                            <div class="col-sm-2 deathcertificatestyle" id="deathcertificate" runat="server" style="margin: 20px 20px 20px 80px; border: 1px solid #ff8f00; padding: 10px; height: 132px; background: #FFFFFF; border-radius: 10px;">
                                <a href="DeathCertificate.aspx">
                                    <span class="imgSpan" style="position: relative; position: center;">
                                        <img style="height: 80px;" src="images/DeathCertificate.png" />
                                    </span>
                                    <br />
                                    <span style="font-family: 'Segoe UI'; font-size: 20px; text-decoration: none; color: #ff8f00;">
                                        <%=Resources.Resource.DeathCertificate %>
                                    </span>
                                </a>
                            </div>
                            <div class="col-sm-2" style="margin: 20px 20px; border: 1px solid #ff8f00; padding: 10px; height: 132px; background: #FFFFFF; border-radius: 10px;">
                                <a href="https://aaplesarkar.maharashtra.gov.in/en/">
                                    <span class="imgSpan" style="position: relative; position: center;">
                                        <img style="width: 80px; height: 90px" src="images/aplesarkar.png" />
                                    </span>
                                    <br />
                                    <span style="font-family: 'Segoe UI'; font-size: 20px; text-decoration: none; color: #ff8f00;">
                                        <%=Resources.Resource.Aplesarkar %>
                                    </span>
                                </a>
                            </div>
                            <div class="col-sm-2" style="margin: 20px 20px; border: 1px solid #ff8f00; padding: 10px; height: 132px; background: #FFFFFF; border-radius: 10px;">
                                <a href="https://www.pcmcindia.gov.in/rti_dept_eng.php">
                                    <%--<span class="imgSpan" style="position: relative; position: center;">
										<img style="width: 80px; height: 90px" src="images/aplesarkar.png" />
									</span>--%>
                                    <br />
                                    <span style="font-family: 'Segoe UI'; font-size: 30px; text-decoration: none; color: #ff8f00;">
                                        <%=Resources.Resource.RTIServices %>
                                    </span>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="QuickLink">
            <div class="fixed-bottom">
                <div class="row fixed-row-bottom" id="QuickLink" style="background-color: #cdcdcd; width: 100%;">
                    <div class="col-md-2" style="margin-top: 37px; padding-left: 55px">
                        <h5><span style="color: darkgreen; font: bold; font-size: 20px;"><%=Resources.Resource.quicklinks %></span></h5>
                    </div>
                    <div class="col-md-9 gap" style="margin-left: 0px; margin-top: 1%">
                        <a href="Ambulance2.aspx" class="carouselPointers" onclick="HideQuicklink();"><span class="imgSpan" style="position: relative; background-color: #f8f9fa">
                            <img src="images/Ambulance.png" style="margin-bottom: 25px; text-align: center; height: 60px; margin-top: -8px;" /></span><br />
                            <%=Resources.Resource.Ambulance %></a> &nbsp;&nbsp;&nbsp;&nbsp;
                        <a href="BloodBank1.aspx" class="carouselPointers" onclick="HideQuicklink();"><span class="imgSpan" style="position: relative; background-color: #f8f9fa">
                            <img src="images/bloodbank.png" /></span><br />
                            <%=Resources.Resource.Blood %> <%=Resources.Resource.Bank %></a> &nbsp;&nbsp;&nbsp;&nbsp;
                        <a href="FireBrigde1.aspx" class="carouselPointers" onclick="HideQuicklink();"><span class="imgSpan" style="position: relative; background-color: #f8f9fa">
                            <img src="images/fire.png" style="height: 30px; margin-top: 5px;" /></span><br />
                            <%=Resources.Resource.Fire %> <%=Resources.Resource.Brigade %></a> &nbsp;&nbsp;
                        <a href="Hospital1.aspx" class="carouselPointers" onclick="HideQuicklink();"><span class="imgSpan" style="position: relative; background-color: #f8f9fa">
                            <img src="images/hospital.png" style="height: 31px; margin-top: 5px;" /></span><br />
                            <%=Resources.Resource.Hospitals %></a> &nbsp;&nbsp;&nbsp;&nbsp;
                        <a href="Police1.aspx" class="carouselPointers" onclick="HideQuicklink();"><span class="imgSpan" style="position: relative; background-color: #f8f9fa">
                            <img src="images/police.png" style="height: 40px" /></span><br />
                            <%=Resources.Resource.Police %></a> &nbsp;&nbsp;&nbsp;&nbsp;
                        <a href="Chemist1.aspx" class="carouselPointers" onclick="HideQuicklink();"><span class="imgSpan" style="position: relative; background-color: #f8f9fa">
                            <img src="images/chemist.png" style="height: 35px; margin-top: 2px;" /></span><br />
                            <%=Resources.Resource.Chemist %></a> &nbsp;&nbsp;&nbsp;&nbsp;
                    </div>
                    <div class="col-md-1">
                        <a href="http://www.pcmchelpline.in/helpline/english/help-dashboard.php">
                            <div class="icon-launch"></div>
                        </a>
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
                    bo rder-radius: 0px 8x 8px 0px;
                    padding: 5 text- lign: left;
                    rder: 3px s lid #cb396;
                    ont-si x;
                    text- ranfor: uperc font weigh lett r-spa px;
                    foat: eft;
                    h: 178px;
                    70px;
                    /* ransition:
				5s;*/
                    webk sition: all 0.5;
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
                und-color: RoyalBlu;
            }
        </style>

        <style>
            h1

            text-alig :
            r;
            font-fami y: Tahom
            l

            ;
            col r: #06D8
            i

            n: 0px
            }

            bo
            width %
            m
            0 auto;
            nd;
            ng: 2 x s lid f


            x/50px
            groun- lp: box;

            t
            i

            e


            ze: 1

            pg: px

            #ff
            sol
            29;

            r-ra

            eo: none;
            rsoran
            eas -ou;
            :hover {
                6
            }

            o

            posit
            p 0;
            ottom


            0
            bacd: gba0,
            0

            trans t
            pacity 5
            y



            ;
            . {
                biit: i io : 1;
                up

            {
                :;
                p: b nd: bo r p 5 n ra si ase-n- op p mag: 0 nt-fmma, san-s lute;
                ;
                ra ll 200s;
                e -we g d;
                cor n #33 pup le co0 up nt m ht o a screen wid)

            {
                widh: 0%;
                up

            {
                7 /
        </style>

        <style type="text/css">
            .cene marin: 0auauto;
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
         <script>
              //  SetService();
                
                $("a").click(function () {                  
                    if ($(this).parent("div").attr("disabled") == "disabled") {
                            return false;
                        }                   
                });
            </script>

        <link href="assets/css/modal.css" rel="stylesheet" />
        <script src="assets/js/vendor/jquery-1.11.2.min.js"></script>
        <script src="assets/js/vendor/bootstrap.min.js"></script>
        <link href="css/bootstrap.min.css" rel="stylesheet" />
        <script src="assets/js/jquery.collapse.js"></script>
        <script src="assets/js/bootsnav.js"></script>
        <script src="assets/js/plugins.js"></script>
        <script src="assets/js/main.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    </form>
</body>
</html>
