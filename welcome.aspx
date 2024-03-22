<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="welcome.aspx.cs" Inherits="college.welcome" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>WELCOME PAGE</title>
    <style type="text/css">
        .auto-style1 {
            font-size: large;
        }
        </style>
   
</head>
<body>
    <%
        string name = Convert.ToString(Session["name"]);
        //if (name.Equals("admin"))
        {




    %>
    <form id="form1" runat="server">
        <div>
           <center><h1 style="color:darkblue ">WELCOME <%= Session["name"] %>! </h1></center> 
        </div>
        
        <div>
            <center>

                <br />
                <br />
                <br />
                <br />
        <%
            if (GridView1.EditIndex == -1)
            {



        %>
                <div id ="search_box">

               
                            <strong>
                         <asp:Label ID="Label14" runat="server" CssClass="auto-style1" Text="SEARCH STUDENT NAME    : "></asp:Label>
&nbsp; </strong>
                                <asp:TextBox ID="searchbox" runat="server"  AutoPostBack="True" ClientIDMode="Inherit" OnTextChanged="searchbox_TextChanged1"></asp:TextBox>
                           
&nbsp;
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="searchbox" Display="Dynamic" ErrorMessage="*  NAME MUST BE OF CHARACTERS ONLY(A-Z,a-z)" Font-Bold="True" ForeColor="Red" SetFocusOnError="True" ValidationExpression="^[A-Za-z]*$"></asp:RegularExpressionValidator>
                    <br />
                    <br />
                    <br />
                </div>

                <br />
                <br />
                <br />
                <br />
                <br />
<%

        }
%>
                <br />
                <br />
                <asp:GridView ID="GridView1" runat="server" DataKeyNames="stud_id" 
                    BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black" OnRowDataBound="GridView1_RowDataBound" OnRowDeleting="GridView1_RowDeleting" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" OnRowCancelingEdit="GridView1_RowCancelingEdit" EmptyDataText="<center>NO RECORDS FOUND</center>" Width="100%" ShowHeaderWhenEmpty="True">
                    <Columns>
                        <asp:TemplateField HeaderText="OPERATIONS" ShowHeader="False">
                              <EditItemTemplate>
                                <asp:Button ID="Button1" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                                &nbsp;<asp:Button ID="Button2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Button ID="Button1" runat="server" CausesValidation="False" CommandName="Edit" Text="EDIT" ValidationGroup="edit_btn" />
                                &nbsp;<asp:Button ID="Button2" runat="server" CausesValidation="False" CommandName="Delete" Text="DELETE" ValidationGroup="delete_btn" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="PROFILE">
                            <EditItemTemplate>
                                <br />
                                <asp:FileUpload ID="edit_image" runat="server" />
                                <br />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <br />
                                <asp:Image ID="Image1" runat="server" Height="62px" ImageUrl='<%# Eval("profile") %>' Width="105px" />
                                <br />
                                <br />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <EmptyDataRowStyle Font-Bold="True" Font-Size="Large" ForeColor="Maroon" />
                    <FooterStyle BackColor="#CCCCCC" />
                    <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
                    <RowStyle BackColor="White" />
                    <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="#808080" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#383838" />
                    <EmptyDataTemplate>

                    </EmptyDataTemplate>
                </asp:GridView>
                <br />
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\users.mdf;Integrated Security=True" ProviderName="System.Data.SqlClient" SelectCommand="SELECT tbl_registration.*, tbl_qualification.quli_name, tbl_dept.dept_name, tbl_course.course_name FROM tbl_registration INNER JOIN tbl_qualification ON tbl_registration.quli_id = tbl_qualification.quli_id INNER JOIN tbl_dept ON tbl_registration.dept_id = tbl_dept.dept_id INNER JOIN tbl_course ON tbl_registration.course_id = tbl_course.course_id AND tbl_dept.dept_id = tbl_course.dept_id"></asp:SqlDataSource>
                <br />
                <br />
                <br />
                <br />
                <br />
                <div>
            <asp:Button ID="Button3" runat="server" Text="LOGOUT" OnClick="Button3_Click" />
        </div>
            </center>
        </div>
    </form>
    <%

        }
    %>
</body>
</html>
