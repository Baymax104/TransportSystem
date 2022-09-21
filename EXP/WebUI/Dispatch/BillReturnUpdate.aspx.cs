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

public partial class Dispatch_BillReturnUpdate : System.Web.UI.Page {
    protected void Page_Load(object sender, EventArgs e) {
        if (!IsPostBack) {
            BindDropDownList();
            string goodsRevertBillCode = Request.QueryString[0].ToString();
            BindControl(goodsRevertBillCode);
            EnableControl(goodsRevertBillCode);
            imgDelete.Attributes["onclick"] = "javascript:return confirm('您确实要删除该记录吗？');";
        }
    }

    private void EnableControl(string goodsRevertBillCode) {
        BillReturnParentBusiness business = new BillReturnParentBusiness();
        BillReturnParent bill = business.GetBillReturn(goodsRevertBillCode);
        if (bill.BackBillState != "未出") {
            txtbGoodsRevertBillCode.Enabled = false;
            drdlDriver.Enabled = false;
            txtbCarNO.Enabled = false;
            txtbBizLicence.Enabled = false;
            txtbDriveLicence.Enabled = false;
            txtbRunLicence.Enabled = false;
            drdlLoadStation.Enabled = false;
            drdldealGoodsStation.Enabled = false;
            txtbStartCarryTime.Enabled = false;
            txtbArriveTime.Enabled = false;
            txtbReceiveGoodsLinkman.Enabled = false;
            txtbLinkmanPhone.Enabled = false;
            txtbLinkmanMobile.Enabled = false;
            txtbDetailAddr.Enabled = false;
            txtbCarryGoodsInsurance.Enabled = false;
            txtbDispatchServiceFee.Enabled = false;
            drdlCarriageBanlanceMode.Enabled = false;
            drdlCarriageMode.Enabled = false;
            txtbCarryGoodsBillDeposit.Enabled = false;
            txtbAllCarriage.Enabled = false;
            txtbInsurance.Enabled = false;
            txtbStartAdvance.Enabled = false;
            txtbSignTime.Enabled = false;
            txtbRemark.Enabled = false;
            imgUpdate.Visible = false;
            imgDelete.Visible = false;
        }
    }

    private void BindControl(string goodsRevertBillCode) {
        BillReturnParentBusiness business = new BillReturnParentBusiness();
        BillReturnParent bill = business.GetBillReturn(goodsRevertBillCode);
        txtbGoodsRevertBillCode.Text = goodsRevertBillCode;
        drdlDriver.SelectedIndex = bill.DriverPKID;
        BindDriverList();
        drdlLoadStation.SelectedValue = bill.LoadStation;
        drdldealGoodsStation.SelectedValue = bill.DealGoodsStation;
        txtbStartCarryTime.Text = bill.StartCarryTime.ToString("d");
        txtbArriveTime.Text = bill.ArriveTime.ToString("d");
        txtbReceiveGoodsLinkman.Text = bill.ReceiveGoodsLinkman;
        txtbLinkmanPhone.Text = bill.LinkmanPhone;
        txtbLinkmanMobile.Text = bill.LinkmanMobile;
        txtbDetailAddr.Text = bill.ReceiveGoodsDetailAddr;
        txtbCarryGoodsInsurance.Text = bill.CarryGoodsInsurance.ToString();
        txtbDispatchServiceFee.Text = bill.DispatchServiceFee.ToString();
        drdlCarriageBanlanceMode.SelectedValue = bill.CarriageBanlanceMode;
        drdlCarriageMode.SelectedValue = bill.CarriageMode;
        txtbCarryGoodsBillDeposit.Text = bill.CarryGoodsBillDeposit.ToString();
        txtbAllCarriage.Text = bill.AllCarriage.ToString();
        txtbInsurance.Text = bill.Insurance.ToString();
        txtbStartAdvance.Text = bill.StartAdvance.ToString();
        txtbSignTime.Text = bill.SignTime.ToString("d");
        txtbRemark.Text = bill.Remark;
    }

    private void BindDropDownList() {
        BillReturnParentBusiness business = new BillReturnParentBusiness();

        DataSet data = business.GetDispatchDrivers();
        DataTable driversTable = data.Tables[0];
        for (int i = 0; i < driversTable.Rows.Count; i++) {
            drdlDriver.Items.Add(driversTable.Rows[i]["DriverName"].ToString());
        }

        DataTable cityTable = business.GetDispatchCitys().Tables[0];
        for (int i = 0; i < cityTable.Rows.Count; i++) {
            drdlLoadStation.Items.Add(cityTable.Rows[i]["City"].ToString());
            drdldealGoodsStation.Items.Add(cityTable.Rows[i]["City"].ToString());
        }
    }

    protected void imgDelete_Click(object sender, ImageClickEventArgs e) {
        BillReturnParentBusiness business = new BillReturnParentBusiness();
        BillReturnParent bill = business.GetBillReturn(Request.QueryString[0].ToString());
        // 添加删除确认弹窗
        if (business.DeleteBillReturn(bill.PkId)) {
            Response.Redirect("BillReturnList.aspx");
        } else {
            Utility.AlertMsg(this, "删除运输合同失败！");
            return;
        }
    }

