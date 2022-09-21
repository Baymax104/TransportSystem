USE [logisticsNew]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/********************************************************************************* 
*过程名称 : uspGetDispatchCitys
*功能描述 : 获取多条城市信息，用于派车管理模块的发货地和交货地下拉框
*输入参数 : 
	无
*输出参数 : 
	无
*返 回 值 :
	结果集 
*作	   者 : 韦振宇
*创建日期 : 2021-9-15     
***********************************************************************************/
ALTER PROCEDURE [dbo].[uspGetDispatchCitys]
AS
BEGIN
	SELECT PKID,	--城市ID
		City		--城市名称
	FROM Basic_CityInfor;
END
GO
