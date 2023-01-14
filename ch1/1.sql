\set start '2017-02-01'
-- get e
SELECT
    date,
    to_char(shares, '99G999G999G999') as shares,
    to_char(trades, '99G999G999G999') as trades,
    to_char(dollars, 'L99G999G999G999') as dollars
FROM
    factbook
WHERE
    date >= date :'start'
    AND date < date :'start' + INTERVAL '1 month'
ORDER BY
    date