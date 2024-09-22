CREATE TABLE [Reviews]
(
    [ISBN] TEXT NOT NULL,
    [User_ID] INTEGER NOT NULL,
    [Five_star_score] INTEGER NOT NULL,
    [Review] TEXT,
    CONSTRAINT [PK_Reviews] PRIMARY KEY ([ISBN], [User_ID]),
    FOREIGN KEY ([ISBN]) REFERENCES [Books] ([ISBN]),
    FOREIGN KEY ([User_ID]) REFERENCES [Users] ([User_ID])
);
