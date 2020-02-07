CREATE Procedure SetRequestStatus
	@RequestId int,
	@IsApproved bit = 1
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @status nvarchar(10);
	IF @IsApproved = 1
	BEGIN
		Set @status = 'APPROVED';
	END
	IF @IsApproved = 0
	BEGIN
		Set @status = 'REJECTED';
	END
	UPDATE Requests Set
		Status = @status
		Where Id = @RequestId;
END
Go