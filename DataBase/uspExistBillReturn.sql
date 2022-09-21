USE [logisticsNew]
GO
/****** Object:  StoredProcedure [dbo].[uspExistBillReturn]    Script Date: 2021/11/18 15:18:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/********************************************************************************* 
*�������� : uspExistBillReturn
*�������� : �ж������ͬ�������Ƿ����ָ�������ͬ��ŵļ�¼�������䳵����ģ���������޸������֮ͬǰ���߼��ж�
*������� : 
	@goodsRevertBillCode	VARCHAR(50) --�����ͬ���
	@PKID					INT			--�����ͬPKID
*������� : 
	��
*�� �� ֵ :
	0:������
	1:����
*��	   �� : Τ����
*�������� : 2021-9-15     
***********************************************************************************/
ALTER PROCEDURE [dbo].[uspExistBillReturn]
(
	@goodsRevertBillCode	VARCHAR(50),	--�����ͬ���
	@PKID					INT				--�����ͬPKID
)
AS
BEGIN
	IF @PKID = -1
	BEGIN
		IF EXISTS
		(
			SELECT *
			FROM Dispatch_BillReturnParent
			WHERE GoodsRevertBillCode = @goodsRevertBillCode
		)
		BEGIN
			RETURN 1
		END
		ELSE
		BEGIN
			RETURN 0
		END
	END
	ELSE
	BEGIN
		IF EXISTS
		(
			SELECT *
			FROM Dispatch_BillReturnParent
			WHERE GoodsRevertBillCode = @goodsRevertBillCode
			AND PKID = @PKID
		)
		BEGIN
			RETURN 1
		END
		ELSE
		BEGIN
			RETURN 0
		END
	END
END
