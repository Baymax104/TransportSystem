USE [logisticsNew]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/********************************************************************************* 
*�������� : uspGetDispatchCitys
*�������� : ��ȡ����������Ϣ�������ɳ�����ģ��ķ����غͽ�����������
*������� : 
	��
*������� : 
	��
*�� �� ֵ :
	����� 
*��	   �� : Τ����
*�������� : 2021-9-15     
***********************************************************************************/
ALTER PROCEDURE [dbo].[uspGetDispatchCitys]
AS
BEGIN
	SELECT PKID,	--����ID
		City		--��������
	FROM Basic_CityInfor;
END
GO
