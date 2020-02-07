
CREATE Procedure SetRequestToApproved
	@RequestId int
AS
BEGIN
	SET NOCOUNT ON;
	UPDATE Requests Set
		Status = 'APPROVED'
		Where Id = @RequestId;
END
Go
CREATE Procedure SetRequestToRejected
	@RequestId int
AS
BEGIN
	SET NOCOUNT ON;
	UPDATE Requests Set
		Status = 'REJECTED'
		Where Id = @RequestId;
END
GO