<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="BillReturnUpdate.aspx.cs" Inherits="Dispatch_BillReturnUpdate" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphPage" Runat="Server">
    <table cellspacing="0" cellpadding="0" width="609" height="100%" align="center" border="0">
	    <tr>
		    <td align="center" background="../Images/wla_top005.gif">
			    <table cellspacing="0" cellpadding="0" width="609" border="0">
				    <tr>
					    <td align="right" width="342">
					        <strong>编辑运输合同</strong>
					    </td>
					    <td align="right" width="267">
					        <a href="../Index.htm" target="_self">
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
					    <td>&nbsp;</td>
				    </tr>
			    </table>
			    <table cellspacing="0" cellpadding="1" width="570" bgcolor="#7e7e7e" border="0">
				    <tr>
					    <td>
                            <table cellspacing="0" cellpadding="1" width="570" bgcolor="#7e7e7e" border="0">
                                <tr bgcolor="#ffffff">
                                    <td style="width: 25%; text-align:left">
                                        合同编号：
                                    </td>
                                    <td style="width: 27%; text-align:left">
                                        <asp:TextBox ID="txtbGoodsRevertBillCode" runat="server" Width ="85%"></asp:TextBox>
                                        <font color="red">*</font>                                
                                    </td>
                                    <td style="width: 20%; text-align:left">
                                        承运人：
                                    </td>
                                    <td style="width: 28%; text-align:left">
                                        <asp:ScriptManager ID="scriptManager1" runat="server"></asp:ScriptManager>
                                        <asp:UpdatePanel ID="updatePanel1" runat="server" UpdateMode="Conditional">
                                        <ContentTemplate>
                                            <asp:DropDownList ID="drdlDriver" runat="server" OnSelectedIndexChanged="drdlDriver_SelectedIndexChanged" AutoPostBack="true">
                                                <asp:ListItem>[请选择]</asp:ListItem>
                                            </asp:DropDownList>
                                            <font color="red">*</font>                                
                                        </ContentTemplate>
                                        </asp:UpdatePanel>
                                    </td>
                                </tr>
                                <tr bgcolor="#f4f9ff">
                                    <td style="text-align: left;">
                                        车牌号：
                                    </td>
                                    <td style="text-align: left;">
                                        <asp:TextBox ID="txtbCarNO" runat="server" Width="85%"></asp:TextBox>
                                    </td>
                                    <td style="text-align: left;">
                                        营运证：
                                    </td>
                                    <td style="text-align: left;">
                                        <asp:TextBox ID="txtbBizLicence" runat="server" Width="85%"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr bgcolor="#ffffff">
                                    <td style="text-align: left;">
                                        驾驶证：
                                    </td>
                                    <td style="text-align: left;">
                                        <asp:TextBox ID="txtbDriveLicence" runat="server" Width="85%"></asp:TextBox>
                                    </td>
                                    <td style="text-align: left;">
                                        行驶证：
                                    </td>
                                    <td style="text-align: left;">
                                        <asp:TextBox ID="txtbRunLicence" runat="server" Width="85%"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr bgcolor="#f4f9ff">
                                    <td style="text-align: left;">
                                        发货地：
                                    </td>
                                    <td style="text-align: left;">
                                        <asp:DropDownList ID="drdlLoadStation" runat="server">
                                            <asp:ListItem>[请选择]</asp:ListItem>
                                        </asp:DropDownList>
                                        <font color="red">*</font>                                
                                    </td>
                                    <td style="text-align: left;">
                                        起运时间：
                                    </td>
                                    <td style="text-align: left;">
                                        <asp:TextBox ID="txtbStartCarryTime" Width="85%" runat="server" Text="年/月/日" OnFocus="javascript:if(this.value=='年/月/日') {this.value=''}" OnBlur="javascript:if(this.value==''){this.value='年/月/日'}"></asp:TextBox>
                                        <font color="red">*</font>                                
                                    </td>
                                </tr>
                                <tr bgcolor="#ffffff">
                                    <td style="text-align: left;">
                                        交货地：
                                    </td>
                                    <td style="text-align: left;">
                                        <asp:DropDownList ID="drdldealGoodsStation" runat="server">
                                            <asp:ListItem>[请选择]</asp:ListItem>
                                        </asp:DropDownList>
                                        <font color="red">*</font>                                
								    </td>
                                    <td style="text-align: left;">
                                        到达时间：
                                    </td>
                                    <td style="text-align: left;">
                                    <asp:TextBox ID="txtbArriveTime" Width="85%" runat="server" Text="年/月/日" OnFocus="javascript:if(this.value=='年/月/日') {this.value=''}" OnBlur="javascript:if(this.value==''){this.value='年/月/日'}"></asp:TextBox>
                                    <font color="red">*</font>                                
                                    </td>
                                </tr>
                                <tr bgcolor="#f4f9ff">
                                    <td style="text-align: left;">
                                        收货联系人：
                                    </td>
                                    <td style="text-align: left;">
                                        <asp:TextBox ID="txtbReceiveGoodsLinkman" runat="server" Width="85%"></asp:TextBox>
                                        <font color="red">*</font>                                
                                    </td>
                                    <td style="text-align: left;">
                                        联系人电话：
                                    </td>
                                    <td style="text-align: left;">
                                        <asp:TextBox ID="txtbLinkmanPhone" runat="server" Width="85%"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr bgcolor="#ffffff">
                                    <td style="text-align: left;">
                                        联系人手机：
                                    </td>
                                    <td style="text-align: left;">
                                        <asp:TextBox ID="txtbLinkmanMobile" runat="server" Width="85%"></asp:TextBox>
                                    </td>
                                    <td style="text-align: left;">
                                        收货详细地址：
                                    </td>
                                    <td style="text-align: left;">
                                        <asp:TextBox ID="txtbDetailAddr" runat="server" Width="85%"></asp:TextBox>
                                        <font color="red">*</font>                                
                                    </td>
                                </tr>
                                <tr bgcolor="#f4f9ff">
                                    <td style="text-align: left;">
                                        承运人订装货物保证金：
                                    </td>
                                    <td style="text-align: left">
                                        <asp:TextBox ID="txtbCarryGoodsInsurance" runat="server" Width="85%"></asp:TextBox>
                                    </td>
                                    <td style="text-align: left;">
                                        配载服务费：
                                    </td>
                                    <td style="text-align: left;">
                                        <asp:TextBox ID="txtbDispatchServiceFee" runat="server" Width="85%"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr bgcolor="#ffffff">
                                    <td style="text-align: left;">
                                        运费结算方式：
                                    </td>
                                    <td style="text-align: left;">
                                        <asp:DropDownList ID="drdlCarriageBanlanceMode" runat="server" Width="85%">
                                            <asp:ListItem>到货</asp:ListItem>
                                            <asp:ListItem>回结</asp:ListItem>
                                            <asp:ListItem>现付</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                    <td style="text-align: left;">
                                        送货单回执押金：
                                    </td>
                                    <td style="text-align: left;">
                                        <asp:TextBox ID="txtbCarryGoodsBillDeposit" runat="server" Width="85%"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr bgcolor="#f4f9ff">
                                    <td style="text-align: left;">
                                        运输计价方式：
                                    </td>
                                    <td style="text-align: left;" colspan="3">
                                        <asp:DropDownList ID="drdlCarriageMode" runat="server">
                                            <asp:ListItem>重量</asp:ListItem>
                                            <asp:ListItem>体积</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr bgcolor="#ffffff">
                                    <td style="text-align: left; height: 22px;">
                                        总运费：
                                    </td>
                                    <td style="text-align: left; height: 22px;">
                                        <asp:TextBox ID="txtbAllCarriage" runat="server" Width="85%"></asp:TextBox>
                                    <font color="red">*</font>                                
                                    </td>
                                    <td style="text-align: left; height: 22px;">
                                        保险费：
                                    </td>
                                    <td style="text-align: left; height: 22px;">
                                        <asp:TextBox ID="txtbInsurance" runat="server" Width="85%"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr bgcolor="#f4f9ff">
                                    <td style="text-align: left;">
                                        预付费用：
                                    </td>
                                    <td style="text-align: left;">
                                        <asp:TextBox ID="txtbStartAdvance" runat="server" Width="85%"></asp:TextBox>
                                    </td>
                                    <td style="text-align: left;">
                                        签定时间：
                                    </td>
                                    <td style="text-align: left;">
                                        <asp:TextBox ID="txtbSignTime" Width="85%" runat="server" Text="年/月/日" OnFocus="javascript:if(this.value=='年/月/日') {this.value=''}" OnBlur="javascript:if(this.value==''){this.value='年/月/日'}"></asp:TextBox>
                                        <font color="red">*</font>                                
                                    </td>
                                </tr>
                                <tr bgcolor="#ffffff">
                                    <td style="text-align: left;">
                                        备注：
                                    </td>
                                    <td style="text-align: left;" colspan="3">
                                        <asp:TextBox TextMode="MultiLine" ID="txtbRemark" style="width: 306px; height: 53px" runat="server"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr bgcolor="#ffffff">
                                    <td style="text-align: left">
                                        <asp:ImageButton ID="imgGoods" ImageUrl="~/Images/an016.gif" runat="server" OnClick="imgGoods_Click"/>
                                    </td>
                                    <td colspan="3" style="text-align: right">
                                        &nbsp;
                                        <asp:ImageButton ID="imgUpdate" ImageUrl="~/Images/anniu009.gif" runat="server" OnClick="imgUpdate_Click" />
                                        <asp:ImageButton ID="imgDelete" ImageUrl="~/Images/anniu006.gif" runat="server" OnClick="imgDelete_Click" OnClientClick="javascript:return confirm('您确实要删除该记录吗？'); "/>
                                        <asp:ImageButton ID="imgbReturn" ImageUrl="~/Images/anniu005.gif" runat="server" OnClick="imgbReturn_Click" />
                                    </td>
                                </tr>
                            </table>
					    </td>
				    </tr>
			    </table>
		    </td>
	    </tr>
        <tr>
            <td>
                <img height="21" src="../Images/wla_top007.gif" width="609" alt="分割线"/>
            </td>
	    </tr>
    </table>        
</asp:Content>

