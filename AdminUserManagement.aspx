<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.Master" AutoEventWireup="true" CodeBehind="AdminUserManagement.aspx.cs" Inherits="DigitalRepository.AdminUserManagement" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <link href="css/tableOt.css" rel="stylesheet" />
    <link href="css/PageIndicator.css" rel="stylesheet" />
    <link href="css/popup.css" rel="stylesheet" />
    <link href="css/btns.css" rel="stylesheet" />

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="line">
        <a class="textB" href="AdminHomepage.aspx">لوحة التحكم </a>
        <label class="textB">&lt</label>
        <a class="textC">ادارة المستخدمين</a>
        <i class="fa-solid fa-pen-to-square icon"></i>
    </div>


    <div style="width: 100%; overflow: scroll;">
            <asp:GridView ID="UsersGridView" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateColumns="false" ShowFooter="true" DataKeyNames="Id" HorizontalAlign="Center" Width="300px" ShowHeaderWhenEmpty="true" OnRowCommand="UsersGridView_RowCommand" OnRowEditing="UsersGridView_RowEditing" OnRowUpdating="UsersGridView_RowUpdating" OnRowCancelingEdit="UsersGridView_RowCancelingEdit" OnRowDeleting="UsersGridView_RowDeleting">
                <AlternatingRowStyle BackColor="White" />
                <EditRowStyle BackColor="#7C6F57" />
                <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#E3EAEB" />
                <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F8FAFA" />
                <SortedAscendingHeaderStyle BackColor="#246B61" />
                <SortedDescendingCellStyle BackColor="#D4DFE1" />
                <SortedDescendingHeaderStyle BackColor="#15524A" />
                <Columns>
                    <%--                        الاسم--%>
                    <asp:TemplateField HeaderText="الاسم" ItemStyle-Width="150px" ItemStyle-HorizontalAlign="Right" ItemStyle-VerticalAlign="Middle" HeaderStyle-Width="150px" HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Middle" ControlStyle-Width="150px">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("FirstName") %>' runat="server" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtFirstName" Text='<%# Eval("FirstName") %>' runat="server" />
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtFirstNameFooter" runat="server" />
                        </FooterTemplate>
                    </asp:TemplateField>

                    <%--                        اللقب--%>
                    <asp:TemplateField HeaderText="اللقب" ItemStyle-Width="150px" HeaderStyle-Width="150px" ItemStyle-HorizontalAlign="Right" ItemStyle-VerticalAlign="Middle" HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Middle">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("LastName") %>' runat="server" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtLastName" Text='<%# Eval("LastName") %>' runat="server" />
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtLastNameFooter" runat="server" />
                        </FooterTemplate>
                    </asp:TemplateField>

                    <%--                        كلمة المرور--%>
                    <asp:TemplateField HeaderText="كلمة المرور" ItemStyle-Width="100px">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("Password") %>' runat="server" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtPassword" Text='<%# Eval("Password") %>' runat="server" />
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtPasswordFooter" runat="server" />
                        </FooterTemplate>
                    </asp:TemplateField>

                    <%--                        الايميل--%>
                    <asp:TemplateField HeaderText="البريد الإلكتروني">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("Email") %>' runat="server" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtEmail" Text='<%# Eval("Email") %>' runat="server" />
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtEmailFooter" runat="server" />
                        </FooterTemplate>
                    </asp:TemplateField>

                    <%--                        الصلاحية--%>
                    <asp:TemplateField HeaderText="الصلاحية" ItemStyle-Width="60px">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("Role") %>' runat="server" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtRole" Text='<%# Eval("Role") %>' runat="server" />
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtRoleFooter" runat="server" />
                        </FooterTemplate>
                    </asp:TemplateField>

                    <%--                        رقم الجوال--%>
                    <asp:TemplateField HeaderText="رقم الجوال">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("PhoneNum") %>' runat="server" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtPhoneNum" Text='<%# Eval("PhoneNum") %>' runat="server" />
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtPhoneNumFooter" runat="server" />
                        </FooterTemplate>
                    </asp:TemplateField>

                    <%--                        تاريخ الميلاد--%>
                    <asp:TemplateField HeaderText="تاريخ الميلاد">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("BirthDate") %>' runat="server" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtBirthDate" Text='<%# Eval("BirthDate") %>' runat="server" />
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtBirthDateFooter" runat="server" />
                        </FooterTemplate>
                    </asp:TemplateField>

                    <%--                        العنوان--%>
                    <asp:TemplateField HeaderText="العنوان">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("Address") %>' runat="server" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtAddress" Text='<%# Eval("Address") %>' runat="server" />
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtAddressFooter" runat="server" />
                        </FooterTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:Button runat="server" CommandName="Edit" ToolTip="Edit" Text="تعديل" class="btn1"/>
                            <asp:Button runat="server" CommandName="Delete" ToolTip="Delete" Text="حذف" class="btn2"/>
                        </ItemTemplate>

                        <EditItemTemplate>
                            <asp:Button runat="server" CommandName="Update" ToolTip="Update" Text="تحديث" class="btn1"/>
                            <asp:Button runat="server" CommandName="Cancel" ToolTip="Cancel" Text="الغاء" class="btn2"/>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:Button runat="server" CommandName="AddNew" ToolTip="AddNew" Text="اضافة مستخدم" class="btn1"/>
                        </FooterTemplate>
                    </asp:TemplateField>

                </Columns>
            </asp:GridView>

            <br />
            <asp:Label ID="lblSuccessMsg" Text="" runat="server" ForeColor="Green" />
            <br />
            <asp:Label ID="lblErrorMsg" Text="" runat="server" ForeColor="Red" />
        </div>













    <%--<div>
        <table dir="rtl" class="tab3">
            <thead>
                <tr>
                    <td>اسم المستخدم </td>
                    <td>صلاحية المستخدم </td>
                </tr>
            </thead>
            <tr>
                <td>سارة</td>
                <td>
                    <button class="btn1">تعديل</button>
                    <button class="btn2" onclick="openPopup()">حذف</button></td>
            </tr>
            <tr>
                <td>العنود</td>
                <td>
                    <button class="btn1">تعديل</button>
                    <button class="btn2" onclick="openPopup()">حذف</button></td>
            </tr>
            <tr>
                <td>فاطمة</td>
                <td>
                    <button class="btn1">تعديل</button>
                    <button class="btn2" onclick="openPopup()">حذف</button></td>
            </tr>
        </table>
        <<div>
            <button style="margin-right: 700px; margin-top: 50px;">اضافة مستخدم</button>
            <asp:Button ID="Button1" runat="server" CssClass="btn1" style="margin-right: 43.7%; margin-top: 50px; width: 160px;" Text="اضافة مستخدم" onclick="Button1_Click"/>
        </div>
    </div>--%>

    <div class="Popup" id="Popupdelprdc">
        <div class="bg">
            <!--اضافة الصورة-->
            <!-- <img src="warring.png">-->
            <h2>هل انت متأكد من حذف المستخدم؟</h2>
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
