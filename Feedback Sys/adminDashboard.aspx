<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="adminDashboard.aspx.cs" Inherits="Feedback_Sys.adminDashboard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <title>Index - Mentor Bootstrap Template</title>
    <meta content="" name="description">
    <meta content="" name="keywords">

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
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">


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
            color: rgba(68, 68, 68, 0.3);
            / rgba for transparent color / margin-right: 10px;
            transition: 0.3s;
        }

            .social-links a:hover {
                color: #2a6b80;
                / rgba for transparent color / border: 1px solid #5fcf80;
                / rgba for transparent color */
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

        .content {
            display: flex;
            justify-content: space-around;
            align-items: center;
            flex-wrap: wrap;
            margin: 2em;
            padding: 6em;
        }

        .card {
            width: 20em;
            background-color: white;
            border-radius: 20px;
            box-shadow: 0 5px 25px rgba(50, 48, 48, 20%);
            padding: 30px;
            text-align: center;
            margin-top: 20px;
            transition: 0.7s ease;
        }

            .card .icon {
                font-size: 4em;
                margin-bottom: 10px;
                color: #5fcf80;
            }

            .card h3 {
                color: #4d869c;
                font-size: 1.5em;
                margin-bottom: 10px;
            }

            .card p {
                font-size: 0.8em;
                font-weight: 300;
            }

            .card:hover {
                transform: scale(1.1);
            }


        @media (max-width: 1000px) {
            span#welcome {
                display: none;
            }
        }

        .services .service-item {
            background-color: var(--surface-color);
            padding: 40px;
            box-shadow: 0px 0 30px rgba(0, 0, 0, 0.1);
            height: 100%;
        }

            .services .service-item .icon {
                width: 48px;
                height: 48px;
                position: relative;
                margin-bottom: 50px;
            }

                .services .service-item .icon i {
                    color: color-mix(in srgb, var(--heading-color), transparent 30%);
                    font-size: 56px;
                    transition: ease-in-out 0.3s;
                    z-index: 2;
                    position: relative;
                }

                .services .service-item .icon:before {
                    position: absolute;
                    content: "";
                    height: 100%;
                    width: 100%;
                    background: color-mix(in srgb, var(--heading-color), transparent 95%);
                    border-radius: 50px;
                    z-index: 1;
                    top: 10px;
                    right: -20px;
                    transition: 0.3s;
                }

            .services .service-item h3 {
                color: color-mix(in srgb, var(--heading-color), transparent 20%);
                font-weight: 700;
                margin: 0 0 20px 0;
                padding-bottom: 8px;
                font-size: 22px;
                position: relative;
                display: inline-block;
                border-bottom: 4px solid color-mix(in srgb, var(--heading-color), transparent 90%);
                transition: 0.3s;
            }

            .services .service-item p {
                line-height: 24px;
                font-size: 14px;
                margin-bottom: 0;
            }

            .services .service-item .readmore {
                margin-top: 15px;
                display: inline-block;
                color: color-mix(in srgb, var(--default-color), transparent 30%);
            }

            .services .service-item:hover .icon i {
                color: var(--heading-color);
            }

            .services .service-item:hover .icon:before {
                background: color-mix(in srgb, var(--accent-color), transparent 50%);
            }

            .services .service-item:hover h3 {
                border-color: color-mix(in srgb, var(--accent-color), transparent 10%);
                color: var(--heading-color);
            }

        @property --p {
            syntax: '<number>';
            inherits: true;
            initial-value: 0;
        }

        .pie {
            --p: 20;
            --b: 22px;
            --c: darkred;
            --w: 150px;
            width: var(--w);
            aspect-ratio: 1;
            position: relative;
            display: inline-grid;
            margin: 5px;
            place-content: center;
            font-size: 25px;
            font-weight: bold;
            font-family: sans-serif;
        }

            .pie:before,
            .pie:after {
                content: "";
                position: absolute;
                border-radius: 50%;
            }

            .pie:before {
                inset: 0;
                background: radial-gradient(farthest-side, var(--c) 98%, #0000) top/var(--b) var(--b) no-repeat, conic-gradient(var(--c) calc(var(--p) * 1%), #0000 0);
                -webkit-mask: radial-gradient(farthest-side, #0000 calc(99% - var(--b)), #000 calc(100% - var(--b)));
                mask: radial-gradient(farthest-side, #0000 calc(99% - var(--b)), #000 calc(100% - var(--b)));
            }

            .pie:after {
                inset: calc(50% - var(--b) / 2);
                background: var(--c);
                transform: rotate(calc(var(--p) * 3.6deg)) translateY(calc(50% - var(--w) / 2));
            }

        .animate {
            animation: p 1s .5s both;
        }

        .no-round:before {
            background-size: 0 0, auto;
        }

        .no-round:after {
            content: none;
        }

        @keyframes p {
            from {
                --p: 0
            }
        }

        div#col {
            margin-top: 4em;
        }

        div#flex {
            display: flex;
            align-items: center;
            flex-wrap: wrap;
            justify-content: space-evenly;
        }


        .pieChartLabel {
            text-align: center;
            font-size: larger;
            font-weight: bolder;
        }

        .pie.animate {
            text-align: center;
        }

        .page-title {
            background: url('assets/img/bg3.jpg');
            background-size: cover;
        }

        .col-lg-4.col-md-6.aos-init.aos-animate {
            width: 45%;
            margin-bottom: 1em;
            margin-left: 1em;
        }

        .row.gy-2 {
            display: flex;
            justify-content: center;
        }

        @media (max-width: 426px) {
            div#flex {
                display: flex;
                align-items: center;
                flex-wrap: wrap;
                justify-content: space-evenly;
                flex-direction: column;
            }

            .col-lg-4.col-md-6.aos-init.aos-animate {
                width: 95%;
            }

            .row.gy-2 {
                display: flex;
                justify-content: center;
                flex-direction: column;
            }
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
                            <asp:HyperLink ID="coursesLink1" runat="server" NavigateUrl="courses.aspx" Text="Courses" Visible="false" /></li>
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
        <!-- Page Title -->
        <div class="page-title hi" data-aos="fade">
            <div class="heading">
                <div class="container">
                    <div class="row d-flex justify-content-center text-center">
                        <div class="col-lg-8">
                            <h1>
                                
                                Admin Dashboard<br>
                            </h1>
                        </div>
                    </div>
                </div>
            </div>

        </div>
        <!-- End Page Title -->


        <div id="col">
            <asp:Label ID="percentageLabel1" runat="server" Style="display: none;"></asp:Label>
            <asp:Label ID="percentageLabel2" runat="server" Style="display: none;"></asp:Label>
            <asp:Label ID="percentageLabel3" runat="server" Style="display: none;"></asp:Label>
            <asp:Label ID="percentageLabel4" runat="server" Style="display: none;"></asp:Label>

            <h2 style="text-align: center; margin-bottom: 2em;">Feedback Statistics</h2>
            <div id="flex">
                <div id="pieChart1" runat="server" visible="false">
                    <div class="pie animate" style="--p: <%= percentageLabel1.Text %>; --c: lightgreen">
                        <%= percentageLabel1.Text %>%
                    </div>
                    <p class="pieChartLabel">Java</p>
                </div>

                <div id="pieChart2" runat="server" visible="false">
                    <div class="pie animate" style="--p: <%= percentageLabel2.Text %>; --c: lightblue">
                        <%= percentageLabel2.Text %>%
                    </div>
                    <p class="pieChartLabel">Python</p>

                </div>

                <div id="pieChart3" runat="server" visible="false">
                    <div class="pie animate" style="--p: <%= percentageLabel3.Text %>; --c: lightcoral">
                        <%= percentageLabel3.Text %>%
                    </div>
                    <p class="pieChartLabel">CSS</p>

                </div>

                <div id="pieChart4" runat="server" visible="false">
                    <div class="pie animate" style="--p: <%= percentageLabel4.Text %>; --c: lightgoldenrodyellow">
                        <%= percentageLabel4.Text %>%
                    </div>
                    <p class="pieChartLabel">JavaScript</p>

                </div>

            </div>
        </div>

        <section id="services" class="services section">

            <!-- Section Title -->
            <div class="container section-title" data-aos="fade-up">
            </div>
            <!-- End Section Title -->

            <div class="container">

                <div class="row gy-2">

                    <div class="col-lg-4 col-md-6" data-aos="fade-up" data-aos-delay="100">
                        <div class="service-item  position-relative">
                            <div class="icon">
                                <i class="fas fa-book"></i>
                            </div>
                            <a href="Courses.aspx">
                                <h3>courses</h3>
                            </a>

                        </div>
                    </div>
                    <!-- End Service Item -->


                    <div class="col-lg-4 col-md-6" data-aos="fade-up" data-aos-delay="200">
                        <div class="service-item position-relative">
                            <div class="icon">
                                <i class="fas fa-comments"></i>
                            </div>
                            <a href="Courses.aspx">
                                <h3>Feedback questions</h3>
                            </a>

                        </div>
                    </div>
                    <!-- End Service Item -->


                    <div class="col-lg-4 col-md-6" data-aos="fade-up" data-aos-delay="400">
                        <div class="service-item position-relative">
                            <div class="icon">
                                <i class="fas fa-user-graduate"></i>
                            </div>
                            <a href="StudentsTable.aspx">
                                <h3>Students</h3>
                            </a>


                        </div>
                    </div>
                    <!-- End Service Item -->

                    <div class="col-lg-4 col-md-6" data-aos="fade-up" data-aos-delay="500">
                        <div class="service-item position-relative">
                            <div class="icon">
                                <i class="fas fa-poll"></i>
                            </div>
                            <a href="ResultsTable.aspx">
                                <h3>Results</h3>
                            </a>

                        </div>
                    </div>
                    <!-- End Service Item -->



                </div>

            </div>

        </section>
        <!-- /Services Section -->








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
        <%-- remmber those files --%>
        <script src="assets/vendor/imagesloaded/imagesloaded.pkgd.min.js"></script>
        <script src="assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>


        <!-- Main JS File -->
        <script src="assets/js/main.js"></script>

    </form>
</body>
</html>
