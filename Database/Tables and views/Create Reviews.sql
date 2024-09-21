CREATE TABLE [Reviews]
(
    [ISBN] TEXT NOT NULL,
    [User_ID] INTEGER NOT NULL,
    [Review] TEXT,
    FOREIGN KEY ([ISBN]) REFERENCES [Books] ([ISBN]),
    FOREIGN KEY ([User_ID]) REFERENCES [Users] ([User_ID])
);