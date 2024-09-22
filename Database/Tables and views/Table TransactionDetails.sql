CREATE TABLE [TransactionDetails]
(
    [Sale_detail_ID] INTEGER NOT NULL,
    [Sale_ID] INTEGER NOT NULL,
    [ISBN] TEXT NOT NULL,
    [Number_of_items] INTEGER NOT NULL,
    CONSTRAINT [PK_TransactionDetails] PRIMARY KEY ([Sale_detail_ID]),
    FOREIGN KEY ([Sale_ID]) REFERENCES [Transactions] ([Sale_ID]),
    FOREIGN KEY ([ISBN]) REFERENCES [Books] ([ISBN])
);