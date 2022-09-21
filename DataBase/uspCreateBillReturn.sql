USE [logisticsNew]
GO
/****** Object:  StoredProcedure [dbo].[uspCreateBillReturn]    Script Date: 2021/11/18 15:16:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/********************************************************************************* 
*�������� : uspCreateBillReturn
*�������� : ���������ͬ
*������� : 
	@PKID INT,								--�����ͬID
	@goodsRevertBillCode VARCHAR(50),		--�����ͬ���
	@driverPKID INT,						--������
	@loadStation VARCHAR(50),				--������
	@startCarryTime DATETIME,				--����ʱ��
	@dealGoodsStation VARCHAR(50),			--������
	@arriveTime DATETIME,					--����ʱ��
	@receiveGoodsLinkman VARCHAR(50),		--�ջ���ϵ��
	@linkmanPhone VARCHAR(50),				--��ϵ�˵绰
	@linkmanMobile	VARCHAR(50),			--��ϵ���ֻ�
	@receiveGoodsDetailAddr VARCHAR(50),	--�ջ���ϸ��ַ
	@carryGoodsInsurance MONEY,				--�����˶�װ���ﱣ֤��
	@dispatchServiceFee MONEY,				--���ط����
	@carriageBanlanceMode VARCHAR(50),		--�˷ѽ��㷽ʽ
	@carryGoodsBillDeposit MONEY,			--�ͻ�����ִѺ��
	@carriageMode VARCHAR(50),				--����Ƽ۷�ʽ
	@allCarriage MONEY,						--���˷�
	@insurance MONEY,						--���շ�
	@startAdvance MONEY,					--Ԥ������
	@ifBalance VARCHAR(50),					--�Ƿ����
	@backBillState VARCHAR(50),				--��ִ��״̬
	@signTime DATETIME,						--ǩ��ʱ��
	@acceptStation VARCHAR(50),				--�ӻ���
	@remark VARCHAR(50)						--��ע
*������� : 
	@PKID INT OUTPUT						--�����ͬ��ϢID
*�� �� ֵ :
	 0:�ɹ�
	 <> 0:ʧ��
*��	   �� : Τ����
*�������� : 2021-9-15     
***********************************************************************************/
ALTER PROCEDURE [dbo].[uspCreateBillReturn]
(
	@goodsRevertBillCode VARCHAR(50),		--�����ͬ���
	@driverPKID INT,						--������
	@loadStation VARCHAR(50),				--������
	@startCarryTime DATETIME,				--����ʱ��
	@dealGoodsStation VARCHAR(50),			--������
	@arriveTime DATETIME,					--����ʱ��
	@receiveGoodsLinkman VARCHAR(50),		--�ջ���ϵ��
	@linkmanPhone VARCHAR(50),				--��ϵ�˵绰
	@linkmanMobile	VARCHAR(50),			--��ϵ���ֻ�
	@receiveGoodsDetailAddr VARCHAR(50),	--�ջ���ϸ��ַ
	@carryGoodsInsurance MONEY,				--�����˶�װ���ﱣ֤��
	@dispatchServiceFee MONEY,				--���ط����
	@carriageBanlanceMode VARCHAR(50),		--�˷ѽ��㷽ʽ
	@carryGoodsBillDeposit MONEY,			--�ͻ�����ִѺ��
	@carriageMode VARCHAR(50),				--����Ƽ۷�ʽ
	@allCarriage MONEY,						--���˷�
	@insurance MONEY,						--���շ�
	@startAdvance MONEY,					--Ԥ������
	@ifBalance VARCHAR(50),					--�Ƿ����
	@backBillState VARCHAR(50),				--��ִ��״̬
	@signTime DATETIME,						--ǩ��ʱ��
	@acceptStation VARCHAR(50),				--�ӻ���
	@remark VARCHAR(50),					--��ע
	@PKID INT OUTPUT						--�����ͬ��ϢPKID
)
AS
BEGIN
	INSERT INTO Dispatch_BillReturnParent
	VALUES
	(
		@goodsRevertBillCode,
		@loadStation,
		@startCarryTime,
		@dealGoodsStation,
		@arriveTime,
		@receiveGoodsLinkman,
		@linkmanPhone,
		@linkmanMobile,
		@receiveGoodsDetailAddr,
		@carriageBanlanceMode,
		@remark,
		@driverPKID,
		@ifBalance,
		@backBillState,
		@startAdvance,
		@carryGoodsBillDeposit,
		@carryGoodsInsurance,
		@dispatchServiceFee,
		@allCarriage,
		@insurance,
		@signTime,
		@acceptStation,
		@carriageMode,
		0
	)
	SELECT @PKID = @@IDENTITY

	INSERT INTO BillMgt_BillDetail
	VALUES
	(
		'��ִ��',
		@goodsRevertBillCode,
		'����',
		@signTime,
		@acceptStation
	)

	IF @@ERROR <> 0 OR @@ROWCOUNT = 0
	BEGIN
		RETURN 1
	END
	ELSE
	BEGIN
		RETURN 0
	END
END
