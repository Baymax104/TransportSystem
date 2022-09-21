using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;
using Light.EXP.Business.Dispatch;
using Light.EXP.Model.Dispatch;
using Light.EXP.SystemFrameworks;
using Light.EXP.WebUI.SystemFrame;



public partial class Dispatch_BillReturnDetailCreate : System.Web.UI.Page {
    protected void Page_Load(object sender, EventArgs e) {
        if (!IsPostBack) {
            BindDropDownList();
            BindLoadGoods();
            BindUnloadGoods();
            imgbSend.Attributes["onclick"] = "javascript:return confirm('发货后不能再装货，您确定要发货吗？'); ";
        }
    }

    private void BindDropDownList() {
        BillReturnParentBusiness business = new BillReturnParentBusiness();

        DataTable cityTable = business.GetDispatchCitys().Tables[0];
        for (int i = 0; i < cityTable.Rows.Count; i++) {
            drdlStartStation.Items.Add(cityTable.Rows[i]["City"].ToString());
            drdlEndStation.Items.Add(cityTable.Rows[i]["City"].ToString());
        }
    }

    private DataSet GetPagerDataLoad (int pageIndex, ref Int64 totalCount) {
        BillReturnDetailBusiness detailBusiness = new BillReturnDetailBusiness();
        string pkid = HttpContext.Current.Request.QueryString[0].ToString();
        DataSet data = detailBusiness.GetLoadedGoods(int.Parse(pkid));
        totalCount = data.Tables[0].Rows.Count;
        CaculateLoad(data.Tables[0]);

        // 裁剪DataSet
        DataTable newTable = data.Tables[0].Clone();
        DataRow[] rows = data.Tables[0].Select();
        for (int i = (pageIndex - 1) * 5; i < totalCount &&  i < (pageIndex - 1) * 5 + 5; i++) {
            newTable.ImportRow(rows[i]);
        }
        DataSet newData = new DataSet();
        newData.Tables.Add(newTable);
        return newData;
    }

    private DataSet GetPagerDataUnload(int pageIndex, ref Int64 totalCount) {
        BillReturnDetailBusiness business = new BillReturnDetailBusiness();
        string sendAddr = drdlStartStation.SelectedIndex == 0 ? null : drdlStartStation.SelectedValue;
        string receiveAddr = drdlEndStation.SelectedIndex == 0 ? null : drdlEndStation.SelectedValue;
        DataSet data = business.GetUnloadGoods(sendAddr, receiveAddr);
        totalCount = data.Tables[0].Rows.Count;
        CaculateUnload(data.Tables[0]);

        // 裁剪DataSet
        DataTable newTable = data.Tables[0].Clone();
        DataRow[] rows = data.Tables[0].Select();
        for (int i = (pageIndex - 1) * 5; i < totalCount && i < (pageIndex - 1) * 5 + 5; i++) {
            newTable.ImportRow(rows[i]);
        }
        DataSet newData = new DataSet();
        newData.Tables.Add(newTable);
        return newData;
    }

    private void BindUnloadGoods() {
        dtpUnloadGoods.BindDataPage(GetPagerDataUnload, 5);
    }

    private void BindLoadGoods() {
        dtpLoadGoods.BindDataPage(GetPagerDataLoad, 5);
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

    private void CaculateUnload(DataTable unloadGoods) {
        int totalPieceAmount = unloadGoods.Rows.Count;
        if (totalPieceAmount == 0) return;
        double totalWeight = 0;
        for (int i = 0; i < totalPieceAmount; i++) {
            totalWeight += double.Parse(unloadGoods.Rows[i]["Weight"].ToString());
        }
        double totalVolume = 0;
        for (int i = 0; i < totalPieceAmount; i++) {
            totalVolume += double.Parse(unloadGoods.Rows[i]["Volume"].ToString());
        }
        lblTotalULoad.Text = totalPieceAmount.ToString();
        lblTotalULoadWeight.Text = totalWeight.ToString();
        lblTotalULGoodsVolume.Text = totalVolume.ToString();
    }


    protected void imgbReturn_Click(object sender, ImageClickEventArgs e) {
        Response.Redirect("BillReturnList.aspx");
    }

    protected void imgbSelectAllLGoods_Click(object sender, ImageClickEventArgs e) {
        for (int i = 0; i < gridLoadGoods.Rows.Count; i++) {
            CheckBox box = (CheckBox)gridLoadGoods.Rows[i].FindControl("CheckLoad");
            box.Checked = true;
        }
    }

    protected void imgbCancleSelectLGoods_Click(object sender, ImageClickEventArgs e) {
        for (int i = 0; i < gridLoadGoods.Rows.Count; i++) {
            CheckBox box = (CheckBox)gridLoadGoods.Rows[i].FindControl("CheckLoad");
            box.Checked = false;
        }
    }


    protected void imgbSelectAllULGoods_Click(object sender, ImageClickEventArgs e) {
        for (int i = 0; i < gridUnloadGoods.Rows.Count; i++) {
            CheckBox box = (CheckBox)gridUnloadGoods.Rows[i].FindControl("CheckUnload");
            box.Checked = true;
        }
    }

    protected void imgbCancleSelectULGoods_Click(object sender, ImageClickEventArgs e) {
        for (int i = 0; i < gridUnloadGoods.Rows.Count; i++) {
            CheckBox box = (CheckBox)gridUnloadGoods.Rows[i].FindControl("CheckUnload");
            box.Checked = false;
        }
    }

    protected void imgbSend_Click(object sender, ImageClickEventArgs e) {
        BillReturnDetailBusiness business = new BillReturnDetailBusiness();
        string pkid = HttpContext.Current.Request.QueryString[0].ToString();
        DataSet data = business.GetLoadedGoods(int.Parse(pkid));
        DataTable table = data.Tables[0];
        if (table.Rows.Count == 0) {
            Utility.AlertMsg(this, "没有装载货物，不能发货！");
            return;
        }
        string goodsBillCodes = "";
        for (int i = 0; i < table.Rows.Count; i++) {
            goodsBillCodes += (table.Rows[i]["GoodsBillCode"].ToString() + ",");
        }
        int length = goodsBillCodes.Length;
        string goodsCodes = goodsBillCodes.Remove(length - 1);
        business.TransportGood(int.Parse(pkid), goodsCodes);
        Response.Redirect("BillReturnList.aspx");
    }

    protected void imgbLoadGoods_Click(object sender, ImageClickEventArgs e) {
        BillReturnDetailBusiness business = new BillReturnDetailBusiness();
        string pkid = HttpContext.Current.Request.QueryString[0].ToString();
        DataSet data = business.GetUnloadGoods(null, null);
        BillReturnDetail bill = new BillReturnDetail();
        DataTable table = data.Tables[0];

        for (int i = 0; i < gridUnloadGoods.Rows.Count; i++) {
            CheckBox box = (CheckBox)gridUnloadGoods.Rows[i].FindControl("CheckUnload");
            TextBox text = (TextBox)gridUnloadGoods.Rows[i].FindControl("UnloadNumber");
            if (box.Checked == true) {
                int number;
                if (!int.TryParse(text.Text, out number)) {
                    Utility.AlertMsg(this, "件数格式错误！");
                    return;
                }
                if (number > int.Parse(table.Rows[i]["RemainPieceCount"].ToString())) {
                    Utility.AlertMsg(this, "输入件数错误！");
                    return;
                }
                bill.PieceAmount = number;
                bill.PkId = int.Parse(table.Rows[i]["GoodsBillPKID"].ToString());
                bill.GoodsValue = double.Parse(table.Rows[i]["GoodsValue"].ToString());
                bill.Weight = double.Parse(table.Rows[i]["Weight"].ToString());
                bill.Volume = double.Parse(table.Rows[i]["Volume"].ToString());
                bill.GoodsBillDetailPKID = int.Parse(table.Rows[i]["PKID"].ToString());
                bill.GoodsRevertBillPKID = int.Parse(pkid);
                business.LoadGood(bill);
            } 
        }
        BindLoadGoods();
        BindUnloadGoods();
    }

    protected void imgbUnload_Click(object sender, ImageClickEventArgs e) {
        BillReturnDetailBusiness business = new BillReturnDetailBusiness();
        string pkid = HttpContext.Current.Request.QueryString[0].ToString();
        DataSet data = business.GetLoadedGoods(int.Parse(pkid));
        BillReturnDetail bill = new BillReturnDetail();
        DataTable table = data.Tables[0];

        for (int i = 0; i < gridLoadGoods.Rows.Count; i++) {
            CheckBox box = (CheckBox)gridLoadGoods.Rows[i].FindControl("CheckLoad");
            TextBox text = (TextBox)gridLoadGoods.Rows[i].FindControl("LoadNumber");
            if (box.Checked == true) {
                int number;
                if (!int.TryParse(text.Text, out number)) {
                    Utility.AlertMsg(this, "件数格式错误！");
                    return;
                }
                if (number > int.Parse(table.Rows[i]["PieceAmount"].ToString())) {
                    Utility.AlertMsg(this, "输入件数错误！");
                    return;
                }
                bill.PieceAmount = number * (-1);
                bill.PkId = int.Parse(table.Rows[i]["GoodsBillPKID"].ToString());
                bill.GoodsValue = double.Parse(table.Rows[i]["GoodsValue"].ToString());
                bill.PriceMode = table.Rows[i]["PriceMode"].ToString();
                bill.Weight = double.Parse(table.Rows[i]["Weight"].ToString());
                bill.Volume = double.Parse(table.Rows[i]["Volume"].ToString());
                bill.GoodsBillDetailPKID = int.Parse(table.Rows[i]["PKID"].ToString());
                bill.GoodsRevertBillPKID = int.Parse(pkid);
                business.LoadGood(bill);
            }
        }
        BindLoadGoods();
        BindUnloadGoods();
    }

    protected void imbSearch_Click(object sender, ImageClickEventArgs e) {
        BindUnloadGoods();
    }
}