<%@ Page Title="" Language="C#" MasterPageFile="~/FreelancerMaster.Master" AutoEventWireup="true" CodeBehind="FreelancerProducts.aspx.cs" Inherits="DigitalRepository.FreelancerProducts" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <link href="css/PageIndicator.css" rel="stylesheet" />
    <link href="css/Amal.css" rel="stylesheet" />
    <link href="css/FreelancerProducts.css" rel="stylesheet" />
    <link href="css/btn_edit.css" rel="stylesheet" />
    <link href="css/btns.css" rel="stylesheet" />

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="line">
        <a class="textB" href="Index.aspx">الصفحة الرئيسية </a>
        <label class="textB">&lt</label>
        <a class="textB" href="FreelancerProfile.aspx">الملف الشخصي</a>
        <label class="textB">&lt</label>
        <a class="textC">منتجاتي</a>
        <i class="fa fa-home icon"></i>
    </div>

    <div class="page-wrapper">
        <div class="navstructor" dir="rtl">
            <a class="linkbtn" href="FreelancerProfile.aspx" target="_self">الملف الشخصي</a>
            <a class="linkbtn" href="FreelancerProducts.aspx" target="_self">منتجاتي</a>
            <a class="linkbtn" href="FreelancerUploadProductDetails.aspx" target="_self">رفع منتج جديد</a>
            <a class="linkbtn" href="FreelancerOrderTracking.aspx" target="_self">تتبع الطلبات</a>
        </div>
         </div>
        <div class="profile-container" style="min-height: 375px;">
            <br />
            <br />
            
            <asp:GridView runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource1" ID="GridView1" AllowPaging="True" 
                AllowSorting="True" HeaderStyle-BackColor="#1A645C" ForeColor="Black" AlternatingRowStyle-BackColor="#C0EFD9" HeaderStyle-ForeColor="White" 
                RowStyle-HorizontalAlign="Center" RowStyle-VerticalAlign="Middle" AlternatingRowStyle-HorizontalAlign="Center"
                AlternatingRowStyle-VerticalAlign="Middle" BackColor="White" HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Middle" HorizontalAlign="Center"
                >
        <AlternatingRowStyle HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#C0EFD9"></AlternatingRowStyle>
            <Columns>

                <asp:CommandField ButtonType="Button" CancelText="إلغاء"  DeleteText="حذف"  HeaderText="حذف المنتج" ShowDeleteButton="True" ControlStyle-CssClass="btn2" >
                    <ControlStyle BackColor="#E3A344" BorderStyle="None" Font-Size="Medium" ForeColor="White" Width="50px" />
                <HeaderStyle Font-Bold="True" Font-Size="Large" />
                    </asp:CommandField>
                <asp:BoundField DataField="p_price" HeaderText="السعر" SortExpression="p_price"></asp:BoundField>
                <asp:BoundField DataField="p_description" HeaderText="الوصف " SortExpression="p_description"></asp:BoundField>
                <asp:BoundField DataField="p_author" HeaderText="المؤلف" SortExpression="p_author"></asp:BoundField> 
                <asp:BoundField DataField="p_type" HeaderText="التصنيف" SortExpression="p_type"></asp:BoundField>
                <asp:BoundField DataField="p_name" HeaderText="اسم المنتج" SortExpression="p_name"></asp:BoundField>
               <asp:ImageField DataImageUrlField="p_picture" HeaderText="صورة المنتج"
                         ControlStyle-Width="150" ItemStyle-Width="150"
                         ControlStyle-Height="150" ItemStyle-Height="150" >
               <ControlStyle Height="150px" Width="150px"></ControlStyle>
               <ItemStyle Height="150px" Width="150px"></ItemStyle>
                    </asp:ImageField>
            </Columns>

<HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#1A645C" ForeColor="White"></HeaderStyle>

<RowStyle HorizontalAlign="Center" VerticalAlign="Middle"></RowStyle>
        </asp:GridView>
        <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:conString %>' SelectCommand="SELECT * FROM [Products_temp] WHERE ([Email] = @Email)" ConflictDetection="CompareAllValues" DeleteCommand="DELETE FROM [Product_temp] WHERE [Id] = @original_Id AND [p_price] = @original_p_price AND [p_description] = @original_p_description AND [p_author] = @original_p_author AND [p_name] = @original_p_name AND [p_type] = @original_p_type AND (([p_picture] = @original_p_picture) OR ([p_picture] IS NULL AND @original_p_picture IS NULL))" InsertCommand="INSERT INTO [Product] ([p_price], [p_description], [p_author], [p_name], [p_type], [p_picture]) VALUES (@p_price, @p_description, @p_author, @p_name, @p_type, @p_picture)" OldValuesParameterFormatString="original_{0}" UpdateCommand="UPDATE [Product] SET [p_price] = @p_price, [p_description] = @p_description, [p_author] = @p_author, [p_name] = @p_name, [p_type] = @p_type, [p_picture] = @p_picture WHERE [Id] = @original_Id AND [p_price] = @original_p_price AND [p_description] = @original_p_description AND [p_author] = @original_p_author AND [p_name] = @original_p_name AND [p_type] = @original_p_type AND (([p_picture] = @original_p_picture) OR ([p_picture] IS NULL AND @original_p_picture IS NULL))">

            <DeleteParameters>
                <asp:Parameter Name="original_Id" Type="Int32"></asp:Parameter>
                <asp:Parameter Name="original_p_price" Type="Double"></asp:Parameter>
                <asp:Parameter Name="original_p_description" Type="String"></asp:Parameter>
                <asp:Parameter Name="original_p_author" Type="String"></asp:Parameter>
                <asp:Parameter Name="original_p_name" Type="String"></asp:Parameter>
                <asp:Parameter Name="original_p_type" Type="String"></asp:Parameter>
                <asp:Parameter Name="original_p_picture" Type="String"></asp:Parameter>
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="p_price" Type="Double"></asp:Parameter>
                <asp:Parameter Name="p_description" Type="String"></asp:Parameter>
                <asp:Parameter Name="p_author" Type="String"></asp:Parameter>
                <asp:Parameter Name="p_name" Type="String"></asp:Parameter>
                <asp:Parameter Name="p_type" Type="String"></asp:Parameter>
                <asp:Parameter Name="p_picture" Type="String"></asp:Parameter>
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="p_price" Type="Double"></asp:Parameter>
                <asp:Parameter Name="p_description" Type="String"></asp:Parameter>
                <asp:Parameter Name="p_author" Type="String"></asp:Parameter>
                <asp:Parameter Name="p_name" Type="String"></asp:Parameter>
                <asp:Parameter Name="p_type" Type="String"></asp:Parameter>
                <asp:Parameter Name="p_picture" Type="String"></asp:Parameter>
                <asp:Parameter Name="original_Id" Type="Int32"></asp:Parameter>
                <asp:Parameter Name="original_p_price" Type="Double"></asp:Parameter>
                <asp:Parameter Name="original_p_description" Type="String"></asp:Parameter>
                <asp:Parameter Name="original_p_author" Type="String"></asp:Parameter>
                <asp:Parameter Name="original_p_name" Type="String"></asp:Parameter>
                <asp:Parameter Name="original_p_type" Type="String"></asp:Parameter>
                <asp:Parameter Name="original_p_picture" Type="String"></asp:Parameter>
            </UpdateParameters>
            <SelectParameters>
                 <asp:SessionParameter Name="Email" SessionField="id" Type="String" />
             </SelectParameters>
        </asp:SqlDataSource>
    </div>
            

</asp:Content>