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


-- BONUS

-- Phase 1: Dynamic INSERT using subquery with multiple insertions
-- Give all cats born before 2013 a new toy named "Cat Bed" using a subquery

INSERT INTO toys (name, cat_id)
SELECT 'Cat Bed', id
FROM cats
WHERE
    birth_year < 2013;


-- Phase 2: Backup the tables using subquery
-- Backup the cats table in a table called cats_backup using a subquery
INSERT INTO cats_backup
SELECT * FROM cats;

-- Backup the toys table in a table called toys_backup using a subquery
INSERT INTO toys_backup
SELECT * FROM toys;
