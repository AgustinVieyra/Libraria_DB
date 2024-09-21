CREATE TABLE [Transactions]
(
    [Sale_ID] INTEGER NOT NULL,
    [Transaction_date] TEXT NOT NULL,
    [User_ID] TEXT NOT NULL,
    CONSTRAINT [PK_Transactions] PRIMARY KEY ([Sale_ID]),
    FOREIGN KEY ([User_ID]) REFERENCES [Users] ([User_ID])
);