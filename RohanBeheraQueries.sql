--1. Count how many parts in NYC have more than 70 parts on hand
SELECT COUNT (*)
FROM part_nyc 
WHERE part_nyc.on_hand > 70;

--2. Count how many total parts on hand, in both NYC and SFO, are Red
SELECT SUM(on_hand) 
FROM (SELECT *
      FROM part_sfo, color 
      WHERE part_sfo.color = color.color_id AND color_name = 'Red'
      UNION
      SELECT *
      FROM part_nyc, color 
      WHERE part_nyc.color = color.color_id AND color_name = 'Red'
     ) 
AS total_on_hand_parts;

--3. List all the suppliers that have more total on hand parts in NYC than they do in SFO.
SELECT supplier_name
FROM supplier 
WHERE (SELECT SUM(part_nyc.on_hand)
FROM part_nyc 
WHERE part_nyc.supplier = supplier.supplier_id) 
> 
(SELECT SUM(part_sfo.on_hand) 
FROM part_sfo 
WHERE part_sfo.supplier = supplier.supplier_id);

--4. List all suppliers that supply parts in NYC that aren’t supplied by anyone in SFO.
SELECT DISTINCT supplier_name
FROM supplier, part_nyc 
WHERE supplier.supplier_id = part_nyc.supplier AND part_nyc.part_number
IN
(SELECT part_number
FROM supplier, part_nyc 
WHERE supplier.supplier_id = part_nyc.supplier
EXCEPT
SELECT part_number
FROM supplier, part_sfo 
WHERE supplier.supplier_id = part_sfo.supplier)
GROUP BY supplier_name;

--5. Update all of the NYC on hand values to on hand - 10.
UPDATE part_nyc
SET on_hand = on_hand - 10;

--6. Delete all parts from NYC which have less than 30 parts on hand.
DELETE FROM part_nyc
WHERE on_hand < 30;
