using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Feedback_Sys
{
    public partial class StudentAnswers : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string studentId = Request.QueryString["StudentID"];
                string courseId = Request.QueryString["CourseID"];

                if (!string.IsNullOrEmpty(studentId) && !string.IsNullOrEmpty(courseId))
                {
                    ShowQuestions(courseId);
                    ShowAnswers(studentId, courseId);
                }
                else
                {
                    // Handle case when query parameters are missing
                    Response.Write("Invalid student or course ID.");
                }
            }
        }

        //-------------------Show Questions Function-------------------
        public void ShowQuestions(string courseId)
        {
            string QuestionsPathFile = Server.MapPath("~/CourseraServices.txt");
            if (File.Exists(QuestionsPathFile))
            {
                string[] lines = File.ReadAllLines(QuestionsPathFile);
                foreach (string line in lines)
                {
                    string[] feedbackData = line.Split(',');

                    CourseID.Text = feedbackData[0].Trim();
                    Q1.Text = "Question 1 : " + feedbackData[1].Trim() + "?";
                    Q2.Text = "Question 2 : " + feedbackData[2].Trim() + "?";
                    Q3.Text = "Question 3 : " + feedbackData[3].Trim() + "?";
                    Q4.Text = "Question 4 : " + feedbackData[4].Trim() + "?";
                    Q5.Text = "Question 5 : " + feedbackData[5].Trim() + "?";
                    Q6.Text = "Question 6 : " + feedbackData[6].Trim() + "?";
                    Q7.Text = "Question 7 : " + feedbackData[7].Trim() + "?";
                    Q8.Text = "Question 8 : " + feedbackData[8].Trim() + "?";
                    Q9.Text = "Question 9 : " + feedbackData[9].Trim() + "?";
                    Q10.Text = "Question 10 : " + feedbackData[10].Trim() + "?";

                }
            }
        }

        //-------------------Show Answers Function-------------------
        public void ShowAnswers(string studentId, string courseId)
        {
            string originalCourseId = courseId; // Store the original course ID
            courseId = ConvertCourseId(courseId); // Convert courseId from query string

            string IdPathFile = Server.MapPath("~/Students.txt");
            bool foundStudent = false;

            if (File.Exists(IdPathFile))
            {
                string[] lines1 = File.ReadAllLines(IdPathFile);
                foreach (string line in lines1)
                {
                    string[] IdData = line.Split(',');

                    if (IdData.Length > 1 && IdData[0].Trim() == studentId)
                    {
                        Label1.Text = IdData[1].Trim();
                        emailLink.Text = IdData[2].Trim();
                        emailLink.NavigateUrl = $"mailto:{emailLink.Text}";
                        emailLink.ToolTip = "Click here to send email";

                        foundStudent = true;
                        break;
                    }
                }
            }

            if (!foundStudent)
            {
                Label1.Text = "Student not found";
            }

            string AnswersPathFile = Server.MapPath("~/FeedbackSubmissions.txt");
            if (File.Exists(AnswersPathFile))
            {
                string[] lines = File.ReadAllLines(AnswersPathFile);
                foreach (string line in lines)
                {
                    string[] AnswersData = line.Split(',');
                    if (AnswersData.Length >= 10 && AnswersData[0].Trim() == studentId)
                    {
                        string dataCourseId = ConvertCourseId(AnswersData[1].Trim());

                        if (dataCourseId == courseId)
                        {
                            StudentID.Text = AnswersData[0].Trim();
                            CourseID.Text = originalCourseId;
                            A1.Text = ConvertAnswerToText(AnswersData[2].Trim(), A1);
                            A2.Text = ConvertAnswerToText(AnswersData[3].Trim(), A2);
                            A3.Text = ConvertAnswerToText(AnswersData[4].Trim(), A3);
                            A4.Text = ConvertAnswerToText(AnswersData[5].Trim(), A4);
                            A5.Text = ConvertAnswerToText(AnswersData[6].Trim(), A5);
                            A6.Text = ConvertAnswerToText(AnswersData[7].Trim(), A6);
                            A7.Text = ConvertAnswerToText(AnswersData[8].Trim(), A7);
                            A8.Text = ConvertAnswerToText(AnswersData[9].Trim(), A8);
                            A9.Text = ConvertAnswerToText(AnswersData[10].Trim(), A9);
                            A10.Text = ConvertAnswerToText(AnswersData[11].Trim(), A10);
                            break;
                        }
                    }
                }
            }
        }
        //------------------Convert Course Id--------------------------
        private string ConvertCourseId(string courseId)
        {
            switch (courseId)
            {
                case "QR5T3":
                    return "Java";
                case "YJVQL":
                    return "Python";
                case "ZCL87":
                    return "CSS";
                case "HVU1M":
                    return "JavaScript";
                default:
                    return courseId;
            }
        }


        //-------------------Convert Answer To Text-------------------
        private string ConvertAnswerToText(string answerData, Label label)
        {
            if (!string.IsNullOrEmpty(answerData))
            {
                int answer = int.Parse(answerData);
                switch (answer)
                {
                    case 3:
                        label.BackColor = System.Drawing.Color.FromArgb(204, 255, 204); // Light green with padding
                        return "Excellent";
                    case 2:
                        label.BackColor = System.Drawing.Color.FromArgb(255, 229, 204); // Light orange with padding
                        return "Very Good";
                    case 1:
                        label.BackColor = System.Drawing.Color.FromArgb(255, 255, 204); // Light yellow with padding
                        return "Good";
                    case 0:
                        label.BackColor = System.Drawing.Color.FromArgb(255, 204, 204);
                        return "Poor";
                    default:
                        label.BackColor = System.Drawing.Color.White; // Default background color
                        return "N/A";
                }
            }
            else
            {
                label.BackColor = System.Drawing.Color.White; // Default background color if answerData is empty
                return "N/A";
            }
        }

        //-------------------Generate CSV-------------------
        private string GenerateCSV()
        {
            StringWriter sw = new StringWriter();
            sw.WriteLine($"Course ID : ,{CourseID.Text}");
            sw.WriteLine($"Student ID : ,{StudentID.Text}");
            sw.WriteLine("Question,Answer");
            sw.WriteLine($"{Q1.Text},{A1.Text}");
            sw.WriteLine($"{Q2.Text},{A2.Text}");
            sw.WriteLine($"{Q3.Text} ,{A3.Text}");
            sw.WriteLine($"{Q4.Text} ,{A4.Text}");
            sw.WriteLine($"{Q5.Text} ,{A5.Text}");
            sw.WriteLine($"{Q6.Text} ,{A6.Text}");
            sw.WriteLine($"{Q7.Text}  ,{A7.Text}");
            sw.WriteLine($"{Q8.Text}  ,{A8.Text}");
            sw.WriteLine($"{Q9.Text}  ,{A9.Text}");
            sw.WriteLine($"{Q10.Text}  ,{A10.Text}");

            return sw.ToString();
        }

        //-------------------Download CSV-------------------
        protected void DownloadCSV(object sender, EventArgs e)
        {
            Response.Clear();
            Response.Buffer = true;
            Response.AddHeader("content-disposition", "attachment;filename=StudentAnswers.csv");
            Response.Charset = "";
            Response.ContentType = "application/text";

            Response.Output.Write(GenerateCSV());
            Response.Flush();
            Response.End();
        }

        //-------------------Back to results page -------------------
        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("ResultsTable.aspx");
        }

    }
}