<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.Master" AutoEventWireup="true" CodeBehind="AdminOrderManagement.aspx.cs" Inherits="DigitalRepository.AdminOrderManagement" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <link href="css/tableOt.css" rel="stylesheet" />
    <link href="css/PageIndicator.css" rel="stylesheet" />
    <link href="css/btns.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="line">
        <a class="textB" href="AdminHomepage.aspx"> لوحة التحكم </a>
        <label class ="textB">&lt</label>
        <a class="textC">ادارة الطلبات الواردة من الزوار</a>
        <i class="fa-solid fa-pen-to-square icon" ></i>
    </div>
        <div style="width: 100%; overflow: scroll;">
        <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" ShowFooter="True" DataKeyNames="Id" HorizontalAlign="Center" Width="900px" ShowHeaderWhenEmpty="True" OnRowEditing="UsersGridView_RowEditing" OnRowUpdating="UsersGridView_RowUpdating" OnRowCancelingEdit="UsersGridView_RowCancelingEdit" OnRowDeleting="UsersGridView_RowDeleting" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
            <AlternatingRowStyle BackColor="White" />
            <EditRowStyle BackColor="White" />
            <FooterStyle BackColor="White" Font-Bold="True" ForeColor="White" />
            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#E3EAEB" HorizontalAlign="Center" VerticalAlign="Middle" />
            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F8FAFA" />
            <SortedAscendingHeaderStyle BackColor="#246B61" />
            <SortedDescendingCellStyle BackColor="#D4DFE1" />
            <SortedDescendingHeaderStyle BackColor="#15524A" />
            <Columns>
                 <asp:TemplateField  HeaderText="تحديث حالة الطلب" ItemStyle-Width="500px" ItemStyle-HorizontalAlign="Right" ItemStyle-VerticalAlign="Middle" HeaderStyle-Width="150px" HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Middle" ControlStyle-Width="150px">
                    <ItemTemplate>
                        <asp:Button runat="server" CommandName="Edit" Cssclass="btn1" ToolTip="Edit" Text="تعديل" />
                        <asp:Button runat="server" CommandName="Delete" Cssclass="btn2" ToolTip="Delete" Text="حذف" />
                    </ItemTemplate>

                    <EditItemTemplate >
                        <asp:Button runat="server" CommandName="Update" Cssclass="btn1" ToolTip="Update" Text="تأكيد" />
                        <asp:Button runat="server" CommandName="Cancel" Cssclass="btn2" ToolTip="Cancel" Text="الغاء" />
                    </EditItemTemplate>

<ControlStyle Width="150px"></ControlStyle>

<HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="150px"></HeaderStyle>

<ItemStyle HorizontalAlign="Right" VerticalAlign="Middle" Width="500px"></ItemStyle>
                    </asp:TemplateField>
                <%--السعر--%>
                <asp:TemplateField HeaderText="رقم الطلب" ItemStyle-Width="150px" ItemStyle-HorizontalAlign="Right" ItemStyle-VerticalAlign="Middle" HeaderStyle-Width="150px" HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Middle" ControlStyle-Width="150px">
                    <ItemTemplate>
                        <asp:Label Text='<%# Eval("id") %>' runat="server" />
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:Label ID="txtid" Text='<%# Eval("id") %>' runat="server" />
                    </EditItemTemplate>
            
                    <ControlStyle Width="150px"></ControlStyle>

                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="150px"></HeaderStyle>

                    <ItemStyle HorizontalAlign="Right" VerticalAlign="Middle" Width="150px"></ItemStyle>
                </asp:TemplateField>

               <%-- الوصف--%>
                <asp:TemplateField HeaderText="الطلب" ItemStyle-Width="150px" HeaderStyle-Width="150px" ItemStyle-HorizontalAlign="Right" ItemStyle-VerticalAlign="Middle" HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Middle">
                    <ItemTemplate>
                        <asp:Label Text='<%# Eval("P_name") %>' runat="server" />
                    </ItemTemplate>
                    <EditItemTemplate>
                  <ItemStyle Width="150px"></ItemStyle>
                        <asp:Label ID="txtDesc" Text='<%# Eval("P_name") %>' runat="server" />
                    </EditItemTemplate>
            

                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="150px"></HeaderStyle>

                    <ItemStyle HorizontalAlign="Right" VerticalAlign="Middle" Width="150px"></ItemStyle>
                </asp:TemplateField>

                <%--المؤلف--%>
                <asp:TemplateField HeaderText="حالة الطلب" ItemStyle-Width="150px">
                    <ItemTemplate>
                        <asp:Label Text='<%# Eval("order_status") %>' runat="server" />
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtstatus" Text='<%# Eval("order_status") %>' runat="server" />
                    </EditItemTemplate>
                    <ItemStyle Width="150px"></ItemStyle>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
            </div>

    <asp:Label ID="lblSuccessMsg" Text="" runat="server" ForeColor="Green" />
        <br />
        <asp:Label ID="lblErrorMsg" Text="" runat="server" ForeColor="Red" />
</asp:Content>