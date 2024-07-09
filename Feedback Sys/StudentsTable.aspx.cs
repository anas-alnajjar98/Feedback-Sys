using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.IO;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace Feedback_Sys
{
    public partial class StudentsTable : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            PopulateTable();
            UpdateUI();
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

        void PopulateTable()
        {
            // Create header row
            TableRow headerRow = new TableHeaderRow();

            TableHeaderCell headerCell = new TableHeaderCell();
            headerCell.Text = "ID";
            headerRow.Cells.Add(headerCell);

            headerCell = new TableHeaderCell();
            headerCell.Text = "Name";
            headerRow.Cells.Add(headerCell);

            headerCell = new TableHeaderCell();
            headerCell.Text = "Registered Courses";
            headerRow.Cells.Add(headerCell);

            headerCell = new TableHeaderCell();
            headerCell.Text = " ";
            headerRow.Cells.Add(headerCell);

            TableOfStudents.Rows.Add(headerRow);


            StudentsList students = StudentsList.All();
            foreach (var student in students)
            {
                TableRow row = new TableRow();
                TableOfStudents.Rows.Add(row);

                // Column 1: 
                TableCell cell1 = new TableCell
                {
                    Text = student.Id
                };
                row.Cells.Add(cell1);

                // Column 2: Name
                TableCell cell2 = new TableCell
                {
                    Text = student.Name
                };
                row.Cells.Add(cell2);

                // Column 3: Courses
                TableCell cell3 = new TableCell();
                CoursesList courses = CoursesList.All();
                HtmlGenericControl coursesContainer = new HtmlGenericControl("div");
                foreach (var course in student.Courses)
                {
                    HtmlGenericControl div = new HtmlGenericControl("div");
                    div.InnerText = course.TheCourse.Name;
                    coursesContainer.Controls.Add(div);
                }
                cell3.Controls.Add(coursesContainer);
                row.Cells.Add(cell3);


                TableCell cell4 = new TableCell();
                HtmlGenericControl link = new HtmlGenericControl("a");
                link.Attributes["href"] = $"EditeStudentCourses.aspx?student={student.Id}";
                link.Attributes["class"] = "btn btn-primary";
                link.InnerText = "Edit";
                cell4.Controls.Add(link);
                row.Cells.Add(cell4);
            }
        }
        protected void SubmitButton_Click(object sender, EventArgs e)
        {
        }
    }
}