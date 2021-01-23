<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CustomError.aspx.cs" Inherits="PCMCerror" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script
        src="https://code.jquery.com/jquery-3.4.1.js"
        integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
        crossorigin="anonymous"></script>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" rel="stylesheet" />
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" type="text/javascript"></script>
    <link href="Dashboard/css/ErrorCss.css" rel="stylesheet" />
   
    <!--https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css-->


    <script type="application/x-javascript"> 
      addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
            function hideURLbar(){ window.scrollTo(0,1); }
    </script>
    <!-- Meta tag Keywords -->
    <!-- css files -->
    <link href="css/ErrorCss.css" rel="stylesheet" type="text/css" media="all" />
    <!-- //css files -->
    <!-- online-fonts -->
    <link href="//fonts.googleapis.com/css?family=Ropa+Sans:400,400i&amp;subset=latin-ext" rel="stylesheet" />
    <!--//online-fonts -->
</head>
<body>
   <div class="header">
        <h1></h1>
    </div>
    <div class="w3-main">
        <div class="agile-info">
            <h3>SORRY</h3>
            <h2>4<img src="images/confused.gif" alt="image" />4</h2>
            <p>An error Occurred in the Application And Your Page could not be Served.</p>
            <a href="<%= Page.ResolveUrl("~/Default.aspx") %> ">go back</a>
        </div>
    </div>
    <div class="footer-w3l">
        <p>
            &copy;
                <script type="text/javascript">
                    document.write(new Date().getFullYear());
                </script>
            PCMC Error Page. All rights reserved  
        </p>
    </div>
</body>
</html>
