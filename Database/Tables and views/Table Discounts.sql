CREATE TABLE [Discounts]
(
    [Discount_ID] INTEGER NOT NULL,
    [ISBN] TEXT,
    [Discount_pct] REAL,
    [Start_date] DATE,
    [End_date] DATE,
    CONSTRAINT [PK_Discounts] PRIMARY KEY ([Discount_ID])
);