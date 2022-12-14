USE [logisticsNew]
GO
/****** Object:  StoredProcedure [dbo].[uspGetBillReturn]    Script Date: 2022/10/30 0:01:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/********************************************************************************* 
*过程名称 : uspGetBillReturn
*功能描述 : 获取单条运输合同信息，用于派车管理模块的编辑或查看运输合同功能
*输入参数 : 
	@PKID INT					--运输合同ID
*输出参数 : 
	无
*返 回 值 :
	结果集
*作	   者 : 韦振宇
*创建日期 : 2021-9-15     
***********************************************************************************/
CREATE PROCEDURE [dbo].[uspGetBillReturn]
(
	@goodsRevertBillCode VARCHAR(50)	--运输合同编号
)
AS
BEGIN
	SELECT PKID,						--运输合同PKID
		GoodsRevertBillCode,			--运输合同编号
		DriverPKID,						--承运人
		LoadStation,					--发货地
		StartCarryTime,					--起运时间
		DealGoodsStation,				--交货地
		ArriveTime,						--到达时间
		ReceiveGoodsLinkman,			--收货联系人
		LinkmanPhone,					--联系人电话
		LinkmanMobile,					--联系人手机
		ReceiveGoodsDetailAddr,			--收货详细地址
		CarryGoodsInsurance,			--承运人订装货物保证金
		DispatchServiceFee,				--配载服务费
		CarriageBanlanceMode,			--运费结算方式
		CarryGoodsBillDeposit,			--送货单回执押金
		CarriageMode,					--运输计价方式
		AllCarriage,					--总运费
		Insurance,						--保险费
		StartAdvance,					--预付费用
		IfBalance, 						--是否结算
		BackBillState,					--回执单状态
		SignTime, 						--签订时间
		AcceptStation,					--接货点
		Remark							--备注
	FROM Dispatch_BillReturnParent
	WHERE GoodsRevertBillCode = @goodsRevertBillCode
END
GO
