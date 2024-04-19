-- Please create a Database View (with name v_generated_dates) which should "store" generated dates from January 1st to
-- January 31st, 2022 in type DATE. Don't forget the order of the generated_date column.

CREATE VIEW v_generated_dates AS
SELECT days:: date AS generated_date
FROM generate_series('2022-01-01':: timestamp, '2022-01-31':: timestamp, '1 day':: interval) AS days
ORDER BY 1;

-- for checking
SELECT *
FROM v_generated_dates;

-- delete view
DROP VIEW v_generated_dates;