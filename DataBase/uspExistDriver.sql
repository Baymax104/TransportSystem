USE [logisticsNew]
GO
/****** Object:  StoredProcedure [dbo].[uspCreateBillReturn]    Script Date: 2021/9/22 9:14:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/********************************************************************************* 
*过程名称 : uspExistDriver
*功能描述 : 判断该运输合同司机是否为空值
*输入参数 : 
	@PKID INT							--回执单PKID
*输出参数 : 
	无
*返 回 值 :
	0:不存在
	1:存在
*作	   者 : 韦振宇
*创建日期 : 2021-9-22     
***********************************************************************************/
ALTER PROCEDURE [dbo].[uspExistDriver]
(
	@PKID INT							--回执单PKID
)
AS
BEGIN
	DECLARE @driverPKID INT
	SELECT @driverPKID = DriverPKID
	FROM Dispatch_BillReturnParent
	WHERE PKID = @PKID
	IF @driverPKID = -1
	BEGIN
		RETURN 0
	END
	ELSE
	BEGIN
		RETURN 1
	END
END
