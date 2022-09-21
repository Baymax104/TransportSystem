<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="BillReturnList.aspx.cs" Inherits="Dispatch_BillReturnList" %>
<%@ Register Src="../Controls/DataPager.ascx" TagName="DataPager" TagPrefix="uc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cphPage" Runat="Server">
    <table height="100%" cellspacing="0" cellpadding="0" width="609" align="center" border="0">
    <tr>
        <td align="center" background="../Images/wla_top005.gif" height="24">
            <table cellspacing="0" cellpadding="0" width="609" border="0">
                <tr>
                    <td align="right" width="342">
                        <strong>运输合同信息查询</strong>
                    </td>
                    <td align="right" width="267">
                        <a href="../index.htm" target="_self">
                            <img height="24" src="../Images/wla_top019.gif" width="21" border="0" alt="关闭"/>
                        </a>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td valign="top" align="center" background="../Images/wla_top006.gif" height="100%">
            <table cellspacing="0" cellpadding="0" width="572" border="0">
                <tr>
                    <td>
                        <table cellspacing="0" cellpadding="0" width="572" border="0">
                            <tr>
                                <td valign="bottom"><img height="12" src="../Images/wla_top013.gif" width="572" alt="分割线"/></td>
                            </tr>
                            <tr>
                                <td align="center" background="../Images/wla_top014.gif">
                                    <table cellspacing="1" cellpadding="1" width="95%" border="0" align="center">
                                        <tr>
                                            <td style="width: 12%; text-align: left;">
                                                司机名称：
                                            </td>
                                            <td style="width: 28%; text-align: left;">
                                                <asp:TextBox ID="txtbDriverName" Width="140px" runat="server"></asp:TextBox>
                                            </td>
                                            <td style="width: 12%; text-align: left;">
                                                合同编号：
                                            </td>
                                            <td style="width: 48%; text-align: left;">
                                                <asp:TextBox ID="txtbGoodsRevertBillCode" runat="server"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="text-align: left;">
                                                合同状态：
                                            </td>
                                            <td style="text-align: left">
                                                <asp:DropDownList ID="drdlBackBillState" runat="server">
                                                    <asp:ListItem>[全部]</asp:ListItem>
                                                    <asp:ListItem>未出</asp:ListItem>
                                                    <asp:ListItem>在途</asp:ListItem>
                                                    <asp:ListItem>回执</asp:ListItem>
                                                </asp:DropDownList>
                                            </td>
                                            <td style="text-align: left;">
                                                时间范围：
                                            </td>
                                            <td style="text-align: left">
                                                <asp:TextBox ID="txtbBeginSignTime" runat="server" Width="60px"></asp:TextBox>
                                                到
                                                <asp:TextBox ID="txtbEndSignTime" Width="60px" runat="server"></asp:TextBox>
                                                &nbsp;
                                                <asp:ImageButton ID="imgbQuery" ImageUrl="~/Images/wla_top016.gif" ImageAlign="Middle" runat="server" OnClick="imgbQuery_Click"/>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td><img height="4" src="../Images/wla_top015.gif" width="572" alt="分割线"/></td>
                            </tr>
                        </table>							  
                    </td>
                </tr>
            </table>
            <table width="572" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td>&nbsp;</td>
                </tr>
            </table>
            <table cellspacing="0" cellpadding="0" width="572" border="0">
                <tr>
                    <td align="center">
                        <asp:GridView ID="gridBillReturns" runat="server" style="margin-left: 0px" Width="100%" Height="100%" AutoGenerateColumns="False" HeaderStyle-Height="50px" RowStyle-Height="30px" RowStyle-HorizontalAlign="Center" RowStyle-BackColor="White" HeaderStyle-BackColor="#a8cdf3">
                            <Columns>
                                <asp:TemplateField HeaderText="合同编号">
                                    <ItemTemplate>
                                        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Eval("GoodsRevertBillCode","BillReturnUpdate.aspx?GoodsRevertBillCode={0}") %>' Text='<%# Eval("GoodsRevertBillCode") %>' Target="_parent"></asp:HyperLink>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="司机名称">
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("DriverName") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="总运费">
                                    <ItemTemplate>
                                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("AllCarriage", "{0:F2}") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="保险费">
                                    <ItemTemplate>
                                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("Insurance", "{0:F2}") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="装货地点">
                                    <ItemTemplate>
                                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("LoadStation") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="交货地点">
                                    <ItemTemplate>
                                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("DealGoodsStation") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="起运时间">
                                    <ItemTemplate>
                                        <asp:Label ID="Label6" runat="server" Text='<%# Bind("StartCarryTime", "{0:d}") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="到达时间">
                                    <ItemTemplate>
                                        <asp:Label ID="Label7" runat="server" Text='<%# Bind("ArriveTime", "{0:d}") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="签订时间">
                                    <ItemTemplate>
                                        <asp:Label ID="Label8" runat="server" Text='<%# Bind("SignTime", "{0:d}") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="合同状态">
                                    <ItemTemplate>
                                        <asp:Label ID="Label9" runat="server" Text='<%# Bind("BackBillState") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <HeaderStyle BackColor="#A8CDF3" Height="50px"></HeaderStyle>
                            <RowStyle HorizontalAlign="Center" BackColor="White" Height="30px"></RowStyle>
                        </asp:GridView>
                    </td>
                </tr>
            </table>
            <table cellspacing="0" cellpadding="0" width="572" border="0">
                <tr>
                    <td align="center" height="6">
					    <uc2:DataPager ID="dtpBillReturn" runat="server" ControlNameToPager="gridBillReturns"/>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td><img height="21" src="../Images/wla_top007.gif" width="609" alt="分割线"/></td>
    </tr> 
    </table>
</asp:Content>

