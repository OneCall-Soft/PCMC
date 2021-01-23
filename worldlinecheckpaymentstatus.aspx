<%@ Page Language="C#" AutoEventWireup="true" CodeFile="worldlinecheckpaymentstatus.aspx.cs" Inherits="worldlinecheckpaymentstatus" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
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


        <hr style="border: 1px solid #eb0029; margin-top: 0rem;">



        <%--Div to show the data--%>

        <div class="row" style="margin-top: 8%; text-align: center; margin-left: 0px; margin-right: 0px;">

            <div class="col-sm-12" style="border: #000; width: 100%; margin-right: 0px; margin-top: -8%;">
                <div style="border-radius: 10px; height: auto; background: rgba(255, 255, 255, 0.51);">
                    <div class="row" style="background-color: rgb(0,181,250);height:80px;">
                        <div class="col-sm-4" style="text-align: left; margin-top: 2%">
                        </div>

                        <div class="col-sm-4" style="margin-top: 20px;">
                            <span style="margin-top: 15px; text-align: center; color: whitesmoke; font-size: 30px; font-family: 'Source Sans Pro',sans-serif"><%=Resources.Resource.watertax %></span>
                        </div>
                        <div class="col-sm-4" style="margin: 11px 12px 75px 20px; height: 77px; max-width: 30%; text-align: right;">
                            <a href="worldlinepayment.aspx">
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
            <div class="col-md-12">
                
            </div>
        </div>

        
        <div class="row" style="text-align: center; padding-left: 15px;">
            <div class="col-md-12">
            <div id="statusdiv" runat="server" style=" width: 100%;  background-image: url('assets/images/Background_PropertTax.jpg'); border-radius: 10px; text-align: center; height: 100%;">
                <div class="row">
                    <div class="col-md-1" style="">
                    </div>
                    <div class="col-md-10" style="padding-top: 6px; padding-bottom: 10px; text-align: left; margin-top: 10px; ">
                        <div class="row">                           
                            <div class="col-md-12">
                                                              
                                   <div class="card-body" id="checkstatus" runat="server">
                                       <div class="row">
                                                    <div class="col-md-12 ">
                                                        <div class="card">
                                                            <div class="card-header"><div class="row"> 
                                                                <div class="col-md-6"><h4>Check Status</h4></div>
                                                                <div class="col-md-6 text-right">
                                                                    <div class="alert alert-success " style="display:inline-flex" role="alert">Note -> URN number is valid for 24 hours</div>
                                                                </div>
                                                                </div>
                                                            </div>
                                                            <div class="card-body">
                                                        <div class="row" >
                                                            <div class="col-md-3"></div>
                                                            <div class="col-md-4">
                                                                <div class="input-group mb-3">
                                                                            <div class="input-group-prepend" style="height: 35px">
                                                                                <span class="input-group-text" id="basic-addon1">URN</span>
                                                                            </div>
                                                                            <asp:TextBox CssClass="form-control" placeholder=" eg. 5510" runat="server"  ID="txturnnumber" aria-label="URN" aria-describedby="basic-addon1"></asp:TextBox>
                                                                        </div>

                                                            </div>
                                                            <div class="col-md-5"><asp:button text="Submit" OnClick="btnCheckStatus_Click" ID="btnCheckStatus" CssClass="btn btn-outline-success" style="border-radius:40px;width:80px" runat="server" /> 
                                                                                                                                                                                                                       </div>  
                                                            </div>
                                                    </div>   </div>   
                                                        </div>                                                 
                                                </div>
                                       
                                   </div>
                                <%--<asp:Button ID="BtnClose" runat="server" Text="Go Back" OnClick="Button1_Click" />--%>
                                
                            </div>

                        </div>
                    </div>
                    <div class="col-md-1" style="">
                    </div>                   
                </div>
                
            </div>
            </div>
            <div class="col-md-3 "></div>
              <div class="col-md-6 ">
                            <div id="error_div" class="alert alert-danger alert-dismissible" runat="server" style="display:none;"><%= Session["ermsg"].ToString() %> 
                                <button type="button" class="close"  onclick="closeModal()" data-dismiss="alert" aria-label="Close">
                                     <span aria-hidden="true">&times;</span>
                                 </button>
                            </div>
                     </div>
            <div class="col-md-3 "></div>
        </div>
        

        <div id="myModal" class=" modal fade modal-SM"  runat="server" style="position: relative; left: 0; right: 0; margin: auto; top: 0px; overflow: auto; width: 430px" role="dialog">
            <div class="modal-dialog " runat="server" id="modaldialog" style="max-width: 800px; height: auto">
                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                         <div class="row w-100">
                             <div class="col-md-3"><img width="60" src="images/pcmclogo.jpg" alt="Alternate Text" /></div>
                             <div class="col-md-6 text-center">
                                <h4>Check Status</h4>
                             </div>
                            <%--  <div class="col-md-3 float-right"> <button type="button" onclick="closeModal()" class="close " style="float: right" data-dismiss="modal">&times;</button></div>--%>
                         </div>
                       
                    </div>
                    <div class="modal-body">
                        <div class="row">
                            <div class="col-md-1"></div>
                            <div class="col-md-10 text-center">
                                <div class="row">
                                    <div class="col-md-12 text-center d-none">
                                        <asp:gridview ID="gdview" CssClass="table " OnRowDataBound="gdview_RowDataBound" runat="server"  AutoGenerateColumns="true">
                                            
                                        </asp:gridview>
                                    </div>
                                </div>
                                <div class="row ">
                                    <div class="col-md-4 text-right  p-0 pr-1">
                                        <label class="label label-info headinglabels">Billing Number</label>
                                        </div>
                                    <div class="col-md-2"> <strong>:</strong></div>
                                    <div class="col-md-6 text-left p-0">
                                        <label class="label label-info headinglabels" id="lblbillingnumber" runat="server"></label>
                                    </div> 

                                    <div class="col-md-4 text-right p-0 pr-1">
                                        <style>
                                            label {
                                                color: chocolate;
                                                font-weight: 700;
                                            }

                                            strong {
                                                color: chocolate;
                                                font-weight: 700;
                                            }

                                            input[type=text], textarea {
                                                font-size: 14px;
                                            }

                                                input[type=text]:placeholder {
                                                    font-size: 12px;
                                                }
                                        </style>

                                        <label class="label  ">Status</label>
                                    </div>
                                    <div class="col-md-2"> <strong>:</strong></div>
                                    <div class="col-md-6  text-left p-0 "><label class="label label-info headinglabels" id="lblrespmsg" runat="server"></label></div>
                                  
                                    <div class="col-md-4 text-right  p-0 pr-1" >
                                        <label class="label col-form-label-sm ">URN Number</label>
                                    </div>
                                     <div class="col-md-2"> <strong>:</strong></div>
                                    <div class="col-md-6 text-left p-1"><label class="label " runat="server" id="lblurnnumber"></label></div>
                                    <div class="col-md-4 text-right p-0 pr-1">
                                        <label class="label  label-info headinglabels">Amount</label>
                                        </div>
                                    <div class="col-md-2"> <strong>:</strong></div>
                                    <div class="col-md-6 text-left p-0">
                                        <label class="label label-info headinglabels" id="lblamount" runat="server"></label>
                                    </div>
                                    <div class="col-md-4 text-right p-0 pr-1">
                                        <label class="label label-info headinglabels">Date</label>
                                        </div>
                                    <div class="col-md-2"> <strong>:</strong></div>
                                    <div class="col-md-6 text-left p-0">
                                        <label class="label label-info headinglabels" id="lbldate" runat="server"></label>
                                    </div> 
                                    <div class="col-md-4 text-right p-0 pr-1">
                                        <label class="label label-info headinglabels">Time</label>
                                        </div>
                                    <div class="col-md-2"> <strong>:</strong></div>
                                    <div class="col-md-6 text-left p-0">
                                        <label class="label label-info headinglabels" id="lbltime" runat="server"></label>
                                    </div> 
                                </div>
                            </div>
                            <div class="col-md-1"></div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" onclick="closeModal();" class=" close btn btn-default" id="btnClose" data-dismiss="modal">Close</button>
                    </div>
                </div>

            </div>
        </div>

        <div style="display: none">
            <asp:Label ID="JsonData" runat="server" Text=""></asp:Label>
            <asp:Label ID="JsonDataAbort" runat="server" Text=""></asp:Label>
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

            function closeModal() {
                $("#myModal").removeClass("show").addClass("modal");
                window.location.replace("worldlinecheckpaymentstatus.aspx");

               <%-- $("#<%= statusdiv.ClientID%>").css("display", 'block');
                $("#<%= error_div.ClientID%>").css("display", 'none');--%>
            }

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


            var textBox = document.getElementById("<%=txturnnumber.ClientID %>");

            textBox.onkeypress = function (e) {
                if (e.which > 47 && e.which > 58) {
                    e.preventDefault();
                } else {

                }
            };

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
        <style>
            .btn:hover {
                background-color: RoyalBlue;
            }
        </style>




        <style>
            h {
                text-a fo Arial, sansse 6D85;
                margin 80p
            }

            wid h: 40%;
            argin: 0 auto;
            backgro nd: #eb009;
            ding: 25px;
            olid #fff;
            b
            50px;
            -

            x;
            ign: cente;
            butto
            fon -size
            pading: 0px;
            r: #fff;
            #eb0029;
            : 20px/ 0px;
            -decoration noe;

            p

            transiti n
            }

            o

            06D85F;



            let: 0;
            0;
            backg
            0, 0.7);
            opacity 50

            idden;
            }

            rget {
                i e;
                acity:;
                popup margin: 7 px au padding: 20 x;
                ckgrou d: # borde -radius: width: 5%;
                l trns t t;
                .popu h2

            {
                margin-top:;
                col ily: Thoma, r
            }

            clos {
                ition: absol top: 20 x;
                0px;
                all 200ms;
                e: 30px;
                old;
                - colo : h col r
            }


            .content
            a

            overflow: auto;


            and (m x-wi
                 
                       ;
        u

                         width: 70%;
            }
            }
            }
        </style>

        <style type="text/css">
            : 0 auto;
            .awesome {
                ly: 'S goe  U font syle: widt : 100%; margin 0 auto; text-align cent color: #3 3131; font-size 4 solute on: nfin it color: lime;
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

    <script type="text/javascript">

       <%-- window.onload = function () {

            // Get references to elements on the page.
            var form = document.getElementById('message-form');
            var urlField = document.getElementById("url");
            //var messageField = document.getElementById('message');
            var messageField = document.getElementById('<%=JsonData.ClientID%>').innerHTML;
            var messageFieldAbort = document.getElementById('<%=JsonDataAbort.ClientID%>').innerHTML;

            var messagesList = document.getElementById('messages');
            var name = "name";
            var counter = 1;
            var LastMessageDetails;

            function syntaxHighlight(json) {
                json = json.replace(/&/g, '&amp;').replace(/</g, '&lt;').replace(/>/g, '&gt;');
                return json.replace(/("(\\u[a-zA-Z0-9]{4}|\\[^u]|[^\\"])*"(\s*:)?|\b(true|false|null)\b|-?\d+(?:\.\d*)?(?:[eE][+\-]?\d+)?)/g, function (match) {
                    var cls = 'number';
                    if (/^"/.test(match)) {
                        if (/:$/.test(match)) {
                            cls = 'key';
                        } else {
                            cls = 'string';
                        }
                    } else if (/true|false/.test(match)) {
                        cls = 'boolean';
                    } else if (/null/.test(match)) {
                        cls = 'null';
                    }

                    return '<span class="' + cls + '">' + match + '</span>';
                });
            }



            //e.preventDefault();

            messagesList.innerHTML = "";

            // Create a new WebSocket.


            var Abortsocket = new WebSocket("ws://localhost:8080/abort");

            var Clearsocket = new WebSocket("ws://localhost:8080/clear");

            var socket = new WebSocket("ws://localhost:8080/pay");


            // Handle any errors that occur.
            socket.onerror = function (error) {
                logStr("Websocket error: " + error);
                //console.log('WebSocket Error: ' + error);
            };


            // Show a connected message when the WebSocket is opened.
            socket.onopen = function (event) {
                //logStr("Connected");
                Abortsocket.send(messageFieldAbort);
                Clearsocket.send(messageFieldAbort);
                socket.send(messageField);

            };

            // Handle messages sent by the server.
            socket.onmessage = function (event) {

                var message = event.data;
                //alert(message);
                message = JSON.parse(message);

                var D = message["param1"]

                logStr(D);
                //alert(message);
                try {
                    message.param2 = JSON.parse(message.param2);
                } catch (e) { }
                //alert(JSON.stringify(message, undefined, 4));
                var mes = JSON.stringify(message);


                message = syntaxHighlight(JSON.stringify(message, undefined, 4));

                /////var test=syntaxHighlightMessageShow(JSON.stringify(message, undefined, 4));
                //alert(message);                   

                setCookie("name" + counter, mes, null);
                setCookie("counter", counter, null);

                //var D = mes["param1"];

                //document.getElementById('hi').value = "" + JSON.stringify(message);
                counter++;

            };
            // LastMessageDetails = message;
            //alert(message.param2);
            // Show a disconnected message when the WebSocket is closed.
            socket.onclose = function (event) {
                //logStr("Closed");
                window.location.href = "PayUWaterTax.aspx";
            };



            function logStr(str) {
                var str1 = "";
                for (var i = 0; i < str.length; i++) {
                    if (str[i] == '_') {
                        str1 += " ";
                    }
                    else {
                        str1 += str[i];
                    }
                }

                if (str1 == 'DEV NOT CONNECTED') {
                    alert("EzeTap Device Is Not Connected!");
                    messagesList.innerHTML = "<pre class='message'>" + str1 + "</pre><br>";
                } else {
                    messagesList.innerHTML = "<pre class='message'>" + str1 + "</pre><br>";
                }
            }--%>



            // Send a message when the form is submitted.
            //form.onsubmit = function (e) {

            //    return false;
            //};
        //};

        //function setCookie(c_name, value, expiredays) {
        //    var exdate = new Date();
        //    exdate.setDate(exdate.getDate() + expiredays);
        //    document.cookie = c_name + "=" + value + ";path=/" + ((expiredays == null) ? "" : ";expires=" + exdate.toGMTString());
        //}
        
    </script >
</body >
</html >

