using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
// ******************************************************************
// 文件名: Light.EXP.DataAccess.Dispatch.BillReturnDetailInterface.cs
// Copyright  (c)  2006-2007 ATA
// 作者:       韦振宇
// 创建日期：  2021-10-13
// 主要内容：  配车管理模块的运输货物数据接口文件
// ******************************************************************


namespace Light.EXP.DataAccess.Dispatch {

    using System;
    using System.Data;
    using System.Data.SqlClient;
    using Light.EXP.Model.Dispatch;

    public interface BillReturnDetailInterface {
        /// <summary>
        /// 获取多个已装货物实体
        /// </summary>
        /// <param name="goodsRevertBillPKID">运输合同ID</param>
        /// <returns>已装货物实体集合</returns>
        DataSet GetLoadedGoods(int goodsRevertBillPKID);

        /// <summary>
        /// 获取多个待装货物实体
        /// </summary>
        /// <param name="sendGoodsAddr">起点</param>
        /// <param name="receiveGoodsAddr">终点</param>
        /// <returns>待装货物实体集合</returns>
        DataSet GetUnloadGoods(string sendGoodsAddr, string receiveGoodsAddr);

        /// <summary>
        /// 判断该运输合同司机是否为空值，若为空值，不能发货
        /// </summary>
        /// <param name="pkId">运输合同PKID</param>
        /// <returns>是否为空</returns>
        bool ExistDriver(int pkId);

        /// <summary>
        /// 装(卸)货
        /// </summary>
        /// <param name="billReturnDetail">BillReturnDetail实体</param>
        /// <returns>是否装(卸)货成功</returns>
        bool LoadGood(BillReturnDetail billReturnDetail);

        /// <summary>
        /// 发货
        /// </summary>
        /// <param name="goodsRevertBillPKID">运输合同ID</param>
        /// <param name="goodsBillCodes">货运单编号字符串</param>
        /// <returns>是否发货成功</returns>
        bool TransportGood(int goodsRevertBillPKID, string goodsBillCodes);
    }
}
