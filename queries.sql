--1. Count how many parts in NYC have more than 70 parts on hand
SELECT COUNT(*)
FROM part_nyc P
WHERE P.on_hand > 70;

--2. Count how many total parts on hand, in both NYC and SFO, are Red
SELECT (SELECT COUNT(*)
FROM part_nyc NYC, color C
WHERE NYC.color = C.color_id AND C.color_name = 'Red')
+
(SELECT COUNT(*)
FROM part_sfo SFO, color C
WHERE SFO.color = C.color_id AND C.color_name = 'Red')
);

--3. List all the suppliers that have more total on hand parts in NYC than they do in SFO.
SELECT S.supplier_id, S.supplier_name
FROM supplier S
WHERE
(SELECT SUM(NYC.on_hand)
FROM part_nyc NYC
WHERE S.supplier_id = NYC.supplier)
>
(SELECT SUM(SFO.on_hand)
FROM part_sfo SFO
WHERE S.supplier_id = SFO.supplier);

--4. List all suppliers that supply parts in NYC that aren’t supplied by anyone in SFO.
SELECT DISTINCT S.supplier_id, S.supplier_name
FROM supplier S, part_nyc NYC, part_sfo SFO
WHERE S.supplier_id = NYC.supplier AND NYC.part_number != SFO.part_number;

--5. Update all of the NYC on hand values to on hand - 10.
UPDATE part_nyc
SET on_hand = on_hand - 10;

--6. Delete all parts from NYC which have less than 30 parts on hand.
DELETE FROM part_nyc
WHERE on_hand < 30;
