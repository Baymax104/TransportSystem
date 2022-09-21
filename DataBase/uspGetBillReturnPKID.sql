USE [logisticsNew]
GO
/****** Object:  StoredProcedure [dbo].[uspCreateBillReturn]    Script Date: 2021/9/22 9:14:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/********************************************************************************* 
*过程名称 : uspGetBillReturnPKID
*功能描述 : 查询出刚刚增入的运输合同的PKID
*输入参数 : 
	无
*输出参数 : 
	@PKID INT							--运输合同PKID
*返 回 值 :
	无
*作	   者 : 韦振宇
*创建日期 : 2021-9-15     
***********************************************************************************/
ALTER PROCEDURE [dbo].[uspGetBillReturnPKID]
AS
BEGIN
	SELECT MAX(PKID)
	FROM Dispatch_BillReturnParent
END
