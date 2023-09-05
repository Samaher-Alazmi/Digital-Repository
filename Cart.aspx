<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="DigitalRepository.Cart" %>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">

    <link href="css/Cart.css" rel="stylesheet" />
    <link href="css/PageIndicator.css" rel="stylesheet" />

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="line" dir="rtl">
        <i class="fa fa-home icon"></i>
        <a class="textB" href="Index.aspx">الصفحة الرئيسية </a>
        <label class="textB">&gt</label>
        <a class="textC">السلة</a>
    </div>

     <div class="OuterBox">
       
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" DataKeyNames="Id" OnSelectedIndexChanged="GridView1_SelectedIndexChanged1">
            <Columns>
                <asp:CommandField ButtonType="Image" ShowDeleteButton="True" DeleteImageUrl="~/Images/DeleteIcon.png" DeleteText="" >
                <ControlStyle Width="40px" />
                </asp:CommandField>
                <asp:BoundField DataField="total_price" HeaderText="سعر المنتج" SortExpression="total_price" >
                <ControlStyle Font-Size="Medium" />
                <HeaderStyle Font-Bold="True" Font-Size="Large" />
                </asp:BoundField>
                <asp:BoundField DataField="product_amount" HeaderText="product_amount" SortExpression="product_amount" Visible="False" />
                <asp:BoundField DataField="num_product" HeaderText="num_product" SortExpression="num_product" Visible="False" />
                <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" Visible="False" />
                <asp:BoundField DataField="product_id" HeaderText="product_id" SortExpression="product_id" Visible="False" >
                </asp:BoundField>
                <asp:BoundField DataField="p_name" HeaderText="اسم المنتج" SortExpression="p_name" >
                <ControlStyle Font-Size="Medium" />
                <HeaderStyle Font-Bold="True" Font-Size="Large" />
                </asp:BoundField>
                <asp:BoundField DataField="Id" HeaderText="Id" SortExpression="Id" InsertVisible="False" ReadOnly="True" Visible="False" >
                </asp:BoundField>
            </Columns>
        </asp:GridView>
        <div class="box" dir="rtl">

        <div><img src="Images/calculater.png" alt="" style="width: 35px; margin-left: 20px;" /></div>
        <div class="cont">
            <div><asp:Label ID="Label1" runat="server" Text="مجموع السلة" ForeColor="#000066" ></asp:Label></div>
            <div><asp:Label ID="Result" runat="server"  ForeColor="#000066" ></asp:Label></div>
        </div>
    </div>

    <div class="position2">
     <asp:Button ID="Button1" class="Btn CheckoutB" runat="server" Text="اكمال الدفع" OnClick="Payment_click" />
    </div>
         <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:conString %>" SelectCommand="SELECT * FROM [Cart] WHERE ([Email] = @Email)" OldValuesParameterFormatString="original_{0}" DeleteCommand="DELETE FROM [Cart] WHERE [Id] = @original_Id" InsertCommand="INSERT INTO [Cart] ([total_price], [product_amount], [num_product], [Email], [product_id], [p_name]) VALUES (@total_price, @product_amount, @num_product, @Email, @product_id, @p_name)" UpdateCommand="UPDATE [Cart] SET [total_price] = @total_price, [product_amount] = @product_amount, [num_product] = @num_product, [Email] = @Email, [product_id] = @product_id, [p_name] = @p_name WHERE [Id] = @original_Id">
             <DeleteParameters>
                 <asp:Parameter Name="original_Id" Type="Int32" />
             </DeleteParameters>
             <InsertParameters>
                 <asp:Parameter Name="total_price" Type="Double" />
                 <asp:Parameter Name="product_amount" Type="Int32" />
                 <asp:Parameter Name="num_product" Type="Int32" />
                 <asp:Parameter Name="Email" Type="String" />
                 <asp:Parameter Name="product_id" Type="Int32" />
                 <asp:Parameter Name="p_name" Type="String" />
             </InsertParameters>
             <SelectParameters>
                 <asp:SessionParameter Name="Email" SessionField="id" Type="String" />
             </SelectParameters>
             <UpdateParameters>
                 <asp:Parameter Name="total_price" Type="Double" />
                 <asp:Parameter Name="product_amount" Type="Int32" />
                 <asp:Parameter Name="num_product" Type="Int32" />
                 <asp:Parameter Name="Email" Type="String" />
                 <asp:Parameter Name="product_id" Type="Int32" />
                 <asp:Parameter Name="p_name" Type="String" />
                 <asp:Parameter Name="original_Id" Type="Int32" />
             </UpdateParameters>
         </asp:SqlDataSource>

     </div>

</asp:Content>
