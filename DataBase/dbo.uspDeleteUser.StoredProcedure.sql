USE [logisticsNew]
GO
/****** Object:  StoredProcedure [dbo].[uspDeleteUser]    Script Date: 2022/10/30 0:01:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




/********************************************************************************* 
*过程名称 : uspDeleteUser
*功能描述 : 根据登录ID删除用户信息
*输入参数 : 
	@loginID	NVARCHAR(20),	--登录ID
*输出参数 : 
	无
*返 回 值 :
	0 - 成功
	<> 0 - 失败
*作    者 : 叶常达
*创建日期 : 2007-8-19      
***********************************************************************************/
CREATE PROCEDURE [dbo].[uspDeleteUser]
(
	 @loginID	NVARCHAR(20)	--登录ID
)
AS
BEGIN
	BEGIN TRY
		DELETE Account_Users 
		WHERE LoginID = @loginID
		RETURN 0
	END TRY
	BEGIN CATCH
		RETURN ERROR_NUMBER()
	END CATCH
END






GO
