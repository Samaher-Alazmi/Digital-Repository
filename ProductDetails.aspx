<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="ProductDetails.aspx.cs" Inherits="DigitalRepository.ProductDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <link href="css/Products.css" rel="stylesheet" />
    <link href="css/PageIndicator.css" rel="stylesheet" />

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

  

     <asp:DataList ID="DataList1" runat="server" DataKeyField="Id" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="DataList1_SelectedIndexChanged">
            <ItemTemplate>

       <div class="line">
        <a class="textB" href="Index.aspx">المنتجات </a>
        <label class="textB">&lt</label>
        <a class="textB" href="##" onClick="history.go(-1); return false;" > <%# Eval("p_type") %></a>     
         <label class="textB">&lt</label>
        <a class="textC">تفاصيل المنتج</a>
        <i class="fa fa-home icon"></i>

    </div>

    <div>

        <asp:Image ID="Image1" runat="server" width="300" height="300" class="picture" ImageUrl= '<%# Eval("p_picture") %>' />
   <div class="head">
   <p style="margin-bottom:0;">  <%# Eval("p_name") %>  </p>
   <p style=" margin:0; margin-bottom:0; padding-top:0;">من اعداد:   <%# Eval("p_author") %> </p>
   <p style="padding-top:0;"><%# Eval("p_price") %> SR</p>
   </div>

   <div class="detail">
   <p style="color:brown">/<%# Eval("p_name") %></p>

   <p style="margin-bottom:0;"><%# Eval("p_description") %></p>
 
   </div>

   <br ><br ><br ><br ><br ><br ><br ><br ><br ><br ><br><br>

   <div>
   <a href="##" onClick="history.go(-1); return false;"><button class="btn11">رجوع</button></a>
   </div>

   </div>
                     </ItemTemplate>
        </asp:DataList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:conString %>" SelectCommand="SELECT [Id], [p_price], [p_description], [p_name], [p_picture], [p_type] , [p_author] FROM [Product] WHERE ([Id] = @Id)">
            <SelectParameters>
                <asp:QueryStringParameter Name="Id" QueryStringField="id" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
  

</asp:Content>
