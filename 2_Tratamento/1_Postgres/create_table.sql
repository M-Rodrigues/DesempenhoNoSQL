create table customers 
(
	c_custkey int not null primary key,
	c_name varchar(50) not null,
	c_address varchar(50),
	c_city varchar(50),
	c_nation varchar(50),
	c_region varchar(50),
	c_phone varchar(50),
	c_mktsegment varchar(50),
	c_extra varchar(10)	
);

create table suppliers
(
	s_suppkey int not null primary key,
	s_name varchar(50) not null,
	s_address varchar(50),
	s_city varchar(50),
	s_nation varchar(50),
	s_region varchar(50),
	s_phone varchar(50),
	s_extra varchar(50)	
);

create table date
(
	d_datekey int not null primary key,
	d_date varchar(50) not null,
	d_dayofweek varchar(50),
	d_month varchar(9),
	d_year int,
	d_yearmonthnum int,
	d_yearmonth varchar(7),
	d_daynuminweek int,	
	d_daynuminmonth int,
	d_daynuminyear int,
	d_monthnuminyear int,
	d_weeknuminyear int,
	d_sellingseason varchar(12),
	d_lasdayinweekfl int,
	d_lastdayinmonthfl int,
	d_holidayfl int,
	d_weekdayfl int,
	d_extra varchar(5)
);

create table parts
(
    p_partkey int not null primary key,
    p_name varchar(50) not null,
    p_mfgr varchar(50),
    p_category varchar(50),
    p_brand1 varchar(50),
    p_color varchar(50),
    p_type varchar(50),
    p_size varchar(50),
    p_container varchar(50),
    p_extra varchar(50)
);

create table lineorder 
(
	lo_orderkey int not null,
	lo_linenumber int not null,
	lo_custkey int,
	lo_partkey int,
	lo_suppkey int,
	lo_orderdate int,
	lo_orderpriority varchar(15),
	lo_shippriority varchar(1),
	lo_quantity int,
	lo_extendedprice int,
	lo_ordtotalproce int,
	lo_discount int,
	lo_revenue int,
	lo_supplycost int,
	lo_tax int,
	lo_commitdate int,
	lo_shipmode varchar(10),
	primary key (lo_orderkey, lo_linenumber),
	CONSTRAINT customer_fk FOREIGN KEY (lo_custkey) REFERENCES customers (c_custkey),
	CONSTRAINT part_fk FOREIGN KEY (lo_partkey) REFERENCES parts (p_partkey),
	CONSTRAINT supplier_fk FOREIGN KEY (lo_suppkey) REFERENCES suppliers (s_suppkey),
	CONSTRAINT orderdate_fk FOREIGN KEY (lo_orderdate) REFERENCES date (d_datekey),
	CONSTRAINT commitdate_fk FOREIGN KEY (lo_commitdate) REFERENCES date (d_datekey)	
);