using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Feedback_Sys
{
    public partial class EditCourseSurvey : System.Web.UI.Page
    {
        string courseId;
        protected void Page_Load(object sender, EventArgs e)
        {
            courseId = Request.QueryString["course"];
            if (IsPostBack)
            {
                TextBox[] inputs = { input1, input2, input3, input4, input5, input6, input7, input8, input9, input10 };
                string[] qustions = (from input in inputs select input.Text).ToArray();
                CourseServay courseServay = new CourseServay(qustions, courseId);
                courseServay.SaveToFile();
            }
            pupulateData();
        }

        private void pupulateData()
        {
            CourseServay courseServay = CourseServay.ReadFromFile(courseId);
            TextBox[] inputs = { input1, input2, input3, input4, input5, input6, input7, input8, input9, input10 };
            for (int index = 0; index < 10; index++)
            {
                inputs[index].Text = courseServay.qustions[index];
            }
        }

        protected void Unnamed11_Click(object sender, EventArgs e)
        {

        }
    }
}