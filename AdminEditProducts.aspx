<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.Master" AutoEventWireup="true" CodeBehind="AdminEditProducts.aspx.cs" Inherits="DigitalRepository.AdminEditProducts" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <link href="css/tableOt.css" rel="stylesheet" />
    <link href="css/PageIndicator.css" rel="stylesheet" />
    <link href="css/popup.css" rel="stylesheet" />
    <link href="css/btn_edit.css" rel="stylesheet" />
    <link href="css/btns.css" rel="stylesheet" />

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="line" aria-expanded="true">
        <a class="textB" href="AdminHomepage.aspx"> لوحة التحكم </a>
        <label class ="textB">&lt</label>
        <a class="textB" href="AdminProductManagement.aspx">ادارة المنتجات</a>
        <label class ="textB">&lt</label>
        <a class="textC">تعديل المنتجات</a>
        <i class="fa-solid fa-pen-to-square icon" ></i>
    </div>

    <div aria-pressed="undefined">


        <asp:GridView runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource1" ID="GridView1" AllowPaging="True" AllowSorting="True" HeaderStyle-BackColor="#1A645C" ForeColor="Black" AlternatingRowStyle-BackColor="#C0EFD9" HeaderStyle-ForeColor="White" RowStyle-HorizontalAlign="Center" RowStyle-VerticalAlign="Middle" AlternatingRowStyle-HorizontalAlign="Center" AlternatingRowStyle-VerticalAlign="Middle" BackColor="White" HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Middle" HorizontalAlign="Center" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
<AlternatingRowStyle HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#C0EFD9"></AlternatingRowStyle>
            <Columns>
                <asp:CommandField ButtonType="Button" CancelText="إلغاء" DeleteText="حذف" HeaderText="حذف المنتج" ShowDeleteButton="True" ControlStyle-CssClass="btn2"  />
                <asp:TemplateField HeaderText="تعديل المنتج" SortExpression="Edit"> 
                    <ItemTemplate>
                        <a class="btn1" href= '<%#"AdminEditProductDetails.aspx?Id="+DataBinder.Eval(Container.DataItem,"Id") %>'>تعديل</a>
                       <%-- <asp:Button ID="Update" runat="server" Text="تعديل" commandName="updat" OnRowCommand="Update_Click" OnClick="GridView1_RowCommand"   />
                    --%></ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="p_price" HeaderText="السعر" SortExpression="p_price"></asp:BoundField>
                <asp:BoundField DataField="p_description" HeaderText="الوصف" SortExpression="p_description"></asp:BoundField>
                <asp:BoundField DataField="p_author" HeaderText="المؤلف" SortExpression="p_author"></asp:BoundField>
                <asp:BoundField DataField="p_name" HeaderText="اسم المنتج" SortExpression="p_name"></asp:BoundField>
                <asp:BoundField DataField="p_type" HeaderText="التصنيف" SortExpression="p_type"></asp:BoundField>
               <asp:ImageField DataImageUrlField="p_picture" HeaderText="صورة االمنتج"
                         ControlStyle-Width="150" ItemStyle-Width="150"
                         ControlStyle-Height="150" ItemStyle-Height="150" >
               <ControlStyle Height="150px" Width="150px"></ControlStyle>
               <ItemStyle Height="150px" Width="150px"></ItemStyle>
                    </asp:ImageField>
            </Columns>

<HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#1A645C" ForeColor="White"></HeaderStyle>

<RowStyle HorizontalAlign="Center" VerticalAlign="Middle"></RowStyle>
        </asp:GridView>
        <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:conString %>' SelectCommand="SELECT * FROM [Product]" ConflictDetection="CompareAllValues" DeleteCommand="DELETE FROM [Product] WHERE [Id] = @original_Id AND [p_price] = @original_p_price AND [p_description] = @original_p_description AND [p_author] = @original_p_author AND [p_name] = @original_p_name AND [p_type] = @original_p_type AND (([p_picture] = @original_p_picture) OR ([p_picture] IS NULL AND @original_p_picture IS NULL))" InsertCommand="INSERT INTO [Product] ([p_price], [p_description], [p_author], [p_name], [p_type], [p_picture]) VALUES (@p_price, @p_description, @p_author, @p_name, @p_type, @p_picture)" OldValuesParameterFormatString="original_{0}" UpdateCommand="UPDATE [Product] SET [p_price] = @p_price, [p_description] = @p_description, [p_author] = @p_author, [p_name] = @p_name, [p_type] = @p_type, [p_picture] = @p_picture WHERE [Id] = @original_Id AND [p_price] = @original_p_price AND [p_description] = @original_p_description AND [p_author] = @original_p_author AND [p_name] = @original_p_name AND [p_type] = @original_p_type AND (([p_picture] = @original_p_picture) OR ([p_picture] IS NULL AND @original_p_picture IS NULL))">
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
        </asp:SqlDataSource>
    </div>

    <div class="Popup" id="Popupdelprdc"> 
        <div class="bg">
        <!--اضافة الصورة-->
        <!-- <img src="warring.png">-->
       <h2> هل انت متأكد من حذف المنتج</h2>
       <!--اذا بضيف برجراف-->
      <!--- <p></p>-->
    
      <div>
        <button type="button" class="button12" onclick="closePopup()">الغاء</button>
        <button type="button" class="button11" onclick="DeletePrdct()">تأكيد</button>
      </div>
    </div>
        </div>

    

    <script>
        let Popup = document.getElementById("Popupdelprdc");
        function openPopup() {
            Popup.classList.add("open-Popup");

        }
        function closePopup() {
            Popup.classList.remove("open-Popup");

        }
        function DeletePrdct() {
            Popup.classList.remove("open-Popup")
        }
    </script>

</asp:Content>