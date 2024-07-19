-- models/ex_trader_invoice.sql

{{ config(materialized='table') }}

SELECT
    ISO,
    ACCOUNT,
    TRADER,
    ASSET_OWNER,
    STATEMENT_ID,
    STATEMENT_DATE,
    CHARGE_TYPE_CODE,
    CHARGE_TYPE_DESCRIPTION,
    SETTLEMENT_TYPE_CODE,
    TRADE_DATE,
    LINE_ITEM_ID,
    AMOUNT,
    COMPANY_NAME
FROM SOLEAPROD.BEYOND.INVOICE
WHERE TRADER IN ({{ "'" + "', '".join(var('trader_list')) + "'" }})
