using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Net;
using System.IO;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Feedback_Sys
{
    public partial class Contact : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            UpdateUI();
        }
        private void UpdateUI() {
            string logedUser = Server.MapPath("~/Session.txt");
            string[] session = File.ReadAllLines(logedUser);
            foreach (string x in session)
            {
                string[] sessionArray = x.Split(',');

                if (sessionArray[0] == "true")
                {
                    logInLink.Text = "Logout";
                    logInLink.NavigateUrl = "Logout.aspx"; /////need to clear session and redirect to home
                    welcome.Visible = true;
                    welcome.Text = $"Welcome {sessionArray[3]}";
                    if (sessionArray[1] == "true")
                    {
                        adminDashLink1.Visible = true;
                        adminDashLink1.NavigateUrl = "adminDashboard.aspx";
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
        protected void submit_feedback(object sender, EventArgs e) {

            try
            {
                string fromEmail = email.Text.Trim();
                string fromName = name.Text.Trim();
                string subjectText = subject.Text.Trim();
                string messageText = message.Text.Trim();

                string toEmail = "techlearnhub.contact@gmail.com";
                string smtpServer = "smtp.gmail.com";
                int smtpPort = 587;

                string smtpUsername = "techlearnhub.contact@gmail.com";
                string smtpPassword = "lyrlogeztsxclank";

                using (MailMessage mailMessage = new MailMessage())
                {
                    mailMessage.From = new MailAddress(fromEmail, fromName);
                    mailMessage.To.Add(toEmail);
                    mailMessage.Subject = subjectText;
                    mailMessage.Body = messageText;
                    mailMessage.IsBodyHtml = false;

                    using (SmtpClient smtpClient = new SmtpClient(smtpServer, smtpPort))
                    {
                        smtpClient.UseDefaultCredentials = false;
                        smtpClient.Credentials = new NetworkCredential(smtpUsername, smtpPassword);
                        smtpClient.EnableSsl = true;

                        smtpClient.Send(mailMessage);
                    }


                    name.Text = "";
                    email.Text = "";
                    subject.Text = "";
                    message.Text = "";
                    sentMessage.Text = "Your message has been sent successfully.";
                    sentMessage.Visible = true;
                    errorMessage.Visible = false;

                }
            }
            catch (Exception ex)
            {
                errorMessage.Text = "An error occurred while sending your message. Please try again later.";
                errorMessage.Visible = true;
                sentMessage.Visible = false;
                Console.WriteLine("Exception message: " + ex.Message);
            }

        }



    }
}