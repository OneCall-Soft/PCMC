<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UtilityBill1.aspx.cs" Inherits="Default2" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <meta name="google" content="notranslate">
    <meta charset="utf-8">
    <title></title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <script
        src="https://code.jquery.com/jquery-3.4.1.js"
        integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
    <script src="js/CustomeJSFile.js"></script>
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

    <%--	<link rel="stylesheet" href="assets/css/style9.css">--%>

    <!--Theme Responsive css-->
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
            right: -1% !important;
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
        <%--		<section id="home" class="home" style="height: 587px;">--%>

        <div class="row" style="margin-right: 0px; margin-left: 0px; display: none;">
            <%--header--%>
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
            <%--	<div class="col-md-2" style="margin-top:5px">					

					</div>--%>
        </div>

        <hr style="border: 1px solid #eb0029; margin-top: 0rem;">


        <div style="background-color: #ff8f00; height: 213px;">
            <%--Div to show the data--%>

            <div class="row" style="margin-top: 8%; text-align: center; margin-left: 0px; margin-right: 0px;">

                <div class="col-sm-12" style="border: #000; width: 100%; margin-right: 0px; margin-top: -8%;">
                    <div style="border-radius: 10px; height: auto; background: rgba(255, 255, 255, 0.51);">
                        <div class="row" style="background-color: #ff8f00;">


                            <div class="col-sm-4" style="text-align: left; margin-top: 2%">
                                <%-- <a runat="server" style="font-size: 18px; font: bold; color: #fff; opacity: 0.5;"><%=Resources.Resource.Home %>/</a>
                           
							<a href="PaymentServices1.aspx" id="btnMarathi"  style="font-size: 18px; font: bold; color: #fff; opacity: 0.5;"><%=Resources.Resource.PaymentServices %>/</a>
							 <a style="font-size: 18px; font: bold; color: white"><%=Resources.Resource.UtilityServices %></a>--%>
                            </div>

                            <div class="col-sm-4" style="margin-top: 20px;">
                                <span style="margin-top: 15px; text-align: center; color: whitesmoke; font-size: 30px; font-family: 'Source Sans Pro',sans-serif"><%=Resources.Resource.UtilityServices %></span>
                            </div>
                            <div class="col-sm-4" style="margin: 11px 12px 75px 20px; height: 77px; max-width: 30%; text-align: right;">
                                <a href="PaymentServices1.aspx">
                                    <div style="position: relative">
                                        <p style="top: 21px; position: absolute; right: 21px; font-size: larger; color: white; font-weight: 600">
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

            <%--Div to show the data--%>
            <div class="row">
                <div class="" style=""></div>


            </div>

            <div class="row" style="text-align: center;">
                <div class="" style="position: absolute; width: 101%; /* left: 15%; */margin-top: -7%; background: #eee; /* border-radius: 10px; */text-align: center; height: 85%; /* box-shadow: 0px 6px 20px 0px #000000c7; */">

                    <div class="col-sm-12">
                        <div class="row" style="text-align: center; margin-top: 7%; padding-left: 23%;">

                            <div class="col-sm-2"></div>

                            <div class="col-sm-3" style="margin: 20px 20px 20px 80px; height: 150px; background: #FFFFFF; border: 1px solid #ff8f00; padding: 10px; border-radius: 10px;">



                                <a href="https://wss.mahadiscom.in/wss/wss?uiActionName=getViewPayBill">
                                    <span class="imgSpan" style="position: relative; position: center;">
                                        <i class="fa fa-bolt fa-5x" style="color: #ff8f00;"></i>
                                    </span>
                                    <br />
                                    <span style="font-family: 'Segoe UI'; font-size: 20px; text-decoration: none; color: #ff8f00;">
                                        <%=Resources.Resource.electricitybill %> <%=Resources.Resource.Paymentsss %>
                                    </span>
                                </a>
                            </div>



                        </div>

                    </div>


                </div>



            </div>


            <%-- <div class="carousel slide carousel-fade" data-ride="carousel" style=" margin: 0 auto; width: 95%; margin-top: -3%; overflow:visible">

            <div class="carousel-inner" role="listbox" style="overflow:visible;">
                <div class="item active">
                </div>
                <div class="item">
                </div>
                <div class="item">
                </div>
                <div class="item">
                </div>
            </div>
        </div>--%>
        </div>
        <div class="QuickLink">
            <div class="fixed-bottom">
                <div class="row fixed-row-bottom" id="QuickLink" style="background-color: #cdcdcd; width: 100%;">

                    <%-- <div class="col-md-12"></div>--%>


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

        <%-- <div class="QuickLink">
            <div class="fixed-bottom">
                <div class="row fixed-row-bottom" id="QuickLink" style="margin-top: 1%; background-color: white; margin-right: 0px">
                    <%--Footer--
                    <div class="col-md-12" style="border:solid 1px #eb0029;"></div>
                    <div class="col-md-1"></div>

                    <div class="col-md-2" style="margin-top: 37px; padding-left: 55px">
                        <h5><span style="color: darkgreen; font: bold; font-size: larger"><%=Resources.Resource.quicklinks %></span></h5>
                    </div>
                    <div class="col-md-8" style="margin-left: 0px; margin-top: 1%">
                        <a href="Ambulance.aspx" class="carouselPointers" onclick="HideQuicklink();"><span class="imgSpan" style="position: relative; background-color: lime">
                            <img src="images/Ambulance.png" style="margin-bottom: 25px" /></span><span class="carouselPointersText" style="border: 3px solid lime;"><%=Resources.Resource.Ambulance %></span></a>
                        <a href="BloodBank.aspx" class="carouselPointers" onclick="HideQuicklink();"><span class="imgSpan" style="position: relative; background-color: lime">
                            <img src="images/bloodbank.png" /></span><span class="carouselPointersText" style="border: 3px solid lime;"><%=Resources.Resource.Blood %> <%=Resources.Resource.Bank %></span></a>
                        <a href="FireBrigde.aspx" class="carouselPointers" onclick="HideQuicklink();"><span class="imgSpan" style="position: relative; background-color: lime">
                            <img src="images/fire.png" style="height: 30px" /></span><span class="carouselPointersText" style="border: 3px solid lime;"><%=Resources.Resource.Fire %> <%=Resources.Resource.Brigade %></span></a><br />
                        <a href="Hospital.aspx" class="carouselPointers" onclick="HideQuicklink();"><span class="imgSpan" style="position: relative; background-color: lime">
                            <img src="images/hospital.png" style="height: 30px" /></span><span class="carouselPointersText" style="border: 3px solid lime;"><%=Resources.Resource.Hospitals %></span></a>
                        <a href="Police.aspx" class="carouselPointers" onclick="HideQuicklink();"><span class="imgSpan" style="position: relative; background-color: lime">
                            <img src="images/police.png" style="height: 30px" /></span><span class="carouselPointersText" style="border: 3px solid lime;"><%=Resources.Resource.Police %></span></a>
                        <a href="Chemist.aspx" class="carouselPointers" onclick="HideQuicklink();"><span class="imgSpan" style="position: relative; background-color: lime">
                            <img src="images/chemist.png" style="height: 30px" /></span><span class="carouselPointersText" style="border: 3px solid lime;"><%=Resources.Resource.Chemist %></span></a>

                    </div>
                    <div class="col-md-1">
                        <a href="http://www.pcmchelpline.in/helpline/english/help-dashboard.php" onclick="centeredPopup(this.href,'myWindow','1440','900','yes');return false">
                           <div class="icon-launch"></div>
                        </a>
                    </div>
                </div>
            </div>
        </div>--%>









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
                background-color: RoyalBlue;
            }
        </style>




        <style>
            h1 {
  
            xt-align: e
                     font-family: Tahoma, Ar
            f

                   color: #06D85F;
            margin: 80px 0;            
                            wid
                        marg n: 0 auo;
             029;                
                        px;
        1

                 adius: 5px/
                     ba kround
                ;
               t
                
           button                 
           m;
               padd
                          color: #fff;
      2px solid eb0029;
             
            :  20px/ 0
                   text-de oratio
                        ursor
                         tr
                 ease-o t;                           }                 .button:hover {                
       round: #06D85F;                              .overl
                    positio : fxed;
        ;

            ttom: 0;
                  right
             
            gba(0, 0  
                        t ansiti
                
    ity: hi de
                  opa it
                 }
                
                  lay:target 
              ible;
                            }

  
                 padding  
                 background  #fff;                
                -radius: 5p
             
                   lative;
         all 5s ase-i
                  }

         
                           33;
              Tahoma, Ar al, sas-serif;
  }

            .popup .c o
                    positio : 
                        top
                       right  30px;                                 2

                  font-s z
                        f nt-weight
                      tex
                                         
                
  up .close: over 
                     color: 06D85
                  }

                         3

             overfow: auto;
      @m dia scre
            p

              .box {
      %;
              .popup {
  w

                       }
           }
        </style>

        <style type="text/css">               c

                     m r
                        }    font-family: 'Segoe UI';
                f    font-family: 'Segoe UI';
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
