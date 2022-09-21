using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Data;
using System.Web.UI.WebControls;
using Light.EXP.Business.Dispatch;
using Light.EXP.Model.Dispatch;
using Light.EXP.SystemFrameworks;
using Light.EXP.WebUI.SystemFrame;



public partial class Dispatch_BillReturnDetailView : System.Web.UI.Page {
    protected void Page_Load(object sender, EventArgs e) {
        if (!IsPostBack) {
            BindLoadGoods();
        }
    }

    private DataSet GetPagerData(int pageIndex, ref Int64 totalCount) {
        // 通过合同编号获取到合同PKID，从而获取完整DataSet
        string goodsRevertBillCode = Request.QueryString[0].ToString();
        BillReturnParentBusiness parentBusiness = new BillReturnParentBusiness();
        BillReturnParent bill = parentBusiness.GetBillReturn(goodsRevertBillCode);
        int pkid = bill.PkId;
        BillReturnDetailBusiness business = new BillReturnDetailBusiness();
        DataSet data = business.GetLoadedGoods(pkid);
        CaculateLoad(data.Tables[0]);
        totalCount = data.Tables[0].Rows.Count;

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

    private void CaculateLoad(DataTable loadGoods) {
        int totalPieceAmount = loadGoods.Rows.Count;
        if (totalPieceAmount == 0) return;
        double totalWeight = 0;
        for (int i = 0; i < totalPieceAmount; i++) {
            totalWeight += double.Parse(loadGoods.Rows[i]["Weight"].ToString());
        }
        double totalVolume = 0;
        for (int i = 0; i < totalPieceAmount; i++) {
            totalVolume += double.Parse(loadGoods.Rows[i]["Volume"].ToString());
        }
        lblTotalLoad.Text = totalPieceAmount.ToString();
        lblTotalLoadWeight.Text = totalWeight.ToString();
        lblTotalLGoodsVolume.Text = totalVolume.ToString();
    }

    private void BindLoadGoods() {
        dtpLoadGoods.BindDataPage(GetPagerData, 10);
    }

    protected void imgbReturn_Click(object sender, ImageClickEventArgs e) {
        Response.Redirect("BillReturnList.aspx");
    }
}