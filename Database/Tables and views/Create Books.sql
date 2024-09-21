CREATE TABLE [Books]
(
    [ISBN] TEXT NOT NULL,
    [Title] TEXT NOT NULL,
    [Author] TEXT,
    [Edition] INTEGER,
    [Genre] TEXT,
    [Description] TEXT,
    [Original_language_ID] TEXT,
    [Price] REAL,
    CONSTRAINT [PK_Books] PRIMARY KEY ([ISBN]),
    FOREIGN KEY ([Original_language_ID]) REFERENCES [Languages] ([Language_ID])
);