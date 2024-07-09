using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web.UI.WebControls;

namespace Feedback_Sys
{
    public partial class ResultsTable : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadStudentData();
                UpdateUI();
                PopulateFilterDropdown();
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
        //-------------Filter button-------------
        protected void Button1_Click(object sender, EventArgs e)
        {
            FilterTable();
        }

        //-------------Clear filter-------------
        protected void Button2_Click(object sender, EventArgs e)
        {
            TextBox1.Text = "";
            LoadStudentData();
        }

        //-------------Filter dropdown with options-------------
        protected void PopulateFilterDropdown()
        {
            DropDownList1.Items.Clear();
            DropDownList1.Items.Add(new ListItem("Student ID", "0"));
            DropDownList1.Items.Add(new ListItem("Course Name", "1"));
            DropDownList1.Items.Add(new ListItem("Overall Percentage", "3"));
        }

        //-------------Filter table-------------
        protected void FilterTable()
        {
            string filterCriteria = DropDownList1.SelectedValue;
            string filterValue = TextBox1.Text.Trim();

            ClearTableRowsExceptHeader();

            try
            {
                string[] lines = File.ReadAllLines(Server.MapPath("~/FeedbackSubmissions.txt"));
                var filteredDataList = new List<string[]>();

                foreach (string line in lines)
                {
                    string[] data = line.Split(',');

                    string studentId = data[0];
                    string courseId = data[1];
                    double overallPercentage = CalculateOverallPercentage(data);
                    string courseName = ConvertCourseId(courseId);

                    bool matchesFilter = false;
                    switch (filterCriteria)
                    {
                        case "0": // Student ID
                            matchesFilter = studentId.ToLower().Contains(filterValue.ToLower());
                            break;
                        case "1": // Course Name
                            matchesFilter = courseName.ToLower().Contains(filterValue.ToLower());
                            break;
                        case "3": // Overall Percentage
                            if (filterValue.EndsWith("%"))
                            {
                                double filterPercentage;
                                bool isPercentageFilter = double.TryParse(filterValue.TrimEnd('%'), out filterPercentage);

                                if (isPercentageFilter)
                                {
                                    double normalizedPercentage = Math.Round(overallPercentage, 1); // Round to one decimal place
                                    string percentageString = $"{normalizedPercentage:0.#}%";
                                    matchesFilter = percentageString.Equals(filterValue.TrimEnd('%'), StringComparison.OrdinalIgnoreCase);
                                }
                            }
                            else
                            {
                                double filterNumeric;
                                bool isNumericFilter = double.TryParse(filterValue, out filterNumeric);

                                if (isNumericFilter)
                                {
                                    double normalizedPercentage = Math.Round(overallPercentage, 1); // Round to one decimal place
                                    matchesFilter = Math.Abs(normalizedPercentage - filterNumeric) <= 1; // Adjust tolerance as needed
                                }
                            }
                            break;
                    }

                    if (matchesFilter)
                    {
                        filteredDataList.Add(data);
                    }
                }

                BindStudentData(filteredDataList);
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine($"Error loading student data: {ex.Message}");
            }
        }

        //-------------Clear Table Rows Except Header-------------
        private void ClearTableRowsExceptHeader()
        {
            for (int i = studentTable.Rows.Count - 1; i > 0; i--)
            {
                studentTable.Rows.RemoveAt(i);
            }
        }

        //-------------Calculate Overall Percentage-------------
        public static double CalculateOverallPercentage(string[] data)
        {
            int[] ratings = new int[10];
            for (int i = 2; i < 12; i++)
            {
                int.TryParse(data[i], out ratings[i - 2]);
            }

            double sum = ratings.Sum();
            double percentage = (sum / (ratings.Length * 3)) * 100;
            return percentage;
        }

        //-------------LoadStudentData-------------
        public List<string[]> LoadStudentData()
        {
            ClearTableRowsExceptHeader();
            List<string[]> studentDataList = new List<string[]>();

            try
            {
                string feedbacksPathFile = Server.MapPath("~/FeedbackSubmissions.txt");
                if (File.Exists(feedbacksPathFile))
                {
                    string[] lines = File.ReadAllLines(feedbacksPathFile);
                    studentDataList = lines.Select(line => line.Split(',')).ToList();

                    foreach (string[] feedbackDataAnswers in studentDataList)
                    {
                        string studentId = feedbackDataAnswers[0];
                        string courseId = feedbackDataAnswers[1];
                        string courseName = ConvertCourseId(courseId);

                        double percentage = CalculateOverallPercentage(feedbackDataAnswers);

                        AddTableRow(studentId, courseName, percentage);
                    }
                }
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine($"Error loading student data: {ex.Message}");
            }

            return studentDataList;
        }

        //-------------Convert Course Id-------------
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

        //-------------Add Table Row-------------
        protected void AddTableRow(string studentID, string courseID, double overallPercentage)
        {
            string courseName = ConvertCourseId(courseID);

            TableRow row = new TableRow();
            row.Cells.Add(new TableCell { Text = studentID });
            row.Cells.Add(new TableCell { Text = courseName });

            TableCell feedbackCell = new TableCell();
            HyperLink feedbackLink = new HyperLink
            {
                Text = "View Feedback",
                NavigateUrl = $"StudentAnswers.aspx?studentId={studentID}&courseId={courseID}",
                CssClass = "viewFeedback"
            };
            feedbackCell.Controls.Add(feedbackLink);
            row.Cells.Add(feedbackCell);

            TableCell cellPercentage = new TableCell();
            string progressBarColor = overallPercentage > 85 ? "bg-success" : "bg-danger"; // Light red for < 85%
            cellPercentage.Text = $@"
    <div class='progress'>
        <div class='progress-bar {progressBarColor}' role='progressbar' style='width: {overallPercentage}%;' aria-valuenow='{overallPercentage}' aria-valuemin='0' aria-valuemax='100'>
            {overallPercentage:0.##}%
        </div>
    </div>";
            row.Cells.Add(cellPercentage);

            studentTable.Rows.Add(row);
        }

        //-------------Bind Student Data-------------
        protected void BindStudentData(List<string[]> studentDataList)
        {
            foreach (string[] feedbackDataAnswers in studentDataList)
            {
                string studentId = feedbackDataAnswers[0];
                string courseId = feedbackDataAnswers[1];
                string courseName = ConvertCourseId(courseId); // Convert to course name

                double percentage = CalculateOverallPercentage(feedbackDataAnswers);

                AddTableRow(studentId, courseName, percentage); // Pass courseName instead of courseId
            }
        }

        //-------------Sort Ascending Click Event-------------



        protected void Button3_Click(object sender, EventArgs e)
        {
            List<string[]> studentDataList = LoadStudentData();
            ClearTableRowsExceptHeader();

            studentDataList = studentDataList.OrderBy(data => CalculateOverallPercentage(data)).ToList();
            BindStudentData(studentDataList);
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            List<string[]> studentDataList = LoadStudentData();
            ClearTableRowsExceptHeader();

            studentDataList = studentDataList.OrderByDescending(data => CalculateOverallPercentage(data)).ToList();
            BindStudentData(studentDataList);
        }
    }
}
