<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="register.aspx.cs" Inherits="college.register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    
    <title>SIGN IN</title>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <script src="Scripts/bootstrap.min.js"></script>
    <link href="Styles/sweetalert.css" rel="stylesheet" />
    <link href="css/style.css" rel="stylesheet" />
      

    <style type="text/css">
        .auto-style2 {
            text-align: center;
        }
        .auto-style3 {
            color: #FF3300;
        }

        .auto-style4 {
            text-align: left;
            height: 47px;
        }
        .auto-style5 {
            font-size: large;
        }
        .auto-style6 {
            height: 45px;
        }
        .auto-style7 {
            text-align: center;
            height: 45px;
        }
        .auto-style8 {
            text-align: center;
            height: 47px;
        }
        .auto-style9 {
            height: 47px;
        }
        .auto-style10 {
            height: 28px;
        }
        .auto-style11 {
            text-align: center;
            height: 28px;
        }
        .auto-style12 {
            height: 69px;
        }
        .auto-style13 { 
            text-align: center;
            height: 69px;
        }
        </style>
    <script>
      
        function checkbox_validation(source, args) {
            var checkbox = document.getElementById("<%=hobby.ClientID%>");
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
         <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
       
            <div class="col-md-8 offset-md-2">

            <div>
                 <header>
                     <center><h1 class="auto-style3">📚COLLEGE MANAGEMENT SYSTEM📚</h1></center>
                </header>

            </div>
              <table cellpadding="10" cellspacing="0" class="table">
                <tr>
                    <td class="auto-style4">
                        <strong>
                        <asp:Label ID="Label1" runat="server" CssClass="auto-style5" Text="NAME"></asp:Label>
                        </strong>
                    </td>
                    <td class="auto-style8">
                        <strong>:</strong></td>
                    
                    <td class="auto-style9">
                        <asp:TextBox ID ="name" runat="server" placeholder="Enter Name" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"  ControlToValidate="name" Display="Dynamic" ErrorMessage="* NAME IS REQUIRED" Font-Bold="True" ForeColor="Red" SetFocusOnError="True" ValidationGroup="validate"></asp:RequiredFieldValidator>
                   
                    </td>
                </tr>
                <tr>
                    <td class="auto-style10"><strong>
                        <asp:Label ID="Label2" runat="server" CssClass="auto-style5" Text="EMAIL"></asp:Label>
                        </strong></td>
                    <td class="auto-style11"><strong>:</strong></td>
                    <td class="auto-style10">
                        <asp:TextBox ID="email" CssClass="form-control" placeholder ="example@example.com" runat="server" TextMode="Email"  ></asp:TextBox>
                        <asp:RequiredFieldValidator ID="error_email" runat="server" ControlToValidate="email" Display="Dynamic"  Font-Bold="True" ForeColor="Red" ErrorMessage="* EMAIL IS REQUIRED" ValidationGroup="validate"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="email" Display="Dynamic" ErrorMessage="* EMAIL IS INVALID" Font-Bold="True" ForeColor="Red" SetFocusOnError="True" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="validate"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style6"><strong>
                        <asp:Label ID="Label3" runat="server" CssClass="auto-style5" Text="PASSWORD"></asp:Label>
                        </strong></td>
                    <td class="auto-style7"><strong>:</strong></td>
                    <td>
                        <asp:TextBox ID="password" runat="server" CssClass="form-control" placeholder="********" TextMode="Password" ></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="password" Display="Dynamic" ErrorMessage="* PASSWORD IS REQUIRED" Font-Bold="True" ForeColor="Red" SetFocusOnError="True" ValidationGroup="validate"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style12"><strong>
                        <asp:Label ID="Label4" runat="server" CssClass="auto-style5" Text="CONFIRM PASSWORD"></asp:Label>
                        </strong></td>
                    <td class="auto-style13"><strong>:</strong></td>
                   <td class="auto-style12">
                        <asp:TextBox ID="confirmpassword" runat="server" CssClass= "form-control" placeholder="********" TextMode="Password" ></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="confirmpassword" Display="Dynamic" ErrorMessage="* CONFIRM PASSWORD IS REQUIRED" Font-Bold="True" ForeColor="Red" SetFocusOnError="True" ValidationGroup="validate"></asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="password" ControlToValidate="confirmpassword" Display="Dynamic" ErrorMessage="PASSWORD AND CONFIRM PASSWORD MUST BE SAME" Font-Bold="True" ForeColor="Red" ValidationGroup="validate"></asp:CompareValidator>
                    </td>
                </tr>
                <tr>
                    <td><strong>
                        <asp:Label ID="Label5" runat="server" CssClass="auto-style5" Text="QUALIFICATION"></asp:Label>
                        </strong></td>
                    <td class="auto-style2"><strong>:</strong></td>
                      
                    <td>

                        
                            <asp:DropDownList ID="qualification" runat="server" CssClass="form-select" ValidationGroup="validate">
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="qualification" Display="Dynamic" ErrorMessage="* QUALIFICATION IS REQUIRED" Font-Bold="True" ForeColor="Red" InitialValue="0" SetFocusOnError="True" ValidationGroup="validate"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td><strong>
                        <asp:Label ID="Label6" runat="server" CssClass="auto-style5" Text="DEPARTMENT"></asp:Label>
                        </strong></td>
                    <td class="auto-style2"><strong>:</strong></td>
                     <td>
                         <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                            <ContentTemplate>
                       
                                <asp:DropDownList ID="department" CssClass="form-select" runat="server" AutoPostBack="true" OnSelectedIndexChanged="department_SelectedIndexChanged">
                                </asp:DropDownList>
                          </ContentTemplate>
                        </asp:UpdatePanel>   
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="department" Display="Dynamic" ErrorMessage="* PLEASE SELECT DEPARTMENT" Font-Bold="True" ForeColor="Red" InitialValue="0" SetFocusOnError="True" ValidationGroup="validate"></asp:RequiredFieldValidator>
                  
                         </td>
                </tr>
                <tr>
                    <td><strong>
                        <asp:Label ID="Label7" runat="server" CssClass="auto-style5" Text="COURSE"></asp:Label>
                        </strong></td>
                    <td class="auto-style2"><strong>:</strong></td>
                    <td>
                        <asp:UpdatePanel ID="UpdatePanel2" runat="server"> 
                            <ContentTemplate>
                                <asp:DropDownList ID="course" CssClass="form-select" runat="server" AutoPostBack="false" >
                                        <asp:ListItem Value="0">SELECT COURSE</asp:ListItem>
                                    </asp:DropDownList>
                                </ContentTemplate>
                        </asp:UpdatePanel>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="course" Display="Dynamic" ErrorMessage="* PLEASE SELECT COURSE" Font-Bold="True" ForeColor="Red" InitialValue="0" SetFocusOnError="True" ValidationGroup="validate"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td><strong>
                        <asp:Label ID="Label8" runat="server" CssClass="auto-style5" Text="PHONE"></asp:Label>
                        </strong></td>
                    <td class="auto-style2"><strong>:</strong></td>
                    <td>
                        <asp:TextBox ID="phone" runat="server" TextMode="Phone" CssClass="form-control" placeholder="9876543210" > </asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="phone" Display="Dynamic" ErrorMessage="* PHONE NO IS REQUIRED" Font-Bold="True" ForeColor="Red" SetFocusOnError="True" ValidationGroup="validate"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="phone" Display="Dynamic" ErrorMessage="*  PHONE NO  IS INVALID" Font-Bold="True" ForeColor="Red" SetFocusOnError="True" ValidationExpression="\d{10}" ValidationGroup="validate"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td><strong>
                        <asp:Label ID="Label9" runat="server" CssClass="auto-style5" Text="GENDER"></asp:Label>
                        </strong></td>
                    <td class="auto-style2"><strong>:</strong></td>
                    <td>
                        <asp:RadioButtonList runat="server" CssClass="form-check" RepeatDirection="Horizontal" ID="gender" >
                            <asp:ListItem>MALE</asp:ListItem>
                            <asp:ListItem>FEMALE</asp:ListItem>

                        </asp:RadioButtonList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="gender" Display="Dynamic" ErrorMessage="* PLEASE CHOOSE GENDER" Font-Bold="True" ForeColor="Red" SetFocusOnError="True" ValidationGroup="validate"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td><strong>
                        <asp:Label ID="Label10" runat="server" CssClass="auto-style5" Text="HOBBY" ></asp:Label>
                        </strong></td>
                    <td class="auto-style2"><strong>:</strong></td>
                    <td>
                        <asp:CheckBoxList runat="server" ID="hobby" CssClass="form-check" RepeatDirection="Horizontal" RepeatLayout="Flow" >
                            <asp:ListItem>READING</asp:ListItem>
                            <asp:ListItem>SINGING</asp:ListItem>
                            <asp:ListItem>DANCING</asp:ListItem>


                        </asp:CheckBoxList>
                        <asp:CustomValidator ID="CustomValidator1" runat="server" ClientValidationFunction="checkbox_validation" Display="Dynamic" ErrorMessage="* PLEASE CHOOSE HOOBY" ValidationGroup="validate" Font-Bold="True" ForeColor="Red" SetFocusOnError="True" OnServerValidate="CustomValidator1_ServerValidate"></asp:CustomValidator>
                        <br />
                    </td>
                </tr>
                <tr>
                    <td><strong>
                        <asp:Label ID="Label11" runat="server" CssClass="auto-style5" Text="PROFILE" ></asp:Label>
                        </strong></td>
                    <td class="auto-style2"><strong>:</strong></td>
                    <td>
                        <asp:FileUpload ID="imageupload" CssClass="form-control" runat="server" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="imageupload" Display="Dynamic" ErrorMessage="* PLEASE UPLOAD IMAGE" Font-Bold="True" ForeColor="Red" SetFocusOnError="True" ValidationGroup="validate"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2" colspan="3">

                        <asp:Button ID="reset" runat="server" Text="RESET" CssClass="btn btn-primary" OnClick="reset_Click"/>
&nbsp;&nbsp;
                        <asp:Button ID="signin" runat="server" Text="SIGN IN" CssClass="btn btn-success" ValidationGroup="validate" OnClick="signin_Click"/>
                        <br />
                        <br />
                        <asp:HyperLink ID="HyperLink1" CssClass="link-primary text-decoration-none" runat="server" NavigateUrl="login.aspx">ALREADY HAVE A ACCOUNT?</asp:HyperLink>
                    </td>
                </tr>
            </table>
           
        </div>
           
    
    </form>
</body>
</html>
