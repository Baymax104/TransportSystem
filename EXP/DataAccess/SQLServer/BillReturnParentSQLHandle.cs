using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
// ******************************************************************
// 文件名: Light.EXP.DataAccess.Dispatch.BillReturnParentSQLHandle.cs
// Copyright  (c)  2006-2007 ATA
// 作者:       韦振宇
// 创建日期：  2021-10-14
// 主要内容：  配车管理模块的运输合同数据处理文件
// ******************************************************************


namespace Light.EXP.DataAccess.Dispatch {

    using System.Data;
    using System.Data.SqlClient;
    using Light.EXP.Model.Dispatch;
    using Light.EXP.DataAccess.SystemFrame;

    public class BillReturnParentSQLHandle :BillReturnParentInterface {
        
        /// <summary>
        /// 获取多个主要城市实体
        /// </summary>
        /// <returns>DataSet</returns>
        public DataSet GetDispatchCitys() {
            SQLHelper helper = new SQLHelper();
            return helper.ExecuteDataSet("uspGetDispatchCitys", null);
        }

        /// <summary>
        /// 获取多个司机信息实体
        /// </summary>
        /// <returns>DataSet</returns>
        public DataSet GetDispatchDrivers() {
            SQLHelper helper = new SQLHelper();
            return helper.ExecuteDataSet("uspGetDispatchDrivers", null);
        }

        /// <summary>
        /// 获取单个司机信息实体
        /// </summary>
        /// <param name="pkId">司机ID</param>
        /// <returns>DataTable</returns>
        public DataTable GetDispatchDriver(int pkId) {
            SQLHelper helper = new SQLHelper();
            SqlParameter[] parameters = {
                new SqlParameter("@PKID", SqlDbType.Int, 4)
            };
            parameters[0].Value = pkId;
            return helper.ExecuteDataTable("uspGetDispatchDriver", parameters);
        }

        /// <summary>
        /// 判断运输合同主表中是否存在指定运输合同编号的记录
        /// </summary>
        /// <param name="goodsRevertBillCode">运输合同编号</param>
        /// <param name="pkId">运输合同PKID</param>
        /// <returns>是否存在</returns>
        public bool ExistBillReturn(string goodsRevertBillCode, int pkId) {
            SQLHelper helper = new SQLHelper();
            SqlParameter[] parameters = {
                new SqlParameter("@goodsRevertBillCode",SqlDbType.VarChar, 50),
                new SqlParameter("@PKID", SqlDbType.Int, 4)
            };
            parameters[0].Value = goodsRevertBillCode;
            parameters[1].Value = pkId;
            return helper.ExecuteNonQuery("uspExistBillReturn", parameters) == 1 ? true : false;
        }

        /// <summary>
        /// 获取接货点信息
        /// </summary>
        /// <param name="goodsRevertBillCode">运输合同编号</param>
        /// <returns>接货点信息</returns>
        public string GetDispatchAcceptStation(string goodsRevertBillCode) {
            SQLHelper helper = new SQLHelper();
            SqlParameter[] parameters = {
                new SqlParameter("@goodsBillCode", SqlDbType.VarChar, 50)
            };
            parameters[0].Value = goodsRevertBillCode;
            SqlDataReader reader = helper.ExecuteDataReader("uspsGetDispatchAcceptStation",
                                                            parameters);
            return reader["@acceptStation"].ToString();
        }

