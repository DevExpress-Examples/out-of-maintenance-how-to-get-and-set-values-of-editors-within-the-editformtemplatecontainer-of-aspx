Imports Microsoft.VisualBasic
Imports System
Imports System.Data
Imports System.Configuration
Imports System.Collections
Imports System.Web
Imports System.Web.Security
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.Web.UI.WebControls.WebParts
Imports System.Web.UI.HtmlControls
Imports DevExpress.Web.ASPxGridView
Imports DevExpress.Web.ASPxEditors

Namespace WebApplication2
	Partial Public Class _Default
		Inherits System.Web.UI.Page
		Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs)

		End Sub

		Protected Sub ASPxGridView1_AfterPerformCallback(ByVal sender As Object, ByVal e As DevExpress.Web.ASPxGridView.ASPxGridViewAfterPerformCallbackEventArgs)
			If e.CallbackName = "STARTEDIT" Then
				Dim index As Integer = (CType(sender, ASPxGridView)).EditingRowVisibleIndex
				Dim val As String = (CType(sender, ASPxGridView)).GetRowValues(index, "Description").ToString()
				Dim box As ASPxTextBox = TryCast((CType(sender, ASPxGridView)).FindEditFormTemplateControl("ASPxTextBox2"), ASPxTextBox)
				box.Text = val

			End If


		End Sub

		Protected Sub ASPxGridView1_RowUpdating(ByVal sender As Object, ByVal e As DevExpress.Web.Data.ASPxDataUpdatingEventArgs)
			Dim box As ASPxTextBox = TryCast((CType(sender, ASPxGridView)).FindEditFormTemplateControl("ASPxTextBox2"), ASPxTextBox)
			e.NewValues("Description") = box.Text
		End Sub
	End Class
End Namespace
