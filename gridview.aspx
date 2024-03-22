<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="gridview.aspx.cs" Inherits="college.gridview" EnableEventValidation="true"%>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 37%;
        }
        .auto-style2 {
            text-align: center;
            height: 26px;
            margin-left: 40px;
        }
        .auto-style3 {
            width: 687px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        &nbsp;<table align="center" class="auto-style1">
            <tr>
                <td>&nbsp;</td>
                <td class="auto-style3">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2" colspan="2">
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowDataBound="GridView1_RowDataBound" OnRowDeleting="GridView1_RowDeleting" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" OnRowCreated="GridView1_RowCreated">
                        <Columns>
                            <asp:TemplateField HeaderText="OPERATIONS" ShowHeader="False">
                                <EditItemTemplate>
                                    <asp:Button ID="Button1" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                                    &nbsp;<asp:Button ID="Button2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Button ID="Button1" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
                                    &nbsp;<asp:Button ID="Button2" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="QUALIFICATION">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="quali" runat="server" SelectedValue='<%# Eval("quli_id") %>'>
                                    </asp:DropDownList>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("quli_name") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="DEPARTMENT">
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("dept_name") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="COURSE">
                                <ItemTemplate>
                                    <asp:Label ID="Label3" runat="server" Text='<%# Eval("course_name") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="ACTION" ShowHeader="False">
                                <EditItemTemplate>
                                    <asp:Button ID="Button3" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                                    &nbsp;<asp:Button ID="Button4" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Button ID="Button3" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
                                    &nbsp;<asp:Button ID="Button4" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\users.mdf;Integrated Security=True" ProviderName="System.Data.SqlClient" SelectCommand="SELECT tbl_registration.course_id, tbl_registration.dept_id, tbl_registration.quli_id, tbl_qualification.quli_name, tbl_dept.dept_name, tbl_course.course_name FROM tbl_registration INNER JOIN tbl_qualification ON tbl_registration.quli_id = tbl_qualification.quli_id INNER JOIN tbl_dept ON tbl_registration.dept_id = tbl_dept.dept_id INNER JOIN tbl_course ON tbl_registration.course_id = tbl_course.course_id AND tbl_dept.dept_id = tbl_course.dept_id"></asp:SqlDataSource>
                </td>
            </tr>
        </table>
        <div>
        </div>
    </form>
</body>
</html>
