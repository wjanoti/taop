BEGIN;

DROP TABLE IF EXISTS factbook;

CREATE TABLE factbook (
   year    INT,
   date    DATE,
   shares  TEXT,
   trades  TEXT,
   dollars TEXT
);

\COPY factbook FROM 'factbook.csv' WITH DELIMITER E'\t' NULL '';

ALTER TABLE factbook
    ALTER shares TYPE bigint USING replace(shares, ',', '')::bigint,
    ALTER trades TYPE bigint USING replace(trades, ',', '')::bigint,
    ALTER dollars TYPE bigint USING substring(replace(dollars, ',', '') FROM 2)::numeric;

COMMIT;