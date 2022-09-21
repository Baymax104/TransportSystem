<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="BillReturnDetailView.aspx.cs" Inherits="Dispatch_BillReturnDetailView" %>
<%@ Register Src="../Controls/DataPager.ascx" TagName="DataPager" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cphPage" Runat="Server">
    <table cellspacing="0" cellpadding="0" width="609" height="100%" align="center" border="0">
    <tr>
        <td align="center" background="../Images/wla_top005.gif">
            <table cellspacing="0" cellpadding="0" width="609" border="0">
                <tr>
                    <td align="right" width="342">
                        <strong>运输货物信息查看</strong>
                    </td>
                    <td align="right" width="267">
                        <a href="../Index.htm" target="_self">
                            <img height="24" src="../Images/wla_top019.gif" width="21" border="0" alt=""/>
                        </a>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td valign="top" align="center" background="../Images/wla_top006.gif" height="100%">
            <table width="572" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td align="center">
                <br />
                    <asp:GridView ID="gridLoadGoods" runat="server" style="margin-left: 0px" Width="100%" Height="100%" AutoGenerateColumns="False" HeaderStyle-Height="50px" RowStyle-Height="30px" RowStyle-HorizontalAlign="Center" RowStyle-BackColor="White" HeaderStyle-BackColor="#a8cdf3">
                        <Columns>
                            <asp:TemplateField HeaderText="货主名称">
                                <ItemTemplate>
                                    <asp:Label ID="Label" runat="server" Text='<%# Bind("SendGoodsCustomer") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="品名">
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("GoodsName") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="件数">
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("PieceAmount") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="中转地">
                                <ItemTemplate>
                                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("TransferStation") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="货主电话">
                                <ItemTemplate>
                                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("SendGoodsCustomerTel") %>'></asp:Label>
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
                <td height="8">
			        <uc1:DataPager ID="dtpLoadGoods" runat="server" ControlNameToPager="gridLoadGoods"/>
                </td>
              </tr>
            </table>
            <table width="572" border="0" cellpadding="3" cellspacing="1" bgcolor="#7d7d7d" class="text">
                <tr>
                    <td bgcolor="#ffffff">
                        <span runat="server" style="text-align:left">
                                已装货物 
                                总件数：
                            <asp:Label ID="lblTotalLoad" Text="0" runat="server"></asp:Label>
                            &nbsp
                                总重量：
                            <asp:Label ID="lblTotalLoadWeight" Text="0" runat="server"></asp:Label>
                            &nbsp
                                总体积：
                            <asp:Label ID="lblTotalLGoodsVolume" Text="0" runat="server"></asp:Label>
                        </span>
                        &nbsp
                        <asp:ImageButton ID="imgbReturn" ImageUrl="~/Images/anniu005.gif" ImageAlign="Right" runat="server" OnClick="imgbReturn_Click"/>
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

