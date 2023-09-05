<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.Master" AutoEventWireup="true" CodeBehind="AdminFreelancerManagement.aspx.cs" Inherits="DigitalRepository.AdminFreelancerManagement" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <link href="css/tableOt.css" rel="stylesheet" />
    <link href="css/PageIndicator.css" rel="stylesheet" />
    <link href="css/popup.css" rel="stylesheet" />

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="line">
        <a class="textB" href="AdminHomepage.aspx"> لوحة التحكم </a>
        <label class ="textB">&lt</label>
        <a class="textC">ادارة أصحاب العمل الحر</a>
        <i class="fa-solid fa-pen-to-square icon" ></i>
    </div>

      <div style="width: 100%; overflow: scroll;">
        <asp:GridView ID="UsersGridView" runat="server" CellPadding="4" ForeColor="#333333" AutoGenerateColumns="False" ShowFooter="True" DataKeyNames="Id" HorizontalAlign="Center" Width="1000px" ShowHeaderWhenEmpty="True" OnRowEditing="UsersGridView_RowEditing" OnRowUpdating="UsersGridView_RowUpdating" OnRowCancelingEdit="UsersGridView_RowCancelingEdit" OnRowDeleting="UsersGridView_RowDeleting">
            <AlternatingRowStyle BackColor="White" />
            <EditRowStyle BackColor="#7C6F57" />
            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" VerticalAlign="Middle" />
            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#E3EAEB" HorizontalAlign="Center" VerticalAlign="Middle" />
            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" HorizontalAlign="Center" VerticalAlign="Middle" />
            <SortedAscendingCellStyle BackColor="#F8FAFA" />
            <SortedAscendingHeaderStyle BackColor="#246B61" />
            <SortedDescendingCellStyle BackColor="#D4DFE1" />
            <SortedDescendingHeaderStyle BackColor="#15524A" />
            <Columns>
                <asp:TemplateField HeaderText="العنوان" HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle" HeaderStyle-Width="100px" ItemStyle-Width="100px">
                    <EditItemTemplate>
                        <asp:Label ID="txtAddress" Text='<%# Eval("Address") %>' runat="server" />
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label Text='<%# Eval("Address") %>' runat="server" />
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle"></HeaderStyle>
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="تاريخ الميلاد" FooterStyle-HorizontalAlign="NotSet" HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
                    <EditItemTemplate>
                        <asp:Label ID="txtBirthDate" Text='<%# Eval("BirthDate") %>' runat="server" />
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label Text='<%# Eval("BirthDate") %>' runat="server" />
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle"></HeaderStyle>
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="النبذة" HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Justify" ItemStyle-VerticalAlign="Middle">
                    <EditItemTemplate>
                        <asp:Label ID="txtBrief" Text='<%# Eval("Brief") %>' runat="server" />
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label Text='<%# Eval("Brief") %>' runat="server" />
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle"></HeaderStyle>
                    <ItemStyle HorizontalAlign="Justify" VerticalAlign="Middle"></ItemStyle>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="الصلاحية" ItemStyle-Width="90px" HeaderStyle-HorizontalAlign="Right" HeaderStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
                    <EditItemTemplate>
                        <asp:Label ID="txtRole" Text='<%# Eval("Role") %>' runat="server" />
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label Text='<%# Eval("Role") %>' runat="server" />
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Right" VerticalAlign="Middle"></HeaderStyle>
                    <ItemStyle Width="60px"></ItemStyle>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="رقم الجوال" HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
                    <EditItemTemplate>
                        <asp:Label ID="txtPhoneNum" Text='<%# Eval("PhoneNum") %>' runat="server" />
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label Text='<%# Eval("PhoneNum") %>' runat="server" />
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle"></HeaderStyle>
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="كلمة المرور" ItemStyle-Width="90px" ItemStyle-HorizontalAlign="Right" ItemStyle-VerticalAlign="Middle" HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Middle" HeaderStyle-Width="90px">
                    <EditItemTemplate>
                        <asp:Label ID="txtPassword" Text='<%# Eval("Password") %>' runat="server" />
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label Text='<%# Eval("Password") %>' runat="server" />
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle"></HeaderStyle>
                    <ItemStyle Width="100px"></ItemStyle>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="البريد الإلكتروني" HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle" HeaderStyle-Width="100px" ItemStyle-Width="100px">
                    <EditItemTemplate>
                        <asp:Label ID="txtEmail" Text='<%# Eval("Email") %>' runat="server" />
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label Text='<%# Eval("Email") %>' runat="server" />
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="100px"></HeaderStyle>
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="100px"></ItemStyle>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="اللقب" ItemStyle-Width="100px" HeaderStyle-Width="100px" ItemStyle-HorizontalAlign="Right" ItemStyle-VerticalAlign="Middle" HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Middle">
                    <ItemTemplate>
                        <asp:Label Text='<%# Eval("LastName") %>' runat="server" />
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:Label ID="txtLastName" Text='<%# Eval("LastName") %>' runat="server" />
                    </EditItemTemplate>
                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="150px"></HeaderStyle>
                    <ItemStyle HorizontalAlign="Right" VerticalAlign="Middle" Width="150px"></ItemStyle>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="الاسم" ItemStyle-Width="100px" ItemStyle-HorizontalAlign="Right" ItemStyle-VerticalAlign="Middle" HeaderStyle-Width="100px" HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Middle" ControlStyle-Width="150px">
                    <ItemTemplate>
                        <asp:Label Text='<%# Eval("FirstName") %>' runat="server" />
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:Label ID="txtFirstName" Text='<%# Eval("FirstName") %>' runat="server" />
                    </EditItemTemplate>
                    <ControlStyle Width="100px"></ControlStyle>
                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="100px"></HeaderStyle>
                    <ItemStyle HorizontalAlign="Right" VerticalAlign="Middle" Width="100px"></ItemStyle>
                </asp:TemplateField>
                

                <asp:TemplateField HeaderText="الحالة">
                    <ItemTemplate>
                        <asp:Button runat="server" CommandName="Edit" ToolTip="Edit" Text="إدارة" class="btn1"/>
                        <asp:Button runat="server" CommandName="Delete" ToolTip="Delete" Text="حذف" class="btn2"/>
                    </ItemTemplate>

                    <EditItemTemplate>
                        <asp:Button runat="server" CommandName="Update" ToolTip="Update" Text="قبول" class="btn1"/>
                        <asp:Button runat="server" CommandName="Cancel" ToolTip="Cancel" Text="رفض" class="btn2" />
                    </EditItemTemplate>

                </asp:TemplateField>

            </Columns>
        </asp:GridView>

        <br />
        <asp:Label ID="lblSuccessMsg" Text="" runat="server" ForeColor="Green" />
        <br />
        <asp:Label ID="lblErrorMsg" Text="" runat="server" ForeColor="Red" />
    </div>

    <div class="Popup" id="PopupSignUp">
        <div class="bg">
            <img src="Images/tick.jpeg" />
            <h2>تم القبول بنجاح</h2>
            <!--اذا بضيف برجراف-->
            <!--- <p></p>-->
            <button type="button" class="button11" onclick="closePopup()">تم</button>
        </div>
    </div>


    <div class="Popup" id="PopupDeleteUser"> 
        <div class="bg">
        <!--اضافة الصورة-->
        <!-- <img src="warring.png">-->
       <h2> سبب الرفض</h2>
       <br>
       <textarea id="Rejct" name="Rejct"></textarea>
       <br>
       <!--اذا بضيف برجراف-->
      <!--- <p></p>-->
    </div>
      <div class="btns">
        <button type="button" class="button12" onclick="closePopup()">الغاء</button>
        <button type="button" class="button11" onclick="DeletePrdct()">تأكيد</button>
      </div>
    </div>

    
    <script>
        let Popup = document.getElementById("PopupSignUp", "PopupDeleteUser");
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

    <%--<script>
        let Popup = document.getElementById("PopupDeleteUser");
        function openPopup2() {
            Popup.classList.add("open-Popup");

        }
        function closePopup2() {
            Popup.classList.remove("open-Popup");

        }
        function DeletePrdct() {
            Popup.classList.remove("open-Popup")
        }
  </script>--%>

</asp:Content>
