<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.Master" AutoEventWireup="true" CodeBehind="AdminUploadProductApproval.aspx.cs" Inherits="DigitalRepository.AdminUploadProductApproval" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/Products.css" rel="stylesheet" />
    <link href="css/btns.css" rel="stylesheet" />
    <link href="css/PageIndicator.css" rel="stylesheet" />
    <link href="css/popup.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="line">
        <a class="textB" href="AdminHomepage.aspx"> لوحة التحكم </a>
        <label class ="textB">&lt</label>
        <a class="textB" href="AdminProductManagement.aspx">ادارة المنتجات</a>
        <label class ="textB">&lt</label>
        <a class="textC">اعتماد رفع طلب منتج جديد</a>
        <i class="fa-solid fa-pen-to-square icon" ></i>
    </div>

      <label style="color: #1A645C; font-weight:bolder;" class="title">اعتماد رفع طلب منتج جديد</label>
    <div>
        <div style="width: 100%; overflow: scroll;">
        <asp:GridView ID="UsersGridView" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" DataKeyNames="Id" HorizontalAlign="Center" Width="900px" ShowHeaderWhenEmpty="True" OnRowEditing="UsersGridView_RowEditing" OnRowUpdating="UsersGridView_RowUpdating" OnRowCancelingEdit="UsersGridView_RowCancelingEdit" OnRowDeleting="UsersGridView_RowDeleting" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
            <AlternatingRowStyle BackColor="White" HorizontalAlign="Center" VerticalAlign="Middle" />
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
                 <asp:TemplateField  HeaderText="تحديد حالة الطلب" ItemStyle-Width="500px" ItemStyle-HorizontalAlign="Right" ItemStyle-VerticalAlign="Middle" HeaderStyle-Width="150px" HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Middle" ControlStyle-Width="150px">
                    <ItemTemplate>
                        <asp:Button runat="server" CommandName="Edit" Cssclass="btn1" ToolTip="Edit" Text="ادارة الطلب" />
                        <asp:Button runat="server" CommandName="Delete" Cssclass="btn2" ToolTip="Delete" Text="حذف" />
                    </ItemTemplate>

                    <EditItemTemplate >
                        <asp:Button runat="server" CommandName="Update" Cssclass="btn1" ToolTip="Update" Text="قبول" />
                        <asp:Button runat="server" CommandName="Cancel" Cssclass="btn2" ToolTip="Cancel" Text="رفض" />
                    </EditItemTemplate>

<ControlStyle Width="150px"></ControlStyle>

<HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="150px"></HeaderStyle>

<ItemStyle HorizontalAlign="Right" VerticalAlign="Middle" Width="500px"></ItemStyle>
                    </asp:TemplateField>
                <%--السعر--%>
                <asp:TemplateField HeaderText="سعر المنتج" ItemStyle-Width="150px" ItemStyle-HorizontalAlign="Right" ItemStyle-VerticalAlign="Middle" HeaderStyle-Width="150px" HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Middle" ControlStyle-Width="150px">
                    <ItemTemplate>
                        <asp:Label Text='<%# Eval("p_price") %>' runat="server" />
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:Label ID="txtPrice" Text='<%# Eval("p_price") %>' runat="server" />
                    </EditItemTemplate>
            
                    <ControlStyle Width="150px"></ControlStyle>

                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="150px"></HeaderStyle>

                    <ItemStyle HorizontalAlign="Right" VerticalAlign="Middle" Width="150px"></ItemStyle>
                </asp:TemplateField>

               <%-- الوصف--%>
                <asp:TemplateField HeaderText="الوصف" ItemStyle-Width="150px" HeaderStyle-Width="150px" ItemStyle-HorizontalAlign="Right" ItemStyle-VerticalAlign="Middle" HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Middle">
                    <ItemTemplate>
                        <asp:Label Text='<%# Eval("p_description") %>' runat="server" />
                    </ItemTemplate>
                    <EditItemTemplate>
                  <ItemStyle Width="150px"></ItemStyle>
                        <asp:Label ID="txtDesc" Text='<%# Eval("p_description") %>' runat="server" />
                    </EditItemTemplate>
            

                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="150px"></HeaderStyle>

                    <ItemStyle HorizontalAlign="Right" VerticalAlign="Middle" Width="150px"></ItemStyle>
                </asp:TemplateField>

                <%--المؤلف--%>
                <asp:TemplateField HeaderText="المؤلف" ItemStyle-Width="150px">
                    <ItemTemplate>
                        <asp:Label Text='<%# Eval("p_author") %>' runat="server" />
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:Label ID="txtAuthor" Text='<%# Eval("p_author") %>' runat="server" />
                    </EditItemTemplate>
                    <ItemStyle Width="150px"></ItemStyle>
                </asp:TemplateField>

                <%--التصنيف--%>
                <asp:TemplateField HeaderText="التصنيف" ItemStyle-Width="150px">
                    <ItemTemplate>
                        <asp:Label Text='<%# Eval("p_type") %>' runat="server" />
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:Label ID="txtType" Text='<%# Eval("p_type") %>' runat="server" />
                    </EditItemTemplate>
             <ItemStyle Width="150px"></ItemStyle>

                </asp:TemplateField>

                <%--اسم المنتج--%>
                <asp:TemplateField HeaderText="اسم المنتج" ItemStyle-Width="150px">
                    <ItemTemplate>
                        <asp:Label Text='<%# Eval("p_name") %>' runat="server" />
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:Label ID="txtName" Text='<%# Eval("p_name") %>' runat="server" />
                    </EditItemTemplate>

                    <ItemStyle Width="150px"></ItemStyle>
                </asp:TemplateField>

                 <%--صورة المنتج--%>  
                 <asp:TemplateField HeaderText="صورة المنتج" ItemStyle-Width="150px">
                     <ItemTemplate>
                        <asp:Image ImageUrl='<%# Eval("p_picture") %>' Height="150px" Width="150px" runat="server" />
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:Image ID="txtPic" ImageUrl= '<%# Eval("p_picture") %>'  Height="150px" Width="150px" runat="server" />
                    </EditItemTemplate>

<ItemStyle Width="150px"></ItemStyle>
                   </asp:TemplateField>


                    
            </Columns>
        </asp:GridView>

        <br />
        <asp:Label ID="lblSuccessMsg" Text="" runat="server" ForeColor="Green" />
        <br />
        <asp:Label ID="lblErrorMsg" Text="" runat="server" ForeColor="Red" />
    </div>

    </div>

</asp:Content>