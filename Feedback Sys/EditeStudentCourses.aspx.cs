using System;
using System.IO;
using System.Web.UI;

namespace Feedback_Sys
{
    public partial class EditeStudentCourses : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            UpdateUI();
            if (IsPostBack)
            {
                SaveStudent();
                MakeToast();
            }


            PopulateData();
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
        private void MakeToast()
        {
            string script = @"
                <script>
                    const toastLiveExample = document.getElementById('liveToast')
                    const toastBootstrap = bootstrap.Toast.getOrCreateInstance(toastLiveExample)
                    toastBootstrap.show()
                </script>";

            ClientScript.RegisterStartupScript(this.GetType(), "showToastScript", script);
        }

        private void SaveStudent()

        {
            string studentId = Request.QueryString["student"];
            CoursesList courses = CoursesList.All();
            Student student = StudentsList.All().GetStudentById(studentId);
            StudentCoursesList studentCourses = new StudentCoursesList();
            if (courseJava.Checked == true)
            {
                try
                {
                    StudentCourse studentCourse = student.Courses.GetCourseById("QR5T3");
                    studentCourses.Add(studentCourse);
                }
                catch
                {
                    StudentCourse studentCourse = new StudentCourse(courses.GetCourseById("QR5T3"), false);
                    studentCourses.Add(studentCourse);
                }
            }
            if (courseJava.Checked == true)
            {
                try
                {
                    StudentCourse studentCourse = student.Courses.GetCourseById("YJVQL");
                    studentCourses.Add(studentCourse);
                }
                catch
                {
                    StudentCourse studentCourse = new StudentCourse(courses.GetCourseById("YJVQL"), false);
                    studentCourses.Add(studentCourse);
                }
            }
            if (courseJava.Checked == true)
            {
                try
                {
                    StudentCourse studentCourse = student.Courses.GetCourseById("ZCL87");
                    studentCourses.Add(studentCourse);
                }
                catch
                {
                    StudentCourse studentCourse = new StudentCourse(courses.GetCourseById("ZCL87"), false);
                    studentCourses.Add(studentCourse);
                }
            }
            if (courseJava.Checked == true)
            {
                try
                {
                    StudentCourse studentCourse = student.Courses.GetCourseById("HVU1M");
                    studentCourses.Add(studentCourse);
                }
                catch
                {
                    StudentCourse studentCourse = new StudentCourse(courses.GetCourseById("HVU1M"), false);
                    studentCourses.Add(studentCourse);
                }
            }
            Student newStudent = new Student(
                studentId,
                inputStudentName.Text,
                inputStudentEmail.Text,
                inputStudentNationalId.Text,
                Convert.ToInt32(inputStudentAge.Text),
                inputStudentPhone.Text,
                inputStudentBio.Text,
                studentCourses
                );
            StudentsList students = StudentsList.All();
            students.UpdateStudent(newStudent);
            students.SaveToFile();
        }


        void PopulateData()
        {
            string studentId = Request.QueryString["student"];
            StudentsList students = StudentsList.All();
            Student student;
            try
            {
                student = students.GetStudentById(studentId);
            }
            catch (Exception)
            {
                throw new Exception("Bad request.");
            }
            inputStudentName.Text = student.Name;
            inputStudentId.Text = student.Id;
            inputStudentEmail.Text = student.Email;
            inputStudentPhone.Text = student.Phone;
            inputStudentNationalId.Text = student.NationalId;
            inputStudentAge.Text = student.Age.ToString();
            inputStudentBio.Text = student.Bio;

            try
            {
                student.Courses.GetCourseById("QR5T3");
                courseJava.Checked = true;
            }
            catch { }
            try
            {
                student.Courses.GetCourseById("YJVQL");
                coursePython.Checked = true;
            }
            catch { }
            try
            {
                student.Courses.GetCourseById("ZCL87");
                courseCss.Checked = true;
            }
            catch { }
            try
            {
                student.Courses.GetCourseById("HVU1M");
                courseJavascript.Checked = true;
            }
            catch { }
        }
        protected void saveChangesBtn_Click(object sender, EventArgs e)
        {

        }
    }
}