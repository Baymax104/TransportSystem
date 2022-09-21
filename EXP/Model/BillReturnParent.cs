using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

// ******************************************************************
// 文件名: Light.EXP.Model.Dispatch.BillReturnParent.cs
// Copyright  (c)  2006-2007 ATA
// 作者:       韦振宇
// 创建日期：  2021-10-13
// 主要内容：  配车管理模块的运输合同实体类文件
// ******************************************************************


namespace Light.EXP.Model.Dispatch {
    public class BillReturnParent {
        private int pkId = -1;                               // 运输合同ID
        private string goodsRevertBillCode = "";            // 运输合同编号
        private int driverPKID = 0;                         // 承运人
        private string loadStation = "";                    // 发货地
        private DateTime startCarryTime = new DateTime();   // 起运时间
        private string dealGoodsStation = "";               // 交货地
        private DateTime arriveTime = new DateTime();       // 到达时间
        private string receiveGoodsLinkman = "";            // 收货联系人
        private string linkmanPhone = "";                   // 联系人电话
        private string linkmanMobile = "";                  // 联系人手机
        private string receiveGoodsDetailAddr = "";         // 收货详细地址
        private double carryGoodsInsurance = 0;             // 承运人订装货物保证金
        private double dispatchServiceFee = 0;              // 配载服务费
        private string carriageBanlanceMode = "";           // 运费结算方式
        private double carryGoodsBillDeposit = 0;           // 送货单回执押金
        private string carriageMode = "";                   // 运输计价方式
        private double allCarriage = 0;                     // 总运费
        private double insurance = 0;                       // 保险费
        private double startAdvance = 0;                    // 预付费用
        private DateTime signTime = new DateTime();         // 签订时间
        private string acceptStation = "";                  // 接货点
        private string remark = "";                         // 备注
        private int execute = 0;                            // 执行
        private string ifBalance = "";                      // 是否结算
        private string backBillState = "";                  // 回执单状态

        public int PkId {
            get {
                return pkId;
            }
            set {
                pkId = value;
            }
        }

        public string GoodsRevertBillCode {
            get {
                return goodsRevertBillCode;
            }
            set {
                goodsRevertBillCode = value;
            }
        }

        public int DriverPKID {
            get {
                return driverPKID;
            }
            set {
                driverPKID = value;
            }
        }

        public string LoadStation {
            get {
                return loadStation;
            }
            set {
                loadStation = value;
            }
        }

        public DateTime StartCarryTime {
            get {
                return startCarryTime;
            }
            set {
                startCarryTime = value;
            }
        }

        public string DealGoodsStation {
            get {
                return dealGoodsStation;
            }
            set {
                dealGoodsStation = value;
            }
        }

        public DateTime ArriveTime {
            get {
                return arriveTime;
            }
            set {
                arriveTime = value;
            }
        }

        public string ReceiveGoodsLinkman {
            get {
                return receiveGoodsLinkman;
            }
            set {
                receiveGoodsLinkman = value;
            }
        }

        public string LinkmanPhone {
            get {
                return linkmanPhone;
            }
            set {
                linkmanPhone = value;
            }
        }

        public string LinkmanMobile {
            get {
                return linkmanMobile;
            }
            set {
                linkmanMobile = value;
            }
        }

        public string ReceiveGoodsDetailAddr {
            get {
                return receiveGoodsDetailAddr;
            }
            set {
                receiveGoodsDetailAddr = value;
            }
        }

        public double CarryGoodsInsurance {
            get {
                return carryGoodsInsurance;
            }
            set {
                carryGoodsInsurance = value;
            }
        }

        public double DispatchServiceFee {
            get {
                return dispatchServiceFee;
            }
            set {
                dispatchServiceFee = value;
            }
        }

        public string CarriageBanlanceMode {
            get {
                return carriageBanlanceMode;
            }
            set {
                carriageBanlanceMode = value;
            }
        } 

        public double CarryGoodsBillDeposit {
            get {
                return carryGoodsBillDeposit;
            }
            set {
                carryGoodsBillDeposit = value;
            }
        }

        public string CarriageMode {
            get {
                return carriageMode;
            }
            set {
                carriageMode = value;
            }
        }

        public double AllCarriage {
            get {
                return allCarriage;
            }
            set {
                allCarriage = value;
            }
        }

        public double Insurance {
            get {
                return insurance;
            }
            set {
                insurance = value;
            }
        }

        public double StartAdvance {
            get {
                return startAdvance;
            }
            set {
                startAdvance = value;
            }
        }

        public DateTime SignTime {
            get {
                return signTime;
            }
            set {
                signTime = value;
            }
        }

        public string AcceptStation {
            get {
                return acceptStation;
            }
            set {
                acceptStation = value;
            }
        }

        public string Remark {
            get {
                return remark;
            }
            set {
                remark = value;
            }
        }

        public int Execute {
            get {
                return execute;
            }
            set {
                execute = value;
            }
        }

        public string IfBalance {
            get {
                return ifBalance;
            }
            set {
                ifBalance = value;
            }
        }

        public string BackBillState {
            get {
                return backBillState;
            }
            set {
                backBillState = value;
            }
        }
    }
}
