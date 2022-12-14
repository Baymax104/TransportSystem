USE [logisticsNew]
GO
/****** Object:  StoredProcedure [dbo].[uspTransportGood]    Script Date: 2022/10/30 0:01:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/********************************************************************************* 
*过程名称 : uspTransportGood
*功能描述 : 发货
*输入参数 : 
	@goodsRevertBillPKID INT,			--运输合同ID
	@goodsBillCodes VARCHAR(50)			--货运单编号字符串
*输出参数 : 
	无
*返 回 值 :
	0:成功
	<>0:失败
*作	   者 : 韦振宇
*创建日期 : 2021-9-22   
***********************************************************************************/
CREATE PROCEDURE [dbo].[uspTransportGood]
(
	@goodsRevertBillPKID INT,			--运输合同ID
	@goodsBillCodes VARCHAR(50)			--货运单编号字符串
)
AS
BEGIN
	UPDATE Dispatch_BillReturnParent
	SET [Execute] = 1,
		BackBillState = '在途'
	WHERE PKID = @goodsRevertBillPKID

	DECLARE @vGoodsBillCodes VARCHAR(50),	--变化字符串
			@goodsBillCode VARCHAR(50),		--货运单编号
			@index INT,						--字符','的位置
			@PKID INT						--货运单PKID

	SET @vGoodsBillCodes = @goodsBillCodes
	SET @index = CHARINDEX(',', @vGoodsBillCodes)
	SET @goodsBillCode = LEFT(@vGoodsBillCodes, @index - 1)

	WHILE @index <> 0
	BEGIN
		SELECT @PKID = PKID
		FROM Accept_CarryBillParent
		WHERE GoodsBillCode = @goodsBillCode
		INSERT INTO Accept_CarryBillEvent
		(
			GoodsBillPKID,
			EventName,
			Remark,
			OccurTime
		)
		VALUES
		(
			@PKID,
			'发货',
			'',
			GETDATE()
		)
		SET @vGoodsBillCodes = RIGHT(@vGoodsBillCodes, LEN(@vGoodsBillCodes) - @index)
		SET @index = CHARINDEX(',', @vGoodsBillCodes)
		IF @index <> 0
		BEGIN
			SET @goodsBillCode = LEFT(@vGoodsBillCodes, @index - 1)
		END
	END
	
	SET @goodsBillCode = @vGoodsBillCodes
	SELECT @PKID = PKID
	FROM Accept_CarryBillParent
	WHERE GoodsBillCode = @goodsBillCode
	INSERT INTO Accept_CarryBillEvent
	(
		GoodsBillPKID,
		EventName,
		Remark,
		OccurTime
	)
	VALUES
	(
		@PKID,
		'发货',
		'',
		GETDATE()
	)

	IF @@ERROR <> 0 OR @@ROWCOUNT = 0
	BEGIN
		RETURN 1
	END
	ELSE
	BEGIN
		RETURN 0
	END
END
GO
