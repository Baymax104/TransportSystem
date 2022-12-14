USE [logisticsNew]
GO
/****** Object:  Table [dbo].[Accept_CarryBillDetail]    Script Date: 2022/10/30 0:00:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accept_CarryBillDetail](
	[PKID] [int] IDENTITY(1,1) NOT NULL,
	[GoodsBillPKID] [int] NOT NULL,
	[GoodsCode] [varchar](50) NULL,
	[GoodsName] [varchar](50) NULL,
	[Size] [varchar](50) NULL,
	[Pack] [varchar](50) NULL,
	[PieceAmount] [int] NULL,
	[Weight] [real] NULL,
	[Volume] [real] NULL,
	[GoodsValue] [money] NULL,
	[Insurance] [money] NULL,
	[Carriage] [money] NULL,
	[PriceMode] [varchar](50) NULL,
	[InsuranceRate] [real] NULL,
	[RemainPieceCount] [int] NULL,
 CONSTRAINT [PK_ACCEPT_CARRYBILLDETAIL] PRIMARY KEY CLUSTERED 
(
	[PKID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Accept_CarryBillParent]    Script Date: 2022/10/30 0:00:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accept_CarryBillParent](
	[PKID] [int] IDENTITY(1,1) NOT NULL,
	[GoodsBillCode] [varchar](50) NOT NULL,
	[SendGoodsCustomerNO] [varchar](50) NULL,
	[SendGoodsCustomer] [varchar](50) NULL,
	[SendGoodsCustomerTel] [varchar](50) NULL,
	[SendGoodsCustomerAddr] [varchar](50) NULL,
	[ReceiveGoodsCustomerCode] [varchar](50) NULL,
	[ReceiveGoodsCustomer] [varchar](50) NULL,
	[ReceiveGoodsCustomerTel] [varchar](50) NULL,
	[ReceiveGoodsCustomerAddr] [varchar](50) NULL,
	[SendGoodsDate] [datetime] NULL,
	[SendGoodsAddr] [varchar](50) NULL,
	[ReceiveGoodsAddr] [varchar](50) NULL,
	[PredeliveryDate] [datetime] NULL,
	[FactDealDate] [datetime] NULL,
	[HelpAcceptPayment] [money] NULL,
	[AcceptprocedureRate] [varchar](50) NULL,
	[PayMode] [varchar](50) NULL,
	[FetchGoodsMode] [varchar](50) NULL,
	[WriteBillPerson] [varchar](50) NULL,
	[WriteDate] [datetime] NULL,
	[Validity] [varchar](50) NULL,
	[IfAudit] [varchar](50) NULL,
	[IfSettleAccounts] [varchar](50) NULL,
	[TransferStation] [varchar](50) NULL,
	[TransferFee] [money] NULL,
	[ReduceFund] [money] NULL,
	[PayKickback] [money] NULL,
	[MoneyOfChangePay] [money] NULL,
	[CarryGoodsFee] [money] NULL,
	[Carriage] [money] NULL,
	[Insurance] [money] NULL,
	[EmployeePKID] [int] NULL,
	[Remark] [varchar](50) NULL,
	[AcceptStation] [varchar](100) NULL,
	[SendGoodsCustomerMobile] [varchar](50) NULL,
	[ReceiveGoodsCustomerMobile] [varchar](50) NULL,
 CONSTRAINT [PK_ACCEPT_CARRYBILLPARENT] PRIMARY KEY CLUSTERED 
(
	[PKID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Basic_DriverInfor]    Script Date: 2022/10/30 0:00:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Basic_DriverInfor](
	[PKID] [int] IDENTITY(1,1) NOT NULL,
	[DriverName] [varchar](50) NULL,
	[IDCard] [varchar](50) NULL,
	[Phone] [varchar](50) NULL,
	[Mobile] [varchar](50) NULL,
	[Gender] [varchar](50) NULL,
	[Birthday] [varchar](50) NULL,
	[State] [varchar](50) NULL,
	[CarNO] [varchar](50) NULL,
	[AllowCarryVolume] [varchar](50) NULL,
	[AllowCarryWeight] [varchar](50) NULL,
	[Address] [varchar](50) NULL,
	[CarType] [varchar](50) NULL,
	[CarLength] [varchar](50) NULL,
	[CarDept] [varchar](50) NULL,
	[CarDeptTel] [varchar](50) NULL,
	[DriveLicence] [varchar](50) NULL,
	[RunLicence] [varchar](50) NULL,
	[BizLicence] [varchar](50) NULL,
	[InsuranceCard] [varchar](50) NULL,
	[CarWidth] [varchar](50) NULL,
	[GoodsHeight] [varchar](50) NULL,
	[CarFrameNO] [varchar](50) NULL,
	[EngineNO] [varchar](50) NULL,
	[Remark] [varchar](50) NULL,
	[CompanyCar] [bit] NOT NULL,
 CONSTRAINT [PK_BASIC_DRIVERINFOR] PRIMARY KEY CLUSTERED 
(
	[PKID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dispatch_BillReturnDetail]    Script Date: 2022/10/30 0:00:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dispatch_BillReturnDetail](
	[PKID] [int] IDENTITY(1,1) NOT NULL,
	[GoodsRevertBillPKID] [int] NULL,
	[GoodsBillDetailPKID] [int] NULL,
	[PieceAmount] [int] NULL,
	[Weight] [real] NULL,
	[Volume] [real] NULL,
	[PriceMode] [varchar](50) NULL,
	[PriceStandard] [varchar](50) NULL,
	[GoodsValue] [money] NULL,
 CONSTRAINT [PK_DISPATCH_BILLRETURNDETAIL] PRIMARY KEY CLUSTERED 
(
	[PKID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dispatch_BillReturnParent]    Script Date: 2022/10/30 0:00:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dispatch_BillReturnParent](
	[PKID] [int] IDENTITY(1,1) NOT NULL,
	[GoodsRevertBillCode] [varchar](50) NOT NULL,
	[LoadStation] [varchar](50) NULL,
	[StartCarryTime] [datetime] NULL,
	[DealGoodsStation] [varchar](50) NULL,
	[ArriveTime] [datetime] NULL,
	[ReceiveGoodsLinkman] [varchar](50) NULL,
	[LinkmanPhone] [varchar](50) NULL,
	[LinkmanMobile] [varchar](50) NULL,
	[ReceiveGoodsDetailAddr] [varchar](50) NULL,
	[CarriageBanlanceMode] [varchar](50) NULL,
	[Remark] [varchar](50) NULL,
	[DriverPKID] [int] NULL,
	[IfBalance] [varchar](50) NULL,
	[BackBillState] [varchar](50) NULL,
	[StartAdvance] [money] NULL,
	[CarryGoodsBillDeposit] [money] NULL,
	[CarryGoodsInsurance] [money] NULL,
	[DispatchServiceFee] [money] NULL,
	[AllCarriage] [money] NULL,
	[Insurance] [money] NULL,
	[SignTime] [datetime] NULL,
	[AcceptStation] [varchar](50) NULL,
	[CarriageMode] [varchar](50) NULL,
	[Execute] [bit] NOT NULL,
 CONSTRAINT [PK_DISPATCH_BILLRETURNPARENT] PRIMARY KEY CLUSTERED 
(
	[PKID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[View_Tempt_GoodsBalanceSmall]    Script Date: 2022/10/30 0:00:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_Tempt_GoodsBalanceSmall]
AS
SELECT     SUM(dbo.Accept_CarryBillParent.PayKickback) AS 付回扣, SUM(dbo.Accept_CarryBillParent.TransferFee) AS 中转费, dbo.Basic_DriverInfor.CarNO, 
                      dbo.Dispatch_BillReturnParent.StartCarryTime, SUM(dbo.Accept_CarryBillParent.Insurance) AS 保险费总计, 
                      COUNT(dbo.Accept_CarryBillParent.Carriage) AS 运费数, dbo.Accept_CarryBillParent.GoodsBillCode, 
                      SUM(dbo.Accept_CarryBillDetail.Carriage + dbo.Accept_CarryBillParent.Insurance) AS 收入, SUM(dbo.Accept_CarryBillParent.Carriage) 
                      AS 运费总计
FROM         dbo.Basic_DriverInfor INNER JOIN
                      dbo.Dispatch_BillReturnParent ON dbo.Basic_DriverInfor.PKID = dbo.Dispatch_BillReturnParent.DriverPKID INNER JOIN
                      dbo.Dispatch_BillReturnDetail ON dbo.Dispatch_BillReturnParent.PKID = dbo.Dispatch_BillReturnDetail.GoodsRevertBillPKID INNER JOIN
                      dbo.Accept_CarryBillDetail INNER JOIN
                      dbo.Accept_CarryBillParent ON dbo.Accept_CarryBillDetail.GoodsBillPKID = dbo.Accept_CarryBillParent.PKID ON 
                      dbo.Dispatch_BillReturnDetail.GoodsBillDetailPKID = dbo.Accept_CarryBillDetail.PKID
GROUP BY dbo.Basic_DriverInfor.CarNO, dbo.Dispatch_BillReturnParent.StartCarryTime, dbo.Accept_CarryBillParent.GoodsBillCode
GO
/****** Object:  View [dbo].[View_Tempt_GoodsBalanceSmall1]    Script Date: 2022/10/30 0:00:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_Tempt_GoodsBalanceSmall1]
AS
SELECT     CarNO, StartCarryTime, 付回扣, 中转费, 保险费总计, 运费总计, SUM(付回扣 / 运费数) AS 付回扣总计, SUM(中转费 / 运费数) AS 中转费用总计, 
                      SUM(保险费总计 / 运费数) AS 保险费用总计, SUM(收入 / 运费数) AS 本车收入总计, SUM(运费总计 / 运费数) AS 本车运费总计
FROM         dbo.View_Tempt_GoodsBalanceSmall
GROUP BY CarNO, StartCarryTime, 付回扣, 中转费, 保险费总计, 运费总计
GO
/****** Object:  Table [dbo].[BalanceMgt_Driver]    Script Date: 2022/10/30 0:00:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BalanceMgt_Driver](
	[PKID] [int] IDENTITY(1,1) NOT NULL,
	[DriverName] [varchar](50) NULL,
	[BalanceType] [varchar](50) NULL,
	[BackBillCode] [varchar](50) NULL,
	[NeedPayment] [money] NULL,
	[CarryFee] [money] NULL,
	[PrepayMoney] [money] NULL,
	[BindInsurance] [money] NULL,
	[AddCarriage] [money] NULL,
	[PayedMoney] [money] NULL,
	[Balance] [money] NULL,
	[BalanceTime] [datetime] NULL,
	[DispatchServiceFee] [money] NULL,
	[Insurance] [money] NULL,
 CONSTRAINT [PK_BALANCEMGT_DRIVER] PRIMARY KEY CLUSTERED 
(
	[PKID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BillMgt_BillDetail]    Script Date: 2022/10/30 0:00:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BillMgt_BillDetail](
	[PKID] [int] IDENTITY(1,1) NOT NULL,
	[BillType] [varchar](50) NULL,
	[BillCode] [varchar](50) NULL,
	[BillState] [varchar](50) NULL,
	[WriteDate] [datetime] NULL,
	[AcceptStation] [varchar](50) NULL,
 CONSTRAINT [PK_BILLMGT_BILLDETAIL] PRIMARY KEY CLUSTERED 
(
	[PKID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[View_Tempt_GoodsBalanceSmall2]    Script Date: 2022/10/30 0:00:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_Tempt_GoodsBalanceSmall2]
AS
SELECT     dbo.Dispatch_BillReturnParent.StartCarryTime, dbo.Basic_DriverInfor.CarNO, STDEV(dbo.BalanceMgt_Driver.PrepayMoney) AS 预付金额总计, 
                      STDEV(dbo.BalanceMgt_Driver.AddCarriage) AS 加运费总计, STDEV(dbo.BalanceMgt_Driver.PayedMoney) AS 已付金额总计, 
                      STDEV(dbo.BalanceMgt_Driver.Balance) AS 余额总计, STDEV(dbo.BalanceMgt_Driver.CarryFee) AS 承运费总计
FROM         dbo.BalanceMgt_Driver INNER JOIN
                      dbo.Basic_DriverInfor ON dbo.BalanceMgt_Driver.DriverName = dbo.Basic_DriverInfor.DriverName INNER JOIN
                      dbo.Dispatch_BillReturnParent ON dbo.Basic_DriverInfor.PKID = dbo.Dispatch_BillReturnParent.DriverPKID AND 
                      dbo.BalanceMgt_Driver.BackBillCode = dbo.Dispatch_BillReturnParent.GoodsRevertBillCode INNER JOIN
                      dbo.BillMgt_BillDetail ON dbo.Dispatch_BillReturnParent.GoodsRevertBillCode = dbo.BillMgt_BillDetail.BillCode
WHERE     (dbo.BalanceMgt_Driver.PKID IN
                          (SELECT     MAX(PKID) AS Expr1
                            FROM          dbo.BalanceMgt_Driver AS BalanceMgt_Driver_1
                            GROUP BY BackBillCode)) AND (dbo.BillMgt_BillDetail.BillType = '回执单') AND (dbo.BillMgt_BillDetail.BillState <> '作废')
GROUP BY dbo.Dispatch_BillReturnParent.StartCarryTime, dbo.Basic_DriverInfor.CarNO
GO
/****** Object:  View [dbo].[View_Tempt_GoodsBalanceSmall3]    Script Date: 2022/10/30 0:00:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_Tempt_GoodsBalanceSmall3]
AS
SELECT     dbo.Dispatch_BillReturnParent.StartCarryTime, dbo.Basic_DriverInfor.CarNO, STDEV(dbo.Dispatch_BillReturnParent.AllCarriage) AS 总运费总计
FROM         dbo.Dispatch_BillReturnParent INNER JOIN
                      dbo.Basic_DriverInfor ON dbo.Dispatch_BillReturnParent.DriverPKID = dbo.Basic_DriverInfor.PKID INNER JOIN
                      dbo.BillMgt_BillDetail ON dbo.Dispatch_BillReturnParent.GoodsRevertBillCode = dbo.BillMgt_BillDetail.BillCode
WHERE     (dbo.BillMgt_BillDetail.BillType = '回执单') AND (dbo.BillMgt_BillDetail.BillState <> '作废')
GROUP BY dbo.Dispatch_BillReturnParent.StartCarryTime, dbo.Basic_DriverInfor.CarNO
GO
/****** Object:  Table [dbo].[BalanceMgt_Customer]    Script Date: 2022/10/30 0:00:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BalanceMgt_Customer](
	[PKID] [int] IDENTITY(1,1) NOT NULL,
	[Customer] [varchar](50) NULL,
	[GoodsBillCode] [varchar](50) NULL,
	[BillMoney] [money] NULL,
	[MoneyReceivable] [money] NULL,
	[ReceivedMoney] [money] NULL,
	[PrepayMoney] [money] NULL,
	[CarriageReduceFund] [money] NULL,
	[Balance] [money] NULL,
	[BalanceTime] [datetime] NULL,
	[Insurance] [money] NULL,
	[PayKickback] [money] NULL,
	[CarryGoodsFee] [money] NULL,
	[BalanceType] [varchar](50) NULL,
 CONSTRAINT [PK_BALANCEMGT_CUSTOMER] PRIMARY KEY CLUSTERED 
(
	[PKID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[View_Temp_Biz]    Script Date: 2022/10/30 0:00:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_Temp_Biz]
AS
SELECT     TOP (100) PERCENT dbo.Accept_CarryBillParent.SendGoodsCustomer, dbo.Accept_CarryBillParent.GoodsBillCode, 
                      dbo.Accept_CarryBillParent.SendGoodsAddr, dbo.Accept_CarryBillParent.Carriage, dbo.Accept_CarryBillParent.Insurance, 
                      dbo.BalanceMgt_Customer.BillMoney, dbo.BalanceMgt_Customer.MoneyReceivable, dbo.BalanceMgt_Customer.ReceivedMoney, 
                      dbo.BalanceMgt_Customer.Balance, dbo.Accept_CarryBillParent.SendGoodsDate, dbo.BillMgt_BillDetail.BillType, dbo.BillMgt_BillDetail.BillState, 
                      dbo.Accept_CarryBillParent.AcceptStation, dbo.Accept_CarryBillDetail.RemainPieceCount, dbo.Accept_CarryBillDetail.PieceAmount, 
                      dbo.Accept_CarryBillParent.ReceiveGoodsAddr
FROM         dbo.BillMgt_BillDetail INNER JOIN
                      dbo.Accept_CarryBillParent ON dbo.BillMgt_BillDetail.BillCode = dbo.Accept_CarryBillParent.GoodsBillCode INNER JOIN
                      dbo.BalanceMgt_Customer ON dbo.Accept_CarryBillParent.GoodsBillCode = dbo.BalanceMgt_Customer.GoodsBillCode INNER JOIN
                      dbo.Accept_CarryBillDetail ON dbo.Accept_CarryBillParent.PKID = dbo.Accept_CarryBillDetail.GoodsBillPKID
WHERE     (dbo.BillMgt_BillDetail.BillType = '货运单') AND (dbo.BillMgt_BillDetail.BillState <> '作废') AND (dbo.Accept_CarryBillParent.PKID IN
                          (SELECT     MAX(GoodsBillPKID) AS Expr1
                            FROM          dbo.Accept_CarryBillDetail AS Accept_CarryBillDetail_1
                            GROUP BY GoodsBillPKID)) AND (dbo.BalanceMgt_Customer.PKID IN
                          (SELECT     MAX(PKID) AS Expr1
                            FROM          dbo.BalanceMgt_Customer AS BalanceMgt_Customer_1
                            GROUP BY GoodsBillCode))
ORDER BY dbo.BalanceMgt_Customer.Balance DESC, dbo.Accept_CarryBillParent.SendGoodsDate DESC
GO
/****** Object:  View [dbo].[View_Print_Biz]    Script Date: 2022/10/30 0:00:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_Print_Biz]
AS
SELECT     ReceiveGoodsAddr, AcceptStation, SUM(MoneyReceivable) AS 应收金额, SUM(ReceivedMoney) AS 已收金额, SUM(PieceAmount) AS 件数, 
                      SUM(RemainPieceCount) AS 剩余件数, SUM(MoneyReceivable) - SUM(ReceivedMoney) AS 余额, SUM(PieceAmount) - SUM(RemainPieceCount) 
                      AS 应收件数
FROM         dbo.View_Temp_Biz
GROUP BY ReceiveGoodsAddr, AcceptStation
GO
/****** Object:  Table [dbo].[Basic_EmployeeInfor]    Script Date: 2022/10/30 0:00:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Basic_EmployeeInfor](
	[PKID] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeCode] [varchar](50) NULL,
	[Employee] [varchar](50) NULL,
	[Department] [varchar](50) NULL,
	[Position] [varchar](50) NULL,
	[Gender] [varchar](50) NULL,
	[Birthday] [datetime] NULL,
 CONSTRAINT [PK_BASIC_EMPLOYEEINFOR] PRIMARY KEY CLUSTERED 
(
	[PKID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[View_Report_InnerEmployee1]    Script Date: 2022/10/30 0:00:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_Report_InnerEmployee1]
AS
SELECT     dbo.Basic_EmployeeInfor.EmployeeCode, dbo.Basic_EmployeeInfor.Employee, SUM(dbo.BalanceMgt_Customer.ReceivedMoney) AS 已收金额, 
                      SUM(dbo.BalanceMgt_Customer.Balance) AS 余额, dbo.BalanceMgt_Customer.CarriageReduceFund AS 运费减款, 
                      SUM(dbo.BalanceMgt_Customer.PrepayMoney) AS 预付金额
FROM         dbo.Basic_EmployeeInfor INNER JOIN
                      dbo.BillMgt_BillDetail INNER JOIN
                      dbo.Accept_CarryBillParent ON dbo.BillMgt_BillDetail.BillCode = dbo.Accept_CarryBillParent.GoodsBillCode INNER JOIN
                      dbo.BalanceMgt_Customer ON dbo.Accept_CarryBillParent.GoodsBillCode = dbo.BalanceMgt_Customer.GoodsBillCode ON 
                      dbo.Basic_EmployeeInfor.PKID = dbo.Accept_CarryBillParent.EmployeePKID
WHERE     (dbo.BillMgt_BillDetail.BillType = '货运单') AND (dbo.BillMgt_BillDetail.BillState <> '作废') AND (dbo.BalanceMgt_Customer.PKID IN
                          (SELECT     MAX(PKID) AS Expr1
                            FROM          dbo.BalanceMgt_Customer AS BalanceMgt_Customer_1
                            GROUP BY GoodsBillCode))
GROUP BY dbo.Basic_EmployeeInfor.EmployeeCode, dbo.Basic_EmployeeInfor.Employee, dbo.BalanceMgt_Customer.CarriageReduceFund
GO
/****** Object:  View [dbo].[View_Report_InnerEmployee2]    Script Date: 2022/10/30 0:00:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_Report_InnerEmployee2]
AS
SELECT     dbo.Basic_EmployeeInfor.EmployeeCode, dbo.Basic_EmployeeInfor.Employee, SUM(dbo.Accept_CarryBillParent.Carriage) AS 运费, 
                      SUM(dbo.Accept_CarryBillParent.Insurance) AS 保险费, SUM(dbo.Accept_CarryBillParent.PayKickback) AS 付回扣
FROM         dbo.Basic_EmployeeInfor INNER JOIN
                      dbo.Accept_CarryBillParent ON dbo.Basic_EmployeeInfor.PKID = dbo.Accept_CarryBillParent.EmployeePKID INNER JOIN
                      dbo.BillMgt_BillDetail ON dbo.Accept_CarryBillParent.GoodsBillCode = dbo.BillMgt_BillDetail.BillCode
WHERE     (dbo.BillMgt_BillDetail.BillType = '货运单') AND (dbo.BillMgt_BillDetail.BillState <> '作废')
GROUP BY dbo.Basic_EmployeeInfor.EmployeeCode, dbo.Basic_EmployeeInfor.Employee
GO
/****** Object:  View [dbo].[View_Report_InnerEmployee]    Script Date: 2022/10/30 0:00:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_Report_InnerEmployee]
AS
SELECT     dbo.View_Report_InnerEmployee1.EmployeeCode, dbo.View_Report_InnerEmployee1.Employee, dbo.View_Report_InnerEmployee2.运费, 
                      dbo.View_Report_InnerEmployee2.保险费, dbo.View_Report_InnerEmployee1.已收金额, dbo.View_Report_InnerEmployee1.预付金额, 
                      dbo.View_Report_InnerEmployee1.运费减款, dbo.View_Report_InnerEmployee1.余额, dbo.View_Report_InnerEmployee2.付回扣, 
                      dbo.View_Report_InnerEmployee2.运费 + dbo.View_Report_InnerEmployee2.保险费 - dbo.View_Report_InnerEmployee2.付回扣 - dbo.View_Report_InnerEmployee1.运费减款
                       AS Expr1
FROM         dbo.View_Report_InnerEmployee1 INNER JOIN
                      dbo.View_Report_InnerEmployee2 ON dbo.View_Report_InnerEmployee1.EmployeeCode = dbo.View_Report_InnerEmployee2.EmployeeCode AND 
                      dbo.View_Report_InnerEmployee1.Employee = dbo.View_Report_InnerEmployee2.Employee
GO
/****** Object:  View [dbo].[View_CustomerCarriageRank(income)]    Script Date: 2022/10/30 0:00:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_CustomerCarriageRank(income)]
AS
SELECT     dbo.Accept_CarryBillParent.SendGoodsCustomer, SUM(dbo.Accept_CarryBillParent.Insurance) AS 保险费, SUM(dbo.Accept_CarryBillParent.Carriage) 
                      AS 运费, SUM(dbo.Accept_CarryBillParent.PayKickback) AS 付回扣
FROM         dbo.Accept_CarryBillParent INNER JOIN
                      dbo.BillMgt_BillDetail ON dbo.Accept_CarryBillParent.GoodsBillCode = dbo.BillMgt_BillDetail.BillCode
WHERE     (dbo.BillMgt_BillDetail.BillState <> '作废') AND (dbo.BillMgt_BillDetail.BillType = '货运单')
GROUP BY dbo.Accept_CarryBillParent.SendGoodsCustomer
GO
/****** Object:  View [dbo].[View_CustomerCarriageRank(payout)]    Script Date: 2022/10/30 0:00:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_CustomerCarriageRank(payout)]
AS
SELECT     dbo.Accept_CarryBillParent.SendGoodsCustomer, SUM(dbo.BalanceMgt_Customer.CarriageReduceFund) AS 运费减款
FROM         dbo.Accept_CarryBillParent INNER JOIN
                      dbo.BillMgt_BillDetail ON dbo.Accept_CarryBillParent.GoodsBillCode = dbo.BillMgt_BillDetail.BillCode INNER JOIN
                      dbo.BalanceMgt_Customer ON dbo.BillMgt_BillDetail.BillCode = dbo.BalanceMgt_Customer.GoodsBillCode
WHERE     (dbo.BillMgt_BillDetail.BillType = '货运单') AND (dbo.BillMgt_BillDetail.BillState <> '作废') AND (dbo.BalanceMgt_Customer.PKID IN
                          (SELECT     MAX(PKID) AS Expr1
                            FROM          dbo.BalanceMgt_Customer AS BalanceMgt_Customer_1
                            GROUP BY Customer))
GROUP BY dbo.Accept_CarryBillParent.SendGoodsCustomer
GO
/****** Object:  View [dbo].[View_CustomerCarriageRank]    Script Date: 2022/10/30 0:00:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_CustomerCarriageRank]
AS
SELECT     TOP (100) PERCENT dbo.[View_CustomerCarriageRank(income)].付回扣, dbo.[View_CustomerCarriageRank(income)].运费, 
                      dbo.[View_CustomerCarriageRank(income)].保险费, dbo.[View_CustomerCarriageRank(payout)].运费减款, 
                      dbo.[View_CustomerCarriageRank(income)].SendGoodsCustomer
FROM         dbo.[View_CustomerCarriageRank(income)] INNER JOIN
                      dbo.[View_CustomerCarriageRank(payout)] ON 
                      dbo.[View_CustomerCarriageRank(income)].SendGoodsCustomer = dbo.[View_CustomerCarriageRank(payout)].SendGoodsCustomer
ORDER BY dbo.[View_CustomerCarriageRank(income)].运费 DESC
GO
/****** Object:  View [dbo].[View_CarCostStat]    Script Date: 2022/10/30 0:00:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_CarCostStat]
AS
SELECT     TOP (100) PERCENT dbo.Basic_DriverInfor.DriverName, dbo.Basic_DriverInfor.CarNO, dbo.Basic_DriverInfor.CarType, 
                      dbo.Basic_DriverInfor.AllowCarryWeight, dbo.Basic_DriverInfor.CarWidth, dbo.Basic_DriverInfor.GoodsHeight, SUM(dbo.BalanceMgt_Driver.CarryFee) 
                      AS 承运费总计, SUM(dbo.BalanceMgt_Driver.AddCarriage) AS 加运费总计, dbo.Dispatch_BillReturnParent.LoadStation, 
                      dbo.Dispatch_BillReturnParent.DealGoodsStation, dbo.BalanceMgt_Driver.BackBillCode, dbo.BalanceMgt_Driver.BalanceTime, 
                      SUM(dbo.BalanceMgt_Driver.CarryFee + dbo.BalanceMgt_Driver.AddCarriage) AS 实际总运费
FROM         dbo.BalanceMgt_Driver INNER JOIN
                      dbo.Basic_DriverInfor ON dbo.BalanceMgt_Driver.DriverName = dbo.Basic_DriverInfor.DriverName INNER JOIN
                      dbo.Dispatch_BillReturnParent ON dbo.BalanceMgt_Driver.BackBillCode = dbo.Dispatch_BillReturnParent.GoodsRevertBillCode AND 
                      dbo.Basic_DriverInfor.PKID = dbo.Dispatch_BillReturnParent.DriverPKID INNER JOIN
                      dbo.BillMgt_BillDetail ON dbo.Dispatch_BillReturnParent.GoodsRevertBillCode = dbo.BillMgt_BillDetail.BillCode
WHERE     (dbo.BillMgt_BillDetail.BillType = '回执单') AND (dbo.BillMgt_BillDetail.BillState <> '作废') AND (dbo.BalanceMgt_Driver.PKID IN
                          (SELECT     MAX(PKID) AS Expr1
                            FROM          dbo.BalanceMgt_Driver AS BalanceMgt_Driver_1
                            GROUP BY BackBillCode))
GROUP BY dbo.Basic_DriverInfor.DriverName, dbo.Basic_DriverInfor.CarNO, dbo.Basic_DriverInfor.CarType, dbo.Basic_DriverInfor.AllowCarryWeight, 
                      dbo.Basic_DriverInfor.CarWidth, dbo.Basic_DriverInfor.GoodsHeight, dbo.Dispatch_BillReturnParent.LoadStation, 
                      dbo.Dispatch_BillReturnParent.DealGoodsStation, dbo.BalanceMgt_Driver.BackBillCode, dbo.BalanceMgt_Driver.BalanceTime
ORDER BY 实际总运费 DESC
GO
/****** Object:  View [dbo].[View_GoodsBalanceSmall]    Script Date: 2022/10/30 0:00:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_GoodsBalanceSmall]
AS
SELECT     dbo.View_Tempt_GoodsBalanceSmall1.CarNO, dbo.View_Tempt_GoodsBalanceSmall1.StartCarryTime, 
                      dbo.View_Tempt_GoodsBalanceSmall1.本车收入总计, dbo.View_Tempt_GoodsBalanceSmall1.中转费用总计, 
                      dbo.View_Tempt_GoodsBalanceSmall1.付回扣总计, dbo.View_Tempt_GoodsBalanceSmall2.加运费总计, 
                      dbo.View_Tempt_GoodsBalanceSmall2.承运费总计, dbo.View_Tempt_GoodsBalanceSmall2.预付金额总计, 
                      dbo.View_Tempt_GoodsBalanceSmall2.已付金额总计, dbo.View_Tempt_GoodsBalanceSmall2.余额总计, 
                      dbo.View_Tempt_GoodsBalanceSmall1.本车运费总计, dbo.View_Tempt_GoodsBalanceSmall1.保险费用总计, 
                      dbo.View_Tempt_GoodsBalanceSmall1.本车收入总计 - dbo.View_Tempt_GoodsBalanceSmall1.中转费用总计 - dbo.View_Tempt_GoodsBalanceSmall1.付回扣总计
                       - dbo.View_Tempt_GoodsBalanceSmall2.加运费总计 - dbo.View_Tempt_GoodsBalanceSmall2.承运费总计 AS 盈利
FROM         dbo.View_Tempt_GoodsBalanceSmall1 INNER JOIN
                      dbo.View_Tempt_GoodsBalanceSmall2 ON 
                      dbo.View_Tempt_GoodsBalanceSmall1.StartCarryTime = dbo.View_Tempt_GoodsBalanceSmall2.StartCarryTime AND 
                      dbo.View_Tempt_GoodsBalanceSmall1.CarNO = dbo.View_Tempt_GoodsBalanceSmall2.CarNO INNER JOIN
                      dbo.View_Tempt_GoodsBalanceSmall3 ON 
                      dbo.View_Tempt_GoodsBalanceSmall2.StartCarryTime = dbo.View_Tempt_GoodsBalanceSmall3.StartCarryTime AND 
                      dbo.View_Tempt_GoodsBalanceSmall2.CarNO = dbo.View_Tempt_GoodsBalanceSmall3.CarNO
GO
/****** Object:  View [dbo].[View_ReturnBizAnalysis]    Script Date: 2022/10/30 0:00:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_ReturnBizAnalysis]
AS
SELECT     dbo.Accept_CarryBillParent.SendGoodsCustomer, dbo.Accept_CarryBillParent.GoodsBillCode, dbo.Accept_CarryBillParent.SendGoodsAddr, 
                      dbo.Accept_CarryBillParent.ReceiveGoodsAddr, dbo.Accept_CarryBillParent.Carriage, dbo.Accept_CarryBillParent.Insurance, 
                      dbo.BalanceMgt_Customer.BillMoney, dbo.BalanceMgt_Customer.MoneyReceivable, dbo.BalanceMgt_Customer.ReceivedMoney, 
                      dbo.BalanceMgt_Customer.Balance, dbo.Accept_CarryBillParent.SendGoodsDate
FROM         dbo.Accept_CarryBillParent INNER JOIN
                      dbo.BillMgt_BillDetail ON dbo.Accept_CarryBillParent.GoodsBillCode = dbo.BillMgt_BillDetail.BillCode INNER JOIN
                      dbo.BalanceMgt_Customer ON dbo.BillMgt_BillDetail.BillCode = dbo.BalanceMgt_Customer.GoodsBillCode
WHERE     (dbo.BalanceMgt_Customer.PKID IN
                          (SELECT     MAX(PKID) AS Expr1
                            FROM          dbo.BalanceMgt_Customer AS BalanceMgt_Customer_1
                            GROUP BY GoodsBillCode)) AND (dbo.BillMgt_BillDetail.BillType = '货运单') AND (dbo.BillMgt_BillDetail.BillState <> '作废')
GROUP BY dbo.Accept_CarryBillParent.SendGoodsCustomer, dbo.Accept_CarryBillParent.GoodsBillCode, dbo.Accept_CarryBillParent.SendGoodsAddr, 
                      dbo.Accept_CarryBillParent.ReceiveGoodsAddr, dbo.Accept_CarryBillParent.Carriage, dbo.Accept_CarryBillParent.Insurance, 
                      dbo.BalanceMgt_Customer.BillMoney, dbo.BalanceMgt_Customer.MoneyReceivable, dbo.BalanceMgt_Customer.ReceivedMoney, 
                      dbo.BalanceMgt_Customer.Balance, dbo.Accept_CarryBillParent.SendGoodsDate
GO
/****** Object:  View [dbo].[View_SpecialLineWholeCostAnalysis1]    Script Date: 2022/10/30 0:00:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_SpecialLineWholeCostAnalysis1]
AS
SELECT     dbo.Dispatch_BillReturnParent.LoadStation, dbo.Dispatch_BillReturnParent.DealGoodsStation, SUM(dbo.Dispatch_BillReturnParent.AllCarriage) 
                      AS 总运费总计, SUM(dbo.Dispatch_BillReturnParent.Insurance) AS 保险费总计, COUNT(*) AS 次数
FROM         dbo.Dispatch_BillReturnParent INNER JOIN
                      dbo.BillMgt_BillDetail ON dbo.Dispatch_BillReturnParent.GoodsRevertBillCode = dbo.BillMgt_BillDetail.BillCode
WHERE     (dbo.BillMgt_BillDetail.BillType = '回执单') AND (dbo.BillMgt_BillDetail.BillState <> '作废')
GROUP BY dbo.Dispatch_BillReturnParent.LoadStation, dbo.Dispatch_BillReturnParent.DealGoodsStation
GO
/****** Object:  View [dbo].[View_SpecialLineWholeCostAnalysis2]    Script Date: 2022/10/30 0:00:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_SpecialLineWholeCostAnalysis2]
AS
SELECT     dbo.Dispatch_BillReturnParent.LoadStation, dbo.Dispatch_BillReturnParent.DealGoodsStation, SUM(dbo.Dispatch_BillReturnParent.AllCarriage) 
                      AS 总运费, SUM(dbo.BalanceMgt_Driver.AddCarriage) AS 加运费
FROM         dbo.BillMgt_BillDetail INNER JOIN
                      dbo.Dispatch_BillReturnParent ON dbo.BillMgt_BillDetail.BillCode = dbo.Dispatch_BillReturnParent.GoodsRevertBillCode INNER JOIN
                      dbo.BalanceMgt_Driver ON dbo.Dispatch_BillReturnParent.GoodsRevertBillCode = dbo.BalanceMgt_Driver.BackBillCode
WHERE     (dbo.BillMgt_BillDetail.BillType = '回执单') AND (dbo.BillMgt_BillDetail.BillState <> '作废')
GROUP BY dbo.Dispatch_BillReturnParent.LoadStation, dbo.Dispatch_BillReturnParent.DealGoodsStation
GO
/****** Object:  View [dbo].[View_SpecialLineWholeCostAnalysis]    Script Date: 2022/10/30 0:00:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_SpecialLineWholeCostAnalysis]
AS
SELECT     dbo.View_SpecialLineWholeCostAnalysis1.LoadStation, dbo.View_SpecialLineWholeCostAnalysis1.DealGoodsStation, 
                      dbo.View_SpecialLineWholeCostAnalysis1.总运费总计, dbo.View_SpecialLineWholeCostAnalysis1.保险费总计, 
                      dbo.View_SpecialLineWholeCostAnalysis1.次数
FROM         dbo.View_SpecialLineWholeCostAnalysis1 INNER JOIN
                      dbo.View_SpecialLineWholeCostAnalysis2 ON 
                      dbo.View_SpecialLineWholeCostAnalysis1.LoadStation = dbo.View_SpecialLineWholeCostAnalysis2.LoadStation AND 
                      dbo.View_SpecialLineWholeCostAnalysis1.DealGoodsStation = dbo.View_SpecialLineWholeCostAnalysis2.DealGoodsStation
GO
/****** Object:  Table [dbo].[Accept_CarryBillEvent]    Script Date: 2022/10/30 0:00:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accept_CarryBillEvent](
	[PKID] [int] IDENTITY(1,1) NOT NULL,
	[GoodsBillPKID] [int] NULL,
	[EventName] [varchar](50) NULL,
	[Remark] [varchar](50) NULL,
	[OccurTime] [datetime] NULL,
 CONSTRAINT [PK_ACCEPT_CARRYBILLEVENT] PRIMARY KEY CLUSTERED 
(
	[PKID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Account_EmployeeUser]    Script Date: 2022/10/30 0:00:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account_EmployeeUser](
	[PKID] [int] IDENTITY(1,1) NOT NULL,
	[EmployeePKID] [int] NULL,
	[UserPKID] [int] NULL,
 CONSTRAINT [PK_ACCOUNT_EMPLOYEEUSER] PRIMARY KEY CLUSTERED 
(
	[PKID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Account_FunctionGroup]    Script Date: 2022/10/30 0:00:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account_FunctionGroup](
	[PKID] [int] IDENTITY(1,1) NOT NULL,
	[FunctionPKID] [int] NULL,
	[GroupPKID] [int] NULL,
 CONSTRAINT [PK_ACCOUNT_FUNCTIONGROUP] PRIMARY KEY CLUSTERED 
(
	[PKID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Account_Functions]    Script Date: 2022/10/30 0:00:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account_Functions](
	[PKID] [int] IDENTITY(1,1) NOT NULL,
	[PageFunction] [varchar](50) NULL,
	[PageName] [varchar](50) NULL,
 CONSTRAINT [PK_ACCOUNT_FUNCTIONS] PRIMARY KEY CLUSTERED 
(
	[PKID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Account_Groups]    Script Date: 2022/10/30 0:00:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account_Groups](
	[PKID] [int] IDENTITY(1,1) NOT NULL,
	[GroupName] [varchar](50) NULL,
	[Description] [varchar](255) NULL,
 CONSTRAINT [PK_ACCOUNT_GROUPS] PRIMARY KEY CLUSTERED 
(
	[PKID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Account_UserGroup]    Script Date: 2022/10/30 0:00:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account_UserGroup](
	[PKID] [int] IDENTITY(1,1) NOT NULL,
	[UserPKID] [int] NULL,
	[GroupPKID] [int] NULL,
 CONSTRAINT [PK_ACCOUNT_USERGROUP] PRIMARY KEY CLUSTERED 
(
	[PKID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Account_Users]    Script Date: 2022/10/30 0:00:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account_Users](
	[PKID] [int] IDENTITY(1,1) NOT NULL,
	[LoginID] [varchar](50) NULL,
	[Username] [nvarchar](50) NULL,
	[Password] [varchar](50) NULL,
	[Sex] [tinyint] NULL,
	[Birthday] [datetime] NULL,
	[IfOnline] [bit] NULL,
 CONSTRAINT [PK_ACCOUNT_USERS] PRIMARY KEY CLUSTERED 
(
	[PKID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ArriveMgt_CarryMistake]    Script Date: 2022/10/30 0:00:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ArriveMgt_CarryMistake](
	[PKID] [int] IDENTITY(1,1) NOT NULL,
	[GoodsRevertBillCode] [varchar](50) NULL,
	[GoodsBillCode] [varchar](50) NULL,
	[Customer] [varchar](50) NULL,
	[GoodsName] [varchar](50) NULL,
	[MistakeType] [varchar](50) NULL,
	[PieceAmount] [int] NULL,
	[Size] [varchar](50) NULL,
	[GoodsValue] [money] NULL,
 CONSTRAINT [PK_ARRIVEMGT_CARRYMISTAKE] PRIMARY KEY CLUSTERED 
(
	[PKID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ArriveMgt_CustomerReturn]    Script Date: 2022/10/30 0:00:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ArriveMgt_CustomerReturn](
	[PKID] [decimal](18, 0) IDENTITY(1,1) NOT NULL,
	[GoodsBillCode] [nvarchar](50) NULL,
	[Customer] [nvarchar](50) NULL,
	[CheckGoodsRecord] [nvarchar](50) NULL,
	[ReceiveGoodsPerson] [nvarchar](50) NULL,
	[ReceiveGoodsDate] [datetime] NULL,
	[CarryBillEventPKID] [int] NULL,
 CONSTRAINT [PK_ARRIVE_CUSTOMERRETURN] PRIMARY KEY CLUSTERED 
(
	[PKID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ArriveMgt_DriverReturn]    Script Date: 2022/10/30 0:00:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ArriveMgt_DriverReturn](
	[PKID] [int] IDENTITY(1,1) NOT NULL,
	[GoodsRevertCode] [varchar](50) NULL,
	[DriverName] [varchar](50) NOT NULL,
	[CheckGoodsRecord] [varchar](50) NULL,
	[ReceiveGoodsPerson] [varchar](50) NULL,
	[ReceiveGoodsDate] [datetime] NULL,
 CONSTRAINT [PK_ARRIVE_DRIVERRETURN] PRIMARY KEY CLUSTERED 
(
	[PKID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BalanceMgt_HelpAccept]    Script Date: 2022/10/30 0:00:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BalanceMgt_HelpAccept](
	[PKID] [int] IDENTITY(1,1) NOT NULL,
	[Customer] [varchar](50) NULL,
	[GoodsBillCode] [varchar](50) NULL,
	[AccountReceivable] [money] NULL,
	[FactReceiveFund] [money] NULL,
	[GoodsPayChange] [money] NULL,
	[CommisionRate] [real] NULL,
	[CommisionReceivable] [money] NULL,
	[ReceivedCommision] [money] NULL,
	[BalanceDate] [datetime] NULL,
 CONSTRAINT [PK_BALANCEMGT_HELPACCEPT] PRIMARY KEY CLUSTERED 
(
	[PKID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BalanceMgt_Others]    Script Date: 2022/10/30 0:00:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BalanceMgt_Others](
	[PKID] [int] IDENTITY(1,1) NOT NULL,
	[SubjectName] [varchar](50) NULL,
	[BalanceMoney] [money] NULL,
	[Remark] [varchar](50) NULL,
	[BalanceDate] [datetime] NULL,
	[BalanceType] [varchar](50) NULL,
 CONSTRAINT [PK_BALANCEMGT_OTHERS] PRIMARY KEY CLUSTERED 
(
	[PKID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Basic_CityInfor]    Script Date: 2022/10/30 0:00:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Basic_CityInfor](
	[PKID] [int] IDENTITY(1,1) NOT NULL,
	[City] [varchar](50) NULL,
 CONSTRAINT [PK_BASIC_CITYINFOR] PRIMARY KEY CLUSTERED 
(
	[PKID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Basic_CityScope]    Script Date: 2022/10/30 0:00:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Basic_CityScope](
	[PKID] [int] IDENTITY(1,1) NOT NULL,
	[CityPKID] [int] NULL,
	[RangeCity] [varchar](50) NULL,
 CONSTRAINT [PK_BASIC_CITYSCOPE] PRIMARY KEY CLUSTERED 
(
	[PKID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Basic_CustomerInfor]    Script Date: 2022/10/30 0:00:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Basic_CustomerInfor](
	[PKID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerCode] [varchar](50) NULL,
	[Customer] [varchar](50) NULL,
	[Phone] [varchar](50) NULL,
	[Fax] [varchar](50) NULL,
	[Address] [varchar](50) NULL,
	[PostCode] [varchar](50) NULL,
	[Linkman] [varchar](50) NULL,
	[LinkmanMobile] [varchar](50) NULL,
	[CustomerType] [varchar](50) NULL,
	[EnterpriseProperty] [varchar](50) NULL,
	[EnterpriseSize] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
 CONSTRAINT [PK_BASIC_CUSTOMERINFOR] PRIMARY KEY CLUSTERED 
(
	[PKID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Basic_LineInfor]    Script Date: 2022/10/30 0:00:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Basic_LineInfor](
	[PKID] [int] IDENTITY(1,1) NOT NULL,
	[StartStation] [varchar](50) NULL,
	[EndStation] [varchar](50) NULL,
	[Distance] [real] NULL,
	[FetchTime] [real] NULL,
 CONSTRAINT [PK_BASIC_LINEINFOR] PRIMARY KEY CLUSTERED 
(
	[PKID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BillMgt_BillDispense]    Script Date: 2022/10/30 0:00:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BillMgt_BillDispense](
	[PKID] [int] IDENTITY(1,1) NOT NULL,
	[BillType] [varchar](50) NULL,
	[BillStartCode] [varchar](50) NULL,
	[BillEndCode] [varchar](50) NULL,
	[ReceiveBillPerson] [varchar](50) NULL,
	[AcceptStation] [varchar](50) NULL,
	[ReceiveBillTime] [datetime] NULL,
	[ReleasePerson] [varchar](50) NULL,
 CONSTRAINT [PK_BILLMGT_BILLDISPENSE] PRIMARY KEY CLUSTERED 
(
	[PKID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cost_AmendsInfor]    Script Date: 2022/10/30 0:00:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cost_AmendsInfor](
	[PKID] [int] IDENTITY(1,1) NOT NULL,
	[Amends] [money] NULL,
	[Customer] [varchar](50) NULL,
	[AmendsTime] [datetime] NULL,
	[Remark] [varchar](255) NULL,
	[ReceiveStationID] [int] NULL,
	[BadDestroyGoods] [money] NULL,
	[ReceiveStationName] [varchar](50) NULL,
	[WriteDate] [datetime] NULL,
 CONSTRAINT [PK_COST_AMENDSINFOR] PRIMARY KEY CLUSTERED 
(
	[PKID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cost_EmployeeWage]    Script Date: 2022/10/30 0:00:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cost_EmployeeWage](
	[PKID] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeCode] [varchar](50) NULL,
	[BasicWage] [money] NULL,
	[StationWage] [money] NULL,
	[Allowance] [money] NULL,
	[Date] [datetime] NULL,
	[Employee] [varchar](50) NULL,
	[WriteDate] [datetime] NULL,
 CONSTRAINT [PK_COST_EMPLOYEEWAGE] PRIMARY KEY CLUSTERED 
(
	[PKID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cost_FinanceFee]    Script Date: 2022/10/30 0:00:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cost_FinanceFee](
	[PKID] [int] IDENTITY(1,1) NOT NULL,
	[FinanceFee] [money] NULL,
	[PayoutMonth] [datetime] NULL,
	[WriteDate] [datetime] NULL,
 CONSTRAINT [PK_COST_FINANCEFEE] PRIMARY KEY CLUSTERED 
(
	[PKID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cost_ManageFee]    Script Date: 2022/10/30 0:00:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cost_ManageFee](
	[PKID] [int] IDENTITY(1,1) NOT NULL,
	[OfficeFee] [money] NULL,
	[HouseRent] [money] NULL,
	[WaterElecFee] [money] NULL,
	[PhoneFee] [money] NULL,
	[OtherPayout] [money] NULL,
	[PayoutMonth] [datetime] NULL,
	[WriteDate] [datetime] NULL,
 CONSTRAINT [PK_COST_MANAGEFEE] PRIMARY KEY CLUSTERED 
(
	[PKID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cost_UnbizIncome]    Script Date: 2022/10/30 0:00:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cost_UnbizIncome](
	[PKID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[Money] [money] NULL,
	[IncomeMonth] [datetime] NULL,
	[WriteDate] [datetime] NULL,
 CONSTRAINT [PK_COST_UNBIZINCOME] PRIMARY KEY CLUSTERED 
(
	[PKID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer_AppealInfor]    Script Date: 2022/10/30 0:00:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer_AppealInfor](
	[PKID] [int] IDENTITY(1,1) NOT NULL,
	[Customer] [varchar](50) NULL,
	[GoodsBillCode] [varchar](50) NULL,
	[AppealContent] [varchar](50) NULL,
	[AppealDate] [varchar](50) NULL,
	[IfHandle] [varchar](50) NULL,
	[DealDate] [varchar](50) NULL,
	[DealResult] [varchar](50) NULL,
	[IfCallback] [varchar](50) NULL,
	[CallBackDate] [varchar](50) NULL,
	[DealPerson] [varchar](50) NULL,
 CONSTRAINT [PK_CUSTOMER_APPEALINFOR] PRIMARY KEY CLUSTERED 
(
	[PKID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer_CustomerCallBack]    Script Date: 2022/10/30 0:00:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer_CustomerCallBack](
	[PKID] [int] IDENTITY(1,1) NOT NULL,
	[GoodsBillPKID] [int] NULL,
	[IfCallback] [bit] NOT NULL,
 CONSTRAINT [PK_CUSTOMER_CUSTOMERCALLBACK] PRIMARY KEY CLUSTERED 
(
	[PKID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer_SoundInfor]    Script Date: 2022/10/30 0:00:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer_SoundInfor](
	[ID] [int] NOT NULL,
	[DialNO] [varchar](50) NOT NULL,
	[Type] [varchar](50) NOT NULL,
	[Content] [varchar](255) NOT NULL,
	[WriteTime] [datetime] NOT NULL,
	[Writer] [varchar](50) NOT NULL,
	[FinallyDialTime] [datetime] NULL,
	[Success] [bit] NOT NULL,
	[Locked] [bit] NOT NULL,
	[BillID] [varchar](50) NULL,
	[BillType] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer_SoundInforHistory]    Script Date: 2022/10/30 0:00:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer_SoundInforHistory](
	[ID] [int] NOT NULL,
	[DialNO] [varchar](50) NOT NULL,
	[Type] [varchar](50) NOT NULL,
	[Content] [varchar](255) NOT NULL,
	[WriteTime] [datetime] NOT NULL,
	[Writer] [varchar](50) NOT NULL,
	[FinallyDialTime] [datetime] NULL,
	[Success] [bit] NOT NULL,
	[Locked] [bit] NOT NULL,
	[BillID] [varchar](50) NULL,
	[BillType] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Print_BizStatDay]    Script Date: 2022/10/30 0:00:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Print_BizStatDay](
	[PickupStation] [varchar](50) NULL,
	[ReceiveGoodsAddr1] [varchar](50) NULL,
	[MoneyReceivable1] [varchar](50) NULL,
	[ReceivedMoney1] [varchar](50) NULL,
	[Balance1] [varchar](50) NULL,
	[PieceCountReceivable1] [varchar](50) NULL,
	[ReceivedPieceCount1] [varchar](50) NULL,
	[RemainPieceCount1] [varchar](50) NULL,
	[ReceiveGoodsAddr2] [varchar](50) NULL,
	[MoneyReceivable2] [varchar](50) NULL,
	[ReceivedMoney2] [varchar](50) NULL,
	[Balance2] [varchar](50) NULL,
	[PieceCountReceivable2] [varchar](50) NULL,
	[ReceivedPieceCount2] [varchar](50) NULL,
	[RemainPieceCount2] [varchar](50) NULL,
	[ReceiveGoodsAddr3] [varchar](50) NULL,
	[MoneyReceivable3] [varchar](50) NULL,
	[ReceivedMoney3] [varchar](50) NULL,
	[Balance3] [varchar](50) NULL,
	[PieceCountReceivable3] [varchar](50) NULL,
	[ReceivedPieceCount3] [varchar](50) NULL,
	[RemainPieceCount3] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Print_CarCost]    Script Date: 2022/10/30 0:00:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Print_CarCost](
	[DriverName] [varchar](50) NULL,
	[CarNO] [varchar](50) NULL,
	[CarType] [varchar](50) NULL,
	[AllowCarryWeight] [varchar](50) NULL,
	[CarWidth] [varchar](50) NULL,
	[GoodsHeight] [varchar](50) NULL,
	[承运费总计] [money] NULL,
	[加运费总计] [money] NULL,
	[LoadStation] [varchar](50) NULL,
	[DealGoodsStation] [varchar](50) NULL,
	[BackBillCode] [varchar](50) NULL,
	[BalanceTime] [datetime] NULL,
	[实际总运费] [money] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Print_CustomerAmount]    Script Date: 2022/10/30 0:00:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Print_CustomerAmount](
	[SendGoodsCustomer] [varchar](50) NULL,
	[CarriageTotal] [money] NULL,
	[InsuranceTotal] [money] NULL,
	[PieceAmountTotal] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Print_DriverAmount]    Script Date: 2022/10/30 0:00:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Print_DriverAmount](
	[CarNO] [varchar](50) NULL,
	[CarryFeeTotal] [money] NULL,
	[AddCarriageTotal] [money] NULL,
	[Total] [money] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Print_LoadStartBill]    Script Date: 2022/10/30 0:00:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Print_LoadStartBill](
	[UserID] [varchar](50) NULL,
	[ID] [varchar](50) NULL,
	[SendGoodsCustomer] [varchar](50) NULL,
	[GoodsName] [varchar](50) NULL,
	[GoodsCode] [varchar](50) NULL,
	[TransferDestination] [varchar](50) NULL,
	[SendGoodsCustomerTel] [varchar](50) NULL,
	[CashPay] [money] NULL,
	[PickupPay] [money] NULL,
	[BackCost] [money] NULL,
	[HelpAcceptFund] [varchar](50) NULL,
	[Remark] [varchar](50) NULL,
	[DriverName] [varchar](50) NULL,
	[CarCardNO] [varchar](50) NULL,
	[Mobile] [varchar](50) NULL,
	[PieceAmount] [int] NULL,
	[GoodsRevertBillCode] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Print_ReturnBiz]    Script Date: 2022/10/30 0:00:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Print_ReturnBiz](
	[SendGoodsCustomer] [varchar](50) NULL,
	[GoodsBillCode] [varchar](50) NOT NULL,
	[SendGoodsAddr] [varchar](50) NULL,
	[ReceiveGoodsAddr] [varchar](50) NULL,
	[Carriage] [money] NULL,
	[Insurance] [money] NULL,
	[BillMoney] [money] NULL,
	[MoneyReceivable] [money] NULL,
	[ReceivedMoney] [money] NULL,
	[Balance] [money] NULL,
	[SendGoodsDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Print_SpecialLineAll]    Script Date: 2022/10/30 0:00:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Print_SpecialLineAll](
	[LoadStation] [varchar](50) NULL,
	[DealGoodsStation] [varchar](50) NULL,
	[总运费总计] [money] NULL,
	[保险费总计] [money] NULL,
	[次数] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Report_ProfitLossMonth]    Script Date: 2022/10/30 0:00:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Report_ProfitLossMonth](
	[PKID] [int] IDENTITY(1,1) NOT NULL,
	[Category] [varchar](50) NULL,
	[MidCategory] [varchar](50) NULL,
	[SubType] [varchar](50) NULL,
	[Money] [money] NULL,
	[StatStartDate] [datetime] NULL,
	[StatEndDate] [datetime] NULL,
	[BalanceDate] [datetime] NULL,
 CONSTRAINT [PK_Q_PROFITLOSSMONTH] PRIMARY KEY CLUSTERED 
(
	[PKID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Report_ProfitLossMonthTemp]    Script Date: 2022/10/30 0:00:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Report_ProfitLossMonthTemp](
	[PKID] [int] IDENTITY(1,1) NOT NULL,
	[Income] [money] NULL,
	[Payout] [money] NULL,
	[BizIncome] [money] NULL,
	[CarriageMoney] [money] NULL,
	[InsuranceMoney] [money] NULL,
	[UnbizIncome_Name_1] [varchar](50) NULL,
	[UnbizIncome_Money_1] [money] NULL,
	[UnbizIncome_Name_2] [varchar](50) NULL,
	[UnbizIncome_Money_2] [money] NULL,
	[UnbizIncome_Name_3] [varchar](50) NULL,
	[UnbizIncome_Money_3] [money] NULL,
	[UnbizIncome_Name_4] [varchar](50) NULL,
	[UnbizIncome_Money_4] [money] NULL,
	[UnbizIncome_Name_5] [varchar](50) NULL,
	[UnbizIncome_Money_5] [money] NULL,
	[UnbizIncome_Name_6] [varchar](50) NULL,
	[UnbizIncome_Money_6] [money] NULL,
	[UnbizIncome_Name_7] [varchar](50) NULL,
	[UnbizIncome_Money_7] [money] NULL,
	[UnbizIncome_Name_8] [varchar](50) NULL,
	[UnbizIncome_Money_8] [money] NULL,
	[BizFee] [money] NULL,
	[CarCarriage] [money] NULL,
	[AmendsFund] [money] NULL,
	[BadDestroyGoods] [money] NULL,
	[ConveyWage] [money] NULL,
	[ManageFee] [money] NULL,
	[OfficeFee] [money] NULL,
	[HouseRent] [money] NULL,
	[WaterElecFee] [money] NULL,
	[PhoneFee] [money] NULL,
	[Other] [money] NULL,
	[FinanceFee] [money] NULL,
	[Profit] [money] NULL,
 CONSTRAINT [PK_Q_PROFITLOSSTEMPMONTH] PRIMARY KEY CLUSTERED 
(
	[PKID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TransferMgt_CompanyInfor]    Script Date: 2022/10/30 0:00:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TransferMgt_CompanyInfor](
	[PKID] [int] IDENTITY(1,1) NOT NULL,
	[City] [varchar](50) NULL,
	[CompanyName] [varchar](50) NULL,
	[LinkPhone] [varchar](50) NULL,
	[DetailAddress] [varchar](200) NULL,
 CONSTRAINT [PK_TRANSFERMGT_COMPANYINFOR] PRIMARY KEY CLUSTERED 
(
	[PKID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TransferMgt_TransferInfor]    Script Date: 2022/10/30 0:00:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TransferMgt_TransferInfor](
	[PKID] [int] IDENTITY(1,1) NOT NULL,
	[GoodsBillCode] [varchar](50) NULL,
	[TransferStation] [varchar](50) NULL,
	[TransferCheck] [varchar](50) NULL,
	[CheckTime] [datetime] NULL,
	[Description] [varchar](50) NULL,
	[TransferCompany] [varchar](50) NULL,
	[TransferAddr] [varchar](50) NULL,
	[TransferStationTel] [varchar](50) NULL,
	[TransferFee] [varchar](50) NULL,
	[AfterTransferBill] [varchar](50) NULL,
 CONSTRAINT [PK_TRANSFERMGT_TRANSFERINFOR] PRIMARY KEY CLUSTERED 
(
	[PKID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Account_Users] ADD  CONSTRAINT [DF__Account_U__IfOnl__0CBAE877]  DEFAULT ((0)) FOR [IfOnline]
GO
ALTER TABLE [dbo].[Basic_DriverInfor] ADD  DEFAULT ((1)) FOR [CompanyCar]
GO
ALTER TABLE [dbo].[Customer_AppealInfor] ADD  CONSTRAINT [DF_Customer_AppealInfor_IfHandle]  DEFAULT ('0') FOR [IfHandle]
GO
ALTER TABLE [dbo].[Customer_CustomerCallBack] ADD  DEFAULT ((0)) FOR [IfCallback]
GO
ALTER TABLE [dbo].[Dispatch_BillReturnParent] ADD  DEFAULT ((1)) FOR [Execute]
GO
ALTER TABLE [dbo].[Accept_CarryBillDetail]  WITH CHECK ADD  CONSTRAINT [FK_CarryBillDetail_Reference_CarryBillParent] FOREIGN KEY([GoodsBillPKID])
REFERENCES [dbo].[Accept_CarryBillParent] ([PKID])
GO
ALTER TABLE [dbo].[Accept_CarryBillDetail] CHECK CONSTRAINT [FK_CarryBillDetail_Reference_CarryBillParent]
GO
ALTER TABLE [dbo].[Accept_CarryBillEvent]  WITH CHECK ADD  CONSTRAINT [FK_CarryBillEvent_Reference_CarryBillParent] FOREIGN KEY([GoodsBillPKID])
REFERENCES [dbo].[Accept_CarryBillParent] ([PKID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Accept_CarryBillEvent] CHECK CONSTRAINT [FK_CarryBillEvent_Reference_CarryBillParent]
GO
ALTER TABLE [dbo].[Account_EmployeeUser]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeUser_Reference_Users] FOREIGN KEY([UserPKID])
REFERENCES [dbo].[Account_Users] ([PKID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Account_EmployeeUser] CHECK CONSTRAINT [FK_EmployeeUser_Reference_Users]
GO
ALTER TABLE [dbo].[Account_FunctionGroup]  WITH CHECK ADD  CONSTRAINT [FK_FunctionGroup_Reference_Functions] FOREIGN KEY([FunctionPKID])
REFERENCES [dbo].[Account_Functions] ([PKID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Account_FunctionGroup] CHECK CONSTRAINT [FK_FunctionGroup_Reference_Functions]
GO
ALTER TABLE [dbo].[Account_FunctionGroup]  WITH CHECK ADD  CONSTRAINT [FK_FunctionGroup_Reference_Groups] FOREIGN KEY([GroupPKID])
REFERENCES [dbo].[Account_Groups] ([PKID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Account_FunctionGroup] CHECK CONSTRAINT [FK_FunctionGroup_Reference_Groups]
GO
ALTER TABLE [dbo].[Account_UserGroup]  WITH CHECK ADD  CONSTRAINT [FK_UserGroup_Reference_Groups] FOREIGN KEY([GroupPKID])
REFERENCES [dbo].[Account_Groups] ([PKID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Account_UserGroup] CHECK CONSTRAINT [FK_UserGroup_Reference_Groups]
GO
ALTER TABLE [dbo].[Account_UserGroup]  WITH CHECK ADD  CONSTRAINT [FK_UserGroup_Reference_Users] FOREIGN KEY([UserPKID])
REFERENCES [dbo].[Account_Users] ([PKID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Account_UserGroup] CHECK CONSTRAINT [FK_UserGroup_Reference_Users]
GO
ALTER TABLE [dbo].[Basic_CityScope]  WITH CHECK ADD  CONSTRAINT [FK_CityScope_Reference_CityInfor] FOREIGN KEY([CityPKID])
REFERENCES [dbo].[Basic_CityInfor] ([PKID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Basic_CityScope] CHECK CONSTRAINT [FK_CityScope_Reference_CityInfor]
GO
ALTER TABLE [dbo].[Dispatch_BillReturnDetail]  WITH CHECK ADD  CONSTRAINT [FK_BillReturnDetail_Reference_BillReturnParent] FOREIGN KEY([GoodsRevertBillPKID])
REFERENCES [dbo].[Dispatch_BillReturnParent] ([PKID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Dispatch_BillReturnDetail] CHECK CONSTRAINT [FK_BillReturnDetail_Reference_BillReturnParent]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "BalanceMgt_Driver"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 230
               Right = 212
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "Basic_DriverInfor"
            Begin Extent = 
               Top = 17
               Left = 245
               Bottom = 236
               Right = 411
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Dispatch_BillReturnParent"
            Begin Extent = 
               Top = 7
               Left = 519
               Bottom = 239
               Right = 717
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "BillMgt_BillDetail"
            Begin Extent = 
               Top = 67
               Left = 758
               Bottom = 175
               Right = 905
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 1440
         Alias = 1275
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 8880
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_CarCostStat'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_CarCostStat'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "View_CustomerCarriageRank(income)"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 192
               Right = 218
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "View_CustomerCarriageRank(payout)"
            Begin Extent = 
               Top = 6
               Left = 256
               Bottom = 188
               Right = 436
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_CustomerCarriageRank'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_CustomerCarriageRank'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Accept_CarryBillParent"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 225
               Right = 262
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "BillMgt_BillDetail"
            Begin Extent = 
               Top = 6
               Left = 300
               Bottom = 185
               Right = 447
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_CustomerCarriageRank(income)'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_CustomerCarriageRank(income)'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Accept_CarryBillParent"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 238
               Right = 262
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "BillMgt_BillDetail"
            Begin Extent = 
               Top = 10
               Left = 322
               Bottom = 242
               Right = 469
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "BalanceMgt_Customer"
            Begin Extent = 
               Top = 8
               Left = 546
               Bottom = 240
               Right = 727
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 1815
         Alias = 810
         Table = 2385
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 2925
         Filter = 11250
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_CustomerCarriageRank(payout)'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_CustomerCarriageRank(payout)'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "View_Tempt_GoodsBalanceSmall1"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 176
               Right = 191
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "View_Tempt_GoodsBalanceSmall2"
            Begin Extent = 
               Top = 6
               Left = 254
               Bottom = 198
               Right = 407
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "View_Tempt_GoodsBalanceSmall3"
            Begin Extent = 
               Top = 5
               Left = 532
               Bottom = 165
               Right = 685
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 17430
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_GoodsBalanceSmall'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_GoodsBalanceSmall'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "View_Temp_Biz"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 221
               Right = 319
            End
            DisplayFlags = 280
            TopColumn = 5
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 4605
         Alias = 900
         Table = 2505
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 2175
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_Print_Biz'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_Print_Biz'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "View_Report_InnerEmployee2"
            Begin Extent = 
               Top = 7
               Left = 328
               Bottom = 229
               Right = 627
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "View_Report_InnerEmployee1"
            Begin Extent = 
               Top = 7
               Left = 55
               Bottom = 235
               Right = 236
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 2550
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_Report_InnerEmployee'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_Report_InnerEmployee'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[43] 4[18] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Basic_EmployeeInfor"
            Begin Extent = 
               Top = 17
               Left = 36
               Bottom = 216
               Right = 187
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "BillMgt_BillDetail"
            Begin Extent = 
               Top = 6
               Left = 227
               Bottom = 142
               Right = 374
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Accept_CarryBillParent"
            Begin Extent = 
               Top = 6
               Left = 412
               Bottom = 214
               Right = 636
            End
            DisplayFlags = 280
            TopColumn = 29
         End
         Begin Table = "BalanceMgt_Customer"
            Begin Extent = 
               Top = 6
               Left = 674
               Bottom = 207
               Right = 916
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 75
         GroupBy = 1350
         Filter = 11190
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_Report_InnerEmployee1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_Report_InnerEmployee1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Basic_EmployeeInfor"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 178
               Right = 189
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Accept_CarryBillParent"
            Begin Extent = 
               Top = 6
               Left = 227
               Bottom = 211
               Right = 451
            End
            DisplayFlags = 280
            TopColumn = 20
         End
         Begin Table = "BillMgt_BillDetail"
            Begin Extent = 
               Top = 6
               Left = 489
               Bottom = 205
               Right = 636
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_Report_InnerEmployee2'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_Report_InnerEmployee2'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Accept_CarryBillParent"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 234
               Right = 262
            End
            DisplayFlags = 280
            TopColumn = 7
         End
         Begin Table = "BillMgt_BillDetail"
            Begin Extent = 
               Top = 6
               Left = 300
               Bottom = 237
               Right = 447
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "BalanceMgt_Customer"
            Begin Extent = 
               Top = 6
               Left = 485
               Bottom = 185
               Right = 666
            End
            DisplayFlags = 280
            TopColumn = 1
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 4665
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_ReturnBizAnalysis'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_ReturnBizAnalysis'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "View_SpecialLineWholeCostAnalysis1"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 206
               Right = 203
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "View_SpecialLineWholeCostAnalysis2"
            Begin Extent = 
               Top = 6
               Left = 241
               Bottom = 229
               Right = 406
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_SpecialLineWholeCostAnalysis'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_SpecialLineWholeCostAnalysis'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Dispatch_BillReturnParent"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 237
               Right = 236
            End
            DisplayFlags = 280
            TopColumn = 11
         End
         Begin Table = "BillMgt_BillDetail"
            Begin Extent = 
               Top = 6
               Left = 274
               Bottom = 236
               Right = 421
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_SpecialLineWholeCostAnalysis1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_SpecialLineWholeCostAnalysis1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "BillMgt_BillDetail"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 205
               Right = 185
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Dispatch_BillReturnParent"
            Begin Extent = 
               Top = 6
               Left = 223
               Bottom = 218
               Right = 421
            End
            DisplayFlags = 280
            TopColumn = 11
         End
         Begin Table = "BalanceMgt_Driver"
            Begin Extent = 
               Top = 6
               Left = 459
               Bottom = 211
               Right = 633
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_SpecialLineWholeCostAnalysis2'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_SpecialLineWholeCostAnalysis2'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[25] 2[16] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "BillMgt_BillDetail"
            Begin Extent = 
               Top = 24
               Left = 28
               Bottom = 212
               Right = 175
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Accept_CarryBillParent"
            Begin Extent = 
               Top = 19
               Left = 214
               Bottom = 219
               Right = 438
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "BalanceMgt_Customer"
            Begin Extent = 
               Top = 81
               Left = 470
               Bottom = 228
               Right = 651
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Accept_CarryBillDetail"
            Begin Extent = 
               Top = 10
               Left = 660
               Bottom = 238
               Right = 897
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 18
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 2985
         Alias = 900
         ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_Temp_Biz'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'Table = 1815
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 9090
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_Temp_Biz'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_Temp_Biz'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Basic_DriverInfor"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 114
               Right = 220
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Dispatch_BillReturnParent"
            Begin Extent = 
               Top = 6
               Left = 258
               Bottom = 114
               Right = 472
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Dispatch_BillReturnDetail"
            Begin Extent = 
               Top = 6
               Left = 510
               Bottom = 114
               Right = 704
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Accept_CarryBillDetail"
            Begin Extent = 
               Top = 114
               Left = 38
               Bottom = 222
               Right = 223
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Accept_CarryBillParent"
            Begin Extent = 
               Top = 114
               Left = 261
               Bottom = 222
               Right = 501
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_Tempt_GoodsBalanceSmall'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N' ColumnWidths = 12
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_Tempt_GoodsBalanceSmall'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_Tempt_GoodsBalanceSmall'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "View_Tempt_GoodsBalanceSmall"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 114
               Right = 207
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_Tempt_GoodsBalanceSmall1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_Tempt_GoodsBalanceSmall1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "BalanceMgt_Driver"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 114
               Right = 228
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Basic_DriverInfor"
            Begin Extent = 
               Top = 6
               Left = 266
               Bottom = 114
               Right = 448
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Dispatch_BillReturnParent"
            Begin Extent = 
               Top = 6
               Left = 486
               Bottom = 114
               Right = 700
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "BillMgt_BillDetail"
            Begin Extent = 
               Top = 6
               Left = 738
               Bottom = 114
               Right = 901
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
       ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_Tempt_GoodsBalanceSmall2'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'  Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_Tempt_GoodsBalanceSmall2'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_Tempt_GoodsBalanceSmall2'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Dispatch_BillReturnParent"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 114
               Right = 252
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Basic_DriverInfor"
            Begin Extent = 
               Top = 6
               Left = 290
               Bottom = 114
               Right = 472
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "BillMgt_BillDetail"
            Begin Extent = 
               Top = 6
               Left = 510
               Bottom = 114
               Right = 673
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_Tempt_GoodsBalanceSmall3'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_Tempt_GoodsBalanceSmall3'
GO
