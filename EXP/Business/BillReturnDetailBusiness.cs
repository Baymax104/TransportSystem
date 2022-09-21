using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
// ******************************************************************
// 文件名: Light.EXP.Business.Dispatch.BillReturnDetailBusiness.cs
// Copyright  (c)  2006-2007 ATA
// 作者:       韦振宇
// 创建日期：  2021-10-14
// 主要内容：  配车管理模块的运输货物业务处理类文件
// ******************************************************************


namespace Light.EXP.Business.Dispatch {

    using System.Data;
    using Light.EXP.DataAccess.Dispatch;
    using Light.EXP.Model.Dispatch;

    public class BillReturnDetailBusiness {

        /// <summary>
        /// 获取多个已装货物实体，用于运输合同信息编辑页面已装货物列表的绑定
        /// </summary>
        /// <param name="goodsRevertBillPKID">运输合同ID</param>
        /// <returns>已装货物实体集合</returns>
        public DataSet GetLoadedGoods(int goodsRevertBillPKID) {
            BillReturnDetailInterface billReturnDetail = DispatchFactory.CreateBillReturnDetail();
            return billReturnDetail.GetLoadedGoods(goodsRevertBillPKID);
        }

        /// <summary>
        /// 获取多个待装货物实体，用于运输合同信息编辑页面待装货物列表的绑定
        /// </summary>
        /// <param name="sendGoodsAddr">起点</param>
        /// <param name="receiveGoodsAddr">终点</param>
        /// <returns>待装货物实体集合</returns>
        public DataSet GetUnloadGoods(string sendGoodsAddr, string receiveGoodsAddr) {
            BillReturnDetailInterface billReturnDetail = DispatchFactory.CreateBillReturnDetail();
            return billReturnDetail.GetUnloadGoods(sendGoodsAddr, receiveGoodsAddr);
        }

        /// <summary>
        /// 判断该运输合同司机是否为空值，在this.TransportGood()调用之前调用
        /// </summary>
        /// <param name="pkId">运输合同PKID</param>
        /// <returns>是否存在</returns>
        public bool ExistDriver(int pkId) {
            BillReturnDetailInterface billReturnDetail = DispatchFactory.CreateBillReturnDetail();
            return billReturnDetail.ExistDriver(pkId);
        }

        /// <summary>
        /// 装(卸)货，用于运输货物信息编辑页面装车(卸货)按钮的单击事件处理
        /// </summary>
        /// <param name="billReturnDetail">运输货物实体</param>
        /// <returns>装(卸)货是否成功</returns>
        public bool LoadGood(BillReturnDetail billReturnDetail) {
            BillReturnDetailInterface billReturn = DispatchFactory.CreateBillReturnDetail();
            return billReturn.LoadGood(billReturnDetail);
        }

        /// <summary>
        /// 发货，用于运输货物信息编辑页面装车发货按钮的单击事件处理
        /// </summary>
        /// <param name="goodsRevertBillPKID">运输合同ID</param>
        /// <param name="goodsBillCodes">货运单编号字符串</param>
        /// <returns>发货是否成功</returns>
        public bool TransportGood(int goodsRevertBillPKID, string goodsBillCodes) {
            BillReturnDetailInterface billReturnDetail = DispatchFactory.CreateBillReturnDetail();
            return billReturnDetail.TransportGood(goodsRevertBillPKID, goodsBillCodes);
        }
    }
}
