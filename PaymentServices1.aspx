<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PaymentServices1.aspx.cs" Inherits="Default2" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <meta name="google" content="notranslate">
    <meta charset="utf-8">
    <title></title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="icon" type="image/png" href="favicon.ico">
    <%-- <link href="https://fonts.googleapis.com/css?family=Ubuntu:300,300i,400,400i,500,500i,700,700i" rel="stylesheet">--%>
    <link href="css/fontawesome.css" rel="stylesheet" />
    <link rel="stylesheet" href="assets/css/swiper.min.css" />
    <link href="css/fontawesome.min.css" rel="stylesheet" />
    <link href="css/all.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="assets/css/style1.css">
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
                                <span style="margin-top: 15px; text-align: center; color: whitesmoke; font-size: 30px; font-family: 'Source Sans Pro',sans-serif"><%=Resources.Resource.PaymentServices %></span>
                            </div>
                            <div class="col-sm-4" style="margin: 11px 12px 75px 20px; height: 77px; max-width: 30%; text-align: right;">
                                <a href="Default.aspx">
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
            <div class="row">
                <div class="" style=""></div>
            </div>



            <div class="row" style="text-align: center;">
                <div class="" style="position: absolute; width: 101%; /* left: 15%; */ margin-top: -7%; background: #eee; /* border-radius: 10px; */ text-align: center; height: 85%; /* box-shadow: 0px 6px 20px 0px #000000c7; */">
                    <div class="col-sm-12">
                        <div class="row" style="text-align: center; margin-top: 7%;">
                            <div class="col-sm-2"></div>
                            <div class="col-sm-2 slumbillingstyle" runat="server" id="slumbilling" style="margin: 20px 20px 20px 80px; height: 150px; background: #FFFFFF; border: 1px solid #ff8f00; padding: 10px; border-radius: 10px;">
                                <a href="Slumbilling.aspx">
                                    <span class="imgSpan" style="position: relative; position: center;">
                                        <i class="fa fa-building fa-5x" style="color: #ff8f00;"></i>
                                    </span>
                                    <br />
                                    <span style="font-family: 'Segoe UI'; font-size: 20px; text-decoration: none; color: #ff8f00;">
                                        <%=Resources.Resource.Slum %> <%=Resources.Resource.Billing %>
                                    </span>
                                </a>
                            </div>
                            <div class="col-sm-2" style="margin: 20px 20px; height: 150px; background: #FFFFFF; border: 1px solid #ff8f00; padding: 10px; border-radius: 10px;">
                                <a href="MobileRecharge1.aspx">
                                    <span class="imgSpan" style="position: relative; position: center;">
                                        <i class="fa fa-volume-control-phone fa-5x" style="color: #ff8f00;"></i>
                                    </span>
                                    <br />
                                    <span style="font-family: 'Segoe UI'; font-size: 20px; text-decoration: none; color: #ff8f00;">
                                        <%=Resources.Resource.telephoneRecharge %>
                                    </span>
                                </a>
                            </div>
                            <div class="col-sm-2" style="margin: 20px 20px; border: 1px solid #ff8f00; padding: 10px; height: 150px; background: #FFFFFF; border-radius: 10px;">
                                <a href="UtilityBill1.aspx">
                                    <span class="imgSpan" style="position: relative; position: center;">
                                        <img src="images/UtilityBillPayment.png" style="height: 70px;" />
                                    </span>
                                    <br />
                                    <span style="font-family: 'Segoe UI'; font-size: 20px; text-decoration: none; color: #ff8f00;">
                                        <%=Resources.Resource.Utility %> <%=Resources.Resource.Payments %> 
                                    </span>
                                </a>
                            </div>
                        </div>
                    </div>

                    <div class="col-sm-12">
                        <div class="row" style="text-align: center; margin-top: -1%;">
                            <div class="col-sm-2"></div>
                            <div class="col-sm-2 propertytaxstyle btnmodal" runat="server" id="propertytax" style="margin: 20px 20px 20px 80px; border: 1px solid #ff8f00; padding: 10px; height: 150px; background: #FFFFFF; border-radius: 10px;">
                                <a id="testa">
                                    <span class="imgSpan" style="position: relative; position: center;">
                                        <img style="width: 128px; height: 75px" src="images/PropertyTax.png" />
                                    </span>
                                    <br />
                                    <span style="font-family: 'Segoe UI'; font-size: 20px; text-decoration: none; color: #ff8f00;">
                                        <%=Resources.Resource.propertytax %>
                                    </span>
                                </a>
                            </div>
                            <div class="col-sm-2 watertaxstyle btnmodal" runat="server" id="watertax" style="margin: 20px 20px; height: 150px; background: #FFFFFF; border: 1px solid #ff8f00; padding: 10px; border-radius: 10px;">
                                <a id="watertaxLink">
                                    <span class="imgSpan" style="position: relative; position: center;">
                                        <img style="width: 128px; height: 75px" src="assets/images/water%20bg.png" />
                                    </span>
                                    <br />
                                    <span style="font-family: 'Segoe UI'; font-size: 20px; text-decoration: none; color: #ff8f00;">
                                        <%=Resources.Resource.watertax %>
                                    </span>
                                </a>
                            </div>
                            <div class="col-sm-2 " style="margin: 20px 20px; height: 150px; background: #FFFFFF; border: 1px solid #ff8f00; padding: 10px; border-radius: 10px;">
                                <a href="https://ebiz.licindia.in/D2CPM/#DirectPay">
                                    <span class="imgSpan" style="position: relative; position: center;">
                                        <img style="width: 128px; height: 75px" src="images/LIC_LOGO.png" />
                                    </span>
                                    <br />
                                    <span style="font-family: 'Segoe UI'; font-size: 20px; text-decoration: none; color: #ff8f00;">
                                        <%=Resources.Resource.LICPremiumPayment %>
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
                text-align: er;
                font-family: Tahom l, sans-se i color: #06D85F;
                margi p
            }

            .box {
                wi 40%;
                margin: 0 auto;
                ck r #eb0029;
                paddi px;
                bor er: 1px solid fff;
                b radius 5px/50p backg oundcl a ox;
                t-alig: ce
            }


            .bu

            font- ize: 1.4
            paddi g: 10
            colo : #ff;
            bo
            2px solid #eb0 29;

            -radius: 20px/50 x;
            text
            ation: none
            c
            :

            r;
            t
            ion: all 0 3s eas
            }


            n:hove {
                ckgroun: #6D85F
            }

            .overlay {
                position:;
                top: 0;
                bo 0;
                left: 0;
                right: 0;
                ackgound: rgb 0 );
                trans t acity 500ms vi t en;
                o: 0;
                rlay ta is y: vi ib op ci
            }


            .popu {
                mar 0px auto;
                paddng: 20 backgrou d: #fff border- ad 5 width: 85%;
                on: relativ;
                t on: all s n
            }

            opup h2 {
                ma op: 0;
                c #333;
                font-: Tahoma, Aria, sa if;
            }

            .popup . lose {
                sition: abs lut;
                top: 20 t: 30p;
                nsition: al 2 f nt-si x;
                fon -weight bold;
                text- t e;
                colo:
            }

            .pop
            se:h ver {
                color #06D
            }

            .ppup .c {
                ma -heig;
                over low:
            }

            @med a scr (max- idth:
            ) box {
                width: 0
            }

            .popup

            70%;
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

        <!-- Service addition modal -->
        <div class="parent" style="position: fixed; top: 0; right: 0; left: 0; bottom: 0; opacity: 0.3; display: none; background-color: darkgray; max-height: 100%">
        </div>
        <div id="myModal" class="modal fade modal-lg" style="position: absolute; left: 0; right: 0; margin: auto; top: 0px; overflow: auto; height: 650px" role="dialog">
            <div class="modal-dialog " style="max-width: 800px; height: auto">
                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <h3 class="modal-title">Health-Feedback</h3>
                        <button type="button" class="close " style="float: right" data-dismiss="modal">&times;</button>
                    </div>
                    <div class="modal-body">
                        <div class="row">
                            <div class="col-md-1"></div>
                            <div class="col-md-10">
                                <div class="row">
                                    <div class="col-md-6">
                                        <style>
                                            label {
                                                font-size: 14px;
                                            }

                                            input[type=text], textarea {
                                                font-size: 14px;
                                            }

                                                input[type=text]:placeholder {
                                                    font-size: 12px;
                                                }
                                        </style>
                                        <label class="label label-info headinglabels">First-Name</label>
                                        <asp:TextBox runat="server" placeholder="Enter First-Name" ID="txtFirstName" CssClass="form-control" />
                                    </div>
                                    <div class="col-md-6">
                                        <label class="label label-info headinglabels">Last-Name</label>
                                        <asp:TextBox runat="server" placeholder="Enter Last-Name" ID="txtlastName" CssClass="form-control" />
                                    </div>
                                    <div class="col-md-12">
                                        <label class="label label-info headinglabels">Mobile No.</label>
                                        <asp:TextBox runat="server" placeholder="Enter Mobile Number" ID="txtMobileNumber" CssClass="form-control" />
                                    </div>

                                    <div class="col-md-12 pt-2">
                                        <div class="card ">
                                            <div class="card-header ">
                                                <div class=""><span class="fa fa-question-circle">How was our service?</span> </div>
                                            </div>
                                            <div class="card-body">
                                                <style>
                                                    img {
                                                        margin-right: 10px;
                                                        width: 35px;
                                                        height: 35px;
                                                        cursor: pointer
                                                    }


                                                    h6 {
                                                        font-size: 12px;
                                                        font-weight: bold
                                                    }

                                                    small {
                                                        font-size: 10px;
                                                        color: #898989
                                                    }
                                                </style>


                                                <div class=" p-2 text-center">
                                                    <h6 class="mb-0">Your feedback help us to improve.</h6>
                                                </div>
                                                <div class="row ">
                                                    <div class="col-md-1"></div>
                                                    <div class="col-md-10">
                                                        <div class="row">
                                                            <div class="col-md-1"></div>
                                                            <div class="col-md-2 text-center" style="padding: 0">
                                                                <img src="images/Feedback Emoji/angry-face-emoji--v2.png" />
                                                            </div>
                                                            <div class="col-md-2 text-center" style="padding: 0">
                                                                <img src="images/Feedback Emoji/sad.png" />
                                                            </div>
                                                            <div class="col-md-2 text-center" style="padding: 0">
                                                                <img src="images/Feedback Emoji/happy.png" />
                                                            </div>
                                                            <div class="col-md-2 text-center" style="padding: 0">
                                                                <img src="images/Feedback Emoji/smiling-face.png" />
                                                            </div>
                                                            <div class="col-md-2 text-center" style="padding: 0">
                                                                <img src="images/Feedback Emoji/lol.png" />
                                                            </div>
                                                            <div class="col-md-1"></div>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-1"></div>
                                                </div>
                                                <div class="form-group mt-4">
                                                    <textarea class="form-control" style="resize:none" rows="4" placeholder="Message"></textarea>
                                                </div>
                                                <div class="mt-2">
                                                    <button id="btnfbsubmit" type="button" class="btn btn-outline-primary btn-block btndbsubmit">Send feedback</button>
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                    <div class="col-md-8 " runat="server" id="divError" style="margin-top: 5px;">
                                        <asp:Label Text="" Style="font-weight: 600; background-color: darkorange; color: white; margin: 5px;" ID="lblerror" runat="server" />
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-1"></div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class=" close btn btn-default" id="btnClose" data-dismiss="modal">Close</button>
                    </div>
                </div>

            </div>
        </div>
        <!--Modal close-->

        <%-- <script>
            $.noConflict();
        </script>--%>
        <link href="assets/css/modal.css" rel="stylesheet" />
        <script src="assets/js/vendor/jquery-1.11.2.min.js"></script>
        <script src="assets/js/vendor/bootstrap.min.js"></script>
        <link href="css/bootstrap.min.css" rel="stylesheet" />
        <script src="assets/js/jquery.collapse.js"></script>
        <script src="assets/js/bootsnav.js"></script>
        <script src="assets/js/plugins.js"></script>
        <script src="assets/js/main.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

        <%--  <script src="Content/JQuery/jquery-3.4.1.min.js"></script>
            <link href="Content/Bootstrap4/bootstrap.min.css" rel="stylesheet" />
            <script src="Content/Bootstrap4/bootstrap.min.js"></script>--%>
        <script src="js/CustomeJSFile.js" crossorigin="anonymous" type="text/javascript"></script>
        <script>    

            var bModalOpened = false;


            $("a").click(function () {
                if ($(this).parent("div").attr("disabled") == "disabled") {
                    return false;
                }


                $(document).on("keypress", "#<%= txtMobileNumber.ClientID %>", function (e) {

                    if ($(this).val().length < 10) {
                        if (e.which > 47 && e.which > 58) {
                            e.preventDefault();
                        } else {

                        }
                    } else {
                        e.preventDefault();
                    }
                });

                $("#btnfbsubmit").click(function (e) {
                    $Fname = $("#<%= txtFirstName.ClientID %>").val();
                    $Lname = $("#<%= txtlastName.ClientID %>").val();
                    $MobileNumber = $("#<%= txtMobileNumber.ClientID %>").val();
                    var url = localStorage.getItem('redirectURL');

                    if ($Fname != "" && $Lname != "" && $MobileNumber != "") {
                        if ($MobileNumber.length >= 10) {
                            window.location.replace(url);
                            e.preventDefault();
                        } else {
                            alert("Invalid mobile number length!");
                            e.preventDefault();
                        }
                    } else {
                        alert("Causion:-all field are mandantory!");
                        e.preventDefault();
                    }
                });


                $(".btnmodal").click(function () {

                    if ($(this).attr('id') == "watertax") {
                        localStorage.setItem('redirectURL', 'watertax.aspx');
                    } else if ($(this).attr('id') == "propertytax") {
                        localStorage.setItem('redirectURL', 'PropertyTaxNew.aspx');
                    }
                    if (!bModalOpened) {
                        $(".parent").css("display", "block");
                        $("#myModal").removeClass('modal').addClass("show");
                        bModalOpened = true;
                    }
                });


                $(".close").click(function () {

                    if (bModalOpened) {
                        $("#myModal").removeClass("show").addClass("modal");
                        $(".parent").css("display", "none");
                        bModalOpened = false;
                    }
                });

            });
        </script>
    </form>
</body>
</html>
