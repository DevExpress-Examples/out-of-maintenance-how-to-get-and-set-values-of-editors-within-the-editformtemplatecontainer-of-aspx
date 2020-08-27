<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebApplication2._Default" %>

<%@ Register Assembly="DevExpress.Web.v15.1, Version=15.1.15.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web"
	TagPrefix="dx" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<title>Untitled Page</title>
</head>
<body>
	<form id="form1" runat="server">
		<div>
			<dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False"
				DataSourceID="AccessDataSource1" KeyFieldName="CategoryID" OnAfterPerformCallback="ASPxGridView1_AfterPerformCallback" OnRowUpdating="ASPxGridView1_RowUpdating">
				<Columns>
					<dx:GridViewCommandColumn VisibleIndex="0" ShowEditButton="True" />
					<dx:GridViewDataTextColumn FieldName="CategoryID" ReadOnly="True" VisibleIndex="1">
						<EditFormSettings Visible="False"></EditFormSettings>
					</dx:GridViewDataTextColumn>
					<dx:GridViewDataTextColumn FieldName="CategoryName" VisibleIndex="2"></dx:GridViewDataTextColumn>
					<dx:GridViewDataTextColumn FieldName="Description" VisibleIndex="3"></dx:GridViewDataTextColumn>
				</Columns>
				<Templates>
					<EditForm>
						<table>
							<tr>
								<td>CategoryID:</td>
								<td>
									<dx:ASPxLabel ID="ASPxLabel1" runat="server" Text='<%#Eval("CategoryID") %>'>
									</dx:ASPxLabel>
								</td>
							</tr>
							<tr>
								<td>CategoryName:</td>
								<td>
									<dx:ASPxTextBox ID="ASPxTextBox1" runat="server" Width="170px" Text='<%#Bind("CategoryName") %>'>
									</dx:ASPxTextBox>
								</td>
							</tr>
							<tr>
								<td>Description:</td>
								<td>
									<dx:ASPxTextBox ID="ASPxTextBox2" runat="server" Width="170px" BackColor="LemonChiffon">
									</dx:ASPxTextBox>
								</td>
							</tr>
							<tr>
								<td></td>
								<td style="font-size: x-small">*yellow is unbound</td>
							</tr>
						</table>

						<dx:ASPxGridViewTemplateReplacement ReplacementType="EditFormUpdateButton" ID="Upd" runat="server"></dx:ASPxGridViewTemplateReplacement>
						<dx:ASPxGridViewTemplateReplacement ReplacementType="EditFormCancelButton" ID="Cancel" runat="server"></dx:ASPxGridViewTemplateReplacement>
					</EditForm>
				</Templates>
			</dx:ASPxGridView>

		</div>
		<asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="~/App_Data/nwind.mdb"
			SelectCommand="SELECT * FROM [Categories]" DeleteCommand="DELETE FROM [Categories] WHERE [CategoryID] = ?" InsertCommand="INSERT INTO [Categories] ([CategoryID], [CategoryName], [Description], [Picture]) VALUES (?, ?, ?, ?)" UpdateCommand="UPDATE [Categories] SET [CategoryName] = ?, [Description] = ?, [Picture] = ? WHERE [CategoryID] = ?">
			<DeleteParameters>
				<asp:Parameter Name="CategoryID" Type="Int32" />
			</DeleteParameters>
			<UpdateParameters>
				<asp:Parameter Name="CategoryName" Type="String" />
				<asp:Parameter Name="Description" Type="String" />
				<asp:Parameter Name="Picture" Type="Object" />
				<asp:Parameter Name="CategoryID" Type="Int32" />
			</UpdateParameters>
			<InsertParameters>
				<asp:Parameter Name="CategoryID" Type="Int32" />
				<asp:Parameter Name="CategoryName" Type="String" />
				<asp:Parameter Name="Description" Type="String" />
				<asp:Parameter Name="Picture" Type="Object" />
			</InsertParameters>
		</asp:AccessDataSource>
	</form>
</body>
</html>
