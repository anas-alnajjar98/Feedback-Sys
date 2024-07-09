using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Feedback_Sys
{
    public partial class Survey : System.Web.UI.Page
    {
        string currentCourseID = null;

        

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                UpdateUI();
            }
            string currentCourseFile = Server.MapPath("~/CurrentCourse.txt");

            if (File.Exists(currentCourseFile))
            {
                currentCourseID = Request.Params["course"];
            }

            string coursesQuestionsFile = Server.MapPath("~/CourseraServices.txt");
            if (File.Exists(coursesQuestionsFile))
            {
                string[] coursesQuestionsArr = File.ReadAllLines(coursesQuestionsFile);
                string currentCourseLine = coursesQuestionsArr.FirstOrDefault(line => line.Trim().StartsWith(currentCourseID));

                if (currentCourseLine != null)
                {
                    string[] CourseQuestions = currentCourseLine.Split(',');
                    if (CourseQuestions.Length >= 11)
                    {
                        Question1.Text = CourseQuestions[1].Trim();
                        Question2.Text = CourseQuestions[2].Trim();
                        Question3.Text = CourseQuestions[3].Trim();
                        Question4.Text = CourseQuestions[4].Trim();
                        Question5.Text = CourseQuestions[5].Trim();
                        Question6.Text = CourseQuestions[6].Trim();
                        Question7.Text = CourseQuestions[7].Trim();
                        Question8.Text = CourseQuestions[8].Trim();
                        Question9.Text = CourseQuestions[9].Trim();
                        Question10.Text = CourseQuestions[10].Trim();
                    }
                }
            }
        }

        protected void SubmitBtn_Click(object sender, EventArgs e)
        {
            if (Page.IsValid && ValidateForm())
            {
                string surveyAnswersFile = Server.MapPath("~/FeedbackSubmissions.txt");
                if (!File.Exists(surveyAnswersFile))
                {
                    using (StreamWriter writeInside = File.CreateText(surveyAnswersFile))
                    {
                        writeInside.WriteLine("");
                    }
                }

                int[] QuestionsAnswersArr = new int[10];
                QuestionsAnswersArr[0] = ConvertOptToInt(DropDownList1.SelectedValue);
                QuestionsAnswersArr[1] = ConvertOptToInt(DropDownList2.SelectedValue);
                QuestionsAnswersArr[2] = ConvertOptToInt(DropDownList3.SelectedValue);
                QuestionsAnswersArr[3] = ConvertOptToInt(DropDownList4.SelectedValue);
                QuestionsAnswersArr[4] = ConvertOptToInt(DropDownList5.SelectedValue);
                QuestionsAnswersArr[5] = ConvertOptToInt(DropDownList6.SelectedValue);
                QuestionsAnswersArr[6] = ConvertOptToInt(DropDownList7.SelectedValue);
                QuestionsAnswersArr[7] = ConvertOptToInt(DropDownList8.SelectedValue);
                QuestionsAnswersArr[8] = ConvertOptToInt(DropDownList9.SelectedValue);
                QuestionsAnswersArr[9] = ConvertOptToInt(DropDownList10.SelectedValue);

                string[] dataArr = new string[12];
                string sessionFile = Server.MapPath("~/Session.txt");
                if (File.Exists(sessionFile))
                {
                    string[] sessionFileLine = File.ReadAllLines(sessionFile);
                    string[] sessionFileArr = sessionFileLine[0].Split(',');
                    int sessionStuID = Convert.ToInt32(sessionFileArr[2]);
                    dataArr[0] = sessionStuID.ToString();
                }

                dataArr[1] = currentCourseID;
                for (int i = 0; i < QuestionsAnswersArr.Length; i++)
                {
                    dataArr[i + 2] = QuestionsAnswersArr[i].ToString();
                }

                string data = string.Join(",", dataArr);

                using (StreamWriter writeInside = File.AppendText(surveyAnswersFile))
                {
                    writeInside.WriteLine(data);
                }

                // Update Students.txt to mark the course as completed (true)
                string studentsFile = Server.MapPath("~/Students.txt");
                if (File.Exists(studentsFile))
                {
                    string[] studentsArr = File.ReadAllLines(studentsFile);
                    for (int i = 0; i < studentsArr.Length; i++)
                    {
                        if (studentsArr[i].StartsWith(dataArr[0])) // Find the student by ID
                        {
                            string[] studentInfo = studentsArr[i].Split(',');
                            for (int j = 1; j < studentInfo.Length; j++) // Check courses section
                            {
                                string searchSubstring = $"{currentCourseID}-false";

                                if (studentInfo[j].Contains(searchSubstring))
                                {
                                    studentInfo[j] = studentInfo[j].Replace(currentCourseID + "-false", currentCourseID + "-true"); // Mark course as completed
                                    studentsArr[i] = string.Join(",", studentInfo);
                                    break;
                                }
                            }
                            break;
                        }
                    }
                    File.WriteAllLines(studentsFile, studentsArr); // Write updated data back to file
                }

                ResetForm();
                ScriptManager.RegisterStartupScript(this, this.GetType(), "ShowModal", "showThankYouModal();", true);
            }
        }
        private bool ValidateForm()
        {
            if (DropDownList1.SelectedValue == "select" || DropDownList2.SelectedValue == "select" ||
                DropDownList3.SelectedValue == "select" || DropDownList4.SelectedValue == "select" ||
                DropDownList5.SelectedValue == "select" || DropDownList6.SelectedValue == "select" ||
                DropDownList7.SelectedValue == "select" || DropDownList8.SelectedValue == "select" ||
                DropDownList9.SelectedValue == "select" || DropDownList10.SelectedValue == "select")
            {
                ErrorMessage.Visible = true;
                ErrorMessage.Text = "Please answer all questions before submitting.";
                return false;
            }
            else
            {
                ErrorMessage.Visible = false;
                return true;
            }
        }
        private int ConvertOptToInt(string answer)
        {
            switch (answer)
            {
                case "Excellent":
                    return 3;
                case "Very Good":
                    return 2;
                case "Good":
                    return 1;
                case "Poor":
                    return 0;
                default:
                    return -1;
            }
        }

        private void ResetForm()
        {
            DropDownList1.SelectedIndex = -1;
            DropDownList2.SelectedIndex = -1;
            DropDownList3.SelectedIndex = -1;
            DropDownList4.SelectedIndex = -1;
            DropDownList5.SelectedIndex = -1;
            DropDownList6.SelectedIndex = -1;
            DropDownList7.SelectedIndex = -1;
            DropDownList8.SelectedIndex = -1;
            DropDownList9.SelectedIndex = -1;
            DropDownList10.SelectedIndex = -1;

            DropDownList1.Items.FindByText("select").Selected = true;
            DropDownList2.Items.FindByText("select").Selected = true;
            DropDownList3.Items.FindByText("select").Selected = true;
            DropDownList4.Items.FindByText("select").Selected = true;
            DropDownList5.Items.FindByText("select").Selected = true;
            DropDownList6.Items.FindByText("select").Selected = true;
            DropDownList7.Items.FindByText("select").Selected = true;
            DropDownList8.Items.FindByText("select").Selected = true;
            DropDownList9.Items.FindByText("select").Selected = true;
            DropDownList10.Items.FindByText("select").Selected = true;
        }

        protected void ClosePopUp_Click(object sender, EventArgs e)
        {
            
            Response.Redirect("Feedback.aspx");
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
    }

}
