-- models/ex_trader_virtual_awards_pnl.sql

{{ config(materialized='table') }}

SELECT
    V.ISO,
    V.ENTITY,
    V.TRADER,
    V.ISO_USER_ID,
    V.TRADE_DATE,
    V.TRADE_DATE_TIMEZONE,
    V.TRADE_DATETIME_UTC,
    V.PRICE_NODE_NAME,
    V.PRICE_NODE_ID,
    V.YE_PRICE_NODE_ID,
    V.TRANSACTION_TYPE,
    V.TRADE_HOUR,
    V.MW,
    V.PRICE,
    V.TRANSACTION_ID,
    V.PNL,
    V.RT_LMP,
    V.DA_LMP
FROM SOLEAPROD.BEYOND.VIRTUAL_WITH_PNL V
WHERE V.TRADER IN ({{ "'" + "', '".join(var('trader_list')) + "'" }})
