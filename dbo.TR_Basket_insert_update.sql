DROP TRIGGER IF EXISTS dbo.TR_Basket_insert_update
GO

CREATE TRIGGER dbo.TR_Basket_insert_update
    ON dbo.Basket
    FOR INSERT
    AS
    IF @@ROWCOUNT = 0
        RETURN
    SET NOCOUNT ON;
    UPDATE dbo.Basket
    SET DiscountValue = Value * 0.05
    WHERE Quantity >= 2
GO