        /// <summary>
        /// 增加运输合同
        /// </summary>
        /// <param name="parent">BillReturnParent实体</param>
        /// <returns>增加是否成功</returns>
        public bool CreateBillReturn(BillReturnParent parent) {
            SQLHelper helper = new SQLHelper();
            SqlParameter[] parameters = {
                new SqlParameter("@goodsRevertBillCode", SqlDbType.VarChar, 50),
                new SqlParameter("@driverPKID", SqlDbType.Int, 4),
                new SqlParameter("@loadStation", SqlDbType.VarChar, 50),
                new SqlParameter("@startCarryTime", SqlDbType.DateTime, 40),
                new SqlParameter("@dealGoodsStation", SqlDbType.VarChar, 50),
                new SqlParameter("@arriveTime", SqlDbType.DateTime, 40),
                new SqlParameter("@receiveGoodsLinkman", SqlDbType.VarChar, 50),
                new SqlParameter("@linkmanPhone", SqlDbType.VarChar, 50),
                new SqlParameter("@linkmanMobile", SqlDbType.VarChar, 50),
                new SqlParameter("@receiveGoodsDetailAddr", SqlDbType.VarChar, 50),
                new SqlParameter("@carryGoodsInsurance", SqlDbType.Money, 10),
                new SqlParameter("@dispatchServiceFee", SqlDbType.Money, 10),
                new SqlParameter("@carriageBanlanceMode", SqlDbType.VarChar, 50),
                new SqlParameter("@carryGoodsBillDeposit", SqlDbType.Money, 10),
                new SqlParameter("@carriageMode", SqlDbType.VarChar, 50),
                new SqlParameter("@allCarriage", SqlDbType.Money, 10),
                new SqlParameter("@insurance", SqlDbType.Money, 10),
                new SqlParameter("@startAdvance", SqlDbType.Money, 10),
                new SqlParameter("@ifBalance", SqlDbType.VarChar, 50),
                new SqlParameter("@backBillState", SqlDbType.VarChar, 50),
                new SqlParameter("@signTime", SqlDbType.DateTime, 40),
                new SqlParameter("@acceptStation", SqlDbType.VarChar, 50),
                new SqlParameter("@remark", SqlDbType.VarChar, 50),
                new SqlParameter("@PKID", SqlDbType.Int, 4)
            };
            parameters[0].Value = parent.GoodsRevertBillCode;
            parameters[1].Value = parent.DriverPKID;
            parameters[2].Value = parent.LoadStation;
            parameters[3].Value = parent.StartCarryTime;
            parameters[4].Value = parent.DealGoodsStation;
            parameters[5].Value = parent.ArriveTime;
            parameters[6].Value = parent.ReceiveGoodsLinkman;
            parameters[7].Value = parent.LinkmanPhone;
            parameters[8].Value = parent.LinkmanMobile;
            parameters[9].Value = parent.ReceiveGoodsDetailAddr;
            parameters[10].Value = parent.CarryGoodsInsurance;
            parameters[11].Value = parent.DispatchServiceFee;
            parameters[12].Value = parent.CarriageBanlanceMode;
            parameters[13].Value = parent.CarryGoodsBillDeposit;
            parameters[14].Value = parent.CarriageMode;
            parameters[15].Value = parent.AllCarriage;
            parameters[16].Value = parent.Insurance;
            parameters[17].Value = parent.StartAdvance;
            parameters[18].Value = parent.IfBalance;
            parameters[19].Value = parent.BackBillState;
            parameters[20].Value = parent.SignTime;
            parameters[21].Value = parent.AcceptStation;
            parameters[22].Value = parent.Remark;
            parameters[23].Direction = ParameterDirection.Output;

            bool isSuccess = helper.ExecuteNonQuery("uspCreateBillReturn", parameters) == 0 ? true : false;
            parent.PkId = int.Parse(parameters[23].Value.ToString());
            return isSuccess;
        }

