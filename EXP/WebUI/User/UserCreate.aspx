<%@ Page language="c#" MasterPageFile="~/MasterPage.master" Inherits="Light.EXP.WebUI.User.UserCreate" CodeFile="UserCreate.aspx.cs" CodeFileBaseClass="Light.EXP.WebUI.SystemFrame.PageBase" Theme="Default"%>
<asp:Content ID="cntnUserCreate" ContentPlaceHolderID="cphPage" Runat="Server">
	<table cellspacing="0" cellpadding="0" width="609" height="470" align="center" border="0">
		<tr>
			<td align="center" background="../Images/wla_top005.gif">
				<table cellspacing="0" cellpadding="0" width="609" border="0">
					<tr>
						<td align="right" width="342">
						    <strong>用户增加</strong>
						</td>
						<td align="right" width="267">
						    <a href="../Index.aspx" target="_self">
						        <img height="24" src="../Images/wla_top019.gif" width="21" border="0" alt="图片无法显示"/>
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
							<table cellspacing="0" cellpadding="3" width="570" border="0">
								<tr bgcolor="#ffffff">
									<td align="right" width="60">登录ID： </td>
									<td width="191"  align="left">
										<asp:TextBox id="txtbUserID" runat="server"></asp:TextBox>
										<font color="red">*</font>
									</td>
									<td width="70">用户名称：</td>
									<td width="201"  align="left">
										<asp:TextBox id="txtbUserName" runat="server"></asp:TextBox>
										<font color="red">*</font>
									</td>
								</tr>
								<tr bgcolor="#f4f9ff">
									<td align="right">性别： </td>
									<td  align="left">
										<asp:RadioButtonList id="rdblSex" RepeatDirection="Horizontal" Runat="server" Font-Size="9pt">
											<asp:ListItem Value="1" Selected="True">男</asp:ListItem>
											<asp:ListItem Value="2">女</asp:ListItem>
										</asp:RadioButtonList>
									</td>
									<td>出生日期：</td>
									<td  align="left">
										<asp:TextBox id="txtbBirthday" runat="server"></asp:TextBox>
										<asp:RangeValidator ID="rvBirthday" runat="server" ErrorMessage="出生日期格式:yyyy-mm-dd" ControlToValidate="txtbBirthday" MinimumValue="1900-01-01" MaximumValue="2010-12-31" Type="Date">*</asp:RangeValidator>
									</td>
								</tr>
								<tr bgcolor="#ffffff">
									<td align="right" colspan="4">
										<asp:ImageButton ID="imgbCreate" Runat="server" ImageUrl="../Images/anniu010.gif"></asp:ImageButton>
										<asp:ImageButton ID="imgbCancel" Runat="server" ImageUrl="../Images/anniu004.gif"></asp:ImageButton>
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
			    <img height="21" src="../Images/wla_top007.gif" width="609" alt="图片无法显示"/>
			</td>
		</tr>
	</table>
</asp:Content>

