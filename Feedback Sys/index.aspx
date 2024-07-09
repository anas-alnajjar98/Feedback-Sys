<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="Feedback_Sys.index" %>

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
<body class="index-page">
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
        <main class="main">

            <!-- Hero Section -->
            <section id="hero" class="hero section dark-background">

                <img src="assets/img/hero-bg.jpg" alt="" data-aos="fade-in">

                <div class="container">
                    <h2 data-aos="fade-up" data-aos-delay="100">Learning Today,<br>
                        Leading Tomorrow</h2>
                    <p data-aos="fade-up" data-aos-delay="200">We are team of talented Full-Stack Web Developers<br />
                        ready to help you get started !</p>
                    <div class="d-flex mt-4" data-aos="fade-up" data-aos-delay="300">
                        <a href="contact.aspx" class="btn-get-started">Get Started</a>
                    </div>
                </div>

            </section>
            <!-- /Hero Section -->

            <!-- About Section -->
            <section id="about" class="about section">

                <div class="container">

                    <div class="row gy-4">

                        <div class="col-lg-6 order-1 order-lg-2" data-aos="fade-up" data-aos-delay="100">
                            <img src="assets/img/about.jpg" class="img-fluid" alt=""/>
                        </div>

                        <div class="col-lg-6 order-2 order-lg-1 content" data-aos="fade-up" data-aos-delay="200">
                            <h3>Welcome to Techlearn Hub</h3>
                            <p class="fst-italic">
                                Our mission is to provide an inclusive and engaging learning environment that fosters creativity, innovation, and technical excellence.
                            </p>
                            <ul>
                                <li><i class="bi bi-check-circle"></i><span>Expert Instructors: Learn from industry professionals who bring real-world experience and insights into the classroom.</span></li>
                                <li><i class="bi bi-check-circle"></i><span>Hands-On Learning: Our curriculum emphasizes practical, project-based learning. </span></li>
                                <li><i class="bi bi-check-circle"></i><span>Career Support: We provide comprehensive career support, including resume building.</span></li>
                            </ul>
                            <%--<a href="#" class="read-more"><span>Read More</span><i class="bi bi-arrow-right"></i></a>--%>
                        </div>

                    </div>

                </div>

            </section>
            <!-- /About Section -->

            <!-- Counts Section -->
            <section id="counts" class="section counts light-background">

                <div class="container" data-aos="fade-up" data-aos-delay="100">

                    <div class="row gy-4">

                        <div class="col-lg-3 col-md-6">
                            <div class="stats-item text-center w-100 h-100">
                                <span data-purecounter-start="0" data-purecounter-end="1232" data-purecounter-duration="1" class="purecounter"></span>
                                <p>Students</p>
                            </div>
                        </div>
                        <!-- End Stats Item -->

                        <div class="col-lg-3 col-md-6">
                            <div class="stats-item text-center w-100 h-100">
                                <span data-purecounter-start="0" data-purecounter-end="16" data-purecounter-duration="1" class="purecounter"></span>
                                <p>Courses</p>
                            </div>
                        </div>
                        <!-- End Stats Item -->

                        <div class="col-lg-3 col-md-6">
                            <div class="stats-item text-center w-100 h-100">
                                <span data-purecounter-start="0" data-purecounter-end="42" data-purecounter-duration="1" class="purecounter"></span>
                                <p>Events</p>
                            </div>
                        </div>
                        <!-- End Stats Item -->

                        <div class="col-lg-3 col-md-6">
                            <div class="stats-item text-center w-100 h-100">
                                <span data-purecounter-start="0" data-purecounter-end="5" data-purecounter-duration="1" class="purecounter"></span>
                                <p>Trainers</p>
                            </div>
                        </div>
                        <!-- End Stats Item -->

                    </div>

                </div>

            </section>
            <!-- /Counts Section -->

            <!-- Why Us Section -->
            <section id="why-us" class="section why-us">

                <div class="container">

                    <div class="row gy-4">

                        <div class="col-lg-4" data-aos="fade-up" data-aos-delay="100">
                            <div class="why-box">
                                <h3>Why Choose Us?</h3>
                                <p>
                                    Our mission is to provide an inclusive and engaging learning environment that fosters creativity, innovation, and technical excellence. We aim to bridge the gap between theoretical knowledge and practical application, empowering our students to become proficient full stack web developers who are ready to make an impact in the tech industry.
                                </p>
                                <p>
                                    &nbsp;
                                </p>
                                <div class="text-center">
                                    <%--<a href="#" class="more-btn"><span>Learn More</span> <i class="bi bi-chevron-right"></i></a>--%>
                                </div>
                            </div>
                        </div>
                        <!-- End Why Box -->

                        <div class="col-lg-8 d-flex align-items-stretch">
                            <div class="row gy-4" data-aos="fade-up" data-aos-delay="200">

                                <div class="col-xl-4">
                                    <div class="icon-box d-flex flex-column justify-content-center align-items-center">
                                        <i class="bi bi-people"></i>
                                        <h4>Expert Instructors</h4>
                                        <p>Learn from industry professionals who bring real-world experience. Our instructors are passionate about teaching and are committed to your success.</p>
                                    </div>
                                </div>
                                <!-- End Icon Box -->

                                <div class="col-xl-4" data-aos="fade-up" data-aos-delay="300">
                                    <div class="icon-box d-flex flex-column justify-content-center align-items-center">
                                        <i class="bi bi-briefcase"></i>
                                        <h4>Career Support</h4>
                                        <p>We provide comprehensive career support, including resume building, interview preparation, and job placement assistance. &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </p>
                                        <%--<p>&nbsp;</p>--%>
                                    </div>
                                </div>
                                <!-- End Icon Box -->

                                <div class="col-xl-4" data-aos="fade-up" data-aos-delay="400">
                                    <div class="icon-box d-flex flex-column justify-content-center align-items-center">
                                        <i class="bi bi-tools"></i>
                                        <h4>Hands-On Learning</h4>
                                        <p>Our curriculum emphasizes practical, project-based learning.Our curriculum emphasizes practical, project-based learning. &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; </p>
                                    </div>
                                </div>
                                <!-- End Icon Box -->

                            </div>
                        </div>

                    </div>

                </div>

            </section>
            <!-- /Why Us Section -->

            <!-- Features Section -->
            <%--            <section id="features" class="features section">

                <div class="container">

                    <div class="row gy-4">

                        <div class="col-lg-3 col-md-4" data-aos="fade-up" data-aos-delay="100">
                            <div class="features-item">
                                <i class="bi bi-eye" style="color: #ffbb2c;"></i>
                                <h3><a href="" class="stretched-link">Lorem Ipsum</a></h3>
                            </div>
                        </div>
                        <!-- End Feature Item -->

                        <div class="col-lg-3 col-md-4" data-aos="fade-up" data-aos-delay="200">
                            <div class="features-item">
                                <i class="bi bi-infinity" style="color: #5578ff;"></i>
                                <h3><a href="" class="stretched-link">Dolor Sitema</a></h3>
                            </div>
                        </div>
                        <!-- End Feature Item -->

                        <div class="col-lg-3 col-md-4" data-aos="fade-up" data-aos-delay="300">
                            <div class="features-item">
                                <i class="bi bi-mortarboard" style="color: #e80368;"></i>
                                <h3><a href="" class="stretched-link">Sed perspiciatis</a></h3>
                            </div>
                        </div>
                        <!-- End Feature Item -->

                        <div class="col-lg-3 col-md-4" data-aos="fade-up" data-aos-delay="400">
                            <div class="features-item">
                                <i class="bi bi-nut" style="color: #e361ff;"></i>
                                <h3><a href="" class="stretched-link">Magni Dolores</a></h3>
                            </div>
                        </div>
                        <!-- End Feature Item -->

                        <div class="col-lg-3 col-md-4" data-aos="fade-up" data-aos-delay="500">
                            <div class="features-item">
                                <i class="bi bi-shuffle" style="color: #47aeff;"></i>
                                <h3><a href="" class="stretched-link">Nemo Enim</a></h3>
                            </div>
                        </div>
                        <!-- End Feature Item -->

                        <div class="col-lg-3 col-md-4" data-aos="fade-up" data-aos-delay="600">
                            <div class="features-item">
                                <i class="bi bi-star" style="color: #ffa76e;"></i>
                                <h3><a href="" class="stretched-link">Eiusmod Tempor</a></h3>
                            </div>
                        </div>
                        <!-- End Feature Item -->

                        <div class="col-lg-3 col-md-4" data-aos="fade-up" data-aos-delay="700">
                            <div class="features-item">
                                <i class="bi bi-x-diamond" style="color: #11dbcf;"></i>
                                <h3><a href="" class="stretched-link">Midela Teren</a></h3>
                            </div>
                        </div>
                        <!-- End Feature Item -->

                        <div class="col-lg-3 col-md-4" data-aos="fade-up" data-aos-delay="800">
                            <div class="features-item">
                                <i class="bi bi-camera-video" style="color: #4233ff;"></i>
                                <h3><a href="" class="stretched-link">Pira Neve</a></h3>
                            </div>
                        </div>
                        <!-- End Feature Item -->

                        <div class="col-lg-3 col-md-4" data-aos="fade-up" data-aos-delay="900">
                            <div class="features-item">
                                <i class="bi bi-command" style="color: #b2904f;"></i>
                                <h3><a href="" class="stretched-link">Dirada Pack</a></h3>
                            </div>
                        </div>
                        <!-- End Feature Item -->

                        <div class="col-lg-3 col-md-4" data-aos="fade-up" data-aos-delay="1000">
                            <div class="features-item">
                                <i class="bi bi-dribbble" style="color: #b20969;"></i>
                                <h3><a href="" class="stretched-link">Moton Ideal</a></h3>
                            </div>
                        </div>
                        <!-- End Feature Item -->

                        <div class="col-lg-3 col-md-4" data-aos="fade-up" data-aos-delay="1100">
                            <div class="features-item">
                                <i class="bi bi-activity" style="color: #ff5828;"></i>
                                <h3><a href="" class="stretched-link">Verdo Park</a></h3>
                            </div>
                        </div>
                        <!-- End Feature Item -->

                        <div class="col-lg-3 col-md-4" data-aos="fade-up" data-aos-delay="1200">
                            <div class="features-item">
                                <i class="bi bi-brightness-high" style="color: #29cc61;"></i>
                                <h3><a href="" class="stretched-link">Flavor Nivelanda</a></h3>
                            </div>
                        </div>
                        <!-- End Feature Item -->

                    </div>

                </div>

            </section>--%>
            <!-- /Features Section -->


            <section id="courses" class="courses section">

                <div class="container">

                    <div class="row">

                        <div class="col-lg-4 col-md-6 d-flex align-items-stretch" data-aos="zoom-in" data-aos-delay="100">
                            <div class="course-item">
                                <img src="assets/img/java.png" id="javaPic" class="img-fluid coursesPic" alt="..." />
                                <div class="course-content">
                                    <div class="d-flex justify-content-between align-items-center mb-3">
                                        <p class="category">Web Development</p>
                                    </div>

                                    <h3><a href="course-details.html">Java Programming</a></h3>
                                    <p class="description">Share your feedback on the Java Programming course you've completed. Your insights help us improve our teaching methods and course content.</p>
                                    <div class="d-flex justify-content-between align-items-center">
                                        <%--<button onclick="location.href='java-survey.html'" class="btn btn-primary">Go to Survey &gt;&gt;</button>--%>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- End Course Item-->

                        <div class="col-lg-4 col-md-6 d-flex align-items-stretch mt-4 mt-md-0" data-aos="zoom-in" data-aos-delay="200">
                            <div class="course-item">
                                <img src="assets/img/pythonpic.png" class="img-fluid coursesPic" alt="...">
                                <div class="course-content">
                                    <div class="d-flex justify-content-between align-items-center mb-3">
                                        <p class="category">Programming</p>
                                    </div>

                                    <h3><a href="course-details.html">Python Course</a></h3>
                                    <p class="description">Provide your feedback for the Python course you have taken. Your insights help us enhance the course content and delivery.</p>
                                    <div class="d-flex justify-content-between align-items-center">
                                        <%--<button onclick="location.href='python-survey.html'" class="btn btn-primary">Go to Survey &gt;&gt;</button>--%>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- End Course Item-->

                        <div class="col-lg-4 col-md-6 d-flex align-items-stretch mt-4 mt-md-0" data-aos="zoom-in" data-aos-delay="200">
                            <div class="course-item">
                                <img src="assets/img/css.png" id="cssPic" class="img-fluid coursesPic" alt="...">
                                <div class="course-content">
                                    <div class="d-flex justify-content-between align-items-center mb-3">
                                        <p class="category">Styling Techniques</p>
                                    </div>

                                    <h3><a href="course-details.html">Advanced CSS Techniques</a></h3>
                                    <p class="description">Provide your feedback on the Advanced CSS Techniques course. Your opinions are valuable to us and help in refining our course materials.</p>
                                    <div class="d-flex justify-content-between align-items-center">
                                        <%--<button onclick="location.href='python-survey.html'" class="btn btn-primary">Go to Survey &gt;&gt;</button>--%>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- End Course Item-->
                        <div class="col-lg-4 col-md-6 d-flex align-items-stretch mt-4 mt-md-0" data-aos="zoom-in" data-aos-delay="200">
                            <div class="course-item">
                                <img src="assets/img/js.png" class="img-fluid coursesPic" alt="...">
                                <div class="course-content">
                                    <div class="d-flex justify-content-between align-items-center mb-3">
                                        <p class="category">Web Development</p>
                                    </div>

                                    <h3><a href="course-details.html">JavaScript Fundamentals</a></h3>
                                    <p class="description">Provide your feedback on the JavaScript Fundamentals course. Your insights are crucial to us and assist in enhancing our course materials.</p>
                                    <div class="d-flex justify-content-between align-items-center">
                                        <%--<button onclick="location.href='python-survey.html'" class="btn btn-primary">Go to Survey &gt;&gt;</button>--%>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- End Course Item-->

                    </div>

                </div>

            </section>
            <!-- /Courses Section -->

            <!-- Trainers Index Section -->
            <%--            <section id="trainers-index" class="section trainers-index">

                <div class="container">

                    <div class="row">

                        <div class="col-lg-4 col-md-6 d-flex" data-aos="fade-up" data-aos-delay="100">
                            <div class="member">
                                <img src="assets/img/trainers/trainer-1.jpg" class="img-fluid" alt="">
                                <div class="member-content">
                                    <h4>Walter White</h4>
                                    <span>Web Development</span>
                                    <p>
                                        Magni qui quod omnis unde et eos fuga et exercitationem. Odio veritatis perspiciatis quaerat qui aut aut aut
                                    </p>
                                    <div class="social">
                                        <a href=""><i class="bi bi-twitter-x"></i></a>
                                        <a href=""><i class="bi bi-facebook"></i></a>
                                        <a href=""><i class="bi bi-instagram"></i></a>
                                        <a href=""><i class="bi bi-linkedin"></i></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- End Team Member -->

                        <div class="col-lg-4 col-md-6 d-flex" data-aos="fade-up" data-aos-delay="200">
                            <div class="member">
                                <img src="assets/img/trainers/trainer-2.jpg" class="img-fluid" alt="">
                                <div class="member-content">
                                    <h4>Sarah Jhinson</h4>
                                    <span>Marketing</span>
                                    <p>
                                        Repellat fugiat adipisci nemo illum nesciunt voluptas repellendus. In architecto rerum rerum temporibus
                                    </p>
                                    <div class="social">
                                        <a href=""><i class="bi bi-twitter-x"></i></a>
                                        <a href=""><i class="bi bi-facebook"></i></a>
                                        <a href=""><i class="bi bi-instagram"></i></a>
                                        <a href=""><i class="bi bi-linkedin"></i></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- End Team Member -->

                        <div class="col-lg-4 col-md-6 d-flex" data-aos="fade-up" data-aos-delay="300">
                            <div class="member">
                                <img src="assets/img/trainers/trainer-3.jpg" class="img-fluid" alt="">
                                <div class="member-content">
                                    <h4>William Anderson</h4>
                                    <span>Content</span>
                                    <p>
                                        Voluptas necessitatibus occaecati quia. Earum totam consequuntur qui porro et laborum toro des clara
                                    </p>
                                    <div class="social">
                                        <a href=""><i class="bi bi-twitter-x"></i></a>
                                        <a href=""><i class="bi bi-facebook"></i></a>
                                        <a href=""><i class="bi bi-instagram"></i></a>
                                        <a href=""><i class="bi bi-linkedin"></i></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- End Team Member -->

                    </div>

                </div>

            </section>--%>
            <!-- /Trainers Index Section -->

        </main>


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
</html>
