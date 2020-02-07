ALTER Procedure AddLineItem
	@RequestDescription nvarchar(30),
	@ProductPartNbr nvarchar(30),
	@Quantity int = 1
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @RequestId int, @ProductId int;

	SELECT @RequestId = Id From Requests Where Description = @RequestDescription;

	SELECT @ProductId = Id From Products Where PartNbr = @ProductPartNbr;

	INSERT into RequestLines (RequestId, ProductId, Quantity)
					values (@RequestId, @ProductId, @Quantity);
END
Go
EXEC AddLineItem @RequestDescription = '1st Request', @ProductPartNbr = 'WORD';
Go


SELECT * from RequestLines where RequestId = 1