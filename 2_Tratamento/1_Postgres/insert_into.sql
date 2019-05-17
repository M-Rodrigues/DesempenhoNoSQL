----- IMPORTANDO DADOS PARA O POSTGRESQL -----

COPY customers(c_custkey, c_name, c_address, c_city, c_nation, c_region, c_phone, c_mktsegment, c_extra)
FROM '/home/grupobd21/trab_bd2/Base de Dados/customer.tbl' DELIMITER '|';

COPY suppliers(s_suppkey, s_name, s_address, s_city, s_nation, s_region, s_phone, s_extra)
FROM '/home/grupobd21/trab_bd2/Base de Dados/supplier.tbl' DELIMITER '|';

COPY parts(p_partkey, p_name, p_mfgr, p_category, p_brand1, p_color, p_type, p_size, p_container, p_extra)
FROM '/home/grupobd21/trab_bd2/Base de Dados/part.tbl' DELIMITER '|';

COPY date(
	d_datekey,
	d_date,
	d_dayofweek ,
	d_month ,
	d_year ,
	d_yearmonthnum ,
	d_yearmonth ,
	d_daynuminweek ,	
	d_daynuminmonth ,
	d_daynuminyear ,
	d_monthnuminyear ,
	d_weeknuminyear ,
	d_sellingseason ,
	d_lasdayinweekfl ,
	d_lastdayinmonthfl ,
	d_holidayfl ,
	d_weekdayfl ,
	d_extra)
FROM '/home/grupobd21/trab_bd2/Base de Dados/date.tbl' DELIMITER '|';

COPY lineorder (
	lo_orderkey ,
	lo_linenumber ,
	lo_custkey ,
	lo_partkey ,
	lo_suppkey ,
	lo_orderdate ,
	lo_orderpriority ,
	lo_shippriority ,
	lo_quantity ,
	lo_extendedprice ,
	lo_ordtotalproce ,
	lo_discount ,
	lo_revenue ,
	lo_supplycost ,
	lo_tax ,
	lo_commitdate ,
	lo_shipmode)
FROM '/home/grupobd21/trab_bd2/Base de Dados/lineorder1.csv' DELIMITER ';';

COPY lineorder (
	lo_orderkey ,
	lo_linenumber ,
	lo_custkey ,
	lo_partkey ,
	lo_suppkey ,
	lo_orderdate ,
	lo_orderpriority ,
	lo_shippriority ,
	lo_quantity ,
	lo_extendedprice ,
	lo_ordtotalproce ,
	lo_discount ,
	lo_revenue ,
	lo_supplycost ,
	lo_tax ,
	lo_commitdate ,
	lo_shipmode)
FROM '/home/grupobd21/trab_bd2/Base de Dados/lineorder2.csv' DELIMITER ';';

COPY lineorder (
	lo_orderkey ,
	lo_linenumber ,
	lo_custkey ,
	lo_partkey ,
	lo_suppkey ,
	lo_orderdate ,
	lo_orderpriority ,
	lo_shippriority ,
	lo_quantity ,
	lo_extendedprice ,
	lo_ordtotalproce ,
	lo_discount ,
	lo_revenue ,
	lo_supplycost ,
	lo_tax ,
	lo_commitdate ,
	lo_shipmode)
FROM '/home/grupobd21/trab_bd2/Base de Dados/lineorder3.csv' DELIMITER ';';


COPY lineorder (
	lo_orderkey ,
	lo_linenumber ,
	lo_custkey ,
	lo_partkey ,
	lo_suppkey ,
	lo_orderdate ,
	lo_orderpriority ,
	lo_shippriority ,
	lo_quantity ,
	lo_extendedprice ,
	lo_ordtotalproce ,
	lo_discount ,
	lo_revenue ,
	lo_supplycost ,
	lo_tax ,
	lo_commitdate ,
	lo_shipmode)
FROM '/home/grupobd21/trab_bd2/Base de Dados/lineorder4.csv' DELIMITER ';';


COPY lineorder (
	lo_orderkey ,
	lo_linenumber ,
	lo_custkey ,
	lo_partkey ,
	lo_suppkey ,
	lo_orderdate ,
	lo_orderpriority ,
	lo_shippriority ,
	lo_quantity ,
	lo_extendedprice ,
	lo_ordtotalproce ,
	lo_discount ,
	lo_revenue ,
	lo_supplycost ,
	lo_tax ,
	lo_commitdate ,
	lo_shipmode)
FROM '/home/grupobd21/trab_bd2/Base de Dados/lineorder5.csv' DELIMITER ';';

COPY lineorder (
	lo_orderkey ,
	lo_linenumber ,
	lo_custkey ,
	lo_partkey ,
	lo_suppkey ,
	lo_orderdate ,
	lo_orderpriority ,
	lo_shippriority ,
	lo_quantity ,
	lo_extendedprice ,
	lo_ordtotalproce ,
	lo_discount ,
	lo_revenue ,
	lo_supplycost ,
	lo_tax ,
	lo_commitdate ,
	lo_shipmode)
FROM '/home/grupobd21/trab_bd2/Base de Dados/lineorder6.csv' DELIMITER ';';