using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.IO;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Feedback_Sys
{
    public partial class Courses : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                UpdateUI();
            }
            PopulateTable();
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
            // Add header row
            CoursesList courses = CoursesList.All();
            TableRow headerRow = new TableRow();
            headerRow.Cells.Add(new TableHeaderCell { Text = "ID" });
            headerRow.Cells.Add(new TableHeaderCell { Text = "Name" });
            headerRow.Cells.Add(new TableHeaderCell { Text = "Instructor" });
            headerRow.Cells.Add(new TableHeaderCell { Text = "Level" });
            headerRow.Cells.Add(new TableHeaderCell { Text = "Price" });
            headerRow.Cells.Add(new TableHeaderCell { Text = "Weeks" });
            headerRow.Cells.Add(new TableHeaderCell { Text = "Description" });
            headerRow.Cells.Add(new TableHeaderCell { Text = " " });



            CourseTable.Rows.Add(headerRow);

            // Add data rows
            foreach (var course in courses)
            {
                TableRow row = new TableRow();
                row.Cells.Add(new TableCell { Text = course.Id });
                row.Cells.Add(new TableCell { Text = course.Name });
                row.Cells.Add(new TableCell { Text = course.Instructor });
                row.Cells.Add(new TableCell { Text = course.Level });
                row.Cells.Add(new TableCell { Text = course.Price.ToString()+"$" });
                row.Cells.Add(new TableCell { Text = course.DurationInWeeks.ToString() });
                row.Cells.Add(new TableCell { Text = course.Description });
                var tableCell = new TableCell();
                HyperLink link = new HyperLink();
                link.Text = "Edit Survey";
                link.CssClass = "btn btn-primary";
                link.NavigateUrl = $"EditCourseSurvey.aspx?course={course.Id}";
                // Add the HyperLink to the TableCell
                tableCell.Controls.Add(link);
                row.Cells.Add(tableCell);

                CourseTable.Rows.Add(row);
            }
        }
    }
}