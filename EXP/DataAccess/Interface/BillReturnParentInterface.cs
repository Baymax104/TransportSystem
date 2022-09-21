using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
// ******************************************************************
// 文件名: Light.EXP.DataAccess.Dispatch.BillReturnParentInterface.cs
// Copyright  (c)  2006-2007 ATA
// 作者:       韦振宇
// 创建日期：  2021-10-13
// 主要内容：  配车管理模块的运输合同数据接口文件
// ******************************************************************


namespace Light.EXP.DataAccess.Dispatch {

    using System;
    using System.Data;
    using System.Data.SqlClient;
    using Light.EXP.Model.Dispatch;

    public interface BillReturnParentInterface {
        /// <summary>
        /// 获取多个主要城市实体
        /// </summary>
        /// <returns>城市实体集合</returns>
        DataSet GetDispatchCitys();

        /// <summary>
        /// 获取多个四级信息实体
        /// </summary>
        /// <returns>司机信息实体集合</returns>
        DataSet GetDispatchDrivers();

        /// <summary>
        /// 获取单个司机信息实体
        /// </summary>
        /// <param name="pkId">司机ID</param>
        /// <returns>司机信息实体</returns>
        DataTable GetDispatchDriver(int pkId);

        /// <summary>
        /// 判断运输合同主表中是否存在指定运输合同编号的记录
        /// </summary>
        /// <param name="goodsRevertBillCode">运输合同编号</param>
        /// <param name="pkId">运输合同PKID</param>
        /// <returns>是否存在</returns>
        bool ExistBillReturn(string goodsRevertBillCode, int pkId);

        /// <summary>
        /// 获取接货点
        /// </summary>
        /// <param name="goodsRevertBillCode">运输合同编号</param>
        /// <returns>接货点</returns>
        string GetDispatchAcceptStation(string goodsRevertBillCode);

        /// <summary>
        /// 增加运输合同
        /// </summary>
        /// <param name="billReturnParent">BillReturnParent实体</param>
        /// <returns>运输合同PKID</returns>
        bool CreateBillReturn(BillReturnParent billReturnParent);

        /// <summary>
        /// 修改运输合同
        /// </summary>
        /// <param name="billReturnParent">BillReturnParent实体</param>
        /// <returns>是否修改成功</returns>
        bool UpdateBillReturn(BillReturnParent billReturnParent);

        /// <summary>
        /// 判断运输合同详表中是否存在指定运输合同编号的货物信息
        /// </summary>
        /// <param name="goodsRevertBillPKID">运输合同PKID</param>
        /// <returns>是否存在</returns>
        bool ExistDispatchGoods(int goodsRevertBillPKID);

        /// <summary>
        /// 删除运输合同
        /// </summary>
        /// <param name="pkId">运输合同PKID</param>
        /// <returns>删除是否成功</returns>
        bool DeleteBillReturn(int pkId);

        /// <summary>
        /// 获取多个运输合同实体
        /// </summary>
        /// <param name="backBillState">运输合同状态</param>
        /// <param name="driverName">司机名称</param>
        /// <param name="goodsRevertBillCode">运输合同编号</param>
        /// <param name="beginSignTime">签订起始时间</param>
        /// <param name="endSignTime">签订结束时间</param>
        /// <returns>运输合同实体集合</returns>
        DataSet GetBillReturns(string backBillState, string driverName, string goodsRevertBillCode,
                                DateTime beginSignTime, DateTime endSignTime);

        /// <summary>
        /// 获取单个运输合同实体
        /// </summary>
        /// <param name="pkId">运输合同ID</param>
        /// <returns>BillReturnParent实体</returns>
        BillReturnParent GetBillReturn(string goodsRevertBillCode);

        /// <summary>
        /// 查询刚刚增入的运输合同PKID
        /// </summary>
        /// <returns>运输合同PKID</returns>
        int GetBillReturnPKID();
    }
}
