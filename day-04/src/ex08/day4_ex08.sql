-- After all our exercises, we have a couple of Virtual Tables and a Materialized View. Let's drop them!

-- delete views
DROP VIEW IF EXISTS v_persons_female,
    v_persons_male,
    v_generated_dates,
    R,
    S,
    v_symmetric_union,
    v_price_with_discount;

-- delete materialized view from 06
DROP MATERIALIZED VIEW IF EXISTS mv_dmitriy_visits_and_eats;