<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PropertyTaxNew.aspx.cs" Inherits="PropertyTaxNew" %>

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

    <%-- <link href="css/fontawesome.css" rel="stylesheet" />--%>
    <link rel="stylesheet" href="assets/css/swiper.min.css" />
    <%--  <link href="css/fontawesome.min.css" rel="stylesheet" />--%>
    <%--	<link href="css/brands.css" rel="stylesheet" />--%>
    <%--	<link href="css/brands.min.css" rel="stylesheet" />--%>
    <%--	<link href="css/all.css" rel="stylesheet" />--%>
    <%-- <link href="css/all.min.css" rel="stylesheet" />--%>

    <%-- <link rel="stylesheet" href="assets/css/bootstrap.min.css">--%>

    <%--	<link rel="stylesheet" href="assets/css/slider.css">--%>

    <%--	<link rel="stylesheet" href="assets/css/a.css">--%>
    <!--Theme custom css -->
    <link rel="stylesheet" href="assets/css/style1.css">

    <%--	<link rel="stylesheet" href="assets/css/style9.css">--%>

    <!--Theme Responsive css-->
    <link rel="stylesheet" href="assets/css/responsive.css" />

    <script src="assets/js/vendor/modernizr-2.8.3-respond-1.4.2.min.js"></script>
    <%--<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>--%>
    <script
        src="https://code.jquery.com/jquery-3.4.1.js"
        integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
        crossorigin="anonymous"></script>
    <%-- <script src="js/CustomeJSFile.js"></script>--%>
    <script src="js/CustomeJSFile.js" type="text/javascript"></script>


    <style type="text/css">
        #lblMobileNumber:after {
            content: "  *";
            color: red;
            font-size: 3vh;
        }

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
        $(document).ready(function () {


            var time;
            window.onload = resetTimer;
            document.onkeypress = resetTimer;

            function logout() {
                var soc = new WebSocket("ws://localhost:8080/clear");
                soc.onopen = function (e) {
                    soc.send("{\"username\":\"9922501200\"}");
                };
            }

            function resetTimer() {
                clearTimeout(time);
                t = setTimeout(logout, 500);
            }

            // MARK:- checking propertyno has no alphabets & special character
            $("#txtPropertyNo").on('focusout keypress', function () {
                var searchText = $("#txtPropertyNo").val();
                if (checkSpecialCharacterandAlphabets(searchText) == false) {
                    $("#lblErrorMsg").text("Invalid property no...");
                } else { $("#lblErrorMsg").text(""); }
            });

            // MARK:- Checking if Mobileno only contains number up to 10 digit
            //$("#TextBox1").keyup(function () {
            //    var searchText = $("#TextBox1").val();
            //    if (checkSpecialCharacterandAlphabets(searchText) == false) {
            //        $("#lblMobileNoError").text("Invalid mobile number!");
            //        $("#TextBox1").val("");
            //    } else if (searchText.length < 10) {
            //        $("#lblMobileNoError").text("Mobile number must be 10 digit!");
            //    } else { $("#lblMobileNoError").text(""); }
            //});


            //MARK:- Checking if the amount is string or special 
            $("#txtbalance").keyup(function () {
                var searchText = $("#txtbalance").val();
                if (checkAmountValidation(searchText) == false) {
                    Swal.fire('Invalid amount..');
                    $("#txtbalance").val("1");
                } else { }
            });

        });
    </script>
</head>
<body>
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

        <%-- HEADER div --%>
        <div class="container-fluid">
            <div class="row" style="border-radius: 10px; background: rgb(0,181,250);">
                <div class="col-sm-4 col-md-4 col-xs-4" style=""></div>
                <div class="col-sm-4 col-md-4 center" style="text-align: center; display: inline-block; padding-top: 2vh;">
                    <span style="margin-top: 15px; text-align: center; color: whitesmoke; font-size: 30px; font-family: 'Source Sans Pro',sans-serif"><%=Resources.Resource.propertytax %></span>
                </div>
                <div class="col-sm-4 col-md-4" style="padding-right: 75px; margin-top: 6px; padding-bottom: 5px; height: auto; max-width: 30%; text-align: right;">
                    <a href="PaymentServices1.aspx">
                        <div style="position:relative">
                            <p style="top: 16px; position: absolute; right: 15px; font-size: larger; color: white; font-weight: 600;">
                                <%=Resources.Resource.goback %>
                            </p>
                            <img src="images/back.png" style=" height: 60px;" />
                        </div>
                    </a>
                </div>
            </div>
        </div>

        <%--Div to show the data--%>
        <div class="container-fluid" style="border: solid 1px #f00; border-bottom: 0; border-left: 0; border-right: 0; width: 100%; background-image: url('assets/images/Background_PropertTax.jpg'); border-radius: 10px; text-align: center;">
            <div class="row">
                <div class="col-md-1" style=""></div>
                <div class="col-md-10" style="border: solid 1px #b5b0b0; padding-top: 5px; padding-bottom: 10px; text-align: left; margin-top: 10px;">
                    <div class="row">
                        <div class="col-md-2">
                            <%=Resources.Resource.lblZoneName %>
                            <div class="row">
                                <div class="col-sm-12">
                                    <asp:DropDownList runat="server" ID="ddlzonename" CssClass="form-control" AutoPostBack="True" OnSelectedIndexChanged="ddlzonename_SelectedIndexChanged"></asp:DropDownList>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-2">
                            <%=Resources.Resource.lblZoneNumber %>
                            <div class="row">
                                <div class="col-sm-12">
                                    <asp:DropDownList runat="server" ID="ddlzoneno" CssClass="form-control" AutoPostBack="True" OnSelectedIndexChanged="ddlzoneno_SelectedIndexChanged"></asp:DropDownList>
                                </div>

                            </div>
                        </div>
                        <div class="col-md-2">
                            <%=Resources.Resource.lblGatNo %>
                            <div class="row">
                                <div class="col-sm-12">
                                    <asp:DropDownList runat="server" ID="ddlgateno" CssClass="form-control">
                                        <asp:ListItem Value="Select">Select</asp:ListItem>
                                    </asp:DropDownList>
                                </div>

                            </div>
                        </div>
                        <div class="col-md-2">
                            <%=Resources.Resource.lblMiyakatNo %>
                            <div class="row">
                                <div class="col-sm-12">
                                    <asp:TextBox runat="server" ID="txtPropertyNo" spellcheck="false" AutoComplete="off" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-2">
                            <%=Resources.Resource.lblVadhiv %>
                            <div class="row">
                                <div class="col-sm-12">
                                    <asp:TextBox runat="server" ID="txtExtra" Text="00" AutoComplete="off" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-2">
                            <br />
                            <div class="row">
                                <div class="col-sm-12">
                                    <asp:Button runat="server" ID="btnshow" Width="130px" CssClass="btn btn-primary" OnClick="btn_PropertyTax" Text="<%$Resources:Resource,Show %>" />
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12" style="text-align: center">
                            <label runat="server" id="lblErrorMsg" style="font-family: 'Segoe UI'; color: red; padding-top: 5px; font-weight: 500;"></label>
                        </div>
                    </div>
                </div>
                <div class="col-md-1" style=""></div>
            </div>

            <div class="row " runat="server" id="divConsumerDetail" visible="true">
                <div class="col-md-1"></div>
                <div class="col-md-10">
                    <div class="row" style="border: solid 1px #b5b0b0;">
                        <%--    Left div   --%>
                        <div class="col-md-6 col-sm-6" style="padding: 0px;">
                            <div class="row" style="margin: 0px;">
                                <div class="col-md-12 col-sm-12" style="text-align: left; border: solid 1px #b5b0b0;">
                                    <h5 style="font-family: 'Segoe UI'; padding-top: 5px;">Consumer Details:</h5>
                                </div>
                            </div>
                            <div class="row" style="margin: 0px;">
                                <div class="col-md-2" style="border-bottom: solid 1px #b5b0b0; margin: 0px; padding: 0px; float: left;">
                                    <label style="font-family: 'Segoe UI'; padding-top: 5px;">Name</label>
                                </div>

                                <div class="col-md-10" style="text-align: right; border-bottom: solid 1px #b5b0b0; margin: 0px; padding: 0px; float: left;">
                                    <label runat="server" id="lblname" style="font-family: 'Segoe UI'; color: brown; font-size: 25px; padding-top: 5px;"></label>
                                </div>
                            </div>
                            <div class="row" style="margin: 0px;">
                                <div class="col-md-2" style="border-bottom: solid 1px #b5b0b0; margin: 0px; padding: 0px; float: left;">
                                    <label style="font-family: 'Segoe UI'; padding-top: 5px;">Address</label>
                                </div>
                                <div class="col-md-10" style="text-align: right; float: left; border-bottom: solid 1px #b5b0b0; margin: 0px; padding: 0px;">
                                    <label runat="server" id="lbladdress" style="font-family: 'Segoe UI'; color: brown; font-size: 25px; padding-top: 5px;"></label>
                                </div>
                            </div>
                        </div>

                        <%--    Right div   --%>
                        <div class="col-md-6 col-sm-6" style="margin: 0px; padding: 0px;">
                            <div class="row" style="margin: 0px; padding: 0px;">
                                <div class="col-md-12 col-sm-12" style="border-bottom: solid 1px #b5b0b0; text-align: left; padding-left: 25px;">
                                    <h5 style="font-family: 'Segoe UI'; padding-top: 5px;">Contact Information:</h5>
                                </div>
                            </div>
                            <div class="row" style="padding: 0px; margin0px;">
                                <div class="col-md-4 col-sm-4" style="padding-top: 8px;">
                                    <label style="font-family: 'Segoe UI'; padding-top: 5px;" id="lblMobileNumber">Mobile Number</label>
                                </div>
                                <div class="col-md-8 col-sm-8" style="text-align: left; border-bottom: solid 0px #b5b0b0; padding-top: 8px;">
                                    <%--<p class="" style="color:red;float:left;width:auto;font-size:4vh;padding-top:8px;">*&nbsp;&nbsp;</p>--%>
                                    <asp:TextBox runat="server" required="true" ID="TextBox1" AutoComplete="off" minlength="10" MaxLength="10" CssClass="form-control"></asp:TextBox>
                                </div>
                                <div class="col-md-12" style="text-align: left; padding-left: 100px; margin: 0px;">
                                    <label class="label-danger" id="lblMobileNoError" name="lblMobileNoError" style="font-family: 'Segoe UI'; color: red; font-style: italic; font-size: 2vh; font-weight: 700; padding-left: 180px;"></label>
                                </div>
                            </div>

                            <div class="row" style="margin: 0px; padding: 0px;">
                                <div class="col-md-4" style="border-bottom: solid 0px #b5b0b0; text-align: left; padding-top: 8px;">
                                    <label style="font-family: 'Segoe UI'; padding-top: 5px;">Email</label>
                                </div>
                                <div class="col-md-8" style="text-align: right; border-bottom: solid 0px #b5b0b0;">
                                    <%--  <label runat="server" id="Label2" style="font-family:'Segoe UI'; color:brown; font-size:25px; padding-top:5px;"></label>--%>
                                    <asp:TextBox runat="server" type="email" ID="TextBox2" AutoComplete="off" CssClass="form-control"></asp:TextBox><br />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-md-1"></div>


            <div class="col-md-12" style="padding-left: 15px; margin-top: 20px;" runat="server" id="paymentdetails">
                <div class="col-md-11" style="text-align: left; margin: 0px 20px 0px 20px; border: solid 1px #b5b0b0;">
                    <div style="border-bottom: solid 1px #b5b0b0;">
                        <h5 style="font-family: 'Segoe UI'; padding-top: 5px;">Payment Details:</h5>
                    </div>
                    <div class="row" style="margin: 0px">
                        <div class="col-md-5" style="">
                            <label style="font-family: 'Segoe UI'; padding-top: 5px;">Pending Payment</label>
                        </div>
                        <%--<div class="col-md-9" style=" text-align:right; border-bottom:solid 1px #b5b0b0;">
                                    <label runat="server" id="Label1" style="font-family:'Segoe UI'; color:brown; font-size:25px; padding-top:5px;"></label>                    
                                </div>--%>
                    </div>
                    <div class="row" style="margin: 0px">
                        <div class="col-md-8" style="border-bottom: solid 1px #b5b0b0; width: 100%;">
                            <span runat="server" id="lblRupeeSymbol" style="font-family: 'Segoe UI'; float: left; width: 5%; color: brown; font-size: 25px;">&#x20B9</span>
                            <asp:TextBox ID="txtbalance" Visible="true" runat="server" Style="float: left; width: 94%;" ReadOnly="true" AutoComplete="off" CssClass="form-control"></asp:TextBox>
                            <label runat="server" id="lblbalance" style="font-family: 'Segoe UI'; display: none; color: brown; font-size: 25px;"></label>
                        </div>
                        <div class="col-md-4" style="border-bottom: solid 1px #b5b0b0;">
                            <asp:Button ID="lbledit" runat="server" OnClick="btn_EditPayment" Width="130px" CssClass="btn btn-primary" Text="<%$Resources:Resource,lbledit %>"></asp:Button>
                        </div>

                    </div>
                    <div class="row" style="margin: 0px">
                        <div class="col-md-12" style="">
                            <label style="font-family: 'Segoe UI'; padding-top: 5px;">Pay Online Payment</label>
                        </div>
                        <%--<div class="col-md-9" style=" text-align:right; border-bottom:solid 1px #b5b0b0;" >
                                    <label runat="server" id="Label3" style="font-family:'Segoe UI'; color:brown; font-size:25px; padding-top:5px;"></label>                    
                                </div>--%>
                    </div>
                    <div class="col-md-6" style="margin-left: 30px;">
                        <%-- <asp:Button runat="server" Width="130px" ID="btnmakepayment" OnClick="btn_MakePayment" CssClass="btn btn-primary" Text="<%$Resources:Resource,MakePayment %>" />--%>
                        <asp:Button runat="server" Width="220px" ID="btnmakepayment" OnClick="btn_MakePayment" CssClass="btn btn-primary" Text="<%$Resources:Resource,CardPayment %>" />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:Button runat="server" Width="220px" ID="btnbillCloudpayment" OnClick="btn_BillCloudPayment" CssClass="btn btn-primary" Text="<%$Resources:Resource,BillCloudPayment %>" />

                    </div>

                    <%--<div class="row" style="margin:0px">
                                <div class="col-md-3" style="border-bottom:solid 1px #b5b0b0;">
                                    <label style="font-family:'Segoe UI'; padding-top:5px; ">Zone</label>                    
                                </div>
                                <div class="col-md-9" style=" text-align:right; border-bottom:solid 1px #b5b0b0;" >
                                    <label runat="server" id="Label5" style="font-family:'Segoe UI'; color:brown; font-size:25px; padding-top:5px;"></label>                    
                                </div>
                            </div>--%>
                    <br />
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
            $(document).ready(function () {

                var time;
                window.onload = resetTimer;
                document.onkeypress = resetTimer;

                function logout() {

                    //Swal.fire("being redirected......");
                    location.href = "Default.aspx";
                }

                function resetTimer() {

                    clearTimeout(time);
                    t = setTimeout(logout, 120000);
                }

            });
        </script>

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
        <%--   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">--%>
    </form>



</body>
</html>
