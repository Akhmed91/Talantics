IF OBJECT_ID('dbo.SKU', 'U') IS NOT NULL DROP TABLE dbo.SKU;

CREATE TABLE dbo.SKU
(
    ID      INT             IDENTITY (1,1)
        CONSTRAINT PK_ID PRIMARY KEY,
    Code    AS 's' + CAST(ID as varchar(20))
        CONSTRAINT AK_Code UNIQUE(Code) ,
    Name    NVARCHAR(30)    NOT NULL
);


IF OBJECT_ID('dbo.Family', 'U') IS NOT NULL DROP TABLE dbo.Family;

CREATE TABLE dbo.Family
(
    ID      INT             IDENTITY (1,1)
        CONSTRAINT PK_Family PRIMARY KEY,
    SurName NVARCHAR(30)    NOT NULL,
    BudgetValue    MONEY    NOT NULL
        CONSTRAINT DFT_Family_BudgetValue DEFAULT(0)
);


IF OBJECT_ID('dbo.Basket', 'U') IS NOT NULL DROP TABLE dbo.Basket;

CREATE TABLE dbo.Basket
(
    ID              INT         IDENTITY (1,1)
        CONSTRAINT PK_Basket PRIMARY KEY,
    ID_SKU          INT             NOT NULL,
    ID_Family       INT             NOT NULL,
    Quantity        SMALLINT        NOT NUll
        CONSTRAINT DFT_Basket_Quantity DEFAULT(1),
    Value           MONEY           NOT NULL
        CONSTRAINT DFT_Basket_Value DEFAULT(0),
    PurchaseDate    DATETIME        NOT NULL
        CONSTRAINT DFT_Basket_PurchaseDate DEFAULT(SYSDATETIME()),
    DiscountValue   NUMERIC(3, 2)   NOT NULL
        CONSTRAINT DFT_Basket_DiscountValue DEFAULT(0),
    CONSTRAINT PK_Basket_SKU FOREIGN KEY(ID_SKU)
        REFERENCES dbo.SKU(ID),
    CONSTRAINT PK_Basket_Family FOREIGN KEY(ID_Family)
        REFERENCES dbo.Family(ID),
    CONSTRAINT CHK_Value CHECK(Value >= 0),
    CONSTRAINT CHK_DiscountValue CHECK (DiscountValue BETWEEN 0 and 1)
);








