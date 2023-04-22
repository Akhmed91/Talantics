IF OBJECT_ID('dbo.GetValueSKU') IS NOT NULL DROP FUNCTION dbo.GetValueSKU;
GO

CREATE FUNCTION dbo.GetValueSKU(@ID_SKU int)
RETURNS int
AS
BEGIN
    DECLARE @ret int;
    SELECT TOP 1 @ret = (Value / Quantity)
    FROM dbo.Basket
    WHERE ID_SKU = @ID_SKU;
     IF (@ret IS NULL)
        SET @ret = 0;
    RETURN @ret;
END;
GO
