using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Feedback_Sys
{
    public partial class Feedback : System.Web.UI.Page
    {
        int loggedInStudentID = -1; // Initialize to an invalid ID

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                UpdateUI();
                BindCourses();
               
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
        private void BindCourses()
        {

            // Read logged-in student ID from session file
            string sessionFile = Server.MapPath("~/Session.txt");
            if (File.Exists(sessionFile))
            {
                string[] sessionFileArr = File.ReadAllLines(sessionFile);
                string[] sessionLineArr = sessionFileArr[0].Split(',');
                loggedInStudentID = Convert.ToInt32(sessionLineArr[2]);
            }

            // Find the student's information based on ID in Students.txt
            string studentsFile = Server.MapPath("~/Students.txt");
            if (File.Exists(studentsFile))
            {
                // Find the line corresponding to the logged-in student ID
                string[] studentsArr = File.ReadAllLines(studentsFile);
                string LoggedInLine = null;
                foreach (var line in studentsArr)
                {
                    if (line.StartsWith(loggedInStudentID.ToString()))
                    {
                        LoggedInLine = line;
                        break;
                    }
                }

                if (LoggedInLine != null)
                {
                    // Extract the courses from the student information
                    string[] LoggedInLineArr = LoggedInLine.Split(',');
                    string coursesRegistered = null;
                    if (LoggedInLineArr.Length > 0)
                    {
                        coursesRegistered = LoggedInLineArr[LoggedInLineArr.Length - 1];
                    }

                    // Map course codes to their names
                    Dictionary<string, string> courseNames = new Dictionary<string, string>
                    {
                        { "QR5T3", "Java" },
                        { "YJVQL", "Python" },
                        { "ZCL87", "CSS" },
                        { "HVU1M", "JavaScript" }
                    };

                    // Split the courses registered part and retrieve the names
                    string[] coursesWithIDnNames = coursesRegistered.Split(' ');
                    List<Course> registeredCourses = new List<Course>();

                    foreach (var course in coursesWithIDnNames)
                    {
                        string courseCode = course.Split('-')[0];
                        string isSurveyDone = course.Split('-')[1].Trim();
                        string survey = isSurveyDone == "true" ? "false" : "true";
                        if (courseNames.ContainsKey(courseCode))
                        {
                            string courseName = courseNames[courseCode];
                            string imgClass = "";

                            if (courseName == "Java")
                            {
                                imgClass = "javaPic";
                            }
                            else if (courseName == "CSS")
                            {
                                imgClass = "cssPic";
                            }
                            if (isSurveyDone == "true")
                            {
                                survey = "false";
                            }
                            registeredCourses.Add(new Course
                            {
                                CourseName = courseName,
                                ImageUrl = GetCourseImageUrl(courseName),
                                Category = GetCourseCategoryLabel(courseName),
                                Description = GetCourseDescription(courseName),
                                ImgClass = imgClass,
                                CourseCode = courseCode,
                                ButtonText = survey == "false" ? "You have already submitted feedback!" : "Go to survey"

                            });
                        }
                    }

                    // Bind the registered courses to the repeater
                    CourseRepeater.DataSource = registeredCourses;
                    CourseRepeater.DataBind();

                }
            }
        }

        private string GetCourseImageUrl(string course)
        {
            switch (course)
            {
                case "Java":
                    return "assets/img/java.png";
                case "Python":
                    return "assets/img/pythonpic.png";
                case "CSS":
                    return "assets/img/css.png";
                case "JavaScript":
                    return "assets/img/js.png";
                default:
                    return "";
            }
        }

        private string GetCourseCategoryLabel(string course)
        {
            switch (course)
            {
                case "Java":
                    return "Web Development";
                case "JavaScript":
                    return "Web Development";
                case "Python":
                    return "Programming";
                case "CSS":
                    return "Styling Techniques";
                default:
                    return "";
            }
        }

        private string GetCourseDescription(string course)
        {
            switch (course)
            {
                case "Java":
                    return "Share your feedback on the Java Programming course you've completed. Your insights help us improve our teaching methods and course content.";
                case "Python":
                    return "Provide your feedback for the Python course you have taken. Your insights help us enhance the course content and delivery.";
                case "CSS":
                    return "Provide your feedback on the Advanced CSS Techniques course. Your opinions are valuable to us and help in refining our course materials.";
                case "JavaScript":
                    return "Provide your feedback on the JavaScript Fundamentals course. Your insights are crucial to us and assist in enhancing our course materials.";
                default:
                    return "";
            }
        }
        private string buttonTextFunction(string survey)
        {
            if (survey == "false")
            {
                return "You have already submitted feedback!";
            }
            else
            {
                return "jjj";
            }
        }

        public class Course
        {
            public string CourseName { get; set; }
            public string ImageUrl { get; set; }
            public string Category { get; set; }
            public string Description { get; set; }
            public string ImgClass { get; set; }
            public string CourseCode { get; set; }
            public string ButtonText { get; set; }


        }
        //string courseCode;
        protected void CourseRepeater_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "GoToSurvey")
            {
                string courseCode = e.CommandArgument.ToString();
                string currentCourseFile = Server.MapPath("~/CurrentCourse.txt");

                if (!File.Exists(currentCourseFile))
                {
                    using (StreamWriter wInCurCourse = File.CreateText(currentCourseFile))
                    {
                        wInCurCourse.WriteLine(courseCode);
                    }
                }
                else
                {
                    using (StreamWriter wInCurCourse = new StreamWriter(currentCourseFile))
                    {
                        wInCurCourse.WriteLine(courseCode);
                    }
                }


                // Redirect to Survey.aspx
                Response.Redirect("Survey.aspx");
            }
        }
        protected string ShowSurveyButton(object dataItem)
        {
            var course = (Course)dataItem;
            string courseCode = course.CourseCode;
            if (course.ButtonText == "You have already submitted feedback!")
            {
                return "<span>You have already submitted feedback!</span>";
            }
            else
            {
                return $"<a  class=\"btn btn-primary\" href=\'Survey.aspx?course={courseCode}\' >Go to Survey </a>";
            }
        }




    }

}
