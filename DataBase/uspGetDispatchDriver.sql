USE [logisticsNew]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/********************************************************************************* 
*�������� : uspGetDispatchDriver
*�������� : ��ȡ����˾����Ϣ�������ɳ�����ģ��ĳ����������������¼�
*������� : 
	@PKID 	INT	       --˾��ID
*������� : 
	��
*�� �� ֵ :
	����� 
*��	   �� : Τ����
*�������� : 2021-9-15     
***********************************************************************************/
ALTER PROCEDURE [dbo].[uspGetDispatchDriver]
(
	@PKID 	INT	       --˾��ID
)
AS
BEGIN
	SELECT CarNO,		--˾��ID
		BizLicence,		--Ӫ��֤
		DriveLicence,	--��ʻ֤
		RunLicence		--��ʻ֤
	FROM Basic_DriverInfor
	WHERE PKID = @PKID;
END
GO