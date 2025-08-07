ResolutionActionSystem
----------------------
A RESTful API built with ASP.NET Core Web API using the Entity Framework Core Code First approach for managing meetings, meeting items, and their statuses.  
This solution was developed as part of the Chillisoft Developer Assessment.

Requirements
------------
- [.NET 8 SDK]
- SQL Server (LocalDB instance)
- Visual Studio 2022 or later

Sample Payloads
---------------
1. Create Meeting Payload
POST https://localhost:7110/api/Meetings

{
  "meetingTypeId": 1,
  "meetingNumber": "RES-2024-001",
  "meetingDate": "2025-08-07T10:30:00",
  "items": [
    {
      "description": "Review report",
      "dueDate": "2025-08-15"
    },
    {
      "description": "Update strategy",
      "dueDate": "2025-08-20"
    }
  ]
}

-------------------------------------------
2. Get Meeting by ID Payload
GET https://localhost:7110/api/Meetings/1

-------------------------------------------
3. Update Meeting Item Status Payload
POST
https://localhost:7110/api/Meetings/{meetingId}/items/{meetingItemId}/status

{
  "meetingItemId": 1,
  "meetingId": 1,
  "responsibleInitials": "KM",
  "status": "InProgress",
  "statusDate": "2025-08-07T12:00:00"
}

------------------------------------------
Database
--------
I used a code first approach but also included SQL queries to create and seed the data if needed