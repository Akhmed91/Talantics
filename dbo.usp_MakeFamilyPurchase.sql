DROP PROC IF EXISTS dbo.usp_MakeFamilyPurchase
GO

CREATE PROC dbo.usp_MakeFamilyPurchase
    @FamilySurName nvarchar(255)
    AS
IF @FamilySurName in (SELECT SurName FROM dbo.Family)
    BEGIN
        WITH C AS (
            SELECT SUM(VALUE) AS val
            FROM dbo.Basket
            WHERE ID_Family = (
                SELECT ID
                FROM dbo.Family
                WHERE SurName = @FamilySurName)
            GROUP BY ID_Family
            )
        UPDATE dbo.Family
        SET BudgetValue -= (SELECT * FROM C)
        WHERE SurName = @FamilySurName;
    END;
ELSE
    BEGIN
        PRINT @FamilySurName + N' - такой семьи нет';
    END
GO
