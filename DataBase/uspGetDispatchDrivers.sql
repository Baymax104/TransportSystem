USE [logisticsNew]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/********************************************************************************* 
*过程名称 : uspGetDispatchDrivers
*功能描述 : 获取多条司机信息，用于派车管理模块的承运人下拉框
*输入参数 : 
	无
*输出参数 : 
	无
*返 回 值 :
	结果集 
*作	   者 : 韦振宇
*创建日期 : 2021-9-15     
***********************************************************************************/
ALTER PROCEDURE [dbo].[uspGetDispatchDrivers]
AS
BEGIN
	SELECT PKID,		--司机ID
		DriverName		--司机名称
	FROM Basic_DriverInfor;
END
GO