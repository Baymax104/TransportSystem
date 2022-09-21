using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Web.SessionState;
using System.Web.UI.HtmlControls;

using Light.EXP.Business.Dispatch;
using Light.EXP.Model.Dispatch;
using Light.EXP.SystemFrameworks;
using Light.EXP.WebUI.SystemFrame;

public partial class Dispatch_BillReturnCreate : System.Web.UI.Page {
    protected void Page_Load(object sender, EventArgs e) {
        if (!IsPostBack) {
            BindDropDownLists();
        }
    }
    
    protected void imgbAdd_Click(object sender, ImageClickEventArgs e) {
        BillReturnParentBusiness business = new BillReturnParentBusiness();
        if (!ValidateForm()) return;

        // 赋值属性
        BillReturnParent bill = new BillReturnParent();
        bill.GoodsRevertBillCode = txtbGoodsRevertBillCode.Text;
        if (business.ExistBillReturn(bill.GoodsRevertBillCode, bill.PkId)) {
            Utility.AlertMsg(this, "已存在运输合同！");
            return;
        }
        bill.DriverPKID = drdlDriver.SelectedIndex;
        bill.LoadStation = drdlLoadStation.SelectedValue;
        bill.StartCarryTime = DateTime.Parse(txtbStartCarryTime.Text);
        bill.DealGoodsStation = drdldealGoodsStation.SelectedValue;
        bill.ArriveTime = DateTime.Parse(txtbArriveTime.Text);
        bill.ReceiveGoodsLinkman = txtbReceiveGoodsLinkman.Text;
        bill.LinkmanPhone = txtbLinkmanPhone.Text;
        bill.LinkmanMobile = txtbLinkmanMobile.Text;
        bill.ReceiveGoodsDetailAddr = txtbDetailAddr.Text;
        if (txtbCarryGoodsInsurance.Text.Length != 0) {
            bill.CarryGoodsInsurance = double.Parse(txtbCarryGoodsInsurance.Text);
        }
        if (txtbDispatchServiceFee.Text.Length != 0) {
            bill.DispatchServiceFee = double.Parse(txtbDispatchServiceFee.Text);
        }
        bill.CarriageBanlanceMode = drdlCarriageBanlanceMode.SelectedValue;
        if (txtbCarryGoodsBillDeposit.Text.Length != 0) {
            bill.CarryGoodsBillDeposit = double.Parse(txtbCarryGoodsBillDeposit.Text);
        }
        bill.CarriageMode = drdlCarriageMode.SelectedValue;
        bill.AllCarriage = double.Parse(txtbAllCarriage.Text);
        if (txtbInsurance.Text.Length != 0) {
            bill.Insurance = double.Parse(txtbInsurance.Text);
        }
        if (txtbStartAdvance.Text.Length != 0) {
            bill.StartAdvance = double.Parse(txtbStartAdvance.Text);
        }
        bill.SignTime = DateTime.Parse(txtbSignTime.Text);
        bill.Remark = txtbRemark.Text;
        bill.AcceptStation = drdldealGoodsStation.SelectedValue;
        bill.BackBillState = "未出";
        bill.IfBalance = "未结";

        if (business.CreateBillReturn(bill)) {
            Response.Redirect("BillReturnList.aspx");
        } else {
            Utility.AlertMsg(this, "添加运输合同失败！");
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

    private void BindDropDownLists() {
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

    protected void imgbCancle_Click(object sender, ImageClickEventArgs e) {
        Response.Redirect("BillReturnList.aspx");
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

    protected void drdlDriver_SelectedIndexChanged(object sender, EventArgs e) {
        BindDriverList();
    }
}