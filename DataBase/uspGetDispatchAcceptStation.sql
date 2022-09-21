USE [logisticsNew]
GO
/****** Object:  StoredProcedure [dbo].[uspExistBillReturn]    Script Date: 2021/9/18 18:43:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/********************************************************************************* 
*�������� : uspGetDispatchAcceptStation
*�������� : ��ȡָ�������ͬ��ŵĽӻ��㣬�����䳵����ģ�����ӻ��޸������֮ͬǰ���߼��ж�
*������� : 
	@goodsBillCode	VARCHAR(50) --���˵����
*������� : 
	��
*�� �� ֵ :
	acceptStation
*��	   �� : Τ����
*�������� : 2021-9-15     
***********************************************************************************/
ALTER PROCEDURE [dbo].[uspGetDispatchAcceptStation]
(
	@goodsBillCode	VARCHAR(50) --�����ͬ���
)
AS
BEGIN
	DECLARE @acceptStation VARCHAR(50)
	DECLARE @billStartCode VARCHAR(50)
	DECLARE @billEndCode VARCHAR(50)

	DECLARE cursorBillDispense CURSOR
	FOR 
		SELECT BillStartCode,
			BillEndCode,
			AcceptStation
		FROM BillMgt_BillDispense
		WHERE BillType = '��ִ��'

	OPEN cursorBillDispense
	FETCH NEXT FROM cursorBillDispense 
		INTO @billStartCode,
			 @billEndCode,
			 @acceptStation
	WHILE @@FETCH_STATUS = 0
	BEGIN
		IF @goodsBillCode <= @billStartCode
		AND @goodsBillCode >= @billEndCode
		BEGIN
			RETURN @acceptStation
		END
		FETCH NEXT FROM cursorBillDispense 
		INTO @billStartCode,
			 @billEndCode,
			 @acceptStation
	END
	CLOSE cursorBillDispense
	DEALLOCATE cursorBillDispense
	RETURN NULL
END
