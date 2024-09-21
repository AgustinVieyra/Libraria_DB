CREATE TABLE [Discounts]
(
    [Discount_ID] INTEGER NOT NULL,
    [ISBN] TEXT NOT NULL,
    [Start_date] DATE,
    [End_date] DATE,
    [Discount_pct] REAL,
    CONSTRAINT [PK_Discounts] PRIMARY KEY ([Discount_ID])
);