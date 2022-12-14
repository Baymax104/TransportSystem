USE [logisticsNew]
GO
/****** Object:  StoredProcedure [dbo].[uspGetBillReturns]    Script Date: 2022/10/30 0:01:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/********************************************************************************* 
*过程名称 : uspGetBillReturns
*功能描述 : 获取多条运输合同信息，用于派车管理模块的运输合同查询功能
*输入参数 : 
	@backBillState NVARCHAR(50),		--运输合同状态
	@driverName NVARCHAR(50),			--司机名称
	@goodsRevertBillCode NVARCHAR(50),	--运输合同编号
	@beginSignTime DATETIME,			--签订起始时间
	@endSignTime DATETIME				--签订结束时间
*输出参数 : 
	无
*返 回 值 :
	 无
*作	   者 : 韦振宇
*创建日期 : 2021-9-19     
***********************************************************************************/
CREATE PROCEDURE [dbo].[uspGetBillReturns]
(
	@backBillState NVARCHAR(50),		--运输合同状态
	@driverName NVARCHAR(50),			--司机名称
	@goodsRevertBillCode NVARCHAR(50),	--运输合同编号
	@beginSignTime DATETIME,			--签订起始时间
	@endSignTime DATETIME				--签订结束时间
)
AS
BEGIN
	DECLARE @function NVARCHAR(4000)
	SET @function = 'SELECT DB.GoodsRevertBillCode,	--运输合同编号
		BDI.DriverName,			--司机名称
		DB.AllCarriage,			--总运费
		DB.Insurance,			--保险费
		DB.LoadStation,			--装货地点
		DB.DealGoodsStation,	--交货地点
		DB.StartCarryTime,		--起运时间
		DB.ArriveTime,			--到达时间
		DB.SignTime,			--签订时间
		DB.PKID,				--运输合同ID
		DB.BackBillState		--运输合同状态
	FROM Dispatch_BillReturnParent DB
	INNER JOIN Basic_DriverInfor BDI
	ON DB.DriverPKID = BDI.PKID
	INNER JOIN BillMgt_BillDetail BM
	ON DB.GoodsRevertBillCode = BM.BillCode
	WHERE BM.BillType = ''回执单''
	AND BM.BillState <> ''作废'''

	IF @backBillState IS NOT NULL
	BEGIN
		SET @function = @function + ' AND DB.BackBillState = @backBillState'
	END
	
	IF @driverName IS NOT NULL
	BEGIN
		SET @function = @function + ' AND BDI.DriverName LIKE ''%'' + @driverName + ''%'''
	END
	
	IF @goodsRevertBillCode IS NOT NULL
	BEGIN
		SET @function = @function + ' AND DB.GoodsRevertBillCode LIKE ''%'' + @goodsRevertBillCode + ''%'''
	END
	
	IF @beginSignTime IS NOT NULL
	BEGIN
		SET @function = @function + ' AND SignTime >= @beginSignTime'
	END

	IF @endSignTime IS NOT NULL
	BEGIN
		SET @function = @function + ' AND SignTime <= @endSignTime'
	END

	EXEC sp_executesql @function, N'@backBillState NVARCHAR(50),
									@driverName NVARCHAR(50),
									@goodsRevertBillCode NVARCHAR(50),
									@beginSignTime DATETIME,
									@endSignTime DATETIME',
									@backBillState,
									@driverName,
									@goodsRevertBillCode,
									@beginSignTime,
									@endSignTime
END
GO
