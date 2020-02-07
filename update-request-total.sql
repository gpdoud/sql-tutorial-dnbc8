CREATE Procedure UpdateRequestTotal
	@RequestId int
AS
BEGIN
-- calculate total for request
	SET NOCOUNT ON;
	UPDATE Requests Set
		Total = (
			SELECT sum(rl.Quantity * p.Price) as 'Request Total'
				from Requests r
				join RequestLines rl
					 on rl.RequestId = r.Id
				join Products p
					on p.id = rl.ProductId
				where r.id = @RequestId
		)
		Where id = @RequestId;
END
go

Select * from Requests;