    protected void imgUpdate_Click(object sender, ImageClickEventArgs e) {
        BillReturnParentBusiness business = new BillReturnParentBusiness();
        string originCode = Request.QueryString[0].ToString();
        BillReturnParent bill = business.GetBillReturn(originCode);
        if (!ValidateForm()) return;
        if (originCode != txtbGoodsRevertBillCode.Text) {
            if (business.ExistBillReturn(txtbGoodsRevertBillCode.Text, -1)) {
                Utility.AlertMsg(this, "已存在此运输合同编号！");
                return;
            }
        }
        bill.GoodsRevertBillCode = txtbGoodsRevertBillCode.Text;
        bill.DriverPKID = drdlDriver.SelectedIndex;
        bill.LoadStation = drdlLoadStation.SelectedValue;
        bill.DealGoodsStation = drdldealGoodsStation.SelectedValue;
        bill.StartCarryTime = DateTime.Parse(txtbStartCarryTime.Text);
        bill.ArriveTime = DateTime.Parse(txtbArriveTime.Text);
        bill.ReceiveGoodsLinkman = txtbReceiveGoodsLinkman.Text;
        bill.LinkmanPhone = txtbLinkmanPhone.Text;
        bill.LinkmanMobile = txtbLinkmanMobile.Text;
        bill.ReceiveGoodsDetailAddr = txtbDetailAddr.Text;
        bill.CarryGoodsInsurance = double.Parse(txtbCarryGoodsInsurance.Text);
        bill.DispatchServiceFee = double.Parse(txtbDispatchServiceFee.Text);
        bill.CarriageBanlanceMode = drdlCarriageBanlanceMode.SelectedValue;
        bill.CarriageMode = drdlCarriageMode.SelectedValue;
        bill.CarryGoodsBillDeposit = double.Parse(txtbCarryGoodsBillDeposit.Text);
        bill.AllCarriage = double.Parse(txtbAllCarriage.Text);
        bill.Insurance = double.Parse(txtbInsurance.Text);
        bill.StartAdvance = double.Parse(txtbStartAdvance.Text);
        bill.SignTime = DateTime.Parse(txtbSignTime.Text);
        bill.Remark = txtbRemark.Text;
        bill.AcceptStation = drdldealGoodsStation.SelectedValue;

        if (business.UpdateBillReturn(bill)) {
            Response.Redirect("BillReturnList.aspx");
        } else {
            Utility.AlertMsg(this, "修改运输合同失败！");
        }
    }

    private bool ValidateForm() {
        if (txtbGoodsRevertBillCode.Text.Length == 0) {
            Utility.AlertMsg(this, "请输入合同编号！");
            return false;
        }
        if (drdlDriver.SelectedIndex == 0) {
            Utility.AlertMsg(this, "请输入承运人！");
            return false;
        }
        if (drdlLoadStation.SelectedIndex == 0) {
            Utility.AlertMsg(this, "请输入发货地！");
            return false;
        }
        if (txtbStartCarryTime.Text.Length == 0) {
            Utility.AlertMsg(this, "请输入起运时间！");
            return false;
        }
        if (drdldealGoodsStation.SelectedIndex == 0) {
            Utility.AlertMsg(this, "请输入交货地！");
            return false;
        }
        if (txtbArriveTime.Text.Length == 0) {
            Utility.AlertMsg(this, "请输入到达时间！");
            return false;
        }
        if (txtbReceiveGoodsLinkman.Text.Length == 0) {
            Utility.AlertMsg(this, "请输入收货联系人！");
            return false;
        }
        if (txtbLinkmanPhone.Text.Length == 0 && txtbLinkmanMobile.Text.Length == 0) {
            Utility.AlertMsg(this, "请输入联系人联系方式！");
            return false;
        }
        if (txtbDetailAddr.Text.Length == 0) {
            Utility.AlertMsg(this, "请输入收货详细地址！");
            return false;
        }
        if (txtbAllCarriage.Text.Length == 0) {
            Utility.AlertMsg(this, "请输入总运费！");
            return false;
        }
        if (txtbSignTime.Text.Length == 0) {
            Utility.AlertMsg(this, "请输入签订时间！");
            return false;
        }
        return true;
    }

    protected void drdlDriver_SelectedIndexChanged(object sender, EventArgs e) {
        BindDriverList();
    }

    private void BindDriverList() {
        BillReturnParentBusiness business = new BillReturnParentBusiness();
        int selectedDriver = drdlDriver.SelectedIndex;
        if (selectedDriver == 0) {
            txtbCarNO.Text = txtbBizLicence.Text = txtbDriveLicence.Text = txtbRunLicence.Text = "";
            return;
        }
        DataTable driverTable = business.GetDispatchDriver(selectedDriver);
        txtbCarNO.Text = driverTable.Rows[0]["CarNo"].ToString();
        txtbDriveLicence.Text = driverTable.Rows[0]["DriveLicence"].ToString();
        txtbBizLicence.Text = driverTable.Rows[0]["BizLicence"].ToString();
        txtbRunLicence.Text = driverTable.Rows[0]["RunLicence"].ToString();
    }

    protected void imgGoods_Click(object sender, ImageClickEventArgs e) {
        string viewUrl = "BillReturnDetailView.aspx?GoodsRevertBillCode=" + Request.QueryString[0].ToString();
        BillReturnParentBusiness business = new BillReturnParentBusiness();
        BillReturnParent bill = business.GetBillReturn(Request.QueryString[0].ToString());
        string updateUrl = "BillReturnDetailCreate.aspx?GoodsRevertBillPKID=" + bill.PkId;
        
        // 若合同状态为未出，则跳转到编辑货物界面
        if (bill.BackBillState == "未出") {
            Response.Redirect(updateUrl);
        }
        // 若合同状态为其他，则跳转到查看货物界面
        if (bill.BackBillState != "未出") {
            Response.Redirect(viewUrl);
        }
    }

    protected void imgbReturn_Click(object sender, ImageClickEventArgs e) {
        Response.Redirect("BillReturnList.aspx");
    }

}