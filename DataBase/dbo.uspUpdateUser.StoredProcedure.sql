USE [logisticsNew]
GO
/****** Object:  StoredProcedure [dbo].[uspUpdateUser]    Script Date: 2022/10/30 0:01:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




/********************************************************************************* 
*过程名称 : uspUpdateUser
*功能描述 : 根据用户ID修改用户名称、性别、出生年月日等信息
*输入参数 : 
	@loginID	NVARCHAR(20),	--登录ID
    @userName 	NVARCHAR(40),	--用户名称
	@sex        TINYINT,     	--性别
	@birthday	DATETIME,		--出生日期

*输出参数 : 
	无
*返 回 值 :
	0 - 成功
	<> 0 - 失败
*作    者 : 叶常达
*创建日期 : 2007-8-19      
***********************************************************************************/
CREATE PROCEDURE [dbo].[uspUpdateUser]
(
	@loginID	NVARCHAR(20),	--登录ID
    @userName 	NVARCHAR(40),	--用户名称
	@sex        TINYINT,     	--性别
	@birthday	DATETIME		--出生日期
)
AS
BEGIN
	BEGIN TRY
		UPDATE Account_Users
		SET Username = @userName,
			Sex = @sex,
			Birthday = @birthday
		WHERE LoginID = @loginID
		RETURN 0
	END TRY
	BEGIN CATCH
		RETURN ERROR_NUMBER()
	END CATCH
END






GO
