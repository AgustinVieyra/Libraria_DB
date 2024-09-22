CREATE TABLE [Users]
(
    [User_ID] INTEGER NOT NULL,
    [Email] TEXT NOT NULL,
    [User_name] TEXT NOT NULL,
    [Address] TEXT,
    [City] TEXT,
    [Zip_code] TEXT,
    [Country] TEXT,
    CONSTRAINT [PK_Users] PRIMARY KEY ([User_ID], [Email])
);