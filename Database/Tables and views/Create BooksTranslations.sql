CREATE TABLE [BookTranslations]
(
    [ISBN] TEXT NOT NULL,
    [Translated_title] TEXT,
    [Translated_genre] TEXT,
    [Translated_description] TEXT,
    [Language_ID] TEXT NOT NULL,
    CONSTRAINT [PK_BookTranslations] PRIMARY KEY ([ISBN], [Language_ID]),
    FOREIGN KEY ([ISBN]) REFERENCES [Books] ([ISBN]),
    FOREIGN KEY ([Language_ID]) REFERENCES [Languages] ([Language_ID])
);