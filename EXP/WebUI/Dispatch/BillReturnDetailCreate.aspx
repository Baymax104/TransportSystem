<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="BillReturnDetailCreate.aspx.cs" Inherits="Dispatch_BillReturnDetailCreate" %>
<%@ Register Src="../Controls/DataPager.ascx" TagName="DataPager" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cphPage" Runat="Server">
    <table height="100%" cellspacing="0" cellpadding="0" width="609" align="center" border="0">
    <tr>
        <td align="center" background="../Images/wla_top005.gif" height="24">
            <table cellspacing="0" cellpadding="0" width="609" border="0">
                <tr>
                    <td align="right" width="342">
                        <strong>运输货物信息编辑</strong>
                    </td>
                    <td align="right" width="267">
                        <a href="../index.htm" target="_self">
                            <img height="24" src="../Images/wla_top019.gif" width="21" border="0" alt=""/>
                        </a>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td valign="top" align="center" background="../Images/wla_top006.gif" height="100%">
            <br />
            <table class="text" bordercolor="#ffffff" cellspacing="1" cellpadding="3" width="572" bgcolor="#7d7d7d" border="0">
                <tr>
                    <td align="center" bgcolor="#a4ceeb">
                    <asp:GridView ID="gridLoadGoods" runat="server" style="margin-left: 0px" Width="100%" Height="100%" AutoGenerateColumns="False" HeaderStyle-Height="50px" RowStyle-Height="30px" RowStyle-HorizontalAlign="Center" RowStyle-BackColor="White" HeaderStyle-BackColor="#a8cdf3">
                        <Columns>
                            <asp:TemplateField HeaderText="货运单编号">
                                <ItemTemplate>
                                    <asp:Label ID="Label" runat="server" Text='<%# Bind("GoodsBillCode") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="品名">
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("GoodsName") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="货号（件）">
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("GoodsCode") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="件数">
                                <ItemTemplate>
                                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("PieceAmount") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="重量">
                                <ItemTemplate>
                                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("Weight") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="体积">
                                <ItemTemplate>
                                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("Volume") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="中转地">
                                <ItemTemplate>
                                    <asp:Label ID="Label6" runat="server" Text='<%# Bind("TransferStation") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="卸货件数" ItemStyle-Width="20%">
                                <ItemTemplate>
                                    <asp:TextBox ID="LoadNumber" runat="server" Width="70%" Text='<%# Bind("PieceAmount") %>'></asp:TextBox>
                                    <asp:CheckBox ID="CheckLoad" runat="server" />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <HeaderStyle BackColor="#A8CDF3" Height="50px"></HeaderStyle>
                        <RowStyle HorizontalAlign="Center" BackColor="White" Height="30px"></RowStyle>
                    </asp:GridView>
                    </td>
                </tr>                        
            </table>
            <table width="572" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td style="height: 5px">
                        <uc1:DataPager ID="dtpLoadGoods" runat="server" ControlNameToPager="gridLoadGoods" />
                    </td>
                </tr>
            </table>
            <table width="572" border="0" cellpadding="3" cellspacing="1" bgcolor="#7d7d7d">
                <tr>
                    <td align="right" bgcolor="#ffffff">
                        总件数：<asp:Label ID="lblTotalLoad" Text="0" runat="server"></asp:Label>
                        总重量：<asp:Label ID="lblTotalLoadWeight" Text="0" runat="server"></asp:Label>
                        总体积：<asp:Label ID="lblTotalLGoodsVolume" Text="0" runat="server"></asp:Label>
                        <asp:ImageButton runat="server" ImageUrl="~/Images/an011.gif" ID="imgbSelectAllLGoods" OnClick="imgbSelectAllLGoods_Click" />
                        <asp:ImageButton runat="server" ImageUrl="~/Images/an015.gif" ID="imgbCancleSelectLGoods" OnClick="imgbCancleSelectLGoods_Click" />
                        <asp:ImageButton runat="server" ImageUrl="~/Images/an012.gif" ID="imgbUnload" OnClick="imgbUnload_Click" />
                    </td>
                </tr>
            </table>
            <table width="572" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td>&nbsp;</td>
                </tr>
            </table>
            <table width="572" border="0" cellpadding="1" cellspacing="0" bgcolor="#7d7d7d">
                <tr bgcolor="#ffffff">
                    <td style="width: 60%; text-align: left;">
                        起点：
                        <asp:DropDownList ID="drdlStartStation" runat="server">
                            <asp:ListItem>[全部]</asp:ListItem>
                        </asp:DropDownList>
                        终点：
                        <asp:DropDownList ID="drdlEndStation" runat="server">
                            <asp:ListItem>[全部]</asp:ListItem>
                        </asp:DropDownList>
                        <asp:ImageButton ID="imbSearch" ImageUrl="~/Images/wla_top016.gif" ImageAlign="Middle" runat="server" OnClick="imbSearch_Click" />
                    </td>
                    <td style="width: 40%; text-align: right;">
                        <asp:ImageButton ID="imgbSend" runat="server" ImageUrl="~/Images/an013.gif" OnClick="imgbSend_Click"/>
                        <asp:ImageButton ID="imgbReturn" runat="server" ImageUrl="~/Images/anniu005.gif" OnClick="imgbReturn_Click" />
                    </td>
                </tr>
            </table>
            
            <table width="572" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td height="5"></td>
                </tr>
            </table>
            <table width="572" border="0" cellpadding="3" cellspacing="1" bgcolor="#7d7d7d">
                <tr>
                    <td align="right" bgcolor="#ffffff">
                        总件数：<asp:Label ID="lblTotalULoad" Text="0" runat="server"></asp:Label>
                        总重量：<asp:Label ID="lblTotalULoadWeight" Text="0" runat="server"></asp:Label>
                        总体积：<asp:Label ID="lblTotalULGoodsVolume" Text="0" runat="server"></asp:Label>
                        <asp:ImageButton ID="imgbSelectAllULGoods" ImageUrl="~/Images/an011.gif" runat="server" OnClick="imgbSelectAllULGoods_Click" />
                        <asp:ImageButton ID="imgbCancleSelectULGoods" ImageUrl="~/Images/an015.gif" runat="server" OnClick="imgbCancleSelectULGoods_Click" />
                        <asp:ImageButton ID="imgbLoadGoods" ImageUrl="~/Images/an014.gif" runat="server" OnClick="imgbLoadGoods_Click" />
                    </td>
                </tr>
            </table>
            <table width="572" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td height="5">
                        <uc1:DataPager ID="dtpUnloadGoods" runat="server" ControlNameToPager="gridUnloadGoods" />
                    </td>
                </tr>
            </table>
            <table class="text" bordercolor="#ffffff" cellspacing="1" cellpadding="3" width="572" bgcolor="#7d7d7d" border="0">
                <tr>
                    <td align="center" bgcolor="#a4ceeb">
                        <asp:GridView ID="gridUnloadGoods" runat="server" style="margin-left: 0px" Width="100%" Height="100%" AutoGenerateColumns="False" HeaderStyle-Height="50px" RowStyle-Height="30px" RowStyle-HorizontalAlign="Center" RowStyle-BackColor="White" HeaderStyle-BackColor="#a8cdf3">
                            <Columns>
                                <asp:TemplateField HeaderText="货运单编号">
                                    <ItemTemplate>
                                        <asp:Label ID="Label" runat="server" Text='<%# Bind("GoodsBillCode") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="品名">
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("GoodsName") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="货号（件）">
                                    <ItemTemplate>
                                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("GoodsCode") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="剩余件数">
                                    <ItemTemplate>
                                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("RemainPieceCount") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="重量">
                                    <ItemTemplate>
                                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("Weight") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="体积">
                                    <ItemTemplate>
                                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("Volume") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="中转地">
                                    <ItemTemplate>
                                        <asp:Label ID="Label6" runat="server" Text='<%# Bind("TransferStation") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="装货件数" ItemStyle-Width="20%">
                                    <ItemTemplate>
                                        <asp:TextBox ID="UnloadNumber" runat="server" Width="70%" Text='<%# Bind("RemainPieceCount") %>'></asp:TextBox>
                                        <asp:CheckBox ID="CheckUnload" runat="server" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <HeaderStyle BackColor="#A8CDF3" Height="50px"></HeaderStyle>
                            <RowStyle HorizontalAlign="Center" BackColor="White" Height="30px"></RowStyle>
                        </asp:GridView>
                    </td>
                </tr>                        
            </table>
        </td>
    </tr>
    <tr>
        <td>
            <img height="21" src="../Images/wla_top007.gif" width="609" alt=""/>
        </td>
    </tr>
    </table>
</asp:Content>

