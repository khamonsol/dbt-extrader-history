-- models/ex_trader_virtual_awards.sql

{{ config(materialized='table') }}

SELECT
    ISO,
    ENTITY,
    TRADER,
    ISO_USER_ID,
    TRADE_DATE,
    TRADE_DATE_TIMEZONE,
    TRADE_DATETIME_UTC,
    PRICE_NODE_NAME,
    PRICE_NODE_ID,
    YE_PRICE_NODE_ID,
    TRANSACTION_TYPE,
    TRADE_HOUR,
    MW,
    PRICE,
    TRANSACTION_ID,
    CREDIT
FROM SOLEAPROD.BEYOND.VIRTUAL_WITH_TRADER
WHERE TRADER IN ({{ "'" + "', '".join(var('trader_list')) + "'" }})

