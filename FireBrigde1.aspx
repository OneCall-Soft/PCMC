<%@ Page Language="C#" AutoEventWireup="true" CodeFile="FireBrigde1.aspx.cs" Inherits="FireBrigde1" %>




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
    <%--<%-- <link href="https://fonts.googleapis.com/css?family=Ubuntu:300,300i,400,400i,500,500i,700,700i" rel="stylesheet">--%>--%>

    <script
        src="https://code.jquery.com/jquery-3.4.1.js"
        integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
    <script src="js/CustomeJSFile.js"></script>

    <link href="css/fontawesome.css" rel="stylesheet" />
    <link rel="stylesheet" href="assets/css/swiper.min.css" />
    <link href="css/fontawesome.min.css" rel="stylesheet" />

    <link href="css/all.min.css" rel="stylesheet" />


    <!--Theme custom css -->


    <link rel="stylesheet" href="assets/css/style9.css">

    <!--Theme Responsive css-->
    <link rel="stylesheet" href="assets/css/responsive.css" />

    <style>
        .glyphicon-plus {
            padding-top: 4px;
        }
    </style>
    <script src="assets/js/vendor/modernizr-2.8.3-respond-1.4.2.min.js"></script>
</head>
<body data-spy="scroll" data-target=".navbar-collapse">
    <form id="form1" runat="server">






        <div class="row" style="margin-right: 0px; margin-left: 0px;">
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


        <div style="background-color: #0c529c; height: 578px;">
            <div class="row" style="margin-top: 8%; text-align: center; margin-left: 0px; margin-right: 0px;">

                <div class="col-sm-12" style="border: #000; width: 100%; margin-right: 0px; margin-top: -8%;">
                    <div style="border-radius: 10px; height: auto; background: rgba(255, 255, 255, 0.51);">
                        <div class="row" style="background-color: #0c529c;">


                            <div class="col-sm-4" style="text-align: left; margin-top: 2%">
                                <%--<a runat="server" style="font-size: 18px; font: bold; color: #fff; opacity: 0.5;"><%=Resources.Resource.Home %>/</a>
								<a style="font-size: 18px; font: bold; color: white"><%=Resources.Resource.Fire %> <%=Resources.Resource.Brigade %></a>--%>
                            </div>

                            <div class="col-sm-4" style="margin-top: 20px;">
                                <span style="margin-top: 15px; text-align: center; color: whitesmoke; font-size: 30px; font-family: 'Source Sans Pro',sans-serif"><%=Resources.Resource.Fire %> <%=Resources.Resource.Brigade %></span>
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




                </div>

            </div>
            <div class="row" style="text-align: center; padding-left: 3%;">
                <div class="" style="position: absolute; border: solid 1px #f00; width: 96%; margin-top: -6%; background: #eee; border-radius: 10px; text-align: center; height: 507px;">


                    <div class="row" style="padding-left: 25%; padding-top: 14px; margin-top: auto">

                        <div class="row" runat="server" style="background-color: #f8f7f7; padding: 16px; width: 70%; margin-top: 1%; border: 4px solid red; border-top: 4px solid red">


                            <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true" style="text-align: left;">

                                <div class="panel panel-default">
                                    <div class="panel-heading" role="tab" id="headingOne" style="background-color: #08223D">
                                        <h4 class="panel-title">
                                            <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne" style="color: White">
                                                <i class="short-full glyphicon glyphicon-plus" style="background-color: #c52d2f; height: 22px; text-align: center; width: 36px;"></i>
                                                <%=Resources.Resource.GAVCFS %> <span style="float: right; padding-right: 40px; font-weight: 400; color: White"><i style="margin-right: 10px;" class="fa fa-phone" aria-hidden="true"></i>9922501475</span>
                                            </a>
                                        </h4>
                                    </div>
                                    <div id="collapseOne" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingOne">
                                        <div class="panel-body">
                                            <%=Resources.Resource.FB1 %>
                                        </div>
                                    </div>
                                </div>

                                <div class="panel panel-default">
                                    <div class="panel-heading" role="tab" id="headingTwo" style="background-color: #08223D">
                                        <h4 class="panel-title">
                                            <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo" style="color: White">
                                                <i class="short-full glyphicon glyphicon-plus" style="background-color: #c52d2f; height: 22px; text-align: center; width: 36px;"></i>
                                                <%=Resources.Resource.RMSSB %> <span style="float: right; padding-right: 40px; font-weight: 400; color: White"><i style="margin-right: 10px;" class="fa fa-phone" aria-hidden="true"></i>9922501476</span>
                                            </a>
                                        </h4>
                                    </div>
                                    <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
                                        <div class="panel-body">
                                            <%=Resources.Resource.FB2 %>
                                        </div>
                                    </div>
                                </div>


                                <div class="panel panel-default">
                                    <div class="panel-heading" role="tab" id="headingThree" style="background-color: #08223D">
                                        <h4 class="panel-title">
                                            <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="false" aria-controls="collapseThree" style="color: White">
                                                <i class="short-full glyphicon glyphicon-plus" style="background-color: #c52d2f; height: 22px; text-align: center; width: 36px;"></i>
                                                <%=Resources.Resource.SFSP %>  <span style="float: right; padding-right: 40px; font-weight: 400; color: White"><i style="margin-right: 10px;" class="fa fa-phone" aria-hidden="true"></i>9922501477</span>
                                            </a>
                                        </h4>
                                    </div>
                                    <div id="collapseThree" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
                                        <div class="panel-body">
                                            <%=Resources.Resource.FB3 %>
                                        </div>
                                    </div>
                                </div>

                                <div class="panel panel-default">
                                    <div class="panel-heading" role="tab" id="headingFour" style="background-color: #08223D">
                                        <h4 class="panel-title">
                                            <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseFour" aria-expanded="false" aria-controls="collapseTwo" style="color: White">
                                                <i class="short-full glyphicon glyphicon-plus" style="background-color: #c52d2f; height: 22px; text-align: center; width: 36px;"></i>
                                                <%=Resources.Resource.SFSR %> <span style="float: right; padding-right: 40px; font-weight: 400; color: White"><i style="margin-right: 10px;" class="fa fa-phone" aria-hidden="true"></i>9922501478</span>
                                            </a>
                                        </h4>
                                    </div>
                                    <div id="collapseFour" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingFour">
                                        <div class="panel-body">
                                            <%=Resources.Resource.FB4 %>
                                        </div>
                                    </div>
                                </div>

                                <div class="panel panel-default">
                                    <div class="panel-heading" role="tab" id="headingFive" style="background-color: #08223D">
                                        <h4 class="panel-title">
                                            <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseFive" aria-expanded="false" aria-controls="collapseTwo" style="color: White">
                                                <i class="short-full glyphicon glyphicon-plus" style="background-color: #c52d2f; height: 22px; text-align: center; width: 36px;"></i>
                                                <%=Resources.Resource.SFST %> <span style="float: right; padding-right: 40px; font-weight: 400; color: White"><i style="margin-right: 10px;" class="fa fa-phone" aria-hidden="true"></i>9552523101</span>
                                            </a>
                                        </h4>
                                    </div>
                                    <div id="collapseFive" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingFive">
                                        <div class="panel-body">
                                            <%=Resources.Resource.FB5 %>
                                        </div>
                                    </div>
                                </div>

                                <div class="panel panel-default">
                                    <div class="panel-heading" role="tab" id="headingSix" style="background-color: #08223D">
                                        <h4 class="panel-title">
                                            <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseSix" aria-expanded="false" aria-controls="collapseTwo" style="color: White">
                                                <i class="short-full glyphicon glyphicon-plus" style="background-color: #c52d2f; height: 22px; text-align: center; width: 36px;"></i>
                                                <%=Resources.Resource.CFS1 %>  <span style="float: right; padding-right: 40px; font-weight: 400; color: White"><i style="margin-right: 10px;" class="fa fa-phone" aria-hidden="true"></i>02027494849</span>
                                            </a>
                                        </h4>
                                    </div>
                                    <div id="collapseSix" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingSix">
                                        <div class="panel-body">
                                            <%=Resources.Resource.FB6 %>
                                        </div>
                                    </div>
                                </div>
                                <div class="panel panel-default">
                                    <div class="panel-heading" role="tab" id="headingSeven" style="background-color: #08223D">
                                        <h4 class="panel-title">
                                            <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseSeven" aria-expanded="false" aria-controls="collapseTwo" style="color: White">
                                                <i class="short-full glyphicon glyphicon-plus" style="background-color: #c52d2f; height: 22px; text-align: center; width: 36px;"></i>
                                                <%=Resources.Resource.CFS2 %>  <span style="float: right; padding-right: 40px; font-weight: 400; color: White"><i style="margin-right: 10px;" class="fa fa-phone" aria-hidden="true"></i>8669694101</span>
                                            </a>
                                        </h4>
                                    </div>
                                    <div id="collapseSeven" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingSeven">
                                        <div class="panel-body">
                                            <%=Resources.Resource.FB7 %>
                                        </div>
                                    </div>
                                </div>

                            </div>

                        </div>
                        <!-- panel-group -->
                    </div>
                </div>
            </div>

        </div>

        <div class="QuickLink" style="margin-top: -8.3%;">
            <div class="fixed-bottom">
                <div class="row fixed-row-bottom" id="QuickLink" style="margin-top: 1%; background-color: #cdcdcd; margin-right: 0px; width: 96%; border-radius: 15px; margin-left: 25px;">

                    <%-- <div class="col-md-12"></div>--%>

                    <div class="col-md-1"></div>
                    <div class="col-md-2" style="margin-top: 37px; padding-left: 55px">
                        <h5><span style="color: darkgreen; font: bold; font-size: 20px;"><%=Resources.Resource.quicklinks %></span></h5>
                    </div>
                    <div class="col-md-8" style="margin-left: 0px; margin-top: 1%">
                        <a href="Ambulance2.aspx" class="carouselPointers" onclick="HideQuicklink();"><span class="imgSpan" style="position: relative; background-color: #f8f9fa">
                            <img src="images/Ambulance.png" style="margin-bottom: 25px; text-align: center; height: 60px; margin-top: -8px;" /></span><br />
                            <%=Resources.Resource.Ambulance %></a> &nbsp;&nbsp;&nbsp;&nbsp;
                        <a href="BloodBank1.aspx" class="carouselPointers" onclick="HideQuicklink();"><span class="imgSpan" style="position: relative; background-color: #f8f9fa">
                            <img src="images/bloodbank.png" style="height: 36px;" /></span><br />
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
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css" />
        <%--		<link href="css/bootstrap.min.css" rel="stylesheet" />--%>
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
