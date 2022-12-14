USE [logisticsNew]
GO
/****** Object:  StoredProcedure [dbo].[uspGetUser]    Script Date: 2022/10/30 0:01:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






/********************************************************************************* 
*过程名称 : uspGetUser
*功能描述 : 根据登录ID, 获取一条用户的信息
*输入参数 : 
	@loginID 	NVARCHAR(20)	       --登录ID
*输出参数 : 
	无
*返 回 值 :
	结果集 
*作	   者 : 叶常达
*创建日期 : 2007-8-19      
***********************************************************************************/
CREATE PROCEDURE [dbo].[uspGetUser]
(
	@loginID 	NVARCHAR(20)	       --登录ID
)
AS
BEGIN
	SELECT LoginID,
		Username,
		Sex,
		Birthday
	FROM Account_Users 
	WHERE LoginID = @loginID
END








GO
