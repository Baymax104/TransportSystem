USE [logisticsNew]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/********************************************************************************* 
*�������� : uspGetDispatchDrivers
*�������� : ��ȡ����˾����Ϣ�������ɳ�����ģ��ĳ�����������
*������� : 
	��
*������� : 
	��
*�� �� ֵ :
	����� 
*��	   �� : Τ����
*�������� : 2021-9-15     
***********************************************************************************/
ALTER PROCEDURE [dbo].[uspGetDispatchDrivers]
AS
BEGIN
	SELECT PKID,		--˾��ID
		DriverName		--˾������
	FROM Basic_DriverInfor;
END
GO