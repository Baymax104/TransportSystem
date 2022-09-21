using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Light.EXP.Business.Dispatch;
using Light.EXP.Model.Dispatch;
using Light.EXP.SystemFrameworks;
using Light.EXP.WebUI.SystemFrame;


public partial class Dispatch_BillReturnList : System.Web.UI.Page {
    protected void Page_Load(object sender, EventArgs e) {
        if (!IsPostBack) {
            InitDate();
            BindGridView();
        }
    }

    private DataSet GetPagerData(int pageIndex, ref Int64 totalCount) {

        // 根据输入条件获取符合条件的完整DataSet
        string backBillState = drdlBackBillState.SelectedIndex == 0 ? null : drdlBackBillState.SelectedValue;
        string driverName = txtbDriverName.Text.Length == 0 ? null : txtbDriverName.Text;
        string goodsRevertBillCode = txtbGoodsRevertBillCode.Text.Length == 0 ? null : txtbGoodsRevertBillCode.Text;
        DateTime beginSignTime = txtbBeginSignTime.Text.Length == 0 ? DateTime.Parse("1900-1-1") : DateTime.Parse(txtbBeginSignTime.Text);
        DateTime endSignTime = txtbEndSignTime.Text.Length == 0 ? DateTime.Parse("1900-1-1") : DateTime.Parse(txtbEndSignTime.Text);
        BillReturnParentBusiness business = new BillReturnParentBusiness();
        DataSet data = business.GetBillReturns(backBillState, driverName, goodsRevertBillCode, beginSignTime,                                   endSignTime);
        totalCount = data.Tables[0].Rows.Count;

        if (totalCount < (pageIndex - 1) * 10) {
            pageIndex = 1;
        }

        // 根据索引页数裁剪DataSet
        DataTable newTable = data.Tables[0].Clone();
        DataRow[] rows = data.Tables[0].Select();
        for (int i = (pageIndex - 1) * 10; i < totalCount &&  i < (pageIndex - 1) * 10 + 10; i++) {
            newTable.ImportRow(rows[i]);
        }
        DataSet newData = new DataSet();
        newData.Tables.Add(newTable);
        return newData;
    }

    private void BindGridView() {
        dtpBillReturn.BindDataPage(GetPagerData, 10);
    }

    protected void imgbQuery_Click(object sender, ImageClickEventArgs e) {
        if (CheckDateFormat()) BindGridView();
    }

    private bool CheckDateFormat() {
        // 判断输入是否符合日期格式
        string inputBeginTime = txtbBeginSignTime.Text;
        string inputEndTime = txtbEndSignTime.Text;
        DateTime beginSignTime, endSignTime;
        if (!DateTime.TryParse(inputBeginTime, out beginSignTime)) {
            Utility.AlertMsg(this, "输入日期格式错误！");
            return false;
        }
        if (!DateTime.TryParse(inputEndTime, out endSignTime)) {
            Utility.AlertMsg(this, "输入日期格式错误！");
            return false;
        }
        if (beginSignTime > endSignTime) {
            Utility.AlertMsg(this, "输入日期错误！");
            return false;
        }
        return true; // 当输入为空或有效日期时返回true
    }

    private void InitDate() {
        txtbBeginSignTime.Text = "1900/1/1";
        DateTime date = DateTime.Now;
        txtbEndSignTime.Text = date.ToString("d");
    }
}