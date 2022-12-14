USE [logisticsNew]
GO
/****** Object:  StoredProcedure [dbo].[uspCheckRight]    Script Date: 2022/10/30 0:01:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/********************************************************************************* 
*过程名称 : uspCheckRight
*功能描述 : 用户权限控制
*输入参数 : 
	@loginID	nvarchar(20)	--登录ID
	@pageName	nvarchar(40)	--页面名称
*输出参数 : 
	默认
*返 回 值 :
	0 - 无权限
	1 - 有权限
*作    者 : 叶常达
*创建日期 : 2007-11-15      
***********************************************************************************/
CREATE PROCEDURE [dbo].[uspCheckRight]
(
	@loginID 	nvarchar(20),	--登录ID
	@pageName 	nvarchar(40)	--页面名称
)
AS	
BEGIN
	IF EXISTS 
	(
		SELECT *
		FROM 
		(
			Account_Groups INNER JOIN 
			(
				Account_Users INNER JOIN Account_UserGroup 
				ON Account_Users.PKID = Account_UserGroup.UserPKID
			) 
			ON Account_Groups.PKID = Account_UserGroup.GroupPKID
		) 
		INNER JOIN 
		(
			Account_Functions INNER JOIN Account_FunctionGroup 
			ON Account_Functions.PKID = Account_FunctionGroup.FunctionPKID
		) 
		ON Account_Groups.PKID = Account_FunctionGroup.GroupPKID 
		WHERE Account_Users.LoginID = @loginID
			AND Account_Functions.PageName = @pageName
	)
		RETURN 1
	ELSE
		RETURN 0
	
END




GO
