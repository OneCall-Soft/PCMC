<%@ Page Language="C#" AutoEventWireup="true" CodeFile="BNDCertificate.aspx.cs" Inherits="BNDCertificate" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>
<head id="Head1" runat="server">
    <meta charset="utf-8">
    <title></title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="google" content="notranslate">




    <script
        src="https://code.jquery.com/jquery-3.4.1.js"
        integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
        crossorigin="anonymous"></script>
    <%--    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>--%>
    <script src="js/CustomeJSFile.js"></script>

    <%-- <link rel="icon" type="image/png" href="favicon.ico">
    <%-- <link href="https://fonts.googleapis.com/css?family=Ubuntu:300,300i,400,400i,500,500i,700,700i" rel="stylesheet">--%>
    <link href="css/fontawesome.css" rel="stylesheet" />
    <link rel="stylesheet" href="assets/css/swiper.min.css" />
    <link href="css/fontawesome.min.css" rel="stylesheet" />
    <link href="css/all.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="assets/css/style1.css">
    <link rel="stylesheet" href="assets/css/responsive.css" />
    <script src="assets/js/vendor/modernizr-2.8.3-respond-1.4.2.min.js"></script>--%>
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

                .carousell-fade .carousel-inner > .item.next.left,
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

    <%--  <script type="text/javascript">
      
    </script>

    <link rel="stylesheet" href="css/modal.css">--%>
</head>

<body style="overflow: hidden;">
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
        <hr style="border: 1px solid #eb0029; margin-top: 0rem;">
        <div style="height: 100%;">
            <div class="row" style="margin-top: 8%; text-align: center; margin-left: 0px; margin-right: 0px;">
                <div class="col-sm-12" style="border: #000; width: 100%; margin-right: 0px; margin-top: -8%;">
                    <div style="border-radius: 10px; height: auto; background: rgba(255, 255, 255, 0.51);">
                        <div class="row" style="background-color: rgb(0,181,250);">
                            <div class="col-sm-4" style="text-align: left; margin-top: 2%">
                            </div>
                            <div class="col-sm-4" style="margin-top: 20px;">
                                <span style="margin-top: 15px; text-align: center; color: whitesmoke; font-size: 30px; font-family: 'Source Sans Pro',sans-serif"><%=Resources.Resource.birthcertificate %></span>
                            </div>
                            <div class="col-sm-4" style="margin: 11px 12px 75px 20px; height: 77px; max-width: 30%; text-align: right;">
                                <a href="Default2.aspx">
                                    <div style="position: relative">
                                        <p style="top: 19px; position: absolute; right: 23px; font-size: larger; color: white; font-weight: 600">
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
            <div class="row" style="text-align: center; padding-left: 15px;">
                <div style="position: absolute; border: solid 1px #f00; width: 100%; margin-top: -7%; background: #eee; border-radius: 10px; text-align: center; height: 100%;">
                    <div class="row">
                        <div class="col-md-1" style=""></div>
                        <div class="col-md-10" style="border: solid 1px #b5b0b0; padding-top: 5px; padding-bottom: 10px; text-align: left; margin-top: 10px;">



                            <div class="row" style="margin-top: 5px;">
                                <div class="col-md-4">
                                    <%= Resources.Resource.RegistrationNo %> :
									<asp:TextBox runat="server" ID="txtRegNo" AutoComplete="off" CssClass="form-control"></asp:TextBox>
                                </div>
                                <div style="width: 50px; padding: 30px 0 0 14px">
                                    <p><%= Resources.Resource.OR %></p>
                                </div>
                                <div class="col-md-4">
                                   <%= Resources.Resource.DateOfBirth %> :
									<asp:TextBox ID="txtDate" runat="server" placeholder="<% $Resources:Resource,BirthDatePlaceholder %>" autocomplete="off" CssClass="form-control"></asp:TextBox>

                                </div>
                            </div>

                            <div class="row" style="margin-top: 10px;">
                                <div class="col-md-2" style="text-align: center">
                                    <asp:Button runat="server" ID="btnShow" Width="130px" OnClick="btn_Show" CssClass="btn btn-primary" Text="<%$Resources:Resource,Show %>" />
                                </div>
                                <asp:RegularExpressionValidator Display="Dynamic" ForeColor="Red" ID="RegxDate" runat="server" ValidationExpression="(19|20|21)\d\d[-](0[1-9]|1[012])[-](0[1-9]|[12][0-9]|3[01])" ControlToValidate="txtDate" ErrorMessage="Enter a valid date e.g (YYYY-MM-DD)"></asp:RegularExpressionValidator>
                                <div class="col-md-10" style="text-align: left">
                                    <label runat="server" id="lblErrorMsg" style="font-family: 'Segoe UI'; color: red; padding-top: 5px;"></label>
                                </div>
                            </div>
                            <div style="color: red"><%= Resources.Resource.Note %>: **<%= Resources.Resource.DataAvailabilityMessage  %>** </div>
                        </div>
                        <div class="col-md-1" style=""></div>
                    </div>
                    <div class="row">
                        <div class="col-md-1" style=""></div>
                        <div class="col-md-10" style="margin-top: 10px;  height: 450px;">
                            <table class="col-md-12" style="border: groove; align-content: center" runat="server" id="tblDOB">
                                <tr>
                                    <th><%= Resources.Resource.ChildName %></th>
                                    <th><%= Resources.Resource.Gender %></th>
                                    <th><%= Resources.Resource.DateOfBirth %> </th>
                                    <th><%= Resources.Resource.ParmanentAddress %></th>
                                </tr>
                            </table>
                        </div>
                        <div class="col-md-1" style=""></div>
                    </div>
                    <label runat="server" id="lblmsg"></label>


                </div>

                <div class="col-md-1" style=""></div>



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

        <%--  <link href="assets/css/modal.css" rel="stylesheet" />
        <script src="assets/js/vendor/jquery-1.11.2.min.js"></script>
        <script src="assets/js/vendor/bootstrap.min.js"></script>--%>
        <link href="css/bootstrap.min.css" rel="stylesheet" />

        <!-- Bootstrap -->
        <script type="text/javascript" src='https://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.8.3.min.js'></script>
        <script type="text/javascript" src='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.0.3/js/bootstrap.min.js'></script>
        <%--<link rel="stylesheet" href='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.0.3/css/bootstrap.min.css'
    media="screen" />--%>
        <!-- Bootstrap -->
        <!-- Bootstrap DatePicker -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.6.4/css/bootstrap-datepicker.css" type="text/css" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.6.4/js/bootstrap-datepicker.js" type="text/javascript"></script>
        <!-- Bootstrap DatePicker -->
        <script type="text/javascript">
            $(function () {
                $('[id*=txtDate]').datepicker({
                    changeMonth: true,
                    changeYear: true,
                    format: "yyyy-mm-dd",
                    autoclose: true,
                    todayHighlight: true,
                    endDate: 'today'
                });
            });
        </script>

        <%--<script src="assets/js/jquery.collapse.js"></script>
        <script src="assets/js/bootsnav.js"></script>
        <script src="assets/js/plugins.js"></script>
        <script src="assets/js/main.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />--%>
    </form>
</body>

</html>

