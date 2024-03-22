<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="welcome1.aspx.cs" Inherits="college.welcome1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>WELCOME PAGE</title>
    <script src="Scripts/bootstrap.min.js"></script>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="Styles/sweetalert.css" rel="stylesheet" />
    <script src="Scripts/sweetalert.min.js"></script>
    <style type="text/css">
        .auto-style1 {
            font-size: large;
        }
        .auto-style2 {
            text-align: center;
        }
        .auto-style3 {
            text-align: left;
        }
    </style>
    </head>
<body>
    <form id="form1" runat="server">
        <div class="auto-style3">
            <div>
                <header>
                    <center><h1 style="color:red">WELCOME <%=Session["id"]%>!</h1>
                    </center>
                </header>
            </div>
            <div class="auto-style2">
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
           
      <%
          if (GridView1.EditIndex == -1)
          {
      %>
             <asp:Label ID="Label12" runat="server" CssClass="auto-style1" Font-Bold="True" Text="SEARCH STUDENT ID    : "></asp:Label>
&nbsp;
            <asp:TextBox ID="searchsid" runat="server" ></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="SEARCH" Width="98px" ValidationGroup="search_validate" />
&nbsp;
            <asp:RangeValidator ID="RangeValidator2" runat="server" ControlToValidate="searchsid" Display="Dynamic" ErrorMessage="* STUDENT ID SHOULD BE BETWEEN 1-100" Font-Bold="True" ForeColor="Red" MaximumValue="100" MinimumValue="1" Type="Integer" ValidationGroup="search_validate"></asp:RangeValidator>
            &nbsp;
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
                <br />
    <%
        }
    %>
            </div>
            <center>
                <asp:GridView ID="GridView1" runat="server" Width="100%" AutoGenerateColumns="False" CssClass="table" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black" DataKeyNames="stud_id,quli_id,dept_id,course_id,hobby,profile" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowDataBound="GridView1_RowDataBound" OnRowDeleting="GridView1_RowDeleting" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" ClientIDMode="Static" EmptyDataText="NO RECORDS FOUND" Caption="STUDENT DETAILS" CaptionAlign="Top" ShowHeaderWhenEmpty="True" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" >
                    <Columns>
                        <asp:TemplateField HeaderText="OPERATIONS" ShowHeader="False">
                            <EditItemTemplate>
                                <asp:Button ID="Button1" runat="server" CausesValidation="True" CommandName="Update" CssClass="btn btn-primary" Text="Update" ValidationGroup="edit_validate" />
                                &nbsp;<asp:Button ID="Button2" runat="server" CausesValidation="False" CssClass="btn btn-danger" CommandName="Cancel" Text="Cancel" />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Button ID="Button1" runat="server" CausesValidation="False" CommandName="Edit" CssClass="btn btn-success" Text="Edit" />
                                &nbsp;<asp:Button ID="Button2" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" CssClass="btn btn-dark" OnClick="Button2_Click" OnClientClick="return confirm('Are You Sure You Want To Delete This ? ');" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="PROFILE">
                            <EditItemTemplate>
                                <br />
                                <asp:FileUpload ID="edit_profile" runat="server"  />
                                &nbsp;&nbsp;&nbsp;
                            </EditItemTemplate>
                            <ItemTemplate>
                                <br />
                                <asp:Image ID="Image1" runat="server" Height="65px" ImageUrl='<%# Eval("profile") %>' Width="125px" />
                                <br />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="STUDENT_ID">
                            <EditItemTemplate>
                                <br />
                                <asp:Label ID="sid" runat="server" Text='<%# Eval("stud_id") %>'></asp:Label>
                                <br />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <br />
                                <asp:Label ID="Label2" runat="server" Text='<%# Eval("stud_id") %>'></asp:Label>
                                <br />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="NAME">
                            <EditItemTemplate>
                                <br />
                                <asp:TextBox ID="edit_name" runat="server" Text='<%# Eval("stud_name") %>'></asp:TextBox>
                                &nbsp;
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="edit_name" Display="Dynamic" ErrorMessage="NAME IS REQUIRED" Font-Bold="True" ForeColor="Red" SetFocusOnError="True" ValidationGroup="edit_validate">*</asp:RequiredFieldValidator>
                                <br />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <br />
                                <asp:Label ID="Label3" runat="server" Text='<%# Eval("stud_name") %>'></asp:Label>
                                <br />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="EMAIL">
                            <EditItemTemplate>
                                <br />
                                <asp:TextBox ID="edit_email" runat="server" Text='<%# Eval("stud_email") %>'></asp:TextBox>
                                &nbsp;
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="edit_email" Display="Dynamic" ErrorMessage="EMAIL-ID IS REQUIRED" ForeColor="Red" SetFocusOnError="True" ValidationGroup="edit_validate">*</asp:RequiredFieldValidator>
                                &nbsp;
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="edit_email" Display="Dynamic" ErrorMessage="INVALID EMAIL-ID FORMAT" Font-Bold="True" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="edit_validate">*</asp:RegularExpressionValidator>
                                <br />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <br />
                                <asp:Label ID="Label4" runat="server" Text='<%# Eval("stud_email") %>'></asp:Label>
                                <br />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="PASSWORD">
                            <EditItemTemplate>
                                <br />
                                <asp:TextBox ID="edit_password" runat="server" Text='<%# Eval("stud_password") %>'></asp:TextBox>
                                &nbsp;
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="edit_password" Display="Dynamic" ErrorMessage="PASSWORD IS REQUIRED" Font-Bold="True" ForeColor="Red" ValidationGroup="edit_validate">*</asp:RequiredFieldValidator>
                                <br />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <br />
                                <asp:Label ID="Label5" runat="server" Text='<%# Eval("stud_password") %>'></asp:Label>
                                <br />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="PHONE NO">
                            <EditItemTemplate>
                                <br />
                                <asp:TextBox ID="edit_phone" runat="server" Text='<%# Eval("stud_phone") %>' TextMode="Phone"></asp:TextBox>
                                &nbsp;
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="edit_phone" Display="Dynamic" ErrorMessage="PHONE NO IS REQUIRED" Font-Bold="True" ForeColor="Red" ValidationGroup="edit_validate">*</asp:RequiredFieldValidator>
                                &nbsp;
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="edit_phone" Display="Dynamic" ErrorMessage="PHONE NUMBER MUST  OF 10 DIGITS ONLY" Font-Bold="True" ForeColor="Red" SetFocusOnError="True" ValidationExpression="\d{10}" ValidationGroup="edit_validate">*</asp:RegularExpressionValidator>
                                <br />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <br />
                                <asp:Label ID="Label6" runat="server" Text='<%# Eval("stud_phone") %>'></asp:Label>
                                <br />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="GENDER">
                            <EditItemTemplate>
                                <br />
                                <asp:RadioButtonList ID="edit_gender" CssClass="form-check" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" SelectedValue='<%# Eval("gender") %>'>
                                    <asp:ListItem>MALE</asp:ListItem>
                                    <asp:ListItem>FEMALE</asp:ListItem>
                                </asp:RadioButtonList>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <br />
                                <asp:Label ID="Label7" runat="server" Text='<%# Eval("gender") %>'></asp:Label>
                                <br />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="HOBBIES">
                            <EditItemTemplate>
                                <br />
                                <asp:CheckBoxList ID="edit_hobby" runat="server" CssClass="form-check" RepeatDirection="Horizontal" RepeatLayout="Flow" ClientIDMode="Static">
                                    <asp:ListItem>READING</asp:ListItem>
                                    <asp:ListItem>SINGING</asp:ListItem>
                                    <asp:ListItem>DANCING</asp:ListItem>
                                </asp:CheckBoxList>
                                &nbsp;&nbsp;
                                <br />
                                <asp:CustomValidator ID="CustomValidator1" runat="server"  Display="Dynamic" ErrorMessage="PLEASE CHOOSE HOOBY" Font-Bold="True" ForeColor="Red" SetFocusOnError="True" ValidationGroup="edit_validate">*</asp:CustomValidator>
                                <br />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <br />
                                <asp:Label ID="Label8" runat="server" Text='<%# Eval("hobby") %>'></asp:Label>
                                <br />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="QUALIFICATION">
                            <EditItemTemplate>
                                <br />
                                <asp:DropDownList ID="edit_quali" runat="server">
                                </asp:DropDownList>
                                <br />
                                <br />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <br />
                                <asp:Label ID="Label9" runat="server" Text='<%# Eval("quli_name") %>'></asp:Label>
                                <br />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="DEPARTMENT">
                            <EditItemTemplate>
                                <br />
                                <asp:DropDownList ID="edit_dept" runat="server" AutoPostBack="True" OnSelectedIndexChanged="edit_dept_SelectedIndexChanged">
                                </asp:DropDownList>
                                <br />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <br />
                                <asp:Label ID="Label10" runat="server" Text='<%# Eval("dept_name") %>'></asp:Label>
                                <br />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="COURSES">
                            <EditItemTemplate>
                                <br />
                                <asp:DropDownList ID="edit_course" runat="server">
                                </asp:DropDownList>
                                <br />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <br />
                                <asp:Label ID="Label11" runat="server" Text='<%# Eval("course_name") %>'></asp:Label>
                                <br />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <EmptyDataRowStyle Font-Bold="True" Font-Italic="True" Font-Underline="False" ForeColor="#990000" HorizontalAlign="Center" VerticalAlign="Middle" />
                    <FooterStyle BackColor="#CCCCCC" />
                    <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
                    <RowStyle BackColor="White" />
                    <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="Gray" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#383838" />

                </asp:GridView>
            </center>
            <div class="auto-style3">
            <br />
                <br />
                <br />
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" Font-Bold="True" ForeColor="Red" ValidationGroup="edit_validate" />
            </div>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\users.mdf;Integrated Security=True" ProviderName="System.Data.SqlClient" SelectCommand="SELECT tbl_registration.stud_id, tbl_registration.stud_name, tbl_registration.stud_email, tbl_registration.stud_password, tbl_registration.stud_phone, tbl_registration.quli_id, tbl_registration.dept_id, tbl_registration.course_id, tbl_registration.gender, tbl_registration.hobby, tbl_registration.profile, tbl_qualification.quli_name, tbl_dept.dept_name, tbl_course.course_name FROM tbl_registration INNER JOIN tbl_qualification ON tbl_registration.quli_id = tbl_qualification.quli_id INNER JOIN tbl_dept ON tbl_registration.dept_id = tbl_dept.dept_id INNER JOIN tbl_course ON tbl_registration.course_id = tbl_course.course_id AND tbl_dept.dept_id = tbl_course.dept_id AND tbl_registration.stud_id = 5"></asp:SqlDataSource>
            <br />
            <asp:Button ID="Button4" runat="server" Text="LOGOUT" OnClick="Button3_Click" />

        </div>
    </form>
</body>
</html>
