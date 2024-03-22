<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="college.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <script src="Scripts/bootstrap.min.js"></script>
    <style type="text/css">
        .auto-style3 {
            text-align: center;
        }
       
        .auto-style4 {
            color: #FF0000;
            text-decoration: underline;
        }
        .auto-style5 {
            width: 193px;
        }
        .auto-style6 {
            width: 1063px;
        }
        .auto-style7 {
            --bs-table-color: var(--bs-body-color);
            --bs-table-bg: transparent;
            --bs-table-border-color: var(--bs-border-color);
            --bs-table-accent-bg: transparent;
            --bs-table-striped-color: var(--bs-body-color);
            --bs-table-striped-bg: rgba(0, 0, 0, 0.05);
            --bs-table-active-color: var(--bs-body-color);
            --bs-table-active-bg: rgba(0, 0, 0, 0.1);
            --bs-table-hover-color: var(--bs-body-color);
            --bs-table-hover-bg: rgba(0, 0, 0, 0.075);
            width: 73%;
            margin-bottom: 1rem;
            color: var(--bs-table-color);
            vertical-align: top;
        }
       
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="col-md-8 offset-md-2">
            <div>
                <header>
                    <center> 
                        <h1 class="auto-style4"><strong>SIGN-UP</strong></h1>
                    </center>
                </header>
            </div>
            <table cellpadding="10" cellspacing="0" class="auto-style7" align="center">
               
                <tr>
                    <td class="auto-style5">
                        <asp:Label ID="Label1" runat="server" Text="EMAIL" Font-Bold="True"></asp:Label>
                    </td>
                    <td class="auto-style3"><strong>:</strong></td>
                    <td class="auto-style6">
                        <asp:TextBox ID="email" runat="server" CssClass="form-control" TextMode="Email" placeholder="example@example.com"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="email" Display="Dynamic" ErrorMessage="* EMAIL IS REQUIRED" Font-Bold="True" ForeColor="Red" ValidationGroup="login_validate"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="email" Display="Dynamic" ErrorMessage="* EMAIL IS INVALID" Font-Bold="True" ForeColor="Red" SetFocusOnError="True" ValidationGroup="login_validate" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style5">
                        <asp:Label ID="Label2" runat="server" Text="PASSWORD" Font-Bold="True"></asp:Label>
                    </td>
                    <td class="auto-style3"><strong>:</strong></td>
                    <td class="auto-style6">
                        <asp:TextBox ID="password" runat="server" CssClass="form-control" TextMode="Password" placeholder="********"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="password" Display="Dynamic" ErrorMessage="* PASSWORD IS REQUIRED" Font-Bold="True" ForeColor="Red" SetFocusOnError="True" ValidationGroup="login_validate"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                
                    
                        
            </table>
                <center>
                        <asp:Button ID="singup" CssClass="btn btn-success" runat="server" Text="SIGN-UP" ValidationGroup="login_validate" OnClick="singup_Click" />
                        <br />
                        <br />
                        <asp:HyperLink ID="HyperLink1" CssClass="link-primary text-decoration-none" runat="server" NavigateUrl="register.aspx">NOT HAVE AN ACCOUNT?</asp:HyperLink>
                </center>
        </div>
    </form>
</body>
</html>
