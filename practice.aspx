<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="practice.aspx.cs" Inherits="college.practice" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>

            <asp:TextBox ID="TextBox1" runat="server" AutoPostBack="True" OnTextChanged="TextBox1_TextChanged"></asp:TextBox>

        </div>
    </form>
</body>
</html>
