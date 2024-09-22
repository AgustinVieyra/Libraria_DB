CREATE TABLE [Transactions]
(
    [Sale_ID] INTEGER NOT NULL,
    [Transaction_date] DATE NOT NULL,
    [User_ID] INTEGER NOT NULL,
    CONSTRAINT [PK_Transactions] PRIMARY KEY ([Sale_ID]),
    FOREIGN KEY ([User_ID]) REFERENCES [Users] ([User_ID])
);