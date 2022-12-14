USE [logisticsNew]
GO
/****** Object:  StoredProcedure [dbo].[uspGetLoadedGoods]    Script Date: 2022/10/30 0:01:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/********************************************************************************* 
*过程名称 : uspGetLoadedGoods
*功能描述 : 用于运输货物信息页面已装货列表的数据绑定
*输入参数 : 
	@goodsRevertBillPKID INT			--运输合同ID
*输出参数 : 
	无
*返 回 值 :
	结果集
*作	   者 : 韦振宇
*创建日期 : 2021-9-22     
***********************************************************************************/
CREATE PROCEDURE [dbo].[uspGetLoadedGoods]
(
	@goodsRevertBillPKID INT			--运输合同ID
)
AS
BEGIN
	SELECT ACBP.GoodsBillCode,			--货运单编号
		DBP.GoodsRevertBillCode,		--运输合同编号
		ACBD.GoodsCode,					--货号
		ACBD.GoodsBillPKID,				--货运单PKID
		ACBP.SendGoodsCustomer,			--发货客户
		ACBD.GoodsName,					--品名
		DBD.PieceAmount,				--件数
		DBD.Weight,						--重量
		DBD.Volume,						--体积
		ACBP.TransferStation,			--中转目的地
		ACBP.SendGoodsCustomerTel,		--发货客户电话
		ACBD.PKID,						--货物PKID
		ACBD.GoodsBillPKID,				--货运单详表PKID
		ACBD.PriceMode,					--计价方式
		ACBD.GoodsValue					--货物价格
	FROM Dispatch_BillReturnParent DBP
	INNER JOIN Dispatch_BillReturnDetail DBD
	ON DBP.PKID = DBD.GoodsRevertBillPKID
	INNER JOIN Accept_CarryBillDetail ACBD
	ON ACBD.PKID = DBD.GoodsBillDetailPKID
	INNER JOIN Accept_CarryBillParent ACBP
	ON ACBP.PKID = ACBD.GoodsBillPKID
	WHERE DBP.PKID = @goodsRevertBillPKID
	AND DBD.PieceAmount > 0
	ORDER BY ACBD.GoodsBillPKID ASC
END
GO
