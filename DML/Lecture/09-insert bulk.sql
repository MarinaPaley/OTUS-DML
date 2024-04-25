USE [WideWorldImporters]
GO
--DROP TABLE [Warehouse].[Colors_Copy];
/****** Object:  Table [Warehouse].[Colors_Copy]    Script Date: 07.12.2023 17:33:55 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [Warehouse].[Colors_Copy](
	[ColorID] [int] NOT NULL,
	[ColorName] [nvarchar](20) NOT NULL,
	[LastEditedBy] [int] NOT NULL,
	[ValidFrom] [datetime2](7) GENERATED ALWAYS AS ROW START NOT NULL,
	[ValidTo] [datetime2](7) GENERATED ALWAYS AS ROW END NOT NULL,
 CONSTRAINT [PK_Warehouse_Colors_Copy] PRIMARY KEY CLUSTERED 
(
	[ColorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [USERDATA],
 CONSTRAINT [UQ_Warehouse_Colors_Copy_ColorName] UNIQUE NONCLUSTERED 
(
	[ColorName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [USERDATA],
	PERIOD FOR SYSTEM_TIME ([ValidFrom], [ValidTo])
) ON [USERDATA]
WITH
(
SYSTEM_VERSIONING = ON (HISTORY_TABLE = [Warehouse].[Colors_Copy_Archive])
)
GO

ALTER TABLE [Warehouse].[Colors_Copy] ADD  CONSTRAINT [DF_Warehouse_Colors_Copy_ColorID]  DEFAULT (NEXT VALUE FOR [Sequences].[ColorID]) FOR [ColorID]
GO

ALTER TABLE [Warehouse].[Colors_Copy]  WITH CHECK ADD  CONSTRAINT [FK_Warehouse_Colors_Copy_Application_People] FOREIGN KEY([LastEditedBy])
REFERENCES [Application].[People] ([PersonID])
GO

ALTER TABLE [Warehouse].[Colors_Copy] CHECK CONSTRAINT [FK_Warehouse_Colors_Copy_Application_People]
GO

-------------

BULK INSERT [Warehouse].[Colors_Double]
    FROM "E:\BCP\WideWorldImporters.Warehouse.Colors_Copy.txt"
	WITH 
		(
		BATCHSIZE = 1000,
		DATAFILETYPE = 'char',
		FIELDTERMINATOR = '\t',
		ROWTERMINATOR ='\n',
		KEEPNULLS,
		TABLOCK
		);


SELECT *
FROM [Warehouse].[Colors_Double];
