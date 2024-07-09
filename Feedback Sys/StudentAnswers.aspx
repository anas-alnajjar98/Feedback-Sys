<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StudentAnswers.aspx.cs" Inherits="Feedback_Sys.StudentAnswers" %>

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
    <link href="https://fonts.googleapis.com" rel="preconnect" />
    <link href="https://fonts.gstatic.com" rel="preconnect" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;0,800;1,300;1,400;1,500;1,600;1,700;1,800&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Raleway:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">

    <!-- Vendor CSS Files -->
    <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
    <link href="assets/vendor/aos/aos.css" rel="stylesheet">
    <link href="assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
    <link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

    <!-- Main CSS File -->
    <link href="assets/css/main.css" rel="stylesheet"/>
    <link href="assets/css/StudentAnswers.css" rel="stylesheet" />

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
            color: #5fcf80;
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
            color: rgba(68, 68, 68, 0.3); /* rgba for transparent color */
            margin-right: 10px;
            transition: 0.3s;
        }

            .social-links a:hover {
                color: #5fcf80; /* rgba for transparent color */
                border: 1px solid #5fcf80; /* rgba for transparent color */
            }

        .social-links.mt-4 {
            display: flex;
            justify-content: center;
        }

        h1.sitename {
            color: #5fcf80;
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
        #Button2 , #Button1:hover  {
    background-color:#388da8;
    color: #f9f9f9 ;
    border: 1px solid #388da8;
    padding: 8px 16px;
    border-radius: 5px;
    transition: background-color 0.3s, border-color 0.3s, color 0.3s;
}

    #Button2:hover ,#Button1 {
        background-color: #e5e5e5;
        border-color: #9bcede;
        color: #388da8;
    }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div style="background-color: #9bcede">
                <center>
                    <asp:Label ID="Label1" runat="server"></asp:Label><br />
                    <br />

                    <asp:Label ID="StudentIDLabel" runat="server" Text="Student ID : "></asp:Label>
                    <asp:Label ID="StudentID" runat="server"></asp:Label>
                    &nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="CourseIDLabel" runat="server" Text="Course : "></asp:Label>
                    &nbsp;<asp:Label ID="CourseID" runat="server"></asp:Label>
                    &nbsp;&nbsp;&nbsp;&nbsp; Student Email:&nbsp; 
                    <asp:HyperLink ID="emailLink" runat="server" Text="Send Email" ToolTip="Click here to send email"></asp:HyperLink>


                </center>
                <br />
                <br />
            </div>
            <%--QUESTION 1--%>
            <br />
            <asp:Label ID="Q1" runat="server" Text="Q1"></asp:Label>
            <br />
            <br />
            <asp:Label ID="A1" runat="server" Text="A1"></asp:Label>
            <br />
            <br />
            <br />
            <%--QUESTION 2--%>

            <asp:Label ID="Q2" runat="server" Text="Q2"></asp:Label>
            <br />
            <br />
            <asp:Label ID="A2" runat="server" Text="A2"></asp:Label>
            <br />
            <br />
            <br />
            <%--QUESTION 3--%>

            <asp:Label ID="Q3" runat="server" Text="Q3"></asp:Label>
            <br />
            <br />
            <asp:Label ID="A3" runat="server" Text="A3"></asp:Label>
            <br />
            <br />
            <br />
            <%--QUESTION 4--%>

            <asp:Label ID="Q4" runat="server" Text="Q4"></asp:Label>
            <br />
            <br />
            <asp:Label ID="A4" runat="server" Text="A4"></asp:Label>
            <br />
            <br />
            <br />
            <%--QUESTION 5--%>

            <asp:Label ID="Q5" runat="server" Text="Q5"></asp:Label>
            <br />
            <br />
            <asp:Label ID="A5" runat="server" Text="A5"></asp:Label>
            <br />
            <br />
            <br />
            <%--QUESTION 6--%>

            <asp:Label ID="Q6" runat="server" Text="Q6"></asp:Label>
            <br />
            <br />
            <asp:Label ID="A6" runat="server" Text="A6"></asp:Label>
            <br />
            <br />
            <br />
            <%--QUESTION 7--%>

            <asp:Label ID="Q7" runat="server" Text="Q7"></asp:Label>
            <br />
            <br />
            <asp:Label ID="A7" runat="server" Text="A7"></asp:Label>
            <br />
            <br />
            <br />
            <%--QUESTION 8--%>

            <asp:Label ID="Q8" runat="server" Text="Q8"></asp:Label>
            <br />
            <br />
            <asp:Label ID="A8" runat="server" Text="A8"></asp:Label>
            <br />
            <br />
            <br />
            <%--QUESTION 9--%>

            <asp:Label ID="Q9" runat="server" Text="Q9"></asp:Label>
            <br />
            <br />
            <asp:Label ID="A9" runat="server" Text="A9"></asp:Label>
            <br />
            <br />
            <br />
            <%--QUESTION 10--%>

            <asp:Label ID="Q10" runat="server" Text="Q10"></asp:Label>
            <br />
            <br />
            <asp:Label ID="A10" runat="server" Text="A10"></asp:Label>
            <br />
            <br />
            <center>
                <asp:Button ID="Button1" runat="server" Text="Back to the results" OnClick="Button1_Click" />
                <asp:Button ID="Button2" runat="server" Text="Download CSV" OnClick="DownloadCSV" /></center>

        </div>
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
