---- CONSULTA SQL NO POSTGRES PARA GERAR O AGREGADO JSON ----
COPY (
select array_to_json(array_agg(row_to_json(query))) from 
( select c_name,	c_city, c_region, c_nation,
	( select array_to_json(array_agg(row_to_json(lin))) from 
		( select l.lo_supplycost, l.lo_quantity, l.lo_revenue, l.lo_extendedprice, l.lo_discount,
		  (	select row_to_json(sup) from 
			( select s.s_nation, s.s_city, s.s_region 
			  from suppliers s
			  where s.s_suppkey = l.lo_suppkey
			) as sup
		  ) as supplier,
		  (	select row_to_json(part) from 
			( select p.p_brand1, p.p_category, p.p_name 
			  from parts p
			  where p.p_partkey = l.lo_partkey
			) as part
		  ) as part,
		  ( select row_to_json(ord) from 
			( select d.d_monthnuminyear, d.d_yearmonthnum, d.d_year
			  from date d
			  where d.d_datekey = l.lo_orderdate
			) as ord
		) as orderdate
	  from lineorder as l
	  where l.lo_custkey = c_custkey
	) as lin
  ) as lineorder
from customers
where c_custkey > 10000 and c_custkey <= 20000
) as query
) To '/home/grupobd21/trab_bd2/base_de_dados/customers.json' WITH (FORMAT 'text');