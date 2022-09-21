USE [logisticsNew]
GO
/****** Object:  StoredProcedure [dbo].[uspCreateBillReturn]    Script Date: 2021/9/22 9:14:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/********************************************************************************* 
*�������� : uspExistDriver
*�������� : �жϸ������ͬ˾���Ƿ�Ϊ��ֵ
*������� : 
	@PKID INT							--��ִ��PKID
*������� : 
	��
*�� �� ֵ :
	0:������
	1:����
*��	   �� : Τ����
*�������� : 2021-9-22     
***********************************************************************************/
ALTER PROCEDURE [dbo].[uspExistDriver]
(
	@PKID INT							--��ִ��PKID
)
AS
BEGIN
	DECLARE @driverPKID INT
	SELECT @driverPKID = DriverPKID
	FROM Dispatch_BillReturnParent
	WHERE PKID = @PKID
	IF @driverPKID = -1
	BEGIN
		RETURN 0
	END
	ELSE
	BEGIN
		RETURN 1
	END
END
