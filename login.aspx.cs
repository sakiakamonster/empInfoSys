using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    sqlHelper ob = new sqlHelper();
    protected void btnLogin_Click(object sender, EventArgs e)
    {
        if (txtUid.Text == "admin" && txtPwd.Text == "admin@123")
        {
            Response.Redirect("admin/adminwelcome.aspx");
            return;
        }
        try
        {
            usermas usr = ob.usrAssign(txtUid.Text, txtPwd.Text, "", "", "", "", "", "", "", "", "");
            ob.usrOp(usr, 'L');
            if (ob.ds.Tables[0].Rows.Count > 0)
            {
                Session["uid"] = txtUid.Text;
                Session["eid"] = ob.ds.Tables[0].Rows[0].ItemArray[10].ToString();
                Response.Redirect("users/userWelcome.aspx");
            }
            else
            {
                lblMsg.Text = "Ìnvalid Credential Or not Authurised";
                txtUid.Focus();
                return;
            }
        }
        catch (Exception ex)
        {
            lblMsg.Text = "Error : " + ex.Message;
        }
    }
}