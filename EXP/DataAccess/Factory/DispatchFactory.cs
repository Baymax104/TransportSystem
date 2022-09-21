using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
// ******************************************************************
// 文件名: Light.EXP.DataAccess.Dispatch.DispatchFactory.cs
// Copyright  (c)  2006-2007 ATA
// 作者:       韦振宇
// 创建日期：  2021-10-13
// 主要内容：  配船管理模块的运输合同数据工厂类文件
// ******************************************************************


namespace Light.EXP.DataAccess.Dispatch {

    using System;
    using System.Data;
    using System.Reflection;
    using System.Data.SqlClient;
    using Light.EXP.Model.Dispatch;
    using Light.EXP.DataAccess.Dispatch;
    using Light.EXP.SystemFrameworks;

    public sealed class DispatchFactory {

        public DispatchFactory() { }

        /// <summary>
        /// BillReturnParentInterface的接口创建
        /// </summary>
        /// <returns></returns>
        public static BillReturnParentInterface CreateBillReturnParent() {
            string path = EXPConfiguration.DataAccess;
			string className = path + ".Dispatch.BillReturnParentSQLHandle";
            return (BillReturnParentInterface)Assembly.Load(path).CreateInstance(className);
        }


        public static BillReturnDetailInterface CreateBillReturnDetail() {
            string path = EXPConfiguration.DataAccess;
			string className = path + ".Dispatch.BillReturnDetailSQLHandle";
            BillReturnDetailInterface bill = (BillReturnDetailInterface)Assembly.Load(path).CreateInstance(className);
            return (BillReturnDetailInterface)Assembly.Load(path).CreateInstance(className);
        }
    }
}
