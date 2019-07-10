<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="Utility/myscript.js" type="text/javascript"></script>
      <script>
          function validate() {
              var uid = document.getElementById("<%=txtUid.ClientID %>");
              var pwd = document.getElementById("<%=txtPwd.ClientID %>");
              if (notEmpty(uid, "User ID Should Not Be Blank")) {
                  if (lengthRestrict(pwd, 6, 10)) {
                      return true;
                  }
              }
              return false;
          }
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table align="center" class="style1">
            <tr>
                <td colspan="2" style="text-align: center">
                    Login Info</td>
            </tr>
            <tr>
                <td>
                    User ID</td>
                <td>
                    <asp:TextBox ID="txtUid" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    Password</td>
                <td>
                    <asp:TextBox ID="txtPwd" runat="server" TextMode="Password"></asp:TextBox>
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
                    <asp:Button ID="btnLogin" runat="server" Text="Login" 
                        OnClientClick="return validate()" onclick="btnLogin_Click" />
                    <asp:Button ID="btnReset" runat="server" Text="Reset" />
                </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
