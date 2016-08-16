using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;
using System.Data;

namespace ChurchRecordkeeping.UserScreens
{
    public partial class addDonation : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!Page.IsPostBack)
            {
                BindGrid();
            }



        }

        #region CouponTitle_NeedDataSource
        protected void CouponTitle_NeedDataSource(object sender, GridNeedDataSourceEventArgs e)
        {

            gvmember.DataSource = null;
            gvmember.DataBind();
        }
        #endregion

        #region BindGrid()
        private void BindGrid()
        {
            DataTable dt = new DataTable();
            {
                gvmember.DataSource = dt;
                gvmember.DataBind();
            }
        }
        #endregion
    }
}