USE [logisticsNew]
GO
/****** Object:  StoredProcedure [dbo].[uspDeleteBillReturn]    Script Date: 2021/11/18 15:17:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/********************************************************************************* 
*过程名称 : uspDeleteBillReturn
*功能描述 : 删除运输合同
*输入参数 : 
	@PKID INT,								--运输合同ID
*输出参数 : 
	无
*返 回 值 :
	 0:成功
	 <> 0:失败
*作	   者 : 韦振宇
*创建日期 : 2021-9-15     
***********************************************************************************/
ALTER PROCEDURE [dbo].[uspDeleteBillReturn]
(
	@PKID INT								--运输合同ID
)
AS
BEGIN
	UPDATE BillMgt_BillDetail
	SET BillState = '作废'
	WHERE PKID IN(
		SELECT b.PKID
		FROM BillMgt_BillDetail b
		INNER JOIN Dispatch_BillReturnParent d
		ON d.GoodsRevertBillCode = b.BillCode
		WHERE BillType = '回执单'
		AND d.PKID = @PKID
	)

	DECLARE @goodsPKID INT,		--货物ID
			@pieceAmount INT	--货物数量
	DECLARE cursorCarryBill CURSOR
	FOR
		SELECT ACBD.PKID,		--货物ID
			ACBD.PieceAmount	--货物数量
		FROM Accept_CarryBillDetail ACBD
		INNER JOIN Accept_CarryBillParent ACBP
		ON ACBP.PKID = ACBD.GoodsBillPKID
		INNER JOIN Dispatch_BillReturnDetail DBRD
		ON ACBD.PKID = DBRD.GoodsBillDetailPKID
		WHERE DBRD.GoodsRevertBillPKID = @PKID

	OPEN cursorCarryBill
	FETCH NEXT
	FROM cursorCarryBill
	INTO @goodsPKID,
		 @pieceAmount
	WHILE @@FETCH_STATUS = 0
	BEGIN
		UPDATE Accept_CarryBillDetail
		SET RemainPieceCount = RemainPieceCount + @pieceAmount
		WHERE PKID = @goodsPKID
		FETCH NEXT
	FROM cursorCarryBill
	INTO @goodsPKID,
		 @pieceAmount
	END
	CLOSE cursorCarryBill
	DEALLOCATE cursorCarryBill
	IF @@ERROR <> 0 OR @@ROWCOUNT = 0
	BEGIN
		RETURN 
	END
END