        /// <summary>
        /// 修改运输合同
        /// </summary>
        /// <param name="parent">BillReturnParent实体</param>
        /// <returns>修改是否成功</returns>
        public bool UpdateBillReturn(BillReturnParent parent) {
            SQLHelper helper = new SQLHelper();
            SqlParameter[] parameters = {
                new SqlParameter("@PKID", SqlDbType.Int, 4),
                new SqlParameter("@goodsRevertBillCode", SqlDbType.VarChar, 50),
                new SqlParameter("@driverPKID", SqlDbType.Int, 4),
                new SqlParameter("@loadStation", SqlDbType.VarChar, 50),
                new SqlParameter("@startCarryTime", SqlDbType.DateTime, 40),
                new SqlParameter("@dealGoodsStation", SqlDbType.VarChar, 50),
                new SqlParameter("@arriveTime", SqlDbType.DateTime, 40),
                new SqlParameter("@receiveGoodsLinkman", SqlDbType.VarChar, 50),
                new SqlParameter("@linkmanPhone", SqlDbType.VarChar, 50),
                new SqlParameter("@linkmanMobile", SqlDbType.VarChar, 50),
                new SqlParameter("@receiveGoodsDetailAddr", SqlDbType.VarChar, 50),
                new SqlParameter("@carryGoodsInsurance", SqlDbType.Money, 10),
                new SqlParameter("@dispatchServiceFee", SqlDbType.Money, 10),
                new SqlParameter("@carriageBanlanceMode", SqlDbType.VarChar, 50),
                new SqlParameter("@carryGoodsBillDeposit", SqlDbType.Money, 10),
                new SqlParameter("@allCarriage", SqlDbType.Money, 10),
                new SqlParameter("@insurance", SqlDbType.Money, 10),
                new SqlParameter("@startAdvance", SqlDbType.Money, 10),
                new SqlParameter("@acceptStation", SqlDbType.VarChar, 50),
                new SqlParameter("@remark", SqlDbType.VarChar, 50),
                new SqlParameter("@carriageMode", SqlDbType.VarChar, 50),
                new SqlParameter("@signTime", SqlDbType.DateTime, 10)
            };
            parameters[0].Value = parent.PkId;
            parameters[1].Value = parent.GoodsRevertBillCode;
            parameters[2].Value = parent.DriverPKID;
            parameters[3].Value = parent.LoadStation;
            parameters[4].Value = parent.StartCarryTime;
            parameters[5].Value = parent.DealGoodsStation;
            parameters[6].Value = parent.ArriveTime;
            parameters[7].Value = parent.ReceiveGoodsLinkman;
            parameters[8].Value = parent.LinkmanPhone;
            parameters[9].Value = parent.LinkmanMobile;
            parameters[10].Value = parent.ReceiveGoodsDetailAddr;
            parameters[11].Value = parent.CarryGoodsInsurance;
            parameters[12].Value = parent.DispatchServiceFee;
            parameters[13].Value = parent.CarriageBanlanceMode;
            parameters[14].Value = parent.CarryGoodsBillDeposit;
            parameters[15].Value = parent.AllCarriage;
            parameters[16].Value = parent.Insurance;
            parameters[17].Value = parent.StartAdvance;
            parameters[18].Value = parent.AcceptStation;
            parameters[19].Value = parent.Remark;
            parameters[20].Value = parent.CarriageMode;
            parameters[21].Value = parent.SignTime;
            return helper.ExecuteNonQuery("uspUpdateBillReturn", parameters) == 0 ? true : false;
        }

        /// <summary>
        /// 判断运输合同详表中是否存在指定运输合同编号的货物信息
        /// </summary>
        /// <param name="goodsRevertBillPKID">运输合同ID</param>
        /// <returns>是否存在</returns>
        public bool ExistDispatchGoods(int goodsRevertBillPKID) {
            SQLHelper helper = new SQLHelper();
            SqlParameter[] parameters = {
                new SqlParameter("@goodsRevertBillPKID", SqlDbType.Int, 4)
            };
            parameters[0].Value = goodsRevertBillPKID;
            return helper.ExecuteNonQuery("uspExistDispatchGoods", parameters) == 0 ? true : false;
        }
        
        /// <summary>
        /// 删除运输合同
        /// </summary>
        /// <param name="pkId">运输合同ID</param>
        /// <returns>是否删除成功</returns>
        public bool DeleteBillReturn(int pkId) {
            SQLHelper helper = new SQLHelper();
            SqlParameter[] parameters = {
                new SqlParameter("@PKID", SqlDbType.Int, 4)
            };
            parameters[0].Value = pkId;
            return helper.ExecuteNonQuery("uspDeleteBillReturn", parameters) == 0 ? true : false;
        }
        
