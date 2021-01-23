<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PropertyTaxEzetap.aspx.cs" Inherits="PropertyTaxNew" %>

<!DOCTYPE html>

<html style="overflow:hidden;">
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
@media all and (transform-3d),
(-webkit-transform-3d) {
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

            .list-group-unbordered>.list-group-item {
                border-left: 0;
                border-right: 0;
                border-radius: 0;
                padding-left: 0;
                padding-right: 0;
            }
	</style>
<script type="text/javascript">
		$('.carousel').carousel();
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
                    <div class="row" style="background-color: rgb(0,181,250);">
                        <div class="col-sm-4" style="text-align: left; margin-top: 2%">
                        
                        </div>

                        <div class="col-sm-4" style="margin-top:20px;">
                            <span style="margin-top: 15px;  text-align: center; color: whitesmoke; font-size: 30px; font-family: 'Source Sans Pro',sans-serif"><%=Resources.Resource.propertytax %></span>
                        </div>
                        <div class="col-sm-4" style="margin: 11px 12px 75px 20px; height: 77px; max-width: 30%; text-align:right;">                            
                            <a href="Default2.aspx">
                              <%-- %>  <img src="images/back.png" style="width: 100px; height: 60px; margin-top: 1%;" />--%>
                            </a>
                        </div>



                    </div>
                </div>
                &nbsp;&nbsp;&nbsp;&nbsp;
                
            </div>

        </div>

        <%--Div to show the data--%>
        
        <div class="row" style="text-align: center; padding-left: 15px;">
            <div style="position: absolute; border: solid 1px #f00; width: 100%; margin-top: -7%; background-image: url('assets/images/Background_PropertTax.jpg'); border-radius: 10px; text-align: center; height: 100%;">
                <div class="row">
                    <div class="col-md-1" style="">
                    </div>
                    <div class="col-md-10" style="border: solid 3px #b5b0b0; padding-top:6px; padding-bottom:10px; text-align:left; margin-top:10px; height:450px;">
                        <div class="row">
                            <div class="col-md-12">
                              <h4>Transaction Status</h4> <asp:Button ID="BtnClose" runat="server" Text="Go Back" OnClick="BtnClose_Click" />	
                                <div class="row" style="margin-top:80px; ">
									 <div class="col-sm-4 ">
                                        

                                    </div> 
                                    <div class="col-sm-5 " id="messages1"  >

                                        <asp:Label ID="messages" runat="server" Font-Size="XX-Large" backcolor="SeaGreen" Font-Bold="True"   ></asp:Label>  
										   
										<%--<label id="messages" style="color:green;font-size:x-large;background-color:red;"></label>--%>
                                    </div> 
									 <div class="col-sm-3 " >                                    
																			
                                    </div> 
									
                                </div>                                
                            </div>
                            
                        </div>                        
                    </div>
                    <div class="col-md-1" style="">
                        
                    </div>
                </div>
                
                
                

            </div>
        </div>

		<div style="display:none">
			<asp:Label ID="JsonData" runat="server" Text=""></asp:Label>
			<asp:Label ID="JsonDataAbort" runat="server" Text=""></asp:Label>
		</div>

        <style>
            div.icon-launch {
                 padding-top:15px;
                padding-left:7px;
        		bottom: 15px;
        		right: 30px;
        		position: fixed;
                color:orangered;
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


            var time;
            window.onload = resetTimer;
            document.onkeypress = resetTimer;

            function clear() {
                var socket = new WebSocket("ws://localhost:8080/clear");
                socket.onopen = function (event) {
                    socket.send("{\"username\":\"9922501200\"}");
                };
               }

            function resetTimer() {
                clearTimeout(time);
                t = setTimeout(clear, 500);
            }

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

		window.onload = function () {
		
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

            function syntaxHighlight(json)
            {
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
                    
                    setCookie("name"+counter,mes, null);
                    setCookie("counter",counter, null);
						
					//var D = mes["param1"];
				
                    //document.getElementById('hi').value = "" + JSON.stringify(message);
                    counter++;
                   
                };
               // LastMessageDetails = message;
                //alert(message.param2);
                // Show a disconnected message when the WebSocket is closed.
                socket.onclose = function (event) {
                    //logStr("Closed");
                    window.location.href = "BillCloud.aspx";
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
                messagesList.innerHTML = "<pre>" + str1 + "</pre><br>" ;
            }

            // Send a message when the form is submitted.
            //form.onsubmit = function (e) {

            //    return false;
            //};
        };
		
        function setCookie(c_name, value, expiredays)
        {
            var exdate = new Date();
                    exdate.setDate(exdate.getDate() + expiredays);
                    document.cookie = c_name + "=" + value + ";path=/" + ((expiredays == null) ? "" : ";expires=" + exdate.toGMTString());
        }
        
    </script>
</body>
</html>