USE [logisticsNew]
GO
/****** Object:  StoredProcedure [dbo].[uspLoadGood]    Script Date: 2022/10/30 0:01:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/********************************************************************************* 
*过程名称 : uspLoadGood
*功能描述 : 装(卸)货
*输入参数 : 
	@goodsRevertBillPKID INT,			--运输合同ID
	@goodsBillDetailPKID INT,			--货运单详表PKID
	@pieceAmount INT,					--装车或卸车件数
	@weight REAL,						--重量
	@volume REAL,						--体积
	@priceMode VARCHAR(50),				--计价方式
	@goodsValue MONEY					--货物价格
*输出参数 : 
	无
*返 回 值 :
	0:成功
	<>0:失败
*作	   者 : 韦振宇
*创建日期 : 2021-9-22     
***********************************************************************************/
CREATE PROCEDURE [dbo].[uspLoadGood]
(
	@goodsRevertBillPKID INT,			--运输合同ID
	@goodsBillDetailPKID INT,			--货运单详表PKID
	@pieceAmount INT,					--装车或卸车件数
	@weight REAL,						--重量
	@volume REAL,						--体积
	@priceMode VARCHAR(50),				--计价方式
	@goodsValue MONEY					--货物价格
)
AS
BEGIN
	IF EXISTS(
		SELECT *
		FROM Dispatch_BillReturnDetail
		WHERE GoodsRevertBillPKID = @goodsRevertBillPKID
		AND GoodsBillDetailPKID = @goodsBillDetailPKID
	)
	BEGIN
		DECLARE @oldPieceAmount INT,	--原有件数
				@newPieceAmount INT		--实际件数

		SELECT @oldPieceAmount = PieceAmount
		FROM Dispatch_BillReturnDetail
		WHERE GoodsRevertBillPKID = @goodsRevertBillPKID
		AND GoodsBillDetailPKID = @goodsBillDetailPKID

		SET @newPieceAmount = @oldPieceAmount + (@pieceAmount)

		IF @newPieceAmount = 0
		BEGIN
			DELETE Dispatch_BillReturnDetail
			WHERE GoodsRevertBillPKID = @goodsRevertBillPKID
			AND GoodsBillDetailPKID = @goodsBillDetailPKID
		END

		IF @newPieceAmount > 0
		BEGIN
			UPDATE Dispatch_BillReturnDetail
			SET PieceAmount = @newPieceAmount
			WHERE GoodsRevertBillPKID = @goodsRevertBillPKID
			AND GoodsBillDetailPKID = @goodsBillDetailPKID
		END

		UPDATE Accept_CarryBillDetail
		SET RemainPieceCount = RemainPieceCount - (@pieceAmount)
		WHERE PKID = @goodsBillDetailPKID
	END
	ELSE
	BEGIN
		INSERT INTO Dispatch_BillReturnDetail
		(
			GoodsRevertBillPKID,
			GoodsBillDetailPKID,
			PieceAmount,
			Weight,
			Volume,
			PriceMode,
			GoodsValue
		)
		VALUES
		(
			@goodsRevertBillPKID,
			@goodsBillDetailPKID,
			@pieceAmount,
			@weight,
			@volume,
			@priceMode,
			@goodsValue
		)

		UPDATE Accept_CarryBillDetail
		SET RemainPieceCount = RemainPieceCount - (@pieceAmount)
		WHERE PKID = @goodsBillDetailPKID
	END

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