        /// <summary>
        /// 获取多个运输合同实体
        /// </summary>
        /// <param name="backBillState">运输合同状态</param>
        /// <param name="driverName">司机名称</param>
        /// <param name="goodsRevertBillCode">运输合同编号</param>
        /// <param name="beginSignTime">签订起始时间</param>
        /// <param name="endSignTime">签订结束时间</param>
        /// <returns>运输合同实体集合</returns>
        public DataSet GetBillReturns(string backBillState, string driverName, string goodsRevertBillCode,
                                        DateTime beginSignTime, DateTime endSignTime) {
            SQLHelper helper = new SQLHelper();
            SqlParameter[] parameters = {
                new SqlParameter("@backBillState", SqlDbType.NVarChar, 50),
                new SqlParameter("@driverName", SqlDbType.NVarChar, 50),
                new SqlParameter("@goodsRevertBillCode", SqlDbType.NVarChar, 50),
                new SqlParameter("@beginSignTime", SqlDbType.DateTime, 40),
                new SqlParameter("@endSignTime", SqlDbType.DateTime, 40)
            };
            if (backBillState == null) {
                parameters[0].Value = DBNull.Value;
            } else {
                parameters[0].Value = backBillState;
            }
            
            if (driverName == null) {
                parameters[1].Value = DBNull.Value;
            } else {
                parameters[1].Value = driverName;
            }

            if (goodsRevertBillCode == null) {
                parameters[2].Value = DBNull.Value;
            } else {
                parameters[2].Value = goodsRevertBillCode;
            }
            
            if (beginSignTime == DateTime.Parse("1900-1-1")) {
                parameters[3].Value = DBNull.Value;
            } else {
                parameters[3].Value = beginSignTime;
            }

            if (endSignTime == DateTime.Parse("1900-1-1")) {
                parameters[4].Value = DBNull.Value;
            } else {
                parameters[4].Value = endSignTime;
            }
            return helper.ExecuteDataSet("uspGetBillReturns", parameters);
        }
        
        /// <summary>
        /// 获取单个运输合同实体
        /// </summary>
        /// <param name="pkId">运输合同状态</param>
        /// <returns>BillReturnParent实体</returns>
        public BillReturnParent GetBillReturn(string goodsRevertBillCode) {
            SQLHelper helper = new SQLHelper();
            SqlParameter[] parameter = {
                new SqlParameter("@goodsRevertBillCode", SqlDbType.VarChar, 50)
            };
            parameter[0].Value = goodsRevertBillCode;
            BillReturnParent parent = new BillReturnParent();
            SqlDataReader reader = helper.ExecuteDataReader("uspGetBillReturn", parameter);
            if (reader.Read()) {
                parent.PkId = int.Parse(reader["PKID"].ToString());
                parent.DriverPKID = int.Parse(reader["DriverPKID"].ToString());
                parent.LoadStation = reader["LoadStation"].ToString();
                parent.StartCarryTime = DateTime.Parse(reader["StartCarryTime"].ToString());
                parent.DealGoodsStation = reader["DealGoodsStation"].ToString();
                parent.ArriveTime = DateTime.Parse(reader["ArriveTime"].ToString());
                parent.ReceiveGoodsLinkman = reader["ReceiveGoodsLinkman"].ToString();
                parent.LinkmanPhone = reader["LinkmanPhone"].ToString();
                parent.LinkmanMobile = reader["LinkmanMobile"].ToString();
                parent.ReceiveGoodsDetailAddr = reader["ReceiveGoodsDetailAddr"].ToString();
                parent.CarryGoodsInsurance = double.Parse(reader["CarryGoodsInsurance"].ToString());
                parent.DispatchServiceFee = double.Parse(reader["DispatchServiceFee"].ToString());
                parent.CarriageBanlanceMode = reader["CarriageBanlanceMode"].ToString();
                parent.CarryGoodsBillDeposit = 
                    double.Parse(reader["CarryGoodsBillDeposit"].ToString());
                parent.CarriageMode = reader["CarriageMode"].ToString();
                parent.AllCarriage = double.Parse(reader["AllCarriage"].ToString());
                parent.Insurance = double.Parse(reader["Insurance"].ToString());
                parent.StartAdvance = double.Parse(reader["StartAdvance"].ToString());
                parent.IfBalance = reader["IfBalance"].ToString();
                parent.BackBillState = reader["BackBillState"].ToString();
                parent.SignTime = DateTime.Parse(reader["SignTime"].ToString());
                parent.AcceptStation = reader["AcceptStation"].ToString();
                parent.Remark = reader["Remark"].ToString();
            }
            return parent;
        }

        /// <summary>
        /// 查询刚刚插入的运输合同的PKID
        /// </summary>
        /// <returns>运输合同PKID</returns>
        public int GetBillReturnPKID() {
            SQLHelper helper = new SQLHelper();
            SqlDataReader reader = helper.ExecuteDataReader("uspGetBillReturnPKID", null);
            return int.Parse(reader["PKID"].ToString());
        }
    }
}
