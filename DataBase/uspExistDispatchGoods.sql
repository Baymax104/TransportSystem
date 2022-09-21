USE [logisticsNew]
GO
/****** Object:  StoredProcedure [dbo].[uspExistDispatchGoods]    Script Date: 2021/11/18 15:18:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/********************************************************************************* 
*过程名称 : uspExistDispatchGoods
*功能描述 : 用于运输合同详表中是否存在指定运输合同编号的货物信息，用于配车管理模块的删除运输合同之前的逻辑判断
*输入参数 : 
	@goodsRevertBillPKID INT			--运输合同ID
*输出参数 : 
	无
*返 回 值 :
	0:不存在
	1:存在
*作	   者 : 韦振宇
*创建日期 : 2021-9-15     
***********************************************************************************/
ALTER PROCEDURE [dbo].[uspExistDispatchGoods]
(
	@goodsRevertBillPKID INT			--运输合同ID
)
AS
BEGIN
	IF EXISTS(
		SELECT *
		FROM Dispatch_BillReturnDetail DBD
		INNER JOIN Accept_CarryBillDetail ACBD
		ON DBD.GoodsBillDetailPKID = ACBD.PKID
		INNER JOIN Accept_CarryBillParent ACBP
		ON ACBP.PKID = ACBD.GoodsBillPKID
		WHERE DBD.GoodsRevertBillPKID = @goodsRevertBillPKID
	)
	BEGIN
		RETURN 1
	END
	ELSE
	BEGIN
		RETURN 0
	END
END
