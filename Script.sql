SELECT * FROM stock.all_stocks;
SELECT COUNT(*) FROM all_stocks;

ALTER TABLE all_stocks
CHANGE COLUMN `Date` trade_date DATE;

ALTER TABLE all_stocks
CHANGE COLUMN `ï»¿stock_symbol` stock_symbol varchar(100);

ALTER TABLE all_stocks
CHANGE COLUMN `Open` open_price DECIMAL(10,2),
CHANGE COLUMN `High` high_price DECIMAL(10,2),
CHANGE COLUMN `Low` low_price DECIMAL(10,2),
CHANGE COLUMN `Close` close_price DECIMAL(10,2);

UPDATE all_stocks
SET Date = STR_TO_DATE(Date, '%d-%m-%Y');

SELECT
    stock_symbol,
    trade_date,
    close_price,
    ROUND(
        ((close_price - LAG(close_price) OVER (PARTITION BY stock_symbol ORDER BY trade_date)) /
         LAG(close_price) OVER (PARTITION BY stock_symbol ORDER BY trade_date)) * 100,
        2
    ) AS daily_return_pct
FROM all_stocks
ORDER BY stock_symbol, trade_date;

SELECT
    stock_symbol,
    trade_date,
    close_price,
    ROUND(AVG(close_price) OVER (PARTITION BY stock_symbol ORDER BY trade_date ROWS BETWEEN 49 PRECEDING AND CURRENT ROW), 2) AS ma_50
FROM all_stocks
ORDER BY stock_symbol, trade_date;

SELECT
    stock_symbol,
    trade_date,
    close_price,
    ROUND(AVG(close_price) OVER (PARTITION BY stock_symbol ORDER BY trade_date ROWS BETWEEN 199 PRECEDING AND CURRENT ROW), 2) AS ma_200
FROM all_stocks
ORDER BY stock_symbol, trade_date;

CREATE VIEW daily_returns AS
SELECT
    stock_symbol,
    trade_date,
    ROUND(
        ((close_price - LAG(close_price) OVER (PARTITION BY stock_symbol ORDER BY trade_date)) /
         LAG(close_price) OVER (PARTITION BY stock_symbol ORDER BY trade_date)) * 100,
        2
    ) AS daily_return_pct
FROM all_stocks;

SELECT
    stock_symbol,
    ROUND(STDDEV(daily_return_pct), 2) AS volatility_pct
FROM daily_returns
GROUP BY stock_symbol;


CREATE OR REPLACE VIEW stock_summary_view AS
WITH daily_returns_cte AS (
    SELECT
        stock_symbol,
        trade_date,
        close_price,
        ROUND(
            ((close_price - LAG(close_price) OVER (PARTITION BY stock_symbol ORDER BY trade_date)) /
             LAG(close_price) OVER (PARTITION BY stock_symbol ORDER BY trade_date)) * 100,
            2
        ) AS daily_return_pct
    FROM all_stocks
)

SELECT
    stock_symbol,
    trade_date,
    close_price,
    daily_return_pct,

    -- 50-day moving average
    ROUND(
        AVG(close_price) OVER (
            PARTITION BY stock_symbol 
            ORDER BY trade_date 
            ROWS BETWEEN 49 PRECEDING AND CURRENT ROW
        ), 2
    ) AS ma_50,

    -- 200-day moving average
    ROUND(
        AVG(close_price) OVER (
            PARTITION BY stock_symbol 
            ORDER BY trade_date 
            ROWS BETWEEN 199 PRECEDING AND CURRENT ROW
        ), 2
    ) AS ma_200,

    -- 30-day rolling volatility (stddev of daily return)
    ROUND(
        STDDEV(daily_return_pct) OVER (
            PARTITION BY stock_symbol 
            ORDER BY trade_date 
            ROWS BETWEEN 29 PRECEDING AND CURRENT ROW
        ), 2
    ) AS volatility_30d_pct

FROM daily_returns_cte
ORDER BY stock_symbol, trade_date;

CREATE OR REPLACE VIEW stock_summary_view AS
WITH daily_returns_cte AS (
    SELECT
        stock_symbol,
        trade_date,
        open_price,
        high_price,
        low_price,
        close_price,
        volume,
        ROUND(
            ((close_price - LAG(close_price) OVER (PARTITION BY stock_symbol ORDER BY trade_date)) /
             LAG(close_price) OVER (PARTITION BY stock_symbol ORDER BY trade_date)) * 100,
            2
        ) AS daily_return_pct
    FROM all_stocks
)

SELECT
    stock_symbol,
    trade_date,
    open_price,
    high_price,
    low_price,
    close_price,
    volume,
    daily_return_pct,

    -- 50-day moving average
    ROUND(
        AVG(close_price) OVER (
            PARTITION BY stock_symbol 
            ORDER BY trade_date 
            ROWS BETWEEN 49 PRECEDING AND CURRENT ROW
        ), 2
    ) AS ma_50,

    -- 200-day moving average
    ROUND(
        AVG(close_price) OVER (
            PARTITION BY stock_symbol 
            ORDER BY trade_date 
            ROWS BETWEEN 199 PRECEDING AND CURRENT ROW
        ), 2
    ) AS ma_200,

    -- 30-day rolling volatility (stddev of daily return)
    ROUND(
        STDDEV(daily_return_pct) OVER (
            PARTITION BY stock_symbol 
            ORDER BY trade_date 
            ROWS BETWEEN 29 PRECEDING AND CURRENT ROW
        ), 2
    ) AS volatility_30d_pct

FROM daily_returns_cte
ORDER BY stock_symbol, trade_date;

