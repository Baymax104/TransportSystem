USE [logisticsNew]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/********************************************************************************* 
*过程名称 : uspGetDispatchDriver
*功能描述 : 获取单条司机信息，用于派车管理模块的承运人下拉框联动事件
*输入参数 : 
	@PKID 	INT	       --司机ID
*输出参数 : 
	无
*返 回 值 :
	结果集 
*作	   者 : 韦振宇
*创建日期 : 2021-9-15     
***********************************************************************************/
ALTER PROCEDURE [dbo].[uspGetDispatchDriver]
(
	@PKID 	INT	       --司机ID
)
AS
BEGIN
	SELECT CarNO,		--司机ID
		BizLicence,		--营运证
		DriveLicence,	--驾驶证
		RunLicence		--行驶证
	FROM Basic_DriverInfor
	WHERE PKID = @PKID;
END
GO