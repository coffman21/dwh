create schema dwh;

create table PART
(
  PARTKEY     int not null primary key,
  NAME        varchar(55),
  MFGR        char(25),
  BRAND       char(10),
  TYPE        varchar(25),
  CONTAINER   char(10),
  RETAILPRICE decimal,
  COMMENT     varchar(23)
);

create table SUPPLIER
(
  SUPPKEY   int not null
    primary key,
  NAME      char(25),
  ADDRESS   varchar(40),
  NATIONKEY int,
  PHONE     char(15),
  ACCTBAL   decimal,
  COMMENT   varchar(101)
);

create table PARTSUPP
(
  PARTKEY    int not null
    references PART (PARTKEY),
  SUPPKEY    int null
    references SUPPLIER (SUPPKEY),
  AVAILQUY   int,
  SYPPLYCOST decimal,
  COMMENT    varchar(199),
  primary key (PARTKEY, SUPPKEY)
);

create table CUSTOMER
(
  CUSTKEY    int not null
    primary key,
  NAME       varchar(25),
  ADDRESS    varchar(40),
  NATIONKEY  int
    references NATION (NATIONKEY),
  PHONE      char(15),
  ACCTBAL    decimal,
  MKTSEGMENT char(10),
  COMMENT    varchar(117)
);

create table ORDERS
(
  ORDERKEY      int not null
    primary key,
  CUSTKEY       int
    references CUSTOMER (CUSTKEY),
  ORDERSTATUS   varchar(1),
  ORDERDATE     date,
  ORDERPRIORITY char(15),
  CLERK         char(15),
  SHIPPRIORITY  int,
  COMMENT       varchar(79)
);

create table LINEITEM
(
  ORDERKEY      int
    references ORDERS (ORDERKEY),
  PARTKEY       int
    references PART (PARTKEY),
  SUPPKEY       int
    references SUPPLIER (SUPPKEY),
  LINENUMBER    int,
  QUANTITY      decimal,
  EXTENDEDPRICE decimal,
  DISCOUNT      decimal,
  TAX           decimal,
  RETURNFLAG    char(1),
  LINESTATUS    char(1),
  SHIPDATE      date,
  COMMITDATE    date,
  RECEIPTDATE   date,
  SHIPINSTRICT  char(25),
  SHIPMODE      char(10),
  COMMENT       varchar(44),
  primary key (ORDERKEY, LINENUMBER),
  foreign key (PARTKEY, SUPPKEY) references PARTSUPP
);

create table NATION
(
  NATIONKEY int not null
    primary key,
  NAME      char(25),
  REGIONKEY int
    references REGION (REGIONKEY),
  COMMENT   varchar(152)
);

create table REGION
(
  REGIONKEY int not null
    primary key,
  NAME      char(25),
  COMMENT   varchar(152)
);
