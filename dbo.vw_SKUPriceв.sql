DROP VIEW IF EXISTS dbo.vw_SKUPriceв;
GO

CREATE VIEW dbo.vw_SKUPriceв
AS
    SELECT [Name], dbo.GetValueSKU(ID) as price
    FROM dbo.SKU;
