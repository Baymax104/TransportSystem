USE [logisticsNew]
GO
/****** Object:  StoredProcedure [dbo].[uspGetUsers]    Script Date: 2022/10/30 0:01:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO









/********************************************************************************* 
*过程名称 : uspGetUsers
*功能描述 : 根据用户名称或性别, 组合查询符合条件的用户信息
*输入参数 : 
	@userName 		NVARCHAR(40),	--用户名称
    @sex			TINYINT,      	--性别(0 : 全部, 1 : 男, 2 : 女)
	@sortField		NVARCHAR(255),	--排序字段
	@sortOrder		NVARCHAR(4),	--排序顺序
	@pageIndex		INT,			--待读取的页索引
	@pageSize		INT,			--每页显示的记录数
	@recordCount	INT OUT			--总记录数
*输出参数 : 
	无
*返 回 值 :
	结果集 
*作    者 : 叶常达
*创建日期 : 2007-8-19      
***********************************************************************************/
CREATE PROCEDURE [dbo].[uspGetUsers]
(
	@userName 		NVARCHAR(40),	--用户名称
	@sex			TINYINT,      	--性别(0 : 全部, 1 : 男, 2 : 女)
	@sortField		NVARCHAR(255),	--排序字段
	@sortOrder		NVARCHAR(4),	--排序顺序
	@pageIndex		INT,			--待读取的页索引
	@pageSize		INT,			--每页显示的记录数
	@recordCount	INT OUTPUT		--总记录数
)
AS
BEGIN
	DECLARE @sqlRC	NVARCHAR(4000)	--RecordCount SQL
	DECLARE @sqlRS	NVARCHAR(4000)	--ResultSet	SQL
	SET @sqlRC = 
		'SELECT @recordCount = Count(*) 
		FROM Account_Users
		WHERE Username LIKE ''%'' + REPLACE(''' + @userName + ''', ''%'', ''/%'') + ''%'' ESCAPE ''/'''
	
	IF @sex <> 0
	BEGIN
		SET @sqlRC = 
		@sqlRC + ' AND Sex = ' + CONVERT(CHAR(1), @sex)
	END
	
	EXEC sp_executesql @sqlRC, N'@recordCount INT OUTPUT', @recordCount OUTPUT

	SET @sqlRS = 
		'SELECT SerialNumber,
			LoginID,
			Username,
			Sex,
			Birthday
		FROM
		(
			SELECT LoginID,
				Username,
				CASE Sex
				WHEN 1 THEN ''男''
				WHEN 2 THEN ''女''
				END AS Sex,
				CONVERT(NVARCHAR(10), Birthday, 120) AS  Birthday,
				ROW_NUMBER() OVER (ORDER BY ' + @sortField + ' ' + @sortOrder + ') AS SerialNumber 
			FROM Account_Users
			WHERE Username LIKE ''%'' + REPLACE(''' + @userName + ''', ''%'', ''/%'') + ''%'' ESCAPE ''/'''
	
	IF @sex <> 0
	BEGIN
		SET @sqlRS = 
		@sqlRS + ' AND Sex = ' + CONVERT(CHAR(1), @sex)
	END

	SET @sqlRS = 
		@sqlRS + 	
		') AS T
		WHERE T.SerialNumber > ' + CONVERT(NVARCHAR(100), (@pageIndex - 1) * @pageSize) +
		' AND T.SerialNumber <= ' + CONVERT(NVARCHAR(100), @pageIndex * @PageSize)
	EXEC (@sqlRS)
END











GO
