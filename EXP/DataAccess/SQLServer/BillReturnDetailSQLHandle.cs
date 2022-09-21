using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
// ******************************************************************
// 文件名: Light.EXP.DataAccess.Dispatch.BillReturnDetailSQLHandle.cs
// Copyright  (c)  2006-2007 ATA
// 作者:       韦振宇
// 创建日期：  2021-10-17
// 主要内容：  配车管理模块的运输货物数据处理文件
// ******************************************************************


namespace Light.EXP.DataAccess.Dispatch {

    using System.Data;
    using System.Data.SqlClient;
    using Light.EXP.Model.Dispatch;
    using Light.EXP.DataAccess.SystemFrame;
    using Light.EXP.DataAccess.Dispatch;

    public class BillReturnDetailSQLHandle :BillReturnDetailInterface {
        
        /// <summary>
        /// 获取多个已装货物实体
        /// </summary>
        /// <param name="goodsRevertBillPKID">运输合同ID</param>
        /// <returns>已装货物实体集合</returns>
        public DataSet GetLoadedGoods(int goodsRevertBillPKID) {
            SQLHelper helper = new SQLHelper();
            SqlParameter[] parameters = {
                new SqlParameter("@goodsRevertBillPKID", SqlDbType.Int, 4)
            };
            parameters[0].Value = goodsRevertBillPKID;
            return helper.ExecuteDataSet("uspGetLoadedGoods", parameters);
        }

        /// <summary>
        /// 获取多个待装货物实体
        /// </summary>
        /// <param name="sendGoodsAddr">起点</param>
        /// <param name="receiveGoodsAddr">终点</param>
        /// <returns>待装货物实体集合</returns>
        public DataSet GetUnloadGoods(string sendGoodsAddr, string receiveGoodsAddr) {
            SQLHelper helper = new SQLHelper();
            SqlParameter[] parameters = {
                new SqlParameter("@sendGoodsAddr", SqlDbType.NVarChar, 50),
                new SqlParameter("@receiveGoodsAddr", SqlDbType.NVarChar, 50)
            };
            if (sendGoodsAddr == null) {
                parameters[0].Value = DBNull.Value;
            } else {
                parameters[0].Value = sendGoodsAddr;
            }
            if (receiveGoodsAddr == null) {
                parameters[1].Value = DBNull.Value;
            } else {
                parameters[1].Value = receiveGoodsAddr;
            }
            return helper.ExecuteDataSet("uspGetUnloadGoods", parameters);
        }

        /// <summary>
        /// 判断该运输合同司机是否为空值
        /// </summary>
        /// <param name="pkId">运输合同ID</param>
        /// <returns>是否为空</returns>
        public bool ExistDriver(int pkId) {
            SQLHelper helper = new SQLHelper();
            SqlParameter[] parameters = {
                new SqlParameter("@PKID", SqlDbType.Int, 4)
            };
            parameters[0].Value = pkId;
            return helper.ExecuteNonQuery("uspExistDriver", parameters) == 0 ? true : false;
        }

        /// <summary>
        /// 装(卸)货
        /// </summary>
        /// <param name="bill">BillReturnDetail实体</param>
        /// <returns>是否装(卸)货成功</returns>
        public bool LoadGood(BillReturnDetail bill) {
            SQLHelper helper = new SQLHelper();
            SqlParameter[] parameters = {
                new SqlParameter("@goodsRevertBillPKID", SqlDbType.Int, 4),
                new SqlParameter("@goodsBillDetailPKID", SqlDbType.Int, 4),
                new SqlParameter("@pieceAmount", SqlDbType.Int, 4),
                new SqlParameter("@weight", SqlDbType.Real, 10),
                new SqlParameter("@volume", SqlDbType.Real, 10),
                new SqlParameter("@priceMode", SqlDbType.VarChar, 50),
                new SqlParameter("@goodsValue", SqlDbType.Money, 10)
            };
            parameters[0].Value = bill.GoodsRevertBillPKID;
            parameters[1].Value = bill.GoodsBillDetailPKID;
            parameters[2].Value = bill.PieceAmount;
            parameters[3].Value = bill.Weight;
            parameters[4].Value = bill.Volume;
            parameters[5].Value = bill.PriceMode;
            parameters[6].Value = bill.GoodsValue;
            return helper.ExecuteNonQuery("uspLoadGood", parameters) == 0 ? true : false;
        }

        /// <summary>
        /// 发货
        /// </summary>
        /// <param name="goodsRevertBillPKID">运输合同ID</param>
        /// <param name="goodsBillCodes">货运单编号字符串</param>
        /// <returns>是否发货成功</returns>
        public bool TransportGood(int goodsRevertBillPKID, string goodsBillCodes) {
            SQLHelper helper = new SQLHelper();
            SqlParameter[] parameters = {
                new SqlParameter("@goodsRevertBillPKID", SqlDbType.Int, 4),
                new SqlParameter("@goodsBillCodes", SqlDbType.VarChar, 50)
            };
            parameters[0].Value = goodsRevertBillPKID;
            parameters[1].Value = goodsBillCodes;
            return helper.ExecuteNonQuery("uspTransportGood", parameters) == 0 ? true : false;
        }
    }
}
