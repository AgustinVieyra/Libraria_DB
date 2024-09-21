CREATE TABLE [Discounts]
(
    [Discount_ID] INTEGER NOT NULL,
    [Start_date] TEXT,
    [End_date] TEXT,
    [Discount_pct] REAL,
    CONSTRAINT [PK_Discounts] PRIMARY KEY ([Discount_ID])
);