<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditCourseSurvey.aspx.cs" Inherits="Feedback_Sys.EditCourseSurvey" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
        <meta charset="utf-8" />
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />
    <title>Index - Mentor Bootstrap Template</title>
    <meta content="" name="description" />
    <meta content="" name="keywords" />

    <!-- Favicons -->
    <link href="assets/img/favicon.png" rel="icon">
    <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

    <!-- Fonts -->
    <link href="https://fonts.googleapis.com" rel="preconnect">
    <link href="https://fonts.gstatic.com" rel="preconnect" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;0,800;1,300;1,400;1,500;1,600;1,700;1,800&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Raleway:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">

    <!-- Vendor CSS Files -->
    <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
    <link href="assets/vendor/aos/aos.css" rel="stylesheet">
    <link href="assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
    <link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

    <!-- Main CSS File -->
    <link href="assets/css/main.css" rel="stylesheet">

    <style>
        .hero {
            padding: 290px 0;
        }

        .me-auto {
            margin-right: auto !important;
            display: flex;
            align-items: baseline;
        }

        span#welcome {
            margin-left: 2em;
        }

        .py-3 my-4 {
            --background-color: #f9f9f9;
        }

        .footerLogo h1 {
            font-weight: 700;
            font-size: 30px;
            text-align: center;
            letter-spacing: 1px;
            text-transform: uppercase;
            color: #388da8;
        }

        .social-links a {
            display: flex;
            align-items: center;
            justify-content: center;
            width: 40px;
            height: 40px;
            border-radius: 50%;
            border: 1px solid rgba(68, 68, 68, 0.5); /* rgba for transparent color */
    font-size: 16px;
    color: rgba(68, 68, 68, 0.3); / rgba for transparent color /
    margin-right: 10px;
    transition: 0.3s;
}

    .social-links a:hover {
        color: #2a6b80; /* rgba for transparent color */
        border: 1px solid #5fcf80; /*rgba for transparent color */
        }

        .social-links.mt-4 {
            display: flex;
            justify-content: center;
        }

        h1.sitename {
            color: #388da8;
        }

        .color {
            background-color: #f9f9f9;
        }

        .my-4 {
            margin-top: 1.5rem !important;
            margin-bottom: 0rem !important;
        }

        .py-3 {
            padding-top: 2rem !important;
            padding-bottom: 1rem !important;
        }

        @media (max-width: 1000px) {
            span#welcome {
                display: none;
            }
        }

        .coursesPic {
            height: 150px;
            width: 100%;
            display: block;
            margin: 0 auto; /* Centers the image horizontally */
        }

        #javaPic {
            width: 85%;
        }

        #cssPic {
            width: 70%;
        }

        .btn-primary {
            background-color: #19517e;
            border: none;
            height: 33px;
            font-size: 14px;
        }

        .course-item {
            margin-bottom: 25px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <header id="header" class="header d-flex align-items-center sticky-top">
    <div class="container-fluid container-xl position-relative d-flex align-items-center">
        <div class="me-auto">
            <a href="index.html" class="logo d-flex align-items-center ">
                <!-- Uncomment the line below if you also wish to use an image logo -->
                <!-- <img src="assets/img/logo.png" alt=""> -->
                <h1 class="sitename">TECHLEARN HUB</h1>
            </a>
            <asp:Label ID="welcome" runat="server" Text="Label" Visible="false"></asp:Label>
        </div>
        <nav id="navmenu" class="navmenu">
            <ul>

                <li>
                    <asp:HyperLink ID="homeLink" runat="server" NavigateUrl="index.aspx" Text="Home" class="active" /></li>
                <li>
                    <asp:HyperLink ID="aboutLink" runat="server" NavigateUrl="about.aspx" Text="About" /></li>

                <li>
                    <asp:HyperLink ID="coursesLink1" runat="server" NavigateUrl="Feedback.aspx" Text="Courses" Visible="false" /></li>
                <li>
                    <asp:HyperLink ID="adminDashLink1" runat="server" NavigateUrl="adminDashboard.aspx" Text="Admin Dashboard" Visible="false" /></li>
                <li>
                    <asp:HyperLink ID="teamLink1" runat="server" NavigateUrl="Trainers.aspx" Text="Trainers" /></li>


                <li>
                    <asp:HyperLink ID="contactLink1" runat="server" NavigateUrl="contact.aspx" Text="Contact" /></li>
            </ul>
            <i class="mobile-nav-toggle d-xl-none bi bi-list"></i>
        </nav>
        <asp:HyperLink ID="logInLink" runat="server" class="btn-getstarted" NavigateUrl="Login.aspx">Login</asp:HyperLink>

    </div>
</header>
       <div class="container">
    <h2 class="mb-4">Feedback Form</h2>
    <div class="form-group">
        <asp:Label runat="server" AssociatedControlID="input1">Question 1</asp:Label>
        <asp:TextBox runat="server" CssClass="form-control" ID="input1"></asp:TextBox>
    </div>
    <div class="form-group">
        <asp:Label runat="server" AssociatedControlID="input2">Question 2</asp:Label>
        <asp:TextBox runat="server" CssClass="form-control" ID="input2"></asp:TextBox>
    </div>
    <div class="form-group">
        <asp:Label runat="server" AssociatedControlID="input3">Question 3</asp:Label>
        <asp:TextBox runat="server" CssClass="form-control" ID="input3"></asp:TextBox>
    </div>
    <div class="form-group">
        <asp:Label runat="server" AssociatedControlID="input4">Question 4</asp:Label>
        <asp:TextBox runat="server" CssClass="form-control" ID="input4"></asp:TextBox>
    </div>
    <div class="form-group">
        <asp:Label runat="server" AssociatedControlID="input5">Question 5</asp:Label>
        <asp:TextBox runat="server" CssClass="form-control" ID="input5"></asp:TextBox>
    </div>
    <div class="form-group">
        <asp:Label runat="server" AssociatedControlID="input6">Question 6</asp:Label>
        <asp:TextBox runat="server" CssClass="form-control" ID="input6"></asp:TextBox>
    </div>
    <div class="form-group">
        <asp:Label runat="server" AssociatedControlID="input7">Question 7</asp:Label>
        <asp:TextBox runat="server" CssClass="form-control" ID="input7"></asp:TextBox>
    </div>
    <div class="form-group">
        <asp:Label runat="server" AssociatedControlID="input8">Question 8</asp:Label>
        <asp:TextBox runat="server" CssClass="form-control" ID="input8"></asp:TextBox>
    </div>
    <div class="form-group">
        <asp:Label runat="server" AssociatedControlID="input9">Question 9</asp:Label>
        <asp:TextBox runat="server" CssClass="form-control" ID="input9"></asp:TextBox>
    </div>
    <div class="form-group">
        <asp:Label runat="server" AssociatedControlID="input10">Question 10</asp:Label>
        <asp:TextBox runat="server" CssClass="form-control" ID="input10"></asp:TextBox>
    </div>
    <asp:Button ID="submitButton" runat="server" Text="Submit Feedback" CssClass="btn btn-primary btn-block mt-4" OnClick="Unnamed11_Click" />
</div>
         <div class="color">
     <div class="container">
         <footer class="py-3 my-4">
             <a href="index.html" class="footerLogo">
                 <h1 class="sitename">TECHLEARN HUB</h1>
             </a>
             <div class="social-links  mt-4">
                 <a href=""><i class="bi bi-twitter-x"></i></a>
                 <a href=""><i class="bi bi-facebook"></i></a>
                 <a href=""><i class="bi bi-instagram"></i></a>
                 <a href=""><i class="bi bi-linkedin"></i></a>
             </div>
             <ul class="nav justify-content-center border-bottom pb-3 mb-3">
                 <li class="nav-item"><a href="#" class="nav-link px-2 text-body-secondary">Home</a></li>
                 <li class="nav-item"><a href="#" class="nav-link px-2 text-body-secondary">About</a></li>
                 <li class="nav-item"><a href="#" class="nav-link px-2 text-body-secondary">Trainers</a></li>
                 <li class="nav-item"><a href="#" class="nav-link px-2 text-body-secondary">Contact</a></li>
             </ul>
             <p class="text-center text-body-secondary">&copy; 2024 Company, Inc</p>
         </footer>
     </div>
 </div>

 <!-- Scroll Top -->
 <a href="#" id="scroll-top" class="scroll-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

 <!-- Preloader -->
 <div id="preloader"></div>

 <!-- Vendor JS Files -->
 <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
 <script src="assets/vendor/php-email-form/validate.js"></script>
 <script src="assets/vendor/aos/aos.js"></script>
 <script src="assets/vendor/glightbox/js/glightbox.min.js"></script>
 <script src="assets/vendor/purecounter/purecounter_vanilla.js"></script>
 <script src="assets/vendor/swiper/swiper-bundle.min.js"></script>

 <!-- Main JS File -->
 <script src="assets/js/main.js"></script>
    </form>
</body>
</html>
