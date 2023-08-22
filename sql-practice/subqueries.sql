-- Phase 1: Replace JOIN with subquery
-- Get list of toys belonging to Garfield

-- JOIN
SELECT toys.name
FROM toys
JOIN cats ON (toys.cat_id = cats.id)
WHERE
    cats.name = 'Garfield';

-- Subquery
SELECT name
FROM toys
WHERE cat_id IN (
    SELECT id
    FROM cats
    WHERE
        name = 'Garfield'
);


-- Phase 2: Dynamic INSERT using subquery
-- Give Garfield a new toy named Pepperoni

INSERT INTO toys (name, cat_id)
VALUES (
    'Pepperoni',
    (
        SELECT id
        FROM cats
        WHERE
            name = 'Garfield'
    )
);
