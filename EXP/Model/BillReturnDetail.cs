using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

// ******************************************************************
// 文件名: Light.EXP.Model.Dispatch.BillReturnDetail.cs
// Copyright  (c)  2006-2007 ATA
// 作者:       韦振宇
// 创建日期：  2021-10-13
// 主要内容：  配车管理模块的运输货物实体类文件
// ******************************************************************

namespace Light.EXP.Model.Dispatch {
    public class BillReturnDetail {
        private int pkId = -1;                       // PKID
        private int goodsRevertBillPKID = 0;        // 货运回执单PKID
        private int goodsBillDetailPKID = 0;        // 货运单详表PKID
        private int pieceAmount = 0;                // 件数
        private double weight = 0;                  // 重量
        private double volume = 0;                  // 体积
        private string priceMode = "";              // 计价方式
        private string priceStandard = "";          // 计费标准
        private double goodsValue = 0;              // 货物价值

        public int PkId {
            get {
                return pkId;
            }
            set {
                pkId = value;
            }
        }

        public int GoodsRevertBillPKID {
            get {
                return goodsRevertBillPKID;
            }
            set {
                goodsRevertBillPKID = value;
            }
        }

        public int GoodsBillDetailPKID {
            get {
                return goodsBillDetailPKID;
            }
            set {
                goodsBillDetailPKID = value;
            }
        }

        public int PieceAmount {
            get {
                return pieceAmount;
            }
            set {
                pieceAmount = value;
            }
        }

        public double Weight {
            get {
                return weight;
            }
            set {
                weight = value;
            }
        }

        public double Volume {
            get {
                return volume;
            }
            set {
                volume = value;
            }
        }

        public string PriceMode {
            get {
                return priceMode;
            }
            set {
                priceMode = value;
            }
        }

        public string PriceStandard {
            get {
                return priceStandard;
            }
            set {
                priceStandard = value;
            }
        }

        public double GoodsValue {
            get {
                return goodsValue;
            }
            set {
                goodsValue = value;
            }
        }
    }
}
