<%@ Page Language="C#" AutoEventWireup="true" CodeFile="newUserReg.aspx.cs" Inherits="newUserReg" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="Utility/myscript.js" type="text/javascript"></script>
    <script>
        function validate() {
            var uid = document.getElementById("<%=txtUid.ClientID %>");
            var pwd = document.getElementById("<%=txtPwd.ClientID %>");
            var uname = document.getElementById("<%=txtUName.ClientID %>");
            var uadd = document.getElementById("<%=txtUAdd.ClientID %>");
            var uphone = document.getElementById("<%=txtUPhno.ClientID %>");
            var uemail = document.getElementById("<%=txtUEmail.ClientID %>");
            var udob = document.getElementById("<%=txtUDob.ClientID %>");
            var uphoto = document.getElementById("<%=fluUPhoto.ClientID %>");
            var eid = document.getElementById("<%=txtUEmpId.ClientID %>");

            if (notEmpty(uid, "User ID Should Not Be Blank")) {
                if (lengthRestrict(pwd, 6, 10)) {
                    if (notEmpty(uname, "User Name Should Not Be Blank")) {
                        if (alphaNum(uadd, "User Address Should Not Be Blank")) {
                            if (onlyDigits(uphone, "User Phone Only Contain Digits")) {
                                if (validEmail(uemail, "Invalid User Email")) {
                                        if (notEmpty(udob, "User DOB Should Not Be Blank")) {
                                            if (notEmpty(uphoto, "Please Select a User Photo")) {
                                                if (notEmpty(eid, "Employee ID Should Not Be Blank")) {
                                                    return true;
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    } 
                }
                
            }
            return false;
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
    
        <table align="center" class="style1">
            <tr>
                <td colspan="2" style="text-align: center">
                    New User Registration Info</td>
            </tr>
            <tr>
                <td>
                    User ID</td>
                <td>
                    <asp:TextBox ID="txtUid" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    Password</td>
                <td class="style2">
                    <asp:TextBox ID="txtPwd" runat="server" TextMode="Password"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    User Name</td>
                <td>
                    <asp:TextBox ID="txtUName" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    User Address</td>
                <td>
                    <asp:TextBox ID="txtUAdd" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    User Phone</td>
                <td>
                    <asp:TextBox ID="txtUPhno" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    User Email</td>
                <td>
                    <asp:TextBox ID="txtUEmail" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    User Gender</td>
                <td>
                    <asp:RadioButtonList ID="rdlUGen" runat="server" RepeatColumns="2">
                        <asp:ListItem>Male</asp:ListItem>
                        <asp:ListItem>Female</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
            </tr>
            <tr>
                <td>
                    User DOB</td>
                <td>
                    <asp:TextBox ID="txtUDob" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    User Photo</td>
                <td>
                    <asp:FileUpload ID="fluUPhoto" runat="server" />
                </td>
            </tr>
            <tr>
                <td class="style3">
                    Employee ID</td>
                <td class="style3">
                    <asp:TextBox ID="txtUEmpId" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Label ID="lblMsg" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    <asp:Button ID="btnSubmit" runat="server" Text="Submit"  
                        OnClientClick="return validate()" onclick="btnSubmit_Click" />
                    <asp:Button ID="btnReset" runat="server" Text="Reset" />
                </td>
            </tr>
        </table>
    
    <div>
    
    </div>
    </form>
</body>
</html>
