using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.IO;

using System.Web.UI;
using System.Web.UI.WebControls;

namespace Feedback_Sys
{
    public partial class Logout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string sessionFilePath = Server.MapPath("~/Session.txt");
            if (File.Exists(sessionFilePath))
            {
                File.WriteAllText(sessionFilePath, "false,false,,,");
            }
            Response.Redirect("index.aspx");
        }
    }
}