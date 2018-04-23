using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using DevExpress.Web;

namespace WebApplication2
{
    public partial class _Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e) {
        }

        protected void ASPxGridView1_AfterPerformCallback(object sender, DevExpress.Web.ASPxGridViewAfterPerformCallbackEventArgs e) {
            if (e.CallbackName == "STARTEDIT") {
                int index = ((ASPxGridView)sender).EditingRowVisibleIndex;
                string val = ((ASPxGridView)sender).GetRowValues(index, "Description").ToString();
                ASPxTextBox box = ((ASPxGridView)sender).FindEditFormTemplateControl("ASPxTextBox2") as ASPxTextBox;
                box.Text = val;
            }
        }
        protected void ASPxGridView1_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e) {
            ASPxTextBox box = ((ASPxGridView)sender).FindEditFormTemplateControl("ASPxTextBox2") as ASPxTextBox;
            e.NewValues["Description"] = box.Text;
        }
    }
}
