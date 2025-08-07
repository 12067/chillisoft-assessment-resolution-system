CREATE DATABASE ResolutionDb;
GO

USE ResolutionDb;
GO

CREATE TABLE MeetingTypes (
    Id INT PRIMARY KEY IDENTITY(1,1),
    Name NVARCHAR(100) NOT NULL
);

CREATE TABLE Meetings (
    Id INT PRIMARY KEY IDENTITY(1,1),
    MeetingTypeId INT NOT NULL,
    MeetingNumber NVARCHAR(100) NOT NULL,
    MeetingDate DATETIME NOT NULL,
    FOREIGN KEY (MeetingTypeId) REFERENCES MeetingTypes(Id)
);

CREATE TABLE MeetingItems (
    Id INT PRIMARY KEY IDENTITY(1,1),
    Description NVARCHAR(MAX) NOT NULL,
    DueDate DATETIME NOT NULL,
    CreatedMeetingId INT NOT NULL,
    FOREIGN KEY (CreatedMeetingId) REFERENCES Meetings(Id)
);

CREATE TABLE MeetingItemStatuses (
    Id INT PRIMARY KEY IDENTITY(1,1),
    MeetingItemId INT NOT NULL,
    MeetingId INT NOT NULL,
    ResponsibleInitials NVARCHAR(50) NOT NULL,
    Status INT NOT NULL,
    StatusDate DATETIME NOT NULL,
    FOREIGN KEY (MeetingItemId) REFERENCES MeetingItems(Id),
    FOREIGN KEY (MeetingId) REFERENCES Meetings(Id)
);