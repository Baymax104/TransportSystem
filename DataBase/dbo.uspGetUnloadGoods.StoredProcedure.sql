USE [logisticsNew]
GO
/****** Object:  StoredProcedure [dbo].[uspGetUnloadGoods]    Script Date: 2022/10/30 0:01:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/********************************************************************************* 
*过程名称 : uspGetUnloadGoods
*功能描述 : 用于运输货物信息页面待装货列表的数据绑定
*输入参数 : 
	@sendGoodsAddr NVARCHAR(50),		--起点
	@receiveGoodsAddr NVARCHAR(50)		--终点
*输出参数 : 
	无
*返 回 值 :
	结果集
*作	   者 : 韦振宇
*创建日期 : 2021-9-15     
***********************************************************************************/
CREATE PROCEDURE [dbo].[uspGetUnloadGoods]
(
	@sendGoodsAddr NVARCHAR(50),		--起点
	@receiveGoodsAddr NVARCHAR(50)		--终点
)
AS
BEGIN
	DECLARE @function NVARCHAR(4000)
	SET @function = 'SELECT ACBP.GoodsBillCode,			--货运单编号
		ACBP.SendGoodsCustomer,			--发货客户
		ACBD.GoodsBillPKID,				--货运单PKID
		ACBD.GoodsName,					--品名
		ACBD.PieceAmount,				--总件数
		ACBP.TransferStation,			--中转目的地
		ACBP.SendGoodsCustomerTel,		--发货客户电话
		ACBD.PKID,						--货物ID
		ACBD.RemainPieceCount,			--剩余件数
		ACBD.GoodsCode,					--货号
		ACBD.Weight,					--重量
		ACBD.Volume,					--体积
		ACBD.PieceAmount,				--计价方式
		ACBD.GoodsValue,				--货物价格
		ACBD.RemainPieceCount			--剩余货量
	FROM Accept_CarryBillParent ACBP
	INNER JOIN BillMgt_BillDetail BBD
	ON BBD.BillCode = ACBP.GoodsBillCode
	INNER JOIN Accept_CarryBillDetail ACBD
	ON ACBD.GoodsBillPKID = ACBP.PKID
	WHERE BBD.BillType = ''货运单''
	AND BBD.BillState <> ''作废''
	AND ACBD.RemainPieceCount > 0'

	IF @sendGoodsAddr IS NOT NULL
	BEGIN
		SET @function = @function + ' AND ACBP.SendGoodsAddr = @sendGoodsAddr'
	END
	
	IF @receiveGoodsAddr IS NOT NULL
	BEGIN
		SET @function = @function + ' AND ACBP.ReceiveGoodsAddr = @receiveGoodsAddr'
	END
	
	SET @function = @function + ' ORDER BY SendGoodsDate ASC'
	
	EXEC sp_executesql @function, N'@sendGoodsAddr NVARCHAR(50),
									@receiveGoodsAddr NVARCHAR(50)',
									@sendGoodsAddr,
									@receiveGoodsAddr
END
GO
