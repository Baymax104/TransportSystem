USE [logisticsNew]
GO
/****** Object:  StoredProcedure [dbo].[uspExistDispatchGoods]    Script Date: 2021/11/18 15:18:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/********************************************************************************* 
*�������� : uspExistDispatchGoods
*�������� : ���������ͬ������Ƿ����ָ�������ͬ��ŵĻ�����Ϣ�������䳵����ģ���ɾ�������֮ͬǰ���߼��ж�
*������� : 
	@goodsRevertBillPKID INT			--�����ͬID
*������� : 
	��
*�� �� ֵ :
	0:������
	1:����
*��	   �� : Τ����
*�������� : 2021-9-15     
***********************************************************************************/
ALTER PROCEDURE [dbo].[uspExistDispatchGoods]
(
	@goodsRevertBillPKID INT			--�����ͬID
)
AS
BEGIN
	IF EXISTS(
		SELECT *
		FROM Dispatch_BillReturnDetail DBD
		INNER JOIN Accept_CarryBillDetail ACBD
		ON DBD.GoodsBillDetailPKID = ACBD.PKID
		INNER JOIN Accept_CarryBillParent ACBP
		ON ACBP.PKID = ACBD.GoodsBillPKID
		WHERE DBD.GoodsRevertBillPKID = @goodsRevertBillPKID
	)
	BEGIN
		RETURN 1
	END
	ELSE
	BEGIN
		RETURN 0
	END
END
