<%@ Page Language="C#" AutoEventWireup="true" CodeFile="naagarvastivibhag.aspx.cs" Inherits="BSUP" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <meta charset="utf-8">
    <title></title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="google" content="notranslate">

    <script
        src="https://code.jquery.com/jquery-3.4.1.js"
        integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
        crossorigin="anonymous"></script>
    <script src="js/CustomeJSFile.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
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
    <%--<style type="text/css">
		html {
			position: relative;
			min-height: 100%;
		}
	</style>--%>
</head>

<body <%--style="overflow: hidden;"--%> data-spy="scroll">
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
                                <span style="margin-top: 15px; text-align: center; color: whitesmoke; font-size: 30px; font-family: 'Source Sans Pro',sans-serif">
                                    <%=Resources.Resource.naagarvastivibhag %>
                                </span>
                            </div>
                            <div class="col-sm-4" style="margin: 11px 12px 75px 20px; height: 77px; max-width: 30%; text-align: right;">
                                <a href="InfoServices1.aspx">
                                    <div style="position: relative">
                                        <p style="top: 21px; position: absolute; right: 21px; font-size: larger; color: white; font-weight: 600">
                                            <%=Resources.Resource.goback %>
                                        </p>
                                        <img src="images/back.png" style="height: 60px; margin-top: 1%;width:100px" />
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
                            <div class="row">
                                <div class="col-md-4">
                                    <%=Resources.Resource.Regionaloffice %>
                                    <asp:DropDownList runat="server" ID="ddlRegionalOffice" OnSelectedIndexChanged="ddlRegionalOffice_SelectedIndexChanged" CssClass="form-control" AutoPostBack="True"></asp:DropDownList>
                                </div>
                                <div class="col-md-4">
                                    <%=Resources.Resource.ElectionDivision %>
                                    <asp:DropDownList runat="server" ID="ddlElectionDivison" CssClass="form-control" OnSelectedIndexChanged="ddlElectionDivison_SelectedIndexChanged" AutoPostBack="True"></asp:DropDownList>
                                </div>
                                <div class="col-md-4">
                                    <%=Resources.Resource.Area %>
                                    <asp:DropDownList runat="server" ID="ddlArea" CssClass="form-control" OnSelectedIndexChanged="ddlArea_SelectedIndexChanged" AutoPostBack="True"></asp:DropDownList>
                                </div>
                            </div>

                            <div class="row" style="margin-top: 5px;">
                                <div class="col-md-4">
                                    <%=Resources.Resource.originalplan %>
                                    <asp:DropDownList runat="server" ID="ddlMainScheme" CssClass="form-control" OnSelectedIndexChanged="ddlMainScheme_SelectedIndexChanged" AutoPostBack="True"></asp:DropDownList>
                                </div>
                                <div class="col-md-4">
                                    <%=Resources.Resource.Subplan %>
                                    <asp:DropDownList runat="server" ID="ddlSubScheme" CssClass="form-control" OnSelectedIndexChanged="ddlSubScheme_SelectedIndexChanged" AutoPostBack="True"></asp:DropDownList>
                                </div>
                                <div class="col-md-4">
                                    <%=Resources.Resource.EligibleOrIneligible %>
                                    <asp:DropDownList runat="server" ID="ddleligibleStatus" CssClass="form-control" OnSelectedIndexChanged="ddleligibleStatus_SelectedIndexChanged" AutoPostBack="True"></asp:DropDownList>
                                </div>
                            </div>

                            <div class="row" style="margin-top: 5px;">
                                <div class="col-md-4">
                                    <%=Resources.Resource.MobileNo %>
                                    <asp:TextBox runat="server" ID="txtMobileNo" AutoComplete="off" CssClass="form-control"></asp:TextBox>
                                </div>
                                <div class="col-md-4">
                                    <%=Resources.Resource.AadhaarNo %>
                                    <asp:TextBox runat="server" ID="txtAadhaarNo" AutoComplete="off" CssClass="form-control"></asp:TextBox>
                                </div>
                                <div class="col-md-4">
                                    <%=Resources.Resource.CFCOrApplicationNo %>
                                    <asp:TextBox runat="server" ID="txtCFCNo" AutoComplete="off" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>

                            <div class="row" style="margin-top: 5px;">
                                <div class="col-md-4">
                                    <%=Resources.Resource.BeneficiarysFirstName %>
                                    <asp:TextBox runat="server" ID="txtFirstName" AutoComplete="off" CssClass="form-control"></asp:TextBox>
                                </div>
                                <div class="col-md-4">
                                    <%=Resources.Resource.BeneficiarysNameofFatherorHusband %>
                                    <asp:TextBox runat="server" ID="txtMidalName" AutoComplete="off" CssClass="form-control"></asp:TextBox>
                                </div>
                                <div class="col-md-4">
                                    <%=Resources.Resource.Beneficiaryslastname %>
                                    <asp:TextBox runat="server" ID="txtLastName" AutoComplete="off" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>

                            <div class="row" style="margin-top: 10px;">
                                <div class="col-md-2" style="text-align: center">
                                    <asp:Button runat="server" ID="btnShow" Width="130px" OnClick="btn_Show" CssClass="btn btn-primary" Text="<%$Resources:Resource,Show %>" />
                                </div>
                                <div class="col-md-10" style="text-align: left">
                                    <label runat="server" id="lblErrorMsg" style="font-family: 'Segoe UI'; color: red; padding-top: 5px;"></label>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-1" style=""></div>
                    </div>

                    <div class="row" runat="server" id="divApplicationDetails" visible="false">
                        <div class="col-md-1"></div>
                        <div class="col-md-10" style="text-align: left; margin-top: 10px;">
                            <table border="5" id="BsupDetailsTable" aria-grabbed="true" runat="server" style="text-align: center; background-color: aliceblue">
                                <tr style="background-color: azure">
                                    <th>अर्ज क्रमांक</th>
                                    <th>अर्जदाराचे नाव</th>
                                    <th>मूळ योजना</th>
                                    <th>उपयोजना</th>
                                    <th>पात्र /अपात्र</th>
                                    <th>क्रिया</th>
                                </tr>
                            </table>
                        </div>
                        <div class="col-md-1"></div>
                    </div>
                    <div id="divErrorMsg" visible="false" runat="server">
                        <label id="lblErrorMsgForDataNotFound" runat="server" style="font-family: 'Segoe UI'; color: red; padding-top: 5px;"></label>
                    </div>
                </div>
            </div>
        </div>

        <style>
            h1 {
                text-align: center;
                font-family: Tahoma, Arial, sans-serif;
                color: #06D85F;
                margin: 80px 0;
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

        <link href="assets/css/modal.css" rel="stylesheet" />
        <script src="assets/js/vendor/jquery-1.11.2.min.js"></script>
        <script src="assets/js/vendor/bootstrap.min.js"></script>
        <link href="css/bootstrap.min.css" rel="stylesheet" />
        <script src="assets/js/jquery.collapse.js"></script>
        <script src="assets/js/bootsnav.js"></script>
        <script src="assets/js/plugins.js"></script>
        <script src="assets/js/main.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
    </form>
</body>

</html>
