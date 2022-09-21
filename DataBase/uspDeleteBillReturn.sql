USE [logisticsNew]
GO
/****** Object:  StoredProcedure [dbo].[uspDeleteBillReturn]    Script Date: 2021/11/18 15:17:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/********************************************************************************* 
*�������� : uspDeleteBillReturn
*�������� : ɾ�������ͬ
*������� : 
	@PKID INT,								--�����ͬID
*������� : 
	��
*�� �� ֵ :
	 0:�ɹ�
	 <> 0:ʧ��
*��	   �� : Τ����
*�������� : 2021-9-15     
***********************************************************************************/
ALTER PROCEDURE [dbo].[uspDeleteBillReturn]
(
	@PKID INT								--�����ͬID
)
AS
BEGIN
	UPDATE BillMgt_BillDetail
	SET BillState = '����'
	WHERE PKID IN(
		SELECT b.PKID
		FROM BillMgt_BillDetail b
		INNER JOIN Dispatch_BillReturnParent d
		ON d.GoodsRevertBillCode = b.BillCode
		WHERE BillType = '��ִ��'
		AND d.PKID = @PKID
	)

	DECLARE @goodsPKID INT,		--����ID
			@pieceAmount INT	--��������
	DECLARE cursorCarryBill CURSOR
	FOR
		SELECT ACBD.PKID,		--����ID
			ACBD.PieceAmount	--��������
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
