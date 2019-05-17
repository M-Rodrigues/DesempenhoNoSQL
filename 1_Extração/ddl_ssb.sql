-- DDL para o esquema SSB - prática BD II - 2018


-- drop table ssb.part;
CREATE TABLE SSB.PART  ( P_PARTKEY     INTEGER NOT NULL,
                          P_NAME        VARCHAR(22) NOT NULL,
                          P_MFGR        CHAR(6) NOT NULL,
                          P_CATEGORY    CHAR(7) NOT NULL,
                          P_BRAND1       CHAR(9) NOT NULL,
                          P_COLOR		VARCHAR(11) not null,
                          P_TYPE        VARCHAR(25) NOT NULL,
                          P_SIZE        INTEGER NOT NULL,
                          P_CONTAINER   CHAR(10) NOT NULL,
                            p_foo character(10),
                          CONSTRAINT PK_P PRIMARY KEY (P_PARTKEY));
-- drop table ssb.supplier;
CREATE TABLE SSB.SUPPLIER ( S_SUPPKEY     INTEGER NOT NULL,
                             S_NAME        CHAR(25) NOT NULL,
                             S_ADDRESS     VARCHAR(25) NOT NULL,
                             S_CITY	   CHAR(10) NOT NULL, 
			      S_NATION	   CHAR(15) NOT NULL,
  			      S_REGION     CHAR(12) NOT NULL,
                             S_PHONE      CHAR(15) NOT NULL,
                               s_foo character(10),
                             CONSTRAINT PK_S PRIMARY KEY (S_SUPPKEY));

--drop table ssb.customer;
CREATE TABLE SSB.CUSTOMER ( C_CUSTKEY     INTEGER NOT NULL,
                             C_NAME        VARCHAR(25) NOT NULL,
                             C_ADDRESS     VARCHAR(25) NOT NULL,
                             C_CITY 	   CHAR(10) NOT NULL,
  			      C_NATION	   CHAR(15) NOT NULL,
   			      C_REGION      CHAR(12) NOT NULL,
                             C_PHONE       CHAR(15) NOT NULL,
                             C_MKTSEGMENT  CHAR(10) NOT NULL,
                             c_foo char(10),
                             CONSTRAINT PK_C PRIMARY KEY (C_CUSTKEY));
                             
--drop table ssb.date;                          
CREATE TABLE SSB.DATE (		D_DATEKEY INTEGER NOT NULL,
							D_DATE CHAR(18) NOT NULL, --: e.g. December 22, 1998 
							D_DAYOFWEEK CHAR(9) NOT NULL, -- fixed text, size 8, Sunday..Saturday 
							D_MONTH CHAR(9) NOT NULL, --fixed text, size 9: January, ..., December 
							D_YEAR INTEGER NOT NULL, --unique value 1992-1998 
							D_YEARMONTHNUM INTEGER NOT NULL, --numeric (YYYYMM) 
							D_YEARMONTH CHAR(7) NOT NULL, --fixed text, size 7: (e.g.: Mar1998 
							D_DAYNUMINWEEK INTEGER NOT NULL, --numeric 1-7 
							D_DAYNUMINMONTH INTEGER NOT NULL, --numeric 1-31 
							D_DAYNUMINYEAR INTEGER NOT NULL, --numeric 1-366 
							D_MONTHNUMINYEAR INTEGER NOT NULL, --numeric 1-12 
							D_WEEKNUMINYEAR INTEGER NOT NULL, --numeric 1-53 
							D_SELLINGSEASON CHAR(12) NOT NULL, --text, size 12 (e.g.: Christmas) 
							D_LASTDAYINWEEKFL CHAR(1) NOT NULL, --1 bit 
							D_LASTDAYINMONTHFL CHAR(1) NOT NULL, --1 bit
							D_HOLIDAYFL CHAR(1) NOT NULL,-- 1 bit
							D_WEEKDAYFL CHAR(1) NOT NULL, --1 bit
							d_foo char(10), 
							CONSTRAINT PK_D PRIMARY KEY (D_DATEKEY)
							);


--DROP TABLE ssb.lineorder;
CREATE TABLE SSB.LINEORDER  ( LO_ORDERKEY    	INTEGER NOT NULL,
			       LO_LINENUMBER  	INTEGER NOT NULL,
                              LO_CUSTKEY     	INTEGER NOT NULL,
                              LO_PARTKEY     	INTEGER NOT NULL,
                              LO_SUPPKEY     	INTEGER NOT NULL,
                              LO_ORDERDATE   	INTEGER NOT NULL,
                             LO_ORDERPRIORITY  	CHAR(15) NOT NULL,  -- R
                             LO_SHIPPRIORITY   	CHAR(1) NOT NULL,
                             LO_QUANTITY    	DECIMAL(15,2) NOT NULL,
                             LO_EXTENDEDPRICE  	DECIMAL(15,2) NOT NULL,
                             LO_ORDTOTALPRICE 	DECIMAL(15,2) NOT NULL,
                             LO_DISCOUNT    	DECIMAL(15,2) NOT NULL,
                             LO_REVENUE			DECIMAL(15,2) NOT NULL,
                             LO_SUPPLYCOST		DECIMAL(15,2) NOT NULL,
                             LO_TAX         	DECIMAL(15,2) NOT NULL,
                             LO_COMMITDATE  	INTEGER NOT NULL,
                             LO_SHIPMODE     	CHAR(10) NOT NULL,  -- R
                          CONSTRAINT PK_LO PRIMARY KEY (LO_ORDERKEY, LO_LINENUMBER),
                          CONSTRAINT FK_C FOREIGN KEY (LO_CUSTKEY) REFERENCES SSB.CUSTOMER (C_CUSTKEY),
                          CONSTRAINT FK_P FOREIGN KEY (LO_PARTKEY) REFERENCES SSB.PART (P_PARTKEY),
                          CONSTRAINT FK_S FOREIGN KEY (LO_SUPPKEY) REFERENCES SSB.SUPPLIER (S_SUPPKEY),
                          CONSTRAINT FK_OD FOREIGN KEY (LO_ORDERDATE) REFERENCES SSB.DATE (D_DATEKEY),
                          CONSTRAINT FK_CD FOREIGN KEY (LO_COMMITDATE) REFERENCES SSB.DATE (D_DATEKEY)
                          );


-- as colunas foo foram criadas devido à forma de geracao do dbgen, que gera um delimitador a mais.
--alter table ssb.customer drop column c_foo;
--alter table ssb.part drop column p_foo;
--alter table ssb.date drop column d_foo;
--alter table ssb.supplier drop column s_foo;
