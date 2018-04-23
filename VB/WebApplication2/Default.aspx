<%@ Page Language="vb" AutoEventWireup="true" CodeBehind="Default.aspx.vb" Inherits="WebApplication2._Default" %>

<%@ register Assembly="DevExpress.Web.ASPxGridView.v8.3" Namespace="DevExpress.Web.ASPxGridView"
    TagPrefix="dxwgv" %>
<%@ register Assembly="DevExpress.Web.ASPxEditors.v8.3" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <dxwgv:aspxgridview ID="ASPxGridView1" runat="server" AutoGenerateColumns="False"
            DataSourceID="AccessDataSource1" KeyFieldName="CategoryID" OnAfterPerformCallback="ASPxGridView1_AfterPerformCallback" OnRowUpdating="ASPxGridView1_RowUpdating"><Columns>
                <dxwgv:gridviewcommandcolumn VisibleIndex="0">
                    <editbutton Visible="True">
                    </editbutton>
                </dxwgv:gridviewcommandcolumn>
<dxwgv:GridViewDataTextColumn FieldName="CategoryID" ReadOnly="True" VisibleIndex="1">
<EditFormSettings Visible="False"></EditFormSettings>

</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn FieldName="CategoryName" VisibleIndex="2"></dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn FieldName="Description" VisibleIndex="3"></dxwgv:GridViewDataTextColumn>
</Columns>
            <templates>
                <editform>
                    <table>
                      <tr>
                        <td>CategoryID:</td>
                        <td>
                            <dxe:aspxlabel ID="ASPxLabel1" runat="server" Text='<%#Eval("CategoryID")%>'>
                            </dxe:aspxlabel>
                        </td>
                      </tr>
                      <tr>
                        <td>CategoryName:</td>
                        <td>
                            <dxe:aspxtextbox ID="ASPxTextBox1" runat="server" Width="170px" Text='<%#Bind("CategoryName")%>'>
                            </dxe:aspxtextbox>
                        </td>
                      </tr>
                      <tr>
                        <td>Description:</td>
                        <td>
                            <dxe:aspxtextbox ID="ASPxTextBox2" runat="server" Width="170px" BackColor="LemonChiffon">
                            </dxe:aspxtextbox>
                        </td>
                      </tr>
                      <tr>
                        <td></td>
                        <td style="font-size:x-small">*yellow is unbound</td>
                      </tr>
                    </table>

                    <dxwgv:aspxgridviewtemplatereplacement ReplacementType="EditFormUpdateButton" ID="Upd" runat="server">
                    </dxwgv:aspxgridviewtemplatereplacement>
                    <dxwgv:aspxgridviewtemplatereplacement ReplacementType = "EditFormCancelButton" ID="Cancel" runat="server">
                    </dxwgv:aspxgridviewtemplatereplacement>
                </editform>
            </templates>
</dxwgv:aspxgridview>

    </div>
        <asp:accessdatasource ID="AccessDataSource1" runat="server" DataFile="~/App_Data/nwind.mdb"
            SelectCommand="SELECT * FROM [Categories]" DeleteCommand="DELETE FROM [Categories] WHERE [CategoryID] = ?" InsertCommand="INSERT INTO [Categories] ([CategoryID], [CategoryName], [Description], [Picture]) VALUES (?, ?, ?, ?)" UpdateCommand="UPDATE [Categories] SET [CategoryName] = ?, [Description] = ?, [Picture] = ? WHERE [CategoryID] = ?">
            <deleteparameters>
                <asp:parameter Name="CategoryID" Type="Int32" />
            </deleteparameters>
            <updateparameters>
                <asp:parameter Name="CategoryName" Type="String" />
                <asp:parameter Name="Description" Type="String" />
                <asp:parameter Name="Picture" Type="Object" />
                <asp:parameter Name="CategoryID" Type="Int32" />
            </updateparameters>
            <insertparameters>
                <asp:parameter Name="CategoryID" Type="Int32" />
                <asp:parameter Name="CategoryName" Type="String" />
                <asp:parameter Name="Description" Type="String" />
                <asp:parameter Name="Picture" Type="Object" />
            </insertparameters>
        </asp:accessdatasource>
    </form>
</body>
</html>