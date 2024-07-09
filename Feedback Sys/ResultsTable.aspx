<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ResultsTable.aspx.cs" Inherits="Feedback_Sys.ResultsTable" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Student Data</title>
    <meta charset="utf-8" />
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />
    <meta content="" name="description" />
    <meta content="" name="keywords" />

    <!-- Favicons -->
    <link href="assets/img/favicon.png" rel="icon">
    <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

    <!-- Fonts -->
    <link href="https://fonts.googleapis.com" rel="preconnect">
    <link href="https://fonts.gstatic.com" rel="preconnect" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;0,800;1,300;1,400;1,500;1,600;1,700;1,800&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800&family=Raleway:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800&display=swap" rel="stylesheet">

    <!-- Vendor CSS Files -->
    <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet" />
    <link href="assets/vendor/aos/aos.css" rel="stylesheet" />
    <link href="assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet" />
    <link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet" />

    <!-- Main CSS File -->
    <link href="assets/css/main.css" rel="stylesheet" />
    <link href="assets/css/ResultsTableStyle.css" rel="stylesheet" />

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
            border: 1px solid rgba(68, 68, 68, 0.5); /* rgba for transparent color /
    font-size: 16px;
    color: rgba(68, 68, 68, 0.3); / rgba for transparent color /
    margin-right: 10px;
    transition: 0.3s;
}

    .social-links a:hover {
        color: #2a6b80; / rgba for transparent color /
        border: 1px solid #5fcf80; / rgba for transparent color */
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
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <!-- HEADER -->
        <header id="header" class="header d-flex align-items-center sticky-top">
            <div class="container-fluid container-xl position-relative d-flex align-items-center">
                <div class="me-auto">
                    <a href="index.aspx" class="logo d-flex align-items-center ">
                        <!-- Uncomment the line below if you also wish to use an image logo -->
                        <!-- <img src="assets/img/logo.png" alt=""> -->
                        <h1 class="sitename">TECHLEARN HUB</h1>
                    </a>
                    <asp:Label ID="welcome" runat="server" Text="Welcome" Visible="true"></asp:Label>
                </div>
                <nav id="navmenu" class="navmenu">
                    <ul>
                        <li>
                            <asp:HyperLink ID="homeLink" runat="server" NavigateUrl="index.aspx" Text="Home" CssClass="active" /></li>
                        <li>
                            <asp:HyperLink ID="aboutLink" runat="server" NavigateUrl="about.aspx" Text="About" /></li>
                        <li>
                            <asp:HyperLink ID="coursesLink1" runat="server" NavigateUrl="Feedback.aspx" Text="Courses" Visible="false" /></li>
                        <li>
                            <asp:HyperLink ID="adminDashLink1" runat="server" NavigateUrl="adminDashboard.aspx" Text="Admin Dashboard" Visible="false" /></li>
                        <li>
                            <asp:HyperLink ID="teamLink1" runat="server" NavigateUrl="team.aspx" Text="Trainers" /></li>
                        <li>
                            <asp:HyperLink ID="contactLink1" runat="server" NavigateUrl="contact.aspx" Text="Contact" /></li>
                    </ul>
                    <i class="mobile-nav-toggle d-xl-none bi bi-list"></i>
                </nav>
                <asp:HyperLink ID="logInLink" runat="server" CssClass="btn-getstarted" NavigateUrl="Login.aspx">Login</asp:HyperLink>
            </div>
        </header>
        <div class="container">
            <center>
                <h2>Feedback Submissions</h2>
                <br />
            </center>
            <p>
                <!-- Filter By -->
                <asp:Label ID="Label1" runat="server" Text="Filter By: "></asp:Label>
                <asp:DropDownList ID="DropDownList1" runat="server" Width="196px">
                    <asp:ListItem Text="Select Filter" Value=""></asp:ListItem>
                    <asp:ListItem Text="Student ID" Value="StudentID"></asp:ListItem>
                    <asp:ListItem Text="Course" Value="Course"></asp:ListItem>
                </asp:DropDownList>
                &nbsp;&nbsp;
                <!-- Filter Value -->
                <asp:Label ID="Label2" runat="server" Text="Filter Value: "></asp:Label>
                <asp:TextBox ID="TextBox1" runat="server" Width="196px"></asp:TextBox>
                &nbsp;&nbsp;&nbsp;
                <!-- Filter Button -->
                <asp:Button ID="Button1" runat="server" Text="Filter" OnClick="Button1_Click" CssClass="btn btn-filter" />
                &nbsp;&nbsp;&nbsp;&nbsp;
                <!-- Reset Filter Button -->
                <asp:Button ID="Button2" runat="server" Text="Reset Filter" OnClick="Button2_Click" CssClass="btn btn-reset" />
            </p>
            <!-- STUDENT TABLE -->
            <asp:Table ID="studentTable" runat="server" CssClass="table table-bordered table-striped">
                <asp:TableHeaderRow>
                    <asp:TableHeaderCell Style="vertical-align: middle; text-align: center;">Student ID</asp:TableHeaderCell>
                    <asp:TableHeaderCell Style="vertical-align: middle; text-align: center;">Course</asp:TableHeaderCell>
                    <asp:TableHeaderCell Style="vertical-align: middle; text-align: center;">Student Feedback</asp:TableHeaderCell>
                    <asp:TableHeaderCell Style="vertical-align: middle; text-align: center;">
                        <div style="display: flex; align-items: center; justify-content: center;">
                            <span style="margin-right: 10px;">Overall Percentage</span>
                            <asp:ImageButton ID="Button3" runat="server"
                                AlternateText="Ascending"
                                ImageUrl="~/assets/img/asc-removebg-preview.png"
                                OnClick="Button3_Click" />
                            <asp:ImageButton ID="Button4" runat="server"
                                AlternateText="Descending"
                                ImageUrl="~/assets/img/dsc-removebg-preview.png"
                                OnClick="Button4_Click" />
                        </div>
                    </asp:TableHeaderCell>
                </asp:TableHeaderRow>
            </asp:Table>
        </div>
        <div class="color">
            <div class="container">
                <footer class="py-3 my-4">
                    <a href="index.aspx" class="footerLogo">
                        <h1 class="sitename">TECHLEARN HUB</h1>
                    </a>
                    <div class="social-links mt-4">
                        <a href="#"><i class="bi bi-twitter"></i></a>
                        <a href="#"><i class="bi bi-facebook"></i></a>
                        <a href="#"><i class="bi bi-instagram"></i></a>
                        <a href="#"><i class="bi bi-linkedin"></i></a>
                    </div>
                    <ul class="nav justify-content-center border-bottom pb-3 mb-3">
                        <li class="nav-item"><a href="index.aspx" class="nav-link px-2 text-body-secondary">Home</a></li>
                        <li class="nav-item"><a href="about.aspx" class="nav-link px-2 text-body-secondary">About</a></li>
                        <li class="nav-item"><a href="team.aspx" class="nav-link px-2 text-body-secondary">Trainers</a></li>
                        <li class="nav-item"><a href="contact.aspx" class="nav-link px-2 text-body-secondary">Contact</a></li>
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
