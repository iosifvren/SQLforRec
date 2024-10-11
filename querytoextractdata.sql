SELECT 
    a.ApplicationID, 
    c.CandidateName, 
    p.PositionName, 
    a.ApplicationDate, 
    a.Status, 
    i.InterviewDate, 
    i.Interviewer, 
    i.Feedback 
FROM 
    Applications a
JOIN 
    Candidates c ON a.CandidateID = c.CandidateID
JOIN 
    Positions p ON a.PositionID = p.PositionID
LEFT JOIN 
    Interviews i ON a.ApplicationID = i.ApplicationID;