USE [logisticsNew]
GO
/****** Object:  StoredProcedure [dbo].[uspCreateBillReturn]    Script Date: 2021/9/22 9:14:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/********************************************************************************* 
*�������� : uspGetBillReturnPKID
*�������� : ��ѯ���ո�����������ͬ��PKID
*������� : 
	��
*������� : 
	@PKID INT							--�����ͬPKID
*�� �� ֵ :
	��
*��	   �� : Τ����
*�������� : 2021-9-15     
***********************************************************************************/
ALTER PROCEDURE [dbo].[uspGetBillReturnPKID]
AS
BEGIN
	SELECT MAX(PKID)
	FROM Dispatch_BillReturnParent
END
