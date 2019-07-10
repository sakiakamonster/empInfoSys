using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class newUserReg : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    sqlHelper ob = new sqlHelper();
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        try
        {
            usermas usr = ob.usrAssign(txtUid.Text, "", "", "", "", "", "", "", "", "", "");
            ob.usrOp(usr, 'S');
            if (ob.ds.Tables[0].Rows.Count > 0)
            {
                lblMsg.Text = "Duplicate User ID";
                txtUid.Focus();
                return;
            }
            empmas emp = ob.empAssign(txtUEmpId.Text, "", "", "", "", "", 0, DateTime.Now.ToString(), "", "");
            ob.empOp(emp, 'S');
            if (ob.ds.Tables[0].Rows.Count == 0)
            {
                lblMsg.Text = "Invalid Employee ID";
                txtUEmpId.Focus();
                return;
            }
            usr = ob.usrAssign("", "", "", "", "", "", "", "", "", "", txtUEmpId.Text);
            ob.usrOp(usr, 'E');
            if (ob.ds.Tables[0].Rows.Count > 0)
            {
                lblMsg.Text = "Duplicate Employee ID";
                txtUEmpId.Focus();
                return;
            }
            usr = ob.usrAssign(txtUid.Text, txtPwd.Text, txtUName.Text, txtUAdd.Text, txtUPhno.Text, txtUEmail.Text, rdlUGen.SelectedValue.ToString(), txtUDob.Text, "uphoto/" + fluUPhoto.FileName, "Inactive", txtUEmpId.Text);
            fluUPhoto.PostedFile.SaveAs(Server.MapPath(".") + "\\uphoto\\" + fluUPhoto.FileName);
            ob.usrOp(usr, 'I');
            lblMsg.Text = "User Registered Successfully";
        }
        catch (Exception ex)
        {
            lblMsg.Text = "Error : " + ex.Message;
        }
    }
}