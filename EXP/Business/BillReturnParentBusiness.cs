using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
// ******************************************************************
// 文件名: Light.EXP.Business.Dispatch.BillReturnParentBusiness.cs
// Copyright  (c)  2006-2007 ATA
// 作者:       韦振宇
// 创建日期：  2021-10-13
// 主要内容：  配车管理模块的运输合同业务处理类文件
// ******************************************************************


namespace Light.EXP.Business.Dispatch {

    using System.Data;
    using Light.EXP.DataAccess.Dispatch;
    using Light.EXP.Model.Dispatch;
    public class BillReturnParentBusiness {

        /// <summary>
        /// 获取多个主要城市实体，用于配车管理模块发货地或交货地下拉框的数据绑定
        /// </summary>
        /// <returns>城市实体集合</returns>
        public DataSet GetDispatchCitys() {
            BillReturnParentInterface billReturnParent = DispatchFactory.CreateBillReturnParent();
            return billReturnParent.GetDispatchCitys();
        }

        /// <summary>
        /// 获取多个司机信息实体，用于配车管理模块承运人下拉框的数据绑定
        /// </summary>
        /// <returns>司机信息实体</returns>
        public DataSet GetDispatchDrivers() {
            BillReturnParentInterface billReturnParent = DispatchFactory.CreateBillReturnParent();
            return billReturnParent.GetDispatchDrivers();
        }

        /// <summary>
        /// 获取单个司机信息实体，用于填写运输合同或编辑合同页面承运人下拉框的SelectIndexChanged事件处理
        /// </summary>
        /// <param name="pkId">司机ID</param>
        /// <returns>司机信息实体</returns>
        public DataTable GetDispatchDriver(int pkId) {
            BillReturnParentInterface billReturnParent = DispatchFactory.CreateBillReturnParent();
            return billReturnParent.GetDispatchDriver(pkId);
        }

        /// <summary>
        /// 判断运输合同主表中是否存在指定运输合同编号的记录，用于配车管理模块增加或修改运输合同之前的逻辑判断
        /// </summary>
        /// <param name="goodsRevertBillCode">运输合同编号</param>
        /// <param name="pkId">运输合同PKID</param>
        /// <returns>是否存在</returns>
        public bool ExistBillReturn(string goodsRevertBillCode, int pkId) {
            BillReturnParentInterface billReturnParent = DispatchFactory.CreateBillReturnParent();
            return billReturnParent.ExistBillReturn(goodsRevertBillCode, pkId);
        }

        /// <summary>
        /// 获取接货点信息，用于增加或修改运输合同之前的逻辑判断
        /// </summary>
        /// <param name="goodsRevertBillCode">运输合同编号</param>
        /// <returns>接货点字符串</returns>
        public string GetDispatchAcceptStation(string goodsRevertBillCode) {
            BillReturnParentInterface billReturnParent = DispatchFactory.CreateBillReturnParent();
            return billReturnParent.GetDispatchAcceptStation(goodsRevertBillCode);
        }

        /// <summary>
        /// 增加运输合同，用于填写运输合同页面添加按钮的单击事件处理
        /// </summary>
        /// <param name="billReturnParent">BillReturnParent实体</param>
        /// <returns>BillReturnParent实体PKID</returns>
        public bool CreateBillReturn(BillReturnParent billReturnParent) {
            BillReturnParentInterface billReturn = DispatchFactory.CreateBillReturnParent();
            return billReturn.CreateBillReturn(billReturnParent);
        }

        /// <summary>
        /// 修改运输合同，用于编辑运输合同页面修改按钮的单击事件处理
        /// </summary>
        /// <param name="billReturnParent">BillReturnParent实体</param>
        /// <returns>是否修改成功</returns>
        public bool UpdateBillReturn(BillReturnParent billReturnParent) {
            BillReturnParentInterface billReturn = DispatchFactory.CreateBillReturnParent();
            return billReturn.UpdateBillReturn(billReturnParent);
        }

        /// <summary>
        /// 判断运输合同详表中是否存在指定运输合同编号的货物信息，用于配车管理模块删除运输合同之前的逻辑判断
        /// </summary>
        /// <param name="goodsRevertBillPKID">运输合同ID</param>
        /// <returns>是否存在</returns>
        public bool ExistDispatchGoods(int goodsRevertBillPKID) {
            BillReturnParentInterface billReturnParent = DispatchFactory.CreateBillReturnParent();
            return billReturnParent.ExistDispatchGoods(goodsRevertBillPKID);
        }

        /// <summary>
        /// 删除运输合同，用于编辑运输合同页面删除按钮的单击事件处理
        /// </summary>
        /// <param name="pkId">运输合同ID</param>
        /// <returns>删除是否成功</returns>
        public bool DeleteBillReturn(int pkId) {
            BillReturnParentInterface billReturnParent = DispatchFactory.CreateBillReturnParent();
            return billReturnParent.DeleteBillReturn(pkId);
        }

        /// <summary>
        /// 获取多个运输合同实体，用于运输合同信息查询页面GridView的数据绑定
        /// </summary>
        /// <param name="backBillState">运输合同状态</param>
        /// <param name="driverName">司机名称</param>
        /// <param name="goodsRevertBillCode">运输合同编号</param>
        /// <param name="beginSignTime">签订起始时间</param>
        /// <param name="endSignTime">签订结束时间</param>
        /// <returns>运输合同实体集合</returns>
        public DataSet GetBillReturns(string backBillState, string driverName, string goodsRevertBillCode,
                                        DateTime beginSignTime, DateTime endSignTime) {
            BillReturnParentInterface billReturnParent = DispatchFactory.CreateBillReturnParent();
            return billReturnParent.GetBillReturns(backBillState, driverName, goodsRevertBillCode,                                                  beginSignTime, endSignTime);
        }

        /// <summary>
        /// 获取单个运输合同实体，用于编辑运输合同页面表单的数据填充
        /// </summary>
        /// <param name="pkId">运输合同PKID</param>
        /// <returns>运输合同实体</returns>
        public BillReturnParent GetBillReturn(string goodsRevertBillCode) {
            BillReturnParentInterface billReturnParent = DispatchFactory.CreateBillReturnParent();
            return billReturnParent.GetBillReturn(goodsRevertBillCode);
        }

        /// <summary>
        /// 查询出刚刚插入的运输合同PKID，用于编辑运输合同页面向运输货物信息编辑页面的参数传递
        /// </summary>
        /// <returns>运输合同PKID</returns>
        public int GetBillReturnPKID() {
            BillReturnParentInterface billReturnParent = DispatchFactory.CreateBillReturnParent();
            return billReturnParent.GetBillReturnPKID();
        }
    }
}
