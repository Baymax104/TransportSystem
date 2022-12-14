USE [logisticsNew]
GO
/****** Object:  StoredProcedure [dbo].[uspUpdateBillReturn]    Script Date: 2022/10/30 0:01:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/********************************************************************************* 
*过程名称 : uspUpdateBillReturn
*功能描述 : 修改运输合同
*输入参数 : 
	@PKID INT,								--运输合同
	@goodsRevertBillCode VARCHAR(50),		--运输合同编号
	@driverPKID INT,						--承运人
	@loadStation VARCHAR(50),				--发货地
	@startCarryTime DATETIME,				--起运时间
	@dealGoodsStation VARCHAR(50),			--交货地
	@arriveTime DATETIME,					--到达时间
	@receiveGoodsLinkman VARCHAR(50),		--收货联系人
	@linkmanPhone VARCHAR(50),				--联系人电话
	@linkmanMobile	VARCHAR(50),			--联系人手机
	@receiveGoodsDetailAddr VARCHAR(50),	--收货详细地址
	@carryGoodsInsurance MONEY,				--承运人订装货物保证金
	@dispatchServiceFee MONEY,				--配载服务费
	@carriageBanlanceMode VARCHAR(50),		--运费结算方式
	@carryGoodsBillDeposit MONEY,			--送货单回执押金
	@carriageMode VARCHAR(50),				--运输计价方式
	@allCarriage MONEY,						--总运费
	@insurance MONEY,						--保险费
	@startAdvance MONEY,					--预付费用
	@acceptStation VARCHAR(50),				--接货点
	@remark VARCHAR(50)						--备注
*输出参数 : 
	无
*返 回 值 :
	 0:成功
	 <> 0:失败
*作	   者 : 韦振宇
*创建日期 : 2021-9-15     
***********************************************************************************/
CREATE PROCEDURE [dbo].[uspUpdateBillReturn]
(
	@PKID INT,								--运输合同ID
	@goodsRevertBillCode VARCHAR(50),		--运输合同编号
	@driverPKID INT,						--承运人
	@loadStation VARCHAR(50),				--发货地
	@startCarryTime DATETIME,				--起运时间
	@dealGoodsStation VARCHAR(50),			--交货地
	@arriveTime DATETIME,					--到达时间
	@receiveGoodsLinkman VARCHAR(50),		--收货联系人
	@linkmanPhone VARCHAR(50),				--联系人电话
	@linkmanMobile	VARCHAR(50),			--联系人手机
	@receiveGoodsDetailAddr VARCHAR(50),	--收货详细地址
	@carryGoodsInsurance MONEY,				--承运人订装货物保证金
	@dispatchServiceFee MONEY,				--配载服务费
	@carriageBanlanceMode VARCHAR(50),		--运费结算方式
	@carryGoodsBillDeposit MONEY,			--送货单回执押金
	@carriageMode VARCHAR(50),				--运输计价方式
	@allCarriage MONEY,						--总运费
	@insurance MONEY,						--保险费
	@startAdvance MONEY,					--预付费用
	@signTime DATETIME,						--签订时间
	@acceptStation VARCHAR(50),				--接货点
	@remark VARCHAR(50)						--备注
)
AS
BEGIN
	UPDATE BillMgt_BillDetail
	SET BillCode = @goodsRevertBillCode,
		AcceptStation = @acceptStation
	WHERE PKID IN(
		SELECT b.PKID
		FROM BillMgt_BillDetail b
		INNER JOIN Dispatch_BillReturnParent d
		ON d.GoodsRevertBillCode = b.BillCode
		WHERE BillType = '回执单'
		AND d.PKID = @PKID
	)

	UPDATE Dispatch_BillReturnParent
	SET GoodsRevertBillCode = @goodsRevertBillCode,
		LoadStation = @loadStation,
		StartCarryTime = @startCarryTime,
		DealGoodsStation = @dealGoodsStation,
		ArriveTime = @arriveTime,
		ReceiveGoodsLinkman = @receiveGoodsLinkman,
		LinkmanPhone = @linkmanPhone,
		LinkmanMobile = @linkmanMobile,
		ReceiveGoodsDetailAddr = @receiveGoodsDetailAddr,
		CarriageBanlanceMode = @carriageBanlanceMode,
		Remark = @remark,
		DriverPKID = @driverPKID,
		StartAdvance = @startAdvance,
		CarryGoodsBillDeposit = @carryGoodsBillDeposit,
		CarryGoodsInsurance = @carryGoodsInsurance,
		DispatchServiceFee = @dispatchServiceFee,
		AllCarriage = @allCarriage,
		Insurance = @insurance,
		AcceptStation = @acceptStation,
		CarriageMode = @carriageMode,
		SignTime = @signTime
	WHERE PKID = @PKID
	IF @@ERROR <> 0 OR @@ROWCOUNT = 0
	BEGIN
		RETURN 1
	END
	ELSE
	BEGIN
		RETURN 0
	END
END
GO
