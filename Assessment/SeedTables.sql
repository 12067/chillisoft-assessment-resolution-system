SET NOCOUNT ON;
BEGIN TRAN;

--MeetingTypes
SET IDENTITY_INSERT dbo.MeetingTypes ON;

INSERT INTO dbo.MeetingTypes (Id, Name)
VALUES
(10, N'MANCO'),
(11, N'Finance'),
(12, N'PTL');

SET IDENTITY_INSERT dbo.MeetingTypes OFF;

--MeetingItems
SET IDENTITY_INSERT dbo.MeetingItems ON;

INSERT INTO dbo.MeetingItems (Id, Description, DueDate)
VALUES
(19, N'Review outstanding action items', '2025-08-16T00:00:00'),
(20, N'Prepare monthly financial report', '2025-08-23T00:00:00'),
(21, N'Schedule project status meeting', '2025-08-30T00:00:00'),
(22, N'Update compliance documentation', '2025-09-08T00:00:00'),
(23, N'Follow up on vendor contracts', '2025-08-19T00:00:00'),
(24, N'Risk register review', '2025-08-27T00:00:00');

SET IDENTITY_INSERT dbo.MeetingItems OFF;

--Meetings
SET IDENTITY_INSERT dbo.Meetings ON;

INSERT INTO dbo.Meetings (Id, MeetingTypeId, MeetingNumber, MeetingDate)
VALUES
(31, 12, N'PTL-001', '2025-07-28T00:00:00'),
(30, 10, N'MAN-001', '2025-07-27T00:00:00'),
(29, 11, N'FIN-001', '2025-07-26T00:00:00');

SET IDENTITY_INSERT dbo.Meetings OFF;

--MeetingItemStatuses
SET IDENTITY_INSERT dbo.MeetingItemStatuses ON;

INSERT INTO dbo.MeetingItemStatuses (Id, MeetingItemId, MeetingId, ResponsibleInitials, Status, StatusDate)
VALUES
(34, 24, 31, N'KL', N'Closed',        '2025-07-29T01:48:38.903'),
(33, 23, 31, N'IJ', N'Open',          '2025-07-28T01:48:38.903'),
(32, 21, 30, N'GH', N'InProgress', '2025-07-27T01:48:38.903'),
(31, 21, 30, N'EF', N'Open',          '2025-07-27T01:48:38.900'),
(30, 19, 29, N'CD', N'OnHold',        '2025-07-26T01:48:38.900'),
(29, 19, 29, N'AB', N'Open',          '2025-07-26T01:48:38.900');

SET IDENTITY_INSERT dbo.MeetingItemStatuses OFF;

COMMIT;

SELECT * FROM dbo.MeetingTypes;
SELECT * FROM dbo.MeetingItems;
SELECT * FROM dbo.Meetings ORDER BY MeetingDate DESC, Id DESC;
SELECT * FROM dbo.MeetingItemStatuses ORDER BY StatusDate DESC, Id DESC;
