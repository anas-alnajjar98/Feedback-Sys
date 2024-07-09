<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Feedback_Sys.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
      <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
  <title>Courses - Mentor Bootstrap Template</title>
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
            border: 1px solid rgba(68, 68, 68, 0.5);
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
            color: #388da8 !important;
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

        .btn-g {
            color: var(--contrast-color);
            background: var(--accent-color);
            font-size: 14px;
            padding: 8px 25px;
            margin: 0 0 0 30px;
            border-radius: 50px;
            transition: 0.3s;
            border-style: none;
        }

        span.h1.fw-bold.mb-0 {
            color: #388da8;
            text-align: center;
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
                            <asp:HyperLink ID="adminDashLink1" runat="server" NavigateUrl="adminDash.aspx" Text="Admin Dashboard" Visible="false" /></li>
                        <li>
                            <asp:HyperLink ID="teamLink1" runat="server" NavigateUrl="team.aspx" Text="Trainers" /></li>


                        <li>
                            <asp:HyperLink ID="contactLink1" runat="server" NavigateUrl="contact.aspx" Text="Contact" /></li>
                    </ul>
                    <i class="mobile-nav-toggle d-xl-none bi bi-list"></i>
                </nav>
                <asp:HyperLink ID="logInLink" runat="server" class="btn-getstarted" NavigateUrl="Login.aspx">Login</asp:HyperLink>

            </div>
        </header>

  <main class="main">

    <section  style="background-color: #f5f5f5;"">
      <div class="container py-5 h-100">
        <div class="row d-flex justify-content-center align-items-center h-100">
          <div class="col col-xl-10">
            <div class="card" style="border-radius: 1rem;">
              <div class="row g-0">
                <div class="col-md-6 col-lg-5 d-none d-md-block">
                  <img src="assets/img/login.jpeg"
                    alt="login form" class="img-fluid" style="border-radius: 1rem 0 0 1rem;" />
                </div>
                <div class="col-md-6 col-lg-7 d-flex align-items-center">
                  <div class="card-body p-4 p-lg-5 text-black">
    
                    <%--<form>--%>
    
                      <div class="d-flex align-items-center mb-3 pb-1">
                        <i class="fas fa-cubes fa-2x me-3" style="color: #ff6219;"></i>
                        <span class="h1 fw-bold mb-0">TECHLEARN HUB</span>
                      </div>
    
                      <h5 class="fw-normal mb-3 pb-3" style="letter-spacing: 1px;">Sign into your account</h5>
    
                      <div data-mdb-input-init class="form-outline mb-4">
                        <%--<input type="email" id="form2Example17" class="form-control form-control-lg" />--%>
                           <label class="form-label" for="email">Email address</label>
                          <asp:TextBox ID="email" runat="server" class="form-control form-control-lg" OnTextChanged="Regex_input" AutoPostBack="true" ></asp:TextBox><br />
                       <br />
                        <%--<label class="form-label" for="form2Example17" >Please enter a valid email.</label>--%>
                          <asp:Label ID="emailRegex" runat="server" Text="Please enter a valid email." Visible="false"></asp:Label>
                      </div>
    
                      <div data-mdb-input-init class="form-outline mb-4">
                        <%--<input type="password" id="form2Example27" class="form-control form-control-lg" />--%>
                           <label class="form-label" for="form2Example27">Student ID</label>
                          <asp:TextBox ID="id" runat="server" class="form-control form-control-lg"></asp:TextBox><br />
                       
                      </div>
    
                      <div class="pt-1 mb-4">
                        <%--<button data-mdb-button-init data-mdb-ripple-init class="btn btn-dark btn-lg btn-block" type="button">Login</button>--%>
                          <asp:Button ID="Button1" runat="server" Text="Login" class="btn-g" OnClick="Button1_Click"/>
                      </div>
    
                        <asp:Label ID="Label1" runat="server" Text="The email or Student ID is wrong!" Visible="false"></asp:Label>
                    <%--</form>--%>
    
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>


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
                       <li class="nav-item"><a href="#" class="nav-link px-2 text-body-secondary">Features</a></li>
                       <li class="nav-item"><a href="#" class="nav-link px-2 text-body-secondary">Pricing</a></li>
                       <li class="nav-item"><a href="#" class="nav-link px-2 text-body-secondary">FAQs</a></li>
                       <li class="nav-item"><a href="#" class="nav-link px-2 text-body-secondary">About</a></li>
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
