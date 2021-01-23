<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ApplicationServices.aspx.cs" Inherits="ApplicationServices" %>

<%--<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">--%>

   <script type="text/javascript">
        function redirect() {
            window.location = "Services.aspx";
        }
    </script>
     

     <div class="row" style="background-color: #ffffff8f; padding: 20px; border: #000; text-shadow: -1px 3px 5px black; width:200%; margin-top:-20%;">

        <div >
   


            <a href="#popup1"  onclick="HideQuicklink();" class="btn btn-danger" style="background-color: rgba(238, 174, 2, 0.8); width: 280px; font-size: large "><%=Resources.Resource.Birth %> <%=Resources.Resource.Certificate %></a>
            <!--<a href="" id="btn2" class="btn btn-primary m-top-20">HINDI</a>-->
             &nbsp;&nbsp; &nbsp;&nbsp;
            <a href="#popup2"  onclick="HideQuicklink();" class="btn btn-danger" style="background-color:rgba(238, 174, 2, 0.8); width: 280px; font-size: large"><%=Resources.Resource.Governance %></a>
            <!--<a href="" id="btn2" class="btn btn-primary m-top-20">HINDI</a>-->
             &nbsp;&nbsp; &nbsp;&nbsp;
            <a href="#popup3"  onclick="HideQuicklink();" class="btn btn-danger" style="background-color: rgba(238, 174, 2, 0.8); width: 280px; font-size: large"><%=Resources.Resource.RTS %> <%=Resources.Resource.Services %></a>
            <!--<a href="" id="btn2" class="btn btn-primary m-top-20">HINDI</a>-->
             &nbsp;&nbsp; &nbsp;&nbsp; <br /><br /><br />
            <a href="#popup4"  onclick="HideQuicklink();" class="btn btn-danger" style="background-color: rgba(0, 139, 219, 0.8); width: 280px; font-size: large;"><%=Resources.Resource.RTI %> <%=Resources.Resource.Services %></a>
            <!--<a href="" id="btn2" class="btn btn-primary m-top-20">HINDI</a>-->
               &nbsp;&nbsp; &nbsp;&nbsp;
             <a href="#popup5"  onclick="HideQuicklink();" class="btn btn-danger" style="background-color: rgba(0, 139, 219, 0.8); width: 280px; font-size: large"><%=Resources.Resource.Aaple %> <%=Resources.Resource.Sarkar %> </a>
            <!--<a href="" id="btn2" class="btn btn-primary m-top-20">HINDI</a>-->
               &nbsp;&nbsp; &nbsp;&nbsp;
            <a href="#popup6"  onclick="HideQuicklink();" class="btn btn-danger" style="background-color: rgba(0, 139, 219, 0.8); width: 280px; font-size: large;"><%=Resources.Resource.Part %> <%=Resources.Resource.Plan %>/<%=Resources.Resource.Zone %> <%=Resources.Resource.Dakhla %></a>
            <!--<a href="" id="btn2" class="btn btn-primary m-top-20">HINDI</a>-->
               &nbsp;&nbsp; &nbsp;&nbsp;<br /><br /><br />
          
        

        </div>


    </div>


     <div id="popup1" class="overlay">
   	     <div class="popup">
		<h2>Birth Certificate</h2>
		<div class="content">
		 <iframe id="frame1" style="width:1200px;height:640px"  src=""  style="border: none; margin-left:20px;  box-shadow: 0px 0px 20px 2px #1999aa;"></iframe>  
		</div>
         <div  >

               <a href="#" onclick="ShowQuicklink();" class="btn btn" style="background-color:rgb(255, 0, 0);width: 15%; font-size:larger" role="button">Close</a>
             
            </div>
	</div>
</div>

     <div id="popup2" class="overlay">
   	     <div class="popup">
		<h2>Governance</h2>
		<div class="content">
		 <iframe id="frame2" style="width:1200px;height:640px"  src="http://grievance.pcmcindia.gov.in:8085/Grievance/citizen/"  style="border: none; margin-left:20px;  box-shadow: 0px 0px 20px 2px #1999aa;"></iframe>  
		</div>
         <div  >

               <a href="#" onclick="ShowQuicklink();" class="btn btn" style="background-color:rgb(255, 0, 0);width: 15%; font-size:larger" role="button">Close</a>
             
            </div>
	</div>
</div>

     <div id="popup3" class="overlay">
   	     <div class="popup">
		<h2>RTS Services</h2>
		<div class="content">
		 <iframe id="frame3" style="width:1200px;height:640px"  src="https://www.pcmcindia.gov.in/rts_e.php"  style="border: none; margin-left:20px;  box-shadow: 0px 0px 20px 2px #1999aa;"></iframe>  
		</div>
         <div  >

               <a href="#" onclick="ShowQuicklink();" class="btn btn" style="background-color:rgb(255, 0, 0);width: 15%; font-size:larger" role="button">Close</a>
             
            </div>
	</div>
</div>


     <div id="popup4" class="overlay">
   	     <div class="popup">
		<h2>RTI Services</h2>
		<div class="content">
		 <iframe id="frame4" style="width:1200px;height:640px"  src="https://www.pcmcindia.gov.in/rti_dept_eng.php"  style="border: none; margin-left:20px;  box-shadow: 0px 0px 20px 2px #1999aa;"></iframe>  
		</div>
         <div  >

               <a href="#" onclick="ShowQuicklink();" class="btn btn" style="background-color:rgb(255, 0, 0);width: 15%; font-size:larger" role="button">Close</a>
             
            </div>
	</div>
</div>



     <div id="popup5" class="overlay">
   	     <div class="popup">
		<h2>Aaple Sarkar</h2>
		<div class="content">
		 <iframe id="frame5" style="width:1200px;height:640px"  src="https://aaplesarkar.maharashtra.gov.in/en/"  style="border: none; margin-left:20px;  box-shadow: 0px 0px 20px 2px #1999aa;"></iframe>  
		</div>
         <div  >

               <a href="#" onclick="ShowQuicklink();" class="btn btn" style="background-color:rgb(255, 0, 0);width: 15%; font-size:larger" role="button">Close</a>
             
            </div>
	</div>
</div>



     <div id="popup6" class="overlay">
   	     <div class="popup">
		<h2>Part Plan / Zone Dakhla</h2>
		<div class="content">
		 <iframe id="frame6" style="width:1200px;height:640px"  src="https://www.pcmcindia.gov.in/TP_info.php"  style="border: none; margin-left:20px;  box-shadow: 0px 0px 20px 2px #1999aa;"></iframe>  
		</div>
         <div  >

               <a href="#" onclick="ShowQuicklink();" class="btn btn" style="background-color:rgb(255, 0, 0);width: 15%; font-size:larger" role="button">Close</a>
             
            </div>
	</div>
</div>


    <div id="Back" style="background-color: aliceblue; right:-40%; " onclick="javascript:redirect();">
            <span class="info-box-icon" style=" position: absolute;  right: -100%; margin-top:38%;">
                <img src="images/back.jpg"  style="width:45%;"/></span>

          
        </div>
     <div id="QuickLink">

     <div class="col-md-12" style="margin-top:31%;width:180%;">

 <div class="col-md-2">
      <h5 style="margin-left:0px"><span style="color:black">QUICK</span><span> LINKS</span></h5>
 </div>
     
      
    <div class="quickOuter">   
      
      <ul>

                    <li style="background-color:rgba(238, 174, 2, 0.8);height:70px"><a href="Ambulance.aspx" style="color:whitesmoke;text-align:center"  ><i " class="fa fa-ambulance" aria-hidden="true"></i><%=Resources.Resource.Ambulance %> </a></li>
          <li style="background-color:rgba(238, 174, 2, 0.8);height:70px"><a href="https://www.pcmcindia.gov.in/quicklinks.php?Link=2" style="color:whitesmoke;text-align:center"><i class="fa fa-tint" aria-hidden="true"></i> <%=Resources.Resource.Blood %> <%=Resources.Resource.Bank %> </a></li>
          <li style="background-color:rgba(238, 174, 2, 0.8);height:70px"><a href="https://www.pcmcindia.gov.in/quicklinks.php?Link=6" style="color:whitesmoke;text-align:center"><i class="fa fa-fire" aria-hidden="true"></i><%=Resources.Resource.Fire %> <%=Resources.Resource.Brigade %> </a></li>
          <li style="background-color:rgba(0, 139, 219, 0.8);height:70px"><a href="https://www.pcmcindia.gov.in/quicklinks.php?Link=7"  style="color:whitesmoke;text-align:center"><i class="fa fa-hospital-o" aria-hidden="true"></i><%=Resources.Resource.Hospitals %>  </a></li>
          <li style="background-color:rgba(0, 139, 219, 0.8);height:70px"><a href="https://www.pcmcindia.gov.in/quicklinks.php?Link=8"  style="color:whitesmoke;text-align:center"><i class="fa fa-shield" aria-hidden="true"></i><%=Resources.Resource.Police %>  </a></li>
            <li style="background-color:rgba(0, 139, 219, 0.8);height:70px"><a href="https://www.pcmcindia.gov.in/quicklinks.php?Link=3"  style="color:whitesmoke;text-align:center"><i class="fa fa-hospital-o" aria-hidden="true"></i><%=Resources.Resource.Chemist %>  </a></li>
                   
        </ul>
           </div>
  
  </div>
         </div>


      <link href="assets/css/modal.css" rel="stylesheet" />

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


     <script type="text/javascript">
        function ShowQuicklink() {
           
          
            var x = document.getElementById("QuickLink");
            if (x.style.display === "none") {
                x.style.display = "block";
            } else {
                x.style.display = "none";
            }

            var x = document.getElementById("Back");
            if (x.style.display === "none") {
                x.style.display = "block";
            } else {
                x.style.display = "none";
            }
         //   location.reload();
        }
        function HideQuicklink() {
           
            var x = document.getElementById("QuickLink");
            if (x.style.display === "none") {
                x.style.display = "block";
            } else {
                x.style.display = "none";
            }

            var x = document.getElementById("Back");
            if (x.style.display === "none") {
                x.style.display = "block";
            } else {
                x.style.display = "none";
            }
        }
    </script>


<%--</asp:Content>--%>


