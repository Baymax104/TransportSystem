USE [logisticsNew]
GO
/****** Object:  StoredProcedure [dbo].[uspExistBillReturn]    Script Date: 2021/11/18 15:18:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/********************************************************************************* 
*过程名称 : uspExistBillReturn
*功能描述 : 判断运输合同主表中是否存在指定运输合同编号的记录，用于配车管理模块新增或修改运输合同之前的逻辑判断
*输入参数 : 
	@goodsRevertBillCode	VARCHAR(50) --运输合同编号
	@PKID					INT			--运输合同PKID
*输出参数 : 
	无
*返 回 值 :
	0:不存在
	1:存在
*作	   者 : 韦振宇
*创建日期 : 2021-9-15     
***********************************************************************************/
ALTER PROCEDURE [dbo].[uspExistBillReturn]
(
	@goodsRevertBillCode	VARCHAR(50),	--运输合同编号
	@PKID					INT				--运输合同PKID
)
AS
BEGIN
	IF @PKID = -1
	BEGIN
		IF EXISTS
		(
			SELECT *
			FROM Dispatch_BillReturnParent
			WHERE GoodsRevertBillCode = @goodsRevertBillCode
		)
		BEGIN
			RETURN 1
		END
		ELSE
		BEGIN
			RETURN 0
		END
	END
	ELSE
	BEGIN
		IF EXISTS
		(
			SELECT *
			FROM Dispatch_BillReturnParent
			WHERE GoodsRevertBillCode = @goodsRevertBillCode
			AND PKID = @PKID
		)
		BEGIN
			RETURN 1
		END
		ELSE
		BEGIN
			RETURN 0
		END
	END
END
