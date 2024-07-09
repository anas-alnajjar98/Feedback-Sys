using System;
using System.IO;
using System.Text.RegularExpressions;
using System.Web.UI;

namespace Feedback_Sys
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                UpdateUI();
            }
        }

        private void UpdateUI()
        {
            string sessionFilePath = Server.MapPath("~/Session.txt");
            if (File.Exists(sessionFilePath))
            {
                string[] session = File.ReadAllLines(sessionFilePath);
                foreach (string x in session)
                {
                    string[] sessionArray = x.Split(',');

                    if (sessionArray[0] == "true")
                    {
                        logInLink.Text = "Logout";
                        logInLink.NavigateUrl = "Logout.aspx"; // Redirect to logout page
                        welcome.Visible = true;
                        welcome.Text = $"Welcome {sessionArray[3]}";
                        if (sessionArray[1] == "true")
                        {
                            adminDashLink1.Visible = true;
                        }
                        else if (sessionArray[1] == "false")
                        {
                            coursesLink1.Visible = true;
                        }
                    }
                    else
                    {
                        logInLink.Text = "Login";
                        welcome.Visible = false;
                        adminDashLink1.Visible = false;
                        coursesLink1.Visible = false;
                    }
                }
            }
            else
            {
                logInLink.Text = "Login";
                welcome.Visible = false;
                adminDashLink1.Visible = false;
                coursesLink1.Visible = false;
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string Email = email.Text;
            string Id = id.Text;
            bool isAuthenticated = AuthenticateUser(Email, Id);

            if (isAuthenticated)
            {
                string sessionFilePath = Server.MapPath("~/Session.txt");
                string[] session = File.ReadAllLines(sessionFilePath);
                foreach (string line in session)
                {
                    string[] sessionArray = line.Split(',');
                    if (sessionArray[1] == "true")
                    {
                        Response.Redirect("adminDashboard.aspx"); // Redirect to admin dashboard if user is admin
                    }
                    else
                    {
                        Response.Redirect("Feedback.aspx"); // Redirect to courses page if user is a student
                    }
                }
            }
            else
            {
                email.Text = "";
                id.Text = "";
                Label1.Visible = true;
            }
        }

        protected bool AuthenticateUser(string email, string id)
        {
            string sessionFilePath = Server.MapPath("~/Session.txt");
            string[] session = File.ReadAllLines(sessionFilePath);

            string studentFilePath = Server.MapPath("~/Students.txt");
            string[] students = File.ReadAllLines(studentFilePath);

            string adminFilePath = Server.MapPath("~/Admin.txt");
            string[] admins = File.ReadAllLines(adminFilePath);

            foreach (string line in admins)
            {
                string[] adminLogin = line.Split(',');
                string adminId = adminLogin[0];
                string adminEmail = adminLogin[1];
                if (adminId == id && adminEmail == email)
                {
                    UpdateSession(sessionFilePath, "true,true", id, "Admin", email);
                    return true;
                }
            }

            foreach (string line in students)
            {
                string[] studentLogin = line.Split(',');
                string studentId = studentLogin[3];
                string ID = studentLogin[0];
                string studentEmail = studentLogin[2];

                if (email == studentEmail && id == studentId)
                {
                    UpdateSession(sessionFilePath, "true,false", ID, studentLogin[1], email);
                    return true;
                }
            }

            return false;
        }

        private void UpdateSession(string sessionFilePath, string status, string id, string name, string email)
        {
            string[] sessionArray = { status.Split(',')[0], status.Split(',')[1], id, name, email };
            string sessionString = string.Join(",", sessionArray);
            File.WriteAllText(sessionFilePath, sessionString);
        }

        protected void Regex_input(object sender, EventArgs e)
        {
            string Email = email.Text;
            string pattern = @"^[^@\s]+@[^@\s]+\.[^@\s]+$";
            Regex regex = new Regex(pattern);
            emailRegex.Visible = !regex.IsMatch(Email);
        }
    }
}
