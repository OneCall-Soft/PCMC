<%@ Page Language="C#" AutoEventWireup="true" CodeFile="BSUPApplicationDetails.aspx.cs" Inherits="BSUPApplicationDetails" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <meta charset="utf-8">
    <title></title>
    <meta name="google" content="notranslate">
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
    <link rel="stylesheet" href="css/modal.css">
    <script src="assets/js/vendor/modernizr-2.8.3-respond-1.4.2.min.js"></script>
    <style type="text/css">
        html {
            position: relative;
            min-height: 100%;
        }
    </style>

</head>

<body style="overflow: hidden;">
    <form id="form2" runat="server">
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
                                <span style="margin-top: 15px; text-align: center; color: whitesmoke; font-size: 30px; font-family: 'Source Sans Pro',sans-serif">Basic Services to Urban Poor</span>
                            </div>
                            <div class="col-sm-4" style="margin: 11px 12px 75px 20px; height: 77px; max-width: 30%; text-align: right;">
                                <a href="GVFeedback1.aspx">
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
            <div class="row" style="text-align: center; padding-left: 15px;">
                <div style="position: absolute; border: solid 1px #f00; width: 100%; margin-top: -7%; background: #eee; border-radius: 10px; text-align: center; height: 100%;">
                    <div class="row">
                        <div class="col-md-1" style=""></div>
                        <div class="col-md-10" style="border: solid 1px #b5b0b0; padding-top: 5px; padding-bottom: 10px; text-align: left; margin-top: 10px;">
                            <table style="background-color: aliceblue" border="5" class="col-me-12">
                                <tr>
                                    <th colspan="6">Application Details</th>
                                </tr>
                                <tr>
                                    <th>Application No.</th>
                                    <td id="tdapplicationno" runat="server" />
                                    <th>Adhar No.</th>
                                    <td id="tdhadharno" runat="server" />
                                    <th>C.F.C No.</th>
                                    <td id="tdcfcno" runat="server" />
                                </tr>
                                <tr>
                                    <th>Prabhag Name</th>
                                    <td id="tdprabhagname" runat="server" />
                                    <th>Ward Id</th>
                                    <td id="tdwardid" runat="server" />
                                    <th>Area</th>
                                    <td id="tdarea" runat="server" />
                                </tr>
                                <tr>
                                    <th>Main Scheme</th>
                                    <td id="tdmainscheme" runat="server" colspan="2" />
                                    <th>Sub Scheme</th>
                                    <td id="tdsubscheme" runat="server" colspan="2" />
                                </tr>
                                <tr>
                                    <th>Eligible / Not Eligible</th>
                                    <td id="tdeligible" runat="server" colspan="2" />
                                    <th>Reason</th>
                                    <td id="tdreason" runat="server" colspan="2" />
                                </tr>
                                <tr>
                                    <th>Name (English)</th>
                                    <td id="tdnameEng" runat="server" colspan="2" />
                                    <th>Name (Marathi)</th>
                                    <td id="tdnameMarathi" runat="server" colspan="2" />
                                </tr>
                                <tr>
                                    <th>Parent Name</th>
                                    <td id="tdParentName" runat="server" colspan="5" />
                                </tr>
                                <tr>
                                    <th>Birth Date</th>
                                    <td id="tdBirthDate" runat="server" />
                                    <th>Age</th>
                                    <td id="tdAge" runat="server" />
                                    <th>Mobile No.</th>
                                    <td id="tdMobileNo" runat="server" />
                                </tr>
                                <tr>
                                    <th>Religon</th>
                                    <td id="tdReligon" runat="server" colspan="2" />
                                    <th>Cast</th>
                                    <td id="tdCast" runat="server" colspan="2" />
                                </tr>
                            </table>

                            <table id="tblDetails" runat="server" style="background-color: aliceblue" border="5" class="col-md-12" />

                            <table style="background-color: aliceblue" border="5" class="col-md-12">
                                <tr>
                                    <td colspan="4">Bank Details</td>
                                </tr>
                                <tr>
                                    <td>Bank Name</td>
                                    <td id="tdBankName" runat="server" />
                                    <td>Branch Name</td>
                                    <td id="tdBranchName" runat="server" />
                                </tr>
                                <tr>
                                    <td>Saving Account Number</td>
                                    <td id="tdSavingAccountNo" runat="server" />
                                    <td>I.F.C Code</td>
                                    <td id="tdifccode" runat="server" />
                                </tr>
                                <tr>
                                    <td>M.I.C.R. Code</td>
                                    <td id="tdmicrCode" runat="server" />
                                    <td>Account Holder Name</td>
                                    <td id="tdAccountHolderName" runat="server" />
                                </tr>
                            </table>

                        </div>
                        <div class="col-md-1" style=""></div>
                    </div>
                    <div id="divErrorMsg" visible="false" runat="server">
                        <label id="lblErrorMsgForDataNotFound" runat="server" style="font-family: 'Segoe UI'; color: red; padding-top: 5px;"></label>
                    </div>
                </div>
            </div>
        </div>

        <style>
			h1 {
				text-al  center;
				font-family: 

            homa, A
                al, sans-ser f;
				col
                r: #06 85F;
                
				margin: 80px
            ;

            			}

			.button {
			t-size: 1.4em;
				padding

            
            	r: #fff;
                			borde
                 solid #eb00 9;
			borderradius: 20p
                ;
			text-dec
                n: none
                			c
            :

            r;
			t
                ion: all 0 3s eas
                
			}                
                
				n:hove  {
                	ckgroun :  #6D85F
				}                .overlay {
			position:
                ;
				top: 0;                
                			bo
                0;
			left: 0;
                right: 0;                
                			ackgound: rgb
            0

            );
				trans t
                acity 500ms
				vi
            t

            en;
			o
                : 0;
			

		rlay ta
                
					is
                y: vi ib
                				op ci
                
				}
                
                		.popu {
                			mar
                0px auto;                
                			paddng:  20
                			backgrou d: #fff
                	border- ad
            5

            	width: 85%;
		on: relativ ;
				t
                on: all s 
            n

            			}
            
                opup h2 {                
				ma
                op: 0;                
                				c
                #333;
				font-
                : Tahoma, Aria ,  sa
                if;
                			}                	.popup . lose {
                	sition: abs lut;                					top: 20
            	
            t: 30p;            	nsition: al  2
                					f nt-si
                x;
					fon -weight bold;
					text-
            t

            e;
				colo :
                
				}
                                					.pop
                se:h ver {
                	color  #06D
                				}

			.ppup  .c
                {
					ma -heig
                ;
					over low: 
                				}

			@med a scr
                 (max- idth:
            )

            box {            					width: 0
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

        <link href="assets/css/modal.css" rel="stylesheet" />
        <script src="assets/js/vendor/jquery-1.11.2.min.js"></script>
        <script src="assets/js/vendor/bootstrap.min.js"></script>
        <link href="css/bootstrap.min.css" rel="stylesheet" />
        <script src="assets/js/jquery.collapse.js"></script>
        <script src="assets/js/bootsnav.js"></script>
        <script src="assets/js/plugins.js"></script>
        <script src="assets/js/main.js"></script>
        <script src="js/CustomeJSFile.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
    </form>
</body>

</html>
