USE RecruitmentDataAnalysisProject;

CREATE TABLE Candidates (
    CandidateID INT PRIMARY KEY,
    CandidateName VARCHAR(100),
    Email VARCHAR(100),
    Phone VARCHAR(20),
    AppliedDate DATE
);

CREATE TABLE Positions (
    PositionID INT PRIMARY KEY,
    PositionName VARCHAR(100),
    Department VARCHAR(50),
    Location VARCHAR(50)
);

CREATE TABLE Applications (
    ApplicationID INT PRIMARY KEY,
    CandidateID INT,
    PositionID INT,
    ApplicationDate DATE,
    Status VARCHAR(50),
    FOREIGN KEY (CandidateID) REFERENCES Candidates(CandidateID),
    FOREIGN KEY (PositionID) REFERENCES Positions(PositionID)
);

CREATE TABLE Interviews (
    InterviewID INT PRIMARY KEY,
    ApplicationID INT,
    InterviewDate DATE,
    Interviewer VARCHAR(100),
    Feedback VARCHAR(255),
    FOREIGN KEY (ApplicationID) REFERENCES Applications(ApplicationID)
);

INSERT INTO Candidates (CandidateID, CandidateName, Email, Phone, AppliedDate) VALUES
(1, 'John Doe', 'john.doe@example.com', '123-456-7890', '2023-01-01'),
(2, 'Jane Smith', 'jane.smith@example.com', '234-567-8901', '2023-01-02'),
(3, 'Alice Johnson', 'alice.johnson@example.com', '345-678-9012', '2023-01-03');

INSERT INTO Positions (PositionID, PositionName, Department, Location) VALUES
(1, 'Software Engineer', 'Engineering', 'New York'),
(2, 'Data Analyst', 'Data Science', 'San Francisco'),
(3, 'Product Manager', 'Product', 'Boston');

INSERT INTO Applications (ApplicationID, CandidateID, PositionID, ApplicationDate, Status) VALUES
(1, 1, 1, '2023-01-05', 'Interview Scheduled'),
(2, 2, 2, '2023-01-06', 'Rejected'),
(3, 3, 3, '2023-01-07', 'Hired');

INSERT INTO Interviews (InterviewID, ApplicationID, InterviewDate, Interviewer, Feedback) VALUES
(1, 1, '2023-01-10', 'Mike Brown', 'Positive'),
(2, 3, '2023-01-12', 'Sarah Green', 'Excellent');
