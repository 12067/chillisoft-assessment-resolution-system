CREATE DATABASE ResolutionActionDb;
GO
USE ResolutionActionDb;
GO

CREATE TABLE dbo.MeetingTypes (
    Id   INT IDENTITY(1,1) PRIMARY KEY,
    Name NVARCHAR(100) NOT NULL
);

CREATE TABLE dbo.Meetings (
    Id            INT IDENTITY(1,1) PRIMARY KEY,
    MeetingTypeId INT NOT NULL,
    MeetingNumber NVARCHAR(100) NOT NULL,
    MeetingDate   DATETIME2(7) NOT NULL,
    CONSTRAINT FK_Meetings_MeetingTypes
        FOREIGN KEY (MeetingTypeId) REFERENCES dbo.MeetingTypes(Id)
);

CREATE TABLE dbo.MeetingItems (
    Id          INT IDENTITY(1,1) PRIMARY KEY,
    Description NVARCHAR(MAX) NOT NULL,
    DueDate     DATETIME2(7) NOT NULL
    -- NOTE: no CreatedMeetingId in current DB
);

CREATE TABLE dbo.MeetingItemStatuses (
    Id                   INT IDENTITY(1,1) PRIMARY KEY,
    MeetingItemId        INT NOT NULL,
    MeetingId            INT NOT NULL,
    ResponsibleInitials  NVARCHAR(50) NOT NULL,
    Status               NVARCHAR(50) NOT NULL, -- string (e.g., 'Open', 'Closed')
    StatusDate           DATETIME2(7) NOT NULL,
    CONSTRAINT FK_Statuses_Items
        FOREIGN KEY (MeetingItemId) REFERENCES dbo.MeetingItems(Id),
    CONSTRAINT FK_Statuses_Meetings
        FOREIGN KEY (MeetingId) REFERENCES dbo.Meetings(Id)
);