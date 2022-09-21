USE [logisticsNew]
GO
/****** Object:  StoredProcedure [dbo].[uspExistBillReturn]    Script Date: 2021/9/18 18:43:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/********************************************************************************* 
*过程名称 : uspGetDispatchAcceptStation
*功能描述 : 获取指定运输合同编号的接货点，用于配车管理模块增加或修改运输合同之前的逻辑判断
*输入参数 : 
	@goodsBillCode	VARCHAR(50) --货运单编号
*输出参数 : 
	无
*返 回 值 :
	acceptStation
*作	   者 : 韦振宇
*创建日期 : 2021-9-15     
***********************************************************************************/
ALTER PROCEDURE [dbo].[uspGetDispatchAcceptStation]
(
	@goodsBillCode	VARCHAR(50) --运输合同编号
)
AS
BEGIN
	DECLARE @acceptStation VARCHAR(50)
	DECLARE @billStartCode VARCHAR(50)
	DECLARE @billEndCode VARCHAR(50)

	DECLARE cursorBillDispense CURSOR
	FOR 
		SELECT BillStartCode,
			BillEndCode,
			AcceptStation
		FROM BillMgt_BillDispense
		WHERE BillType = '回执单'

	OPEN cursorBillDispense
	FETCH NEXT FROM cursorBillDispense 
		INTO @billStartCode,
			 @billEndCode,
			 @acceptStation
	WHILE @@FETCH_STATUS = 0
	BEGIN
		IF @goodsBillCode <= @billStartCode
		AND @goodsBillCode >= @billEndCode
		BEGIN
			RETURN @acceptStation
		END
		FETCH NEXT FROM cursorBillDispense 
		INTO @billStartCode,
			 @billEndCode,
			 @acceptStation
	END
	CLOSE cursorBillDispense
	DEALLOCATE cursorBillDispense
	RETURN NULL
END
