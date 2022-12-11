DROP INDEX IF EXISTS part_nyc_partNo_idx;
DROP INDEX IF EXISTS part_nyc_supplier_idx;
DROP INDEX IF EXISTS part_nyc_color_idx;
DROP INDEX IF EXISTS part_nyc_onhand_idx;
DROP INDEX IF EXISTS part_sfo_partNo_idx;
DROP INDEX IF EXISTS part_sfo_supplier_idx;
DROP INDEX IF EXISTS part_sfo_color_idx;
DROP INDEX IF EXISTS part_sfo_onhand_idx;

DROP INDEX IF EXISTS supplier_id_idx;
DROP INDEX IF EXISTS supplier_name_idx;
DROP INDEX IF EXISTS color_id_idx;
DROP INDEX IF EXISTS color_name_idx;

CREATE INDEX part_nyc_partNo_idx
ON part_nyc
USING BTREE(part_number);

CREATE INDEX part_nyc_supplier_idx
ON part_nyc
USING BTREE(supplier);

CREATE INDEX part_nyc_color_idx
ON part_nyc
USING BTREE(color);

CREATE INDEX part_nyc_onhand_idx
ON part_nyc
USING BTREE(on_hand);

CREATE INDEX part_sfo_partNo_idx
ON part_sfo
USING BTREE(part_number);

CREATE INDEX part_sfo_supplier_idx
ON part_sfo
USING BTREE(supplier);

CREATE INDEX part_sfo_color_idx
ON part_sfo
USING BTREE(color);

CREATE INDEX part_sfo_onhand_idx
ON part_sfo
USING BTREE(on_hand);

CREATE INDEX supplier_id_idx
ON supplier
USING BTREE(supplier_id);

CREATE INDEX supplier_name_idx
ON supplier
USING BTREE(supplier_name);

CREATE INDEX color_id_idx
ON color
USING BTREE(color_id);

CREATE INDEX color_name_idx
ON color
USING BTREE(color_name);






