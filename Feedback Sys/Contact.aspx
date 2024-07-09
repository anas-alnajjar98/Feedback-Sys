<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="Feedback_Sys.Contact" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Contact Us</title>
    <link href="Content/bootstrap-grid.min.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com" rel="preconnect" />
    <link href="https://fonts.gstatic.com" rel="preconnect" crossorigin />
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;0,800;1,300;1,400;1,500;1,600;1,700;1,800&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900&family=Raleway:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900&display=swap" rel="stylesheet" />
    <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet" />
    <link href="assets/vendor/aos/aos.css" rel="stylesheet" />
    <link href="assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet" />
    <link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet" />
    <link href="assets/css/main.css" rel="stylesheet" />
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
            border: 1px solid rgba(68, 68, 68, 0.5);
            font-size: 16px;
            color: rgba(68, 68, 68, 0.3);
            margin-right: 10px;
            transition: 0.3s;
        }

            .social-links a:hover {
                color: #2a6b80;
                border: 1px solid #5fcf80;
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

        .page-title {
            background-image: url('assets/img/bg3.jpg');
            background-repeat: no-repeat;
            background-size: cover;
            padding: 3.125em;
        }

        @media (max-width: 1000px) {
            span#welcome {
                display: none;
            }
        }
    </style>

</head>
<body class="contact-page">
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
                            <asp:HyperLink ID="adminDashLink1" runat="server" NavigateUrl="adminDash.aspx" Text="Admin Dashboard" Visible="false" /></li>
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

        <main class="main">
            <!-- Page Title -->
            <div class="page-title" data-aos="fade">
                <div class="heading">
                    <div class="container">
                        <div class="row d-flex justify-content-center text-center">
                            <div class="col-lg-8">
                                <h1>Contact</h1>
                                <p class="mb-0">Feel free to reach out to us with any inquiries or feedback. We are dedicated to providing exceptional service and are here to assist you. Your satisfaction is our priority, and we look forward to hearing from you.</p>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
            <!-- End Page Title -->

            <!-- Contact Section -->
            <section id="contact" class="contact section">
                <div class="mb-5" data-aos="fade-up" data-aos-delay="200">

                    <iframe style="border: 0; width: 100%; height: 300px;" src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3363.009729811048!2d35.84709387545008!3d32.55258557375824!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x151c7715f2c2e7ab%3A0x51755840c8ddbefd!2sOrange%20Digital%20Village%20Irbid!5e0!3m2!1sen!2sjo!4v1720206003379!5m2!1sen!2sjo" frameborder="0" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
                </div>
                <!-- End Google Maps -->

                <div class="container" data-aos="fade-up" data-aos-delay="100">
                    <div class="row gy-4">
                        <div class="col-lg-4">
                            <div class="info-item d-flex" data-aos="fade-up" data-aos-delay="300">
                                <i class="bi bi-geo-alt flex-shrink-0"></i>
                                <div>
                                    <h3>Address</h3>
                                    <p>HR3X+2VM, Al-Sheikh Khalil St., Irbid</p>
                                </div>
                            </div>
                            <!-- End Info Item -->

                            <div class="info-item d-flex" data-aos="fade-up" data-aos-delay="400">
                                <i class="bi bi-telephone flex-shrink-0"></i>
                                <div>
                                    <h3>Call Us</h3>
                                    <p>+962 792 237 329</p>
                                </div>
                            </div>
                            <!-- End Info Item -->

                            <div class="info-item d-flex" data-aos="fade-up" data-aos-delay="500">
                                <i class="bi bi-envelope flex-shrink-0"></i>
                                <div>
                                    <h3>Email Us</h3>
                                    <p>techlearnhub.contact@gmail.com</p>
                                </div>
                            </div>
                            <!-- End Info Item -->
                        </div>

                        <div class="col-lg-8">
                            <div class="php-email-form" data-aos="fade-up" data-aos-delay="200">
                                <div class="row gy-4">
                                    <div class="col-md-6">
                                        <asp:TextBox ID="name" runat="server" CssClass="form-control" Placeholder="Your Name" required="true"></asp:TextBox>
                                    </div>
                                    <div class="col-md-6">
                                        <asp:TextBox ID="email" runat="server" CssClass="form-control" Placeholder="Your Email" required="true" TextMode="Email"></asp:TextBox>
                                    </div>
                                    <div class="col-md-12">
                                        <asp:TextBox ID="subject" runat="server" CssClass="form-control" Placeholder="Subject" required="true"></asp:TextBox>
                                    </div>
                                    <div class="col-md-12">
                                        <asp:TextBox ID="message" runat="server" CssClass="form-control" Placeholder="Message" required="true" TextMode="MultiLine" Rows="6"></asp:TextBox>
                                    </div>
                                    <div class="col-md-12 text-center">
                                        <div class="loading">Loading</div>
                                        <div class="error-message">
                                            <asp:Label ID="errorMessage" runat="server" Text="Label"></asp:Label>
                                        </div>
                                        <div class="sent-message">
                                            <asp:Label ID="sentMessage" runat="server" Text="Label"></asp:Label>
                                        </div>
                                        <asp:Button ID="submitButton" runat="server" CssClass="btn btn-primary" Text="Send Message" OnClick="submit_feedback" />
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- End Contact Form -->
                    </div>
                </div>
            </section>
            <!-- /Contact Section -->
        </main>

        <div class="color">
            <div class="container">
                <footer class="py-3 my-4">
                    <a href="index.html" class="footerLogo">
                        <h1 class="sitename">TECHLEARN HUB</h1>
                    </a>
                    <div class="social-links  mt-4">
                        <a href="#"><i class="bi bi-twitter-x"></i></a>
                        <a href="#"><i class="bi bi-facebook"></i></a>
                        <a href="#"><i class="bi bi-instagram"></i></a>
                        <a href="#"><i class="bi bi-linkedin"></i></a>
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

    </form>

    <!-- Include necessary scripts -->
    <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="assets/vendor/php-email-form/validate.js"></script>
    <script src="assets/vendor/aos/aos.js"></script>
    <script src="assets/vendor/glightbox/js/glightbox.min.js"></script>
    <script src="assets/vendor/purecounter/purecounter_vanilla.js"></script>
    <script src="assets/vendor/swiper/swiper-bundle.min.js"></script>

    <!-- Main JS File -->
    <script src="assets/js/main.js"></script>
</body>
</html>
