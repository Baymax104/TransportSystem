USE [logisticsNew]
GO
/****** Object:  StoredProcedure [dbo].[uspCreateBillReturn]    Script Date: 2021/11/18 15:16:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/********************************************************************************* 
*过程名称 : uspCreateBillReturn
*功能描述 : 增加运输合同
*输入参数 : 
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
	@ifBalance VARCHAR(50),					--是否结算
	@backBillState VARCHAR(50),				--回执单状态
	@signTime DATETIME,						--签订时间
	@acceptStation VARCHAR(50),				--接货点
	@remark VARCHAR(50)						--备注
*输出参数 : 
	@PKID INT OUTPUT						--运输合同信息ID
*返 回 值 :
	 0:成功
	 <> 0:失败
*作	   者 : 韦振宇
*创建日期 : 2021-9-15     
***********************************************************************************/
ALTER PROCEDURE [dbo].[uspCreateBillReturn]
(
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
	@ifBalance VARCHAR(50),					--是否结算
	@backBillState VARCHAR(50),				--回执单状态
	@signTime DATETIME,						--签订时间
	@acceptStation VARCHAR(50),				--接货点
	@remark VARCHAR(50),					--备注
	@PKID INT OUTPUT						--运输合同信息PKID
)
AS
BEGIN
	INSERT INTO Dispatch_BillReturnParent
	VALUES
	(
		@goodsRevertBillCode,
		@loadStation,
		@startCarryTime,
		@dealGoodsStation,
		@arriveTime,
		@receiveGoodsLinkman,
		@linkmanPhone,
		@linkmanMobile,
		@receiveGoodsDetailAddr,
		@carriageBanlanceMode,
		@remark,
		@driverPKID,
		@ifBalance,
		@backBillState,
		@startAdvance,
		@carryGoodsBillDeposit,
		@carryGoodsInsurance,
		@dispatchServiceFee,
		@allCarriage,
		@insurance,
		@signTime,
		@acceptStation,
		@carriageMode,
		0
	)
	SELECT @PKID = @@IDENTITY

	INSERT INTO BillMgt_BillDetail
	VALUES
	(
		'回执单',
		@goodsRevertBillCode,
		'已填',
		@signTime,
		@acceptStation
	)

	IF @@ERROR <> 0 OR @@ROWCOUNT = 0
	BEGIN
		RETURN 1
	END
	ELSE
	BEGIN
		RETURN 0
	END
END
