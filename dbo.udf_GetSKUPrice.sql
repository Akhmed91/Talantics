IF OBJECT_ID('dbo.GetValueSKU') IS NOT NULL DROP FUNCTION dbo.GetValueSKU;
GO

CREATE FUNCTION dbo.GetValueSKU(@ID_SKU int)
RETURNS DECIMAL(10, 2)
AS
BEGIN
    DECLARE @ret DECIMAL(10, 2) ;
    SELECT TOP 1 @ret = Value / Quantity
    FROM dbo.Basket
    WHERE ID_SKU = @ID_SKU;
     IF (@ret IS NULL)
        SET @ret = 0;
    RETURN @ret;
END;
GO

SELECT dbo.GetValueSKU(5)