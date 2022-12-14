USE [logisticsNew]
GO
/****** Object:  StoredProcedure [dbo].[uspValidateUser]    Script Date: 2022/10/30 0:01:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





/********************************************************************************* 
*过程名称 : uspValidateUser
*功能描述 : 用户登录身份验证
*输入参数 : 
	@loginID	nvarchar(20)	--登录ID
	@password	nvarchar(40)	--密码
*输出参数 : 
	默认
*返 回 值 :
	0 - 非法用户
	1 - 合法用户
*作    者 : 叶常达
*创建日期 : 2007-8-19      
***********************************************************************************/
CREATE PROCEDURE [dbo].[uspValidateUser]
(
	@loginID 	nvarchar(20),	--登录ID
	@password 	nvarchar(40)	--密码
)
AS
BEGIN
	IF EXISTS
	(
		SELECT * 
		FROM Account_Users   
		WHERE LoginID = @loginID 
		AND [Password] = @password
	)
		RETURN 1
	ELSE  
		RETURN 0
END




GO
