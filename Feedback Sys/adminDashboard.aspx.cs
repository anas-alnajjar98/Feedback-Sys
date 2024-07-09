using System;
using System.IO;
using System.Linq;
using System.Web.UI;

namespace Feedback_Sys
{
    public partial class adminDashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                UpdateUI();
            }
            double firstCalculatedValue = CalculateFirstPercentage();
            double secondCalculatedValue = CalculateSecondPercentage();
            double thirdCalculatedValue = CalculateThirdPercentage();
            double fourthCalculatedValue = CalculateFourthPercentage();


            string feedBack = Server.MapPath("~/Courses.txt");
            string[] data = File.ReadAllLines(feedBack);
            foreach (string item in data)
            {
                string[] dataArray = item.Split(',');
                if (dataArray[0] == "QR5T3" && dataArray[dataArray.Length - 1] == "true")
                {
                    pieChart1.Visible = true;
                    if (firstCalculatedValue == 55)
                    {
                        percentageLabel1.Text = "No Entries Yet";
                    }
                    else
                    {
                        percentageLabel1.Text = firstCalculatedValue.ToString("F2");
                    }
                }
                if (dataArray[0] == "YJVQL" && dataArray[dataArray.Length - 1] == "true")
                {
                    pieChart2.Visible = true;
                    if (secondCalculatedValue == 55)
                    {
                        percentageLabel2.Text = "No Entries Yet";
                    }
                    else
                    {
                        percentageLabel2.Text = secondCalculatedValue.ToString("F2");
                    }
                }
                if (dataArray[0] == "ZCL87" && dataArray[dataArray.Length - 1] == "true")
                {
                    pieChart3.Visible = true;
                    if (thirdCalculatedValue == 55)
                    {
                        percentageLabel3.Text = "No Entries Yet";
                    }
                    else
                    {
                        percentageLabel3.Text = thirdCalculatedValue.ToString("F2");
                    }
                }
                if (dataArray[0] == "HVU1M" && dataArray[dataArray.Length - 1] == "true")
                {
                    pieChart4.Visible = true;
                    if (fourthCalculatedValue == 55)
                    {
                        percentageLabel4.Text = "No Entries Yet";
                    }
                    else
                    {
                        percentageLabel4.Text = fourthCalculatedValue.ToString("F2");
                    }
                }
            }

        }
        private void UpdateUI()
        {
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
        private double CalculateFirstPercentage()
        {
            string feedBack = Server.MapPath("~/FeedbackSubmissions.txt");
            string[] data = File.ReadAllLines(feedBack);
            double totalPercentage = 0;
            int count = 0;

            foreach (string item in data)
            {
                string[] dataArray = item.Split(',');
                if (dataArray[1] == "QR5T3")
                {
                    int[] ratings = new int[10];
                    for (int i = 2; i < 12; i++)
                    {
                        int.TryParse(dataArray[i], out ratings[i - 2]);
                    }

                    double sum = ratings.Sum();
                    double percentage = (sum / (ratings.Length * 3)) * 100;
                    totalPercentage += percentage;
                    count++;
                }
            }

            return count > 0 ? totalPercentage / count : 55;
        }


        private double CalculateSecondPercentage()
        {
            string feedBack = Server.MapPath("~/FeedbackSubmissions.txt");
            string[] data = File.ReadAllLines(feedBack);
            double totalPercentage = 0;
            int count = 0;

            foreach (string item in data)
            {
                string[] dataArray = item.Split(',');
                if (dataArray[1] == "YJVQL")
                {
                    int[] ratings = new int[10];
                    for (int i = 2; i < 12; i++)
                    {
                        int.TryParse(dataArray[i], out ratings[i - 2]);
                    }

                    double sum = ratings.Sum();
                    double percentage = (sum / (ratings.Length * 3)) * 100;
                    totalPercentage += percentage;
                    count++;
                }
            }

            return count > 0 ? totalPercentage / count : 55;
        }

        private double CalculateThirdPercentage()
        {
            string feedBack = Server.MapPath("~/FeedbackSubmissions.txt");
            string[] data = File.ReadAllLines(feedBack);
            double totalPercentage = 0;
            int count = 0;

            foreach (string item in data)
            {
                string[] dataArray = item.Split(',');
                if (dataArray[1] == "ZCL87")
                {
                    int[] ratings = new int[10];
                    for (int i = 2; i < 12; i++)
                    {
                        int.TryParse(dataArray[i], out ratings[i - 2]);
                    }

                    double sum = ratings.Sum();
                    double percentage = (sum / (ratings.Length * 3)) * 100;
                    totalPercentage += percentage;
                    count++;
                }
            }

            return count > 0 ? totalPercentage / count : 55;
        }

        private double CalculateFourthPercentage()
        {
            string feedBack = Server.MapPath("~/FeedbackSubmissions.txt");
            string[] data = File.ReadAllLines(feedBack);
            double totalPercentage = 0;
            int count = 0;

            foreach (string item in data)
            {
                string[] dataArray = item.Split(',');
                if (dataArray[1] == "HVU1M")
                {
                    int[] ratings = new int[10];
                    for (int i = 2; i < 12; i++)
                    {
                        int.TryParse(dataArray[i], out ratings[i - 2]);
                    }

                    double sum = ratings.Sum();
                    double percentage = (sum / (ratings.Length * 3)) * 100;
                    totalPercentage += percentage;
                    count++;
                }
            }

            return count > 0 ? totalPercentage / count : 55;
        }
    }
}
