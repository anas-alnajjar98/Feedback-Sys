<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Survey.aspx.cs" Inherits="Feedback_Sys.Survey" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <meta charset="utf-8" />
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />
    <title>Survey</title>

    <!-- Favicons -->
    <link href="assets/img/favicon.png" rel="icon" />
    <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon" />

    <!-- Fonts -->
    <link href="https://fonts.googleapis.com" rel="preconnect" />
    <link href="https://fonts.gstatic.com" rel="preconnect" />
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;0,800;1,300;1,400;1,500;1,600;1,700;1,800&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900&family=Raleway:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900&display=swap" rel="stylesheet" />

    <!-- Vendor CSS Files -->
    <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet" />
    <link href="assets/vendor/aos/aos.css" rel="stylesheet" />
    <link href="assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet" />
    <link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet" />

    <!-- Main CSS File -->
    <link href="assets/css/main.css" rel="stylesheet" />
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous" />
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" />
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <script type="text/javascript">
        function showThankYouModal() {
            $('#thankYouModal').modal('show');
        }
    </script>


    <style>
        .btn-primary {
            background-color: #19517e;
            border: none;
            height: 40px;
            font-size: 16px;
            width: auto;
        }

        .survey-form-container {
            background: #fff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

            .survey-form-container h2 {
                font-weight: 700;
                margin-bottom: 20px;
            }

            .survey-form-container .form-group label {
                font-weight: 600;
            }

            .survey-form-container .form-control {
                border-radius: 5px;
                font-size: 14px;
            }

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

        .py-3.my-4 {
            background-color: #f9f9f9;
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
            border: 1px solid rgba(68, 68, 68, 0.5); /* rgba for transparent color*/
            font-size: 16px;
            color: rgba(68, 68, 68, 0.3); /* rgba for transparent color */
            margin-right: 10px;
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

        select.form-control {
            appearance: none;
            -webkit-appearance: none;
            -moz-appearance: none;
            background: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" width="10" height="10" viewBox="0 0 24 24"><path fill="none" stroke="currentColor" stroke-width="2" d="M6 9l6 6 6-6"/></svg>') no-repeat right 0.75rem center/8px 10px;
            background-color: #f9f9f9;
            padding-right: 1.5rem;
            border: 1px solid #ced4da;
            border-radius: 0.25rem;
            height: calc(2.25rem + 2px);
        }

        #ClosePopUp {
            background-color: #5fcf80;
            border: none;
        }

        .lab {
            margin-top: 5px;
        }

        .CloseBtn {
            background-color: #5fcf80;
            border: none;
        }

        @media (max-width: 1000px) {
            span#welcome {
                display: none;
            }
        }
    </style>
    </head>

    <body class="courses-page">
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
                            <asp:HyperLink ID="teamLink1" runat="server" NavigateUrl="team.aspx" Text="Trainers" /></li>


                        <li>
                            <asp:HyperLink ID="contactLink1" runat="server" NavigateUrl="contact.aspx" Text="Contact" /></li>
                    </ul>
                    <i class="mobile-nav-toggle d-xl-none bi bi-list"></i>
                </nav>
                <asp:HyperLink ID="logInLink" runat="server" class="btn-getstarted" NavigateUrl="Login.aspx">Login</asp:HyperLink>

            </div>
        </header>

        <form runat="server">
            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
            <main class="main">
                <div class="container mt-5">
                    <div class="survey-form-container">
                        <h2 class="text-center mb-4">Survey Form</h2>
                        <asp:Label ID="ErrorMessage" runat="server" ForeColor="Red" Visible="false"></asp:Label>
                        <!-- Question 1 -->
                        <div class="form-group">
                            <asp:Label ID="Question1" runat="server" Text=""></asp:Label>
                            <asp:DropDownList ID="DropDownList1" class="form-control lab" runat="server" SelectedText="select">
                                <asp:ListItem disabled Selected style="display: none">select</asp:ListItem>
                                <asp:ListItem Value="Excellent">Excellent</asp:ListItem>
                                <asp:ListItem Value="Very Good">Very Good</asp:ListItem>
                                <asp:ListItem Value="Good">Good</asp:ListItem>
                                <asp:ListItem Value="Poor">Poor</asp:ListItem>
                            </asp:DropDownList>
                        </div>

                        <!-- Question 2 -->
                        <div class="form-group">
                            <asp:Label ID="Question2" runat="server" Text=""></asp:Label>
                            <asp:DropDownList ID="DropDownList2" class="form-control lab" runat="server" SelectedText="select">
                                <asp:ListItem disabled Selected style="display: none">select</asp:ListItem>
                                <asp:ListItem Value="Excellent">Excellent</asp:ListItem>
                                <asp:ListItem Value="Very Good">Very Good</asp:ListItem>
                                <asp:ListItem Value="Good">Good</asp:ListItem>
                                <asp:ListItem Value="Poor">Poor</asp:ListItem>
                            </asp:DropDownList>
                        </div>

                        <!-- Question 3 -->
                        <div class="form-group">
                            <asp:Label ID="Question3" runat="server" Text=""></asp:Label>
                            <asp:DropDownList ID="DropDownList3" class="form-control lab" runat="server" SelectedText="select">
                                <asp:ListItem disabled Selected style="display: none">select</asp:ListItem>
                                <asp:ListItem Value="Excellent">Excellent</asp:ListItem>
                                <asp:ListItem Value="Very Good">Very Good</asp:ListItem>
                                <asp:ListItem Value="Good">Good</asp:ListItem>
                                <asp:ListItem Value="Poor">Poor</asp:ListItem>
                            </asp:DropDownList>
                        </div>

                        <!-- Question 4 -->
                        <div class="form-group">
                            <asp:Label ID="Question4" runat="server" Text=""></asp:Label>
                            <asp:DropDownList ID="DropDownList4" class="form-control lab" runat="server" SelectedText="select">
                                <asp:ListItem disabled Selected style="display: none">select</asp:ListItem>
                                <asp:ListItem Value="Excellent">Excellent</asp:ListItem>
                                <asp:ListItem Value="Very Good">Very Good</asp:ListItem>
                                <asp:ListItem Value="Good">Good</asp:ListItem>
                                <asp:ListItem Value="Poor">Poor</asp:ListItem>
                            </asp:DropDownList>
                        </div>

                        <!-- Question 5 -->
                        <div class="form-group">
                            <asp:Label lass="lab" ID="Question5" runat="server" Text=""></asp:Label>
                            <asp:DropDownList ID="DropDownList5" class="form-control lab" runat="server" SelectedText="select">
                                <asp:ListItem disabled Selected style="display: none">select</asp:ListItem>
                                <asp:ListItem Value="Excellent">Excellent</asp:ListItem>
                                <asp:ListItem Value="Very Good">Very Good</asp:ListItem>
                                <asp:ListItem Value="Good">Good</asp:ListItem>
                                <asp:ListItem Value="Poor">Poor</asp:ListItem>
                            </asp:DropDownList>
                        </div>

                        <!-- Question 6 -->
                        <div class="form-group">
                            <asp:Label Class="lab" ID="Question6" runat="server" Text=""></asp:Label>
                            <asp:DropDownList ID="DropDownList6" class="form-control lab" runat="server" SelectedText="select">
                                <asp:ListItem disabled Selected style="display: none">select</asp:ListItem>
                                <asp:ListItem Value="Excellent">Excellent</asp:ListItem>
                                <asp:ListItem Value="Very Good">Very Good</asp:ListItem>
                                <asp:ListItem Value="Good">Good</asp:ListItem>
                                <asp:ListItem Value="Poor">Poor</asp:ListItem>
                            </asp:DropDownList>
                        </div>

                        <!-- Question 7 -->
                        <div class="form-group">
                            <asp:Label Class="lab" ID="Question7" runat="server" Text=""></asp:Label>
                            <asp:DropDownList ID="DropDownList7" class="form-control lab" runat="server" SelectedText="select">
                                <asp:ListItem disabled Selected style="display: none">select</asp:ListItem>
                                <asp:ListItem Value="Excellent">Excellent</asp:ListItem>
                                <asp:ListItem Value="Very Good">Very Good</asp:ListItem>
                                <asp:ListItem Value="Good">Good</asp:ListItem>
                                <asp:ListItem Value="Poor">Poor</asp:ListItem>
                            </asp:DropDownList>
                        </div>

                        <!-- Question 8 -->
                        <div class="form-group">
                            <asp:Label Class="lab" ID="Question8" runat="server" Text=""></asp:Label>
                            <asp:DropDownList ID="DropDownList8" class="form-control lab" runat="server" SelectedText="select">
                                <asp:ListItem disabled Selected style="display: none">select</asp:ListItem>
                                <asp:ListItem Value="Excellent">Excellent</asp:ListItem>
                                <asp:ListItem Value="Very Good">Very Good</asp:ListItem>
                                <asp:ListItem Value="Good">Good</asp:ListItem>
                                <asp:ListItem Value="Poor">Poor</asp:ListItem>
                            </asp:DropDownList>
                        </div>

                        <!-- Question 9 -->
                        <div class="form-group">
                            <asp:Label Class="lab" ID="Question9" runat="server" Text=""></asp:Label>
                            <asp:DropDownList ID="DropDownList9" class="form-control lab" runat="server" SelectedText="select">
                                <asp:ListItem disabled Selected style="display: none">select</asp:ListItem>
                                <asp:ListItem Value="Excellent">Excellent</asp:ListItem>
                                <asp:ListItem Value="Very Good">Very Good</asp:ListItem>
                                <asp:ListItem Value="Good">Good</asp:ListItem>
                                <asp:ListItem Value="Poor">Poor</asp:ListItem>
                            </asp:DropDownList>
                        </div>

                        <!-- Question 10 -->
                        <div class="form-group">
                            <asp:Label Class="lab" ID="Question10" runat="server" Text=""></asp:Label>
                            <asp:DropDownList ID="DropDownList10" class="form-control lab" runat="server" SelectedText="select">
                                <asp:ListItem disabled Selected style="display: none">select</asp:ListItem>
                                <asp:ListItem Value="Excellent">Excellent</asp:ListItem>
                                <asp:ListItem Value="Very Good">Very Good</asp:ListItem>
                                <asp:ListItem Value="Good">Good</asp:ListItem>
                                <asp:ListItem Value="Poor">Poor</asp:ListItem>
                            </asp:DropDownList>
                        </div>

                        <!-- Submit Button -->
                        <asp:Button ID="SubmitBtn" runat="server" Text="Submit" OnClick="SubmitBtn_Click" CssClass="btn btn-primary" />
                    </div>
                </div>
            </main>

            <!-- Modal -->
            <div class="modal fade" id="thankYouModal" tabindex="-1" role="dialog" aria-labelledby="thankYouModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="thankYouModalLabel">Thank You!</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            Your feedback has been submitted.
               
                        </div>
                        <div class="modal-footer">
                            <asp:Button class="btn btn-secondary CloseBtn" ID="Button1" OnClick="ClosePopUp_Click" runat="server" Text="Close" />
                        </div>
                    </div>
                </div>
            </div>
        </form>
        <div class="color">
            <div class="container">
                <footer class="py-3 my-4">
                    <a href="index.html" class="footerLogo">
                        <h1 class="sitename">TECHLEARN HUB</h1>
                    </a>
                    <div class="social-links mt-4">
                        <a href="#"><i class="bi bi-twitter"></i></a>
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

        <!-- Vendor JS Files -->
        <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="assets/vendor/php-email-form/validate.js"></script>
        <script src="assets/vendor/aos/aos.js"></script>
        <script src="assets/vendor/glightbox/js/glightbox.min.js"></script>
        <script src="assets/vendor/purecounter/purecounter_vanilla.js"></script>
        <script src="assets/vendor/swiper/swiper-bundle.min.js"></script>

        <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha384-ZvpUoO/+PdoLioF6Y6lJ3GeD4ylrzeh6avkG4TBZpMEV0kYr2L/LmrYFqkCZxTFA" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js" integrity="sha384-QytV76Xk1rKuwKohZwOB5d+TyN3xlcC+rxpJ8U0w1yYgAo7+E/6LOubHea4mt/5t" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-pzjw8f+ua7Kw1TIqXcJH0ta+Wj9rgybwhPzMZPrYf7xvGa1wj8bB8c/5DH5zP2y0" crossorigin="anonymous"></script>

        <script type="text/javascript">
            function showThankYouModal() {
                $('#thankYouModal').modal('show');
            }
        </script>


        <!-- Main JS File -->
        <script src="assets/js/main.js"></script>
        <script type="text/javascript">
            function showThankYouModal() {
                $('#thankYouModal').modal('show');
            }
        </script>

    </body>
</html>

