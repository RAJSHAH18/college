<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="reg.aspx.cs" Inherits="college.reg" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>REGISTER PAGE</title>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <script src="Scripts/sweetalert.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
    <link href="Styles/sweetalert.css" rel="stylesheet" />

    <style type="text/css">
        .auto-style2 {
            text-align: center;
        }
        .auto-style4 {
            font-weight: bold;
        }
        .auto-style5 {
            width: 107px;
        }
        .auto-style6 {
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
            width: 56%;
            margin-bottom: 1rem;
            color: var(--bs-table-color);
            vertical-align: top;
        }
    </style>
    <script>
        <%--function check_hobby(source, args) {
            var checkbox = document.getElementById("<%= txt_hobby%>");
            var checkboxes = checkbox.getElementsByTagName("input");
            for (var i = 0; i < checkboxes.length; i++) {
                if (checkboxes[i].checked) {
                    args.IsValid = true;
                    return;
                }
            }
            args.IsValid = true;
        }--%>
        function checkbox_validation(source, args) {
            var checkbox = document.getElementById("<%=txt_hobby.ClientID%>");
             //var checkbox = document.getElementById("edit_hobby");

             var checkboxes = checkbox.getElementsByTagName("input");
             for (var i = 0; i < checkboxes.length; i++) {
                 if (checkboxes[i].checked == true) {
                     args.IsValid = true;
                     return;
                 }
             }
             args.IsValid = false;
         }
    </script>
</head>
<body>
    <form id="form1" runat="server">
       <div class="col-md-8 offset-md-2">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
           <div>
                 <header>
                     <center><h1 class="auto-style3">📚COLLEGE MANAGEMENT SYSTEM📚</h1></center>
                </header>

            </div>
        <table class="table" align="center">
           
            <tr>
                <td>
                    <asp:Label ID="Label1" runat="server" Font-Bold="True" Text="NAME"></asp:Label>
                </td>
                <td class="auto-style5"><strong>:</strong></td>
                <td>
                    <asp:TextBox ID="txt_name" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txt_name" Display="Dynamic" ErrorMessage="* NAME IS REQUIRED" Font-Bold="True" ForeColor="Red" SetFocusOnError="True" ValidationGroup="validate"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label2" runat="server" Font-Bold="True" Text="EMAIL"></asp:Label>
                </td>
                <td class="auto-style5"><strong>:</strong></td>
                <td>
                    <asp:TextBox ID="txt_email" runat="server" TextMode="Email"></asp:TextBox>
                    <br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txt_email" Display="Dynamic" ErrorMessage="* EMAIL IS REQUIRED" Font-Bold="True" ForeColor="Red" SetFocusOnError="True" ValidationGroup="validate"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txt_email" Display="Dynamic" ErrorMessage="* EMAIL FORMAT IS INVALID" Font-Bold="True" ForeColor="Red" SetFocusOnError="True" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="validate"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label3" runat="server" Font-Bold="True" Text="PASSWORD"></asp:Label>
                </td>
                <td class="auto-style5"><strong>:</strong></td>
                <td>
                    <asp:TextBox ID="txt_password" runat="server" TextMode="Password"></asp:TextBox>
                    <br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txt_password" Display="Dynamic" ErrorMessage="* PASSWORD IS REQUIRED" Font-Bold="True" ForeColor="Red" SetFocusOnError="True" ValidationGroup="validate"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label4" runat="server" Font-Bold="True" Text="PHONE"></asp:Label>
                </td>
                <td class="auto-style5"><strong>:</strong></td>
                <td>
                    <asp:TextBox ID="txt_phone" runat="server" TextMode="Phone"></asp:TextBox>
                    <br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txt_phone" Display="Dynamic" ErrorMessage="* PHONE IS REQUIRED" Font-Bold="True" ForeColor="Red" SetFocusOnError="True" ValidationGroup="validate" InitialValue="0"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label5" runat="server" Font-Bold="True" Text="QUALIFICATION"></asp:Label>
                </td>
                <td class="auto-style5"><strong>:</strong></td>
                <td>
                    <asp:DropDownList ID="txt_quali" runat="server">
                    </asp:DropDownList>
                    <br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txt_quali" Display="Dynamic" ErrorMessage="*  PLEASE SELECT QUALIFICATION" Font-Bold="True" ForeColor="Red" SetFocusOnError="True" ValidationGroup="validate" InitialValue="0"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label6" runat="server" Font-Bold="True" Text="DEPARTMENT"></asp:Label>
                </td>
                <td class="auto-style5"><strong>:</strong></td>
                <td>
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                                <asp:DropDownList ID="txt_dept" runat="server" AutoPostBack="True" OnSelectedIndexChanged="txt_dept_SelectedIndexChanged">
                                </asp:DropDownList>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txt_dept" Display="Dynamic" ErrorMessage="*  PLEASE SELECT DEPARTMENT" Font-Bold="True" ForeColor="Red" SetFocusOnError="True" ValidationGroup="validate" InitialValue="0"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label7" runat="server" Font-Bold="True" Text="COURSE"></asp:Label>
                </td>
                <td class="auto-style5"><strong>:</strong></td>
                <td>
                    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                        <ContentTemplate>
                    <asp:DropDownList ID="txt_course" runat="server">
                        <asp:ListItem Value="0">SELECT COURSE</asp:ListItem>
                    </asp:DropDownList>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    <br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txt_quali" Display="Dynamic" ErrorMessage="*  PLEASE SELECT COURSE" Font-Bold="True" ForeColor="Red" SetFocusOnError="True" ValidationGroup="validate" InitialValue="0"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style4">
                    <asp:Label ID="Label8" runat="server" Font-Bold="True" Text="GENDER"></asp:Label>
                </td>
                <td class="auto-style5"><strong>:</strong></td>
                <td>
                    <asp:RadioButtonList ID="txt_gender" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem>MALE</asp:ListItem>
                        <asp:ListItem>FEMALE</asp:ListItem>
                    </asp:RadioButtonList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txt_gender" Display="Dynamic" ErrorMessage="*  PLEASE CHOOSE GENDER" Font-Bold="True" ForeColor="Red" SetFocusOnError="True" ValidationGroup="validate"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label9" runat="server" Font-Bold="True" Text="HOBBIES"></asp:Label>
                </td>
                <td class="auto-style5"><strong>:</strong></td>
                <td>
                    <asp:CheckBoxList ID="txt_hobby" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem>READING</asp:ListItem>
                        <asp:ListItem>DANCING</asp:ListItem>
                        <asp:ListItem>SINGING</asp:ListItem>
                    </asp:CheckBoxList>
                        <asp:CustomValidator ID="CustomValidator1" runat="server" ClientValidationFunction="checkbox_validation" Display="Dynamic" ErrorMessage="* PLEASE CHOOSE HOOBY" ValidationGroup="validate" Font-Bold="True" ForeColor="Red" SetFocusOnError="True" ></asp:CustomValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label10" runat="server" Font-Bold="True" Text="PROFILE"></asp:Label>
                </td>
                <td class="auto-style5"><strong>:</strong></td>
                <td>
                    <asp:FileUpload ID="txt_profile" runat="server" />
                    <br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="txt_profile" Display="Dynamic" ErrorMessage="* PROFILE IS REQUIRED" Font-Bold="True" ForeColor="Red" SetFocusOnError="True" ValidationGroup="validate"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style2" colspan="3">
                    <asp:Button ID="reset" runat="server" Text="RESET" OnClick="reset_Click" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="REGISTER" ValidationGroup="validate" />
                </td>
            </tr>
        </table>
        </div>
    </form>
</body>
</html>
