<%@ Page Title="" Language="C#" AutoEventWireup="true" CodeFile="PrintReceiptNewWater.aspx.cs" Inherits="PropertyTax" %>

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

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.4.1.js"
        integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
        crossorigin="anonymous"></script>
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
            //$('.carousel').carousel();


    </script>

    <script type="text/javascript">
        var newtxt = "";
        var i = 0;
        function ascii(a) { return a.charCodeAt(0); }
        function Print() {

            //var txt = "*** PIMPRI CHINCHWARD SMARTCITY KIOSK ***\r\n       PCMC Head office\r\n      ----------------------------\r\na Date: " + lblTxnDate.innerText + "\r\n\r\n!                * Payment Receipt * \r\n\r\nTransaction ID:       " + lblTxnID.innerText + "\r\nWaterTax ID:          " + lblConsumerID.innerText + "\r\nAmount:               " + lblTxnAmount.innerText + "\r\n\Payment Mode:         " + lblPaymentMode.innerText + "\r\n\Status:               " + lblStatus.innerText + "\r\n\r\n  *******************Thank You*********************\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n      i";
            var txt = "*** PIMPRI CHINCHWARD SMARTCITY KIOSK ***\r\n             " + hdnaddress.innerText + "\r\n      ----------------------------\r\na Date: " + lblTxnDate.innerText + "\r\n\r\n!                * Payment Receipt * \r\n\r\nTransaction ID:       " + lblTxnID.innerText + "\r\nWaterTax ID:          " + lblConsumerID.innerText + "\r\nAmount:               " + lblTxnAmount.innerText + "\r\n\Payment Mode:         " + lblPaymentMode.innerText + "\r\n\Status:               " + lblStatus.innerText + "\r\n\r\n  *******************Thank You*********************\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n      i";


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

        $.getJSON("https://api.ipify.org/?format=json", function (e) {
            alert(e.ip);
            $("#" + '<%=hiddenip.ClientID %>').val(e.ip);
        });
    </script>


</head>
<body>



    <%--		<section id="home" class="home" style="height: 587px;">--%>


    <hr style="border: 1px solid #eb0029; margin-top: 0rem;">

    <div style="height: 100%;">
          <input type="hidden" id="hiddenip" runat="server" />
        <%--Div to show the data--%>
        <label id="hdnaddress" runat="server"></label>
        <div class="row" style="margin-top: 8%; text-align: center; margin-left: 0px; margin-right: 0px;">
            <div class="col-sm-12" style="border: #000; width: 100%; margin-right: 0px; margin-top: -8%;">
                <div style="border-radius: 10px; height: auto; background: rgba(255, 255, 255, 0.51);">
                    <div class="row" style="background-color: #0c529c;">
                        <div class="col-sm-4" style="text-align: left; margin-top: 2%">
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

                        <div class="col-sm-4" style="margin-top: 20px;">
                            <span style="margin-top: 15px; text-align: center; color: whitesmoke; font-size: 30px; font-family: 'Source Sans Pro',sans-serif">Payment Receipt</span>
                        </div>
                    </div>
                </div>
                &nbsp;&nbsp;&nbsp;&nbsp;                
            </div>
        </div>

        <%--Div to show the data--%>

        <div class="row" style="text-align: center; padding-left: 15px;">
            <div style="position: absolute; border: solid 1px #f00; width: 100%; margin-top: -7%; background: #eee; border-radius: 10px; text-align: center; height: 100%;">


                <div class="row " runat="server" id="divConsumerDetail" visible="true">
                    <div class="col-md-3">
                    </div>
                    <div class="col-md-6" style="padding-right: 0px;">
                        <div class="col-md-11" style="text-align: left; margin: 0px 0px 0px 20px; border: solid 1px #b5b0b0;">
                            <div style="border-bottom: solid 1px #b5b0b0;">
                                <h5 style="font-family: 'Segoe UI'; padding-top: 5px;">Receipt Details:</h5>
                            </div>
                            <div class="row" style="margin: 0px">
                                <div class="col-md-4" style="border-bottom: solid 1px #b5b0b0;">
                                    <label style="font-family: 'Segoe UI'; padding-top: 5px;">Transaction ID</label>
                                </div>
                                <div class="col-md-8" style="text-align: right; border-bottom: solid 1px #b5b0b0;">
                                    <label runat="server" id="lblTxnID" style="font-family: 'Segoe UI'; color: brown; font-size: 25px; padding-top: 5px;"></label>
                                </div>
                            </div>
                            <div class="row" style="margin: 0px">
                                <div class="col-md-4" style="border-bottom: solid 1px #b5b0b0;">
                                    <label style="font-family: 'Segoe UI'; padding-top: 5px;">Transaction Amount</label>
                                </div>
                                <div class="col-md-8" style="text-align: right; border-bottom: solid 1px #b5b0b0;">
                                    <label runat="server" id="lblTxnAmount" style="font-family: 'Segoe UI'; color: brown; font-size: 25px; padding-top: 5px;"></label>
                                </div>
                            </div>
                            <div class="row" style="margin: 0px">
                                <div class="col-md-4" style="border-bottom: solid 1px #b5b0b0;">
                                    <label style="font-family: 'Segoe UI'; padding-top: 5px;">Transaction Date</label>
                                </div>
                                <div class="col-md-8" style="text-align: right; border-bottom: solid 1px #b5b0b0;">
                                    <label runat="server" id="lblTxnDate" style="font-family: 'Segoe UI'; color: brown; font-size: 25px; padding-top: 5px;"></label>
                                    <%--                                        <label runat="server" id="LabelTime"  visible="false" style="font-family: 'Segoe UI'; color: brown; font-size: 25px; padding-top: 5px;"></label>--%>
                                </div>
                            </div>
                            <div class="row" style="margin: 0px">
                                <div class="col-md-4" style="border-bottom: solid 1px #b5b0b0;">
                                    <label style="font-family: 'Segoe UI'; padding-top: 5px;">WaterTax ID</label>
                                </div>
                                <div class="col-md-8" style="text-align: right; border-bottom: solid 1px #b5b0b0;">
                                    <label runat="server" id="lblConsumerID" style="font-family: 'Segoe UI'; color: brown; font-size: 25px; padding-top: 5px;"></label>
                                </div>
                            </div>
                            <div class="row" style="margin: 0px">
                                <div class="col-md-4" style="border-bottom: solid 1px #b5b0b0;">
                                    <label style="font-family: 'Segoe UI'; padding-top: 5px;">Payment Mode</label>
                                </div>
                                <div class="col-md-8" style="text-align: right; border-bottom: solid 1px #b5b0b0;">
                                    <label runat="server" id="lblPaymentMode" style="font-family: 'Segoe UI'; color: brown; font-size: 25px; padding-top: 5px;"></label>
                                </div>
                            </div>
                            <div class="row" style="margin: 0px">
                                <div class="col-md-4" style="border-bottom: solid 1px #b5b0b0;">
                                    <label style="font-family: 'Segoe UI'; padding-top: 5px;">Status</label>
                                </div>
                                <div class="col-md-8" style="text-align: right; border-bottom: solid 1px #b5b0b0;">
                                    <label runat="server" id="lblStatus" style="font-family: 'Segoe UI'; color: brown; font-size: 25px; padding-top: 5px;"></label>
                                </div>
                            </div>
                            <div class="row" style="margin: 15px">
                                <div class="col-md-3" style="text-align: center;">
                                </div>
                                <div class="col-md-6" style="text-align: center;">
                                    <%-- <asp:Button runat="server" ID="btnPrintReceipt" Width="130px" CssClass="btn btn-primary"  Text="Print Receipt" />--%>
                                    <%--	<input id="btnPrintReceipt" style="width:120px;height:40px;" value="Print Receipt" type="button" onclick="Print()"  />--%>
                                    <button id="RecBtn" class="btn btn-primary active" onclick="Print()">Print Receipt</button>
                                    <%--			 <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal" value="ShowModal">Print Receipt</button>--%>
                                </div>
                                <div class="col-md-3" style="text-align: center;">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                    </div>
                </div>

            </div>
        </div>
        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal" value="ShowModal"></button>
    </div>

    <%-- %>MARK: Modal DialogBox --%>


    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLongTitle">Modal title</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    ...
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary">Save changes</button>
                </div>
            </div>
        </div>
    </div>


    <!-- Modal -->



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
                tex t-transform: upperase;
                t: 500;
                g: 1px;
                widt hei
                /*t
            s;*/
                - all 0.5s;
            }                </style>


    <style>
     rs1 {
           ock;
            border-
                    text-align: lef;
              r

             -webkit-transtion:  all 0.5s;
        }
            ouselPoi ters1 span.im
                   back round: #c3906
        px 10px;
             ispl
            
                          he
                      erticl-align:
                    bo der-r
             8px;
               flo
                     tex -ali
                       posi ion:
                     /*
            5s;*/                  transit on: a
                }

            .car n.carouselPointersT xt1 {
              d

        inline-block;      backgr      background: rgba(255, 255, 255, 0.81);
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

        }
        function HideQuicklink() {

        }
    </script >
            <style>
                .btn:hover {
                    background - color: RoyalBlue;
        }
    </style>




            <style>
                h1 {

                    xt - align: e
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
                 ease-o t;                           }             .button:hover {
                    round: #06D85F;                               .overl
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
                        right  30px;                                  2
    
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

            <style type="text/css">
                c

                     m r
                        }    font-family: 'Segoe UI';
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
                    0 % {
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
</body>
</html>
