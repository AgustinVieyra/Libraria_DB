CREATE TABLE [Books]
(
    [ISBN] TEXT NOT NULL,
    [Title] TEXT NOT NULL,
    [Genre] TEXT,
    [Description] TEXT,
    [Price] REAL,
    CONSTRAINT [PK_Books] PRIMARY KEY ([ISBN])
);