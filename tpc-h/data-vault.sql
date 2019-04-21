create schema dwh_data_vault;
SET SEARCH_PATH = 'dwh_data_vault';


-- Reference tables are a normal part of a healthy
-- Data Vault model. They are there to prevent
-- redundant storage of simple reference data that
-- is referenced a lot. Reference tables are referenced
-- from Satellites, but never bound with physical foreign
-- keys.

create table RT_REGION
(
  REGIONKEY int not null
    primary key,
  NAME      char(25),
  COMMENT   varchar(152)
);
create table RT_NATION
(
  NATIONKEY int not null
    primary key,
  NAME      char(25),
  REGIONKEY int
    references RT_REGION (REGIONKEY),
  COMMENT   varchar(152)
);

create table H_PART
(
  H_PART_SK     bigint not null primary key,
  PARTKEY       int    not null unique,
  TIMESTAMP     timestamp,
  SOURCE_SYSTEM varchar
);

create table S_PART
(
  S_PART_SK     bigint    not null
    references H_PART (H_PART_SK),
  TIMESTAMP     timestamp not null,
  SOURCE_SYSTEM varchar,
  NAME          varchar(55),
  MFGR          char(25),
  BRAND         char(10),
  TYPE          varchar(25),
  SIZE          integer,
  CONTAINER     char(10),
  RETAILPRICE   decimal,
  COMMENT       varchar(23),
  primary key (S_PART_SK, TIMESTAMP)
);

create table H_SUPP
(
  H_SUPP_SK     bigint not null primary key,
  SUPPKEY       int    not null unique,
  TIMESTAMP     timestamp,
  SOURCE_SYSTEM varchar
);

create table S_SUPP
(
  S_SUPP_SK     bigint    not null
    references H_SUPP (H_SUPP_SK),
  TIMESTAMP     timestamp not null,
  SOURCE_SYSTEM varchar,
  NAME          char(25),
  ADDRESS       varchar(40),
  NATIONKEY     int
    references RT_NATION (NATIONKEY),
  PHONE         char(15),
  ACCTBAL       decimal,
  COMMENT       varchar(101),
  primary key (S_SUPP_SK, TIMESTAMP)
);

create table H_ORDER
(
  H_ORDER_SK    bigint not null primary key,
  ORDERKEY      int    not null unique,
  TIMESTAMP     timestamp,
  SOURCE_SYSTEM varchar
);

create table S_ORDER
(
  S_ORDER_SK    bigint    not null
    references H_ORDER (H_ORDER_SK),
  TIMESTAMP     timestamp not null,
  SOURCE_SYSTEM varchar,
  ORDERSTATUS   varchar(1),
  ORDERDATE     date,
  ORDERPRIORITY char(15),
  CLERK         char(15),
  SHIPPRIORITY  int,
  COMMENT       varchar(79),
  primary key (S_ORDER_SK, TIMESTAMP)
);

create table H_CUSTOMER
(
  H_CUSTOMER_SK bigint not null primary key,
  CUSTKEY       int    not null unique,
  TIMESTAMP     timestamp,
  SOURCE_SYSTEM varchar
);

create table S_CUSTOMER
(
  S_CUSTOMER_SK bigint    not null
    references H_CUSTOMER (H_CUSTOMER_SK),
  TIMESTAMP     timestamp not null,
  SOURCE_SYSTEM varchar,
  NAME          varchar(25),
  ADDRESS       varchar(40),
  NATIONKEY     int
    references RT_NATION (NATIONKEY),
  PHONE         char(15),
  ACCTBAL       decimal,
  MKTSEGMENT    char(10),
  COMMENT       varchar(117),
  primary key (S_CUSTOMER_SK, TIMESTAMP)
);

create table L_CUST_ORDER
(
  L_CUST_ORDER_SK bigint    not null primary key,
  H_CUSTOMER_SK   bigint    not null
    references H_CUSTOMER (H_CUSTOMER_SK),
  H_ORDER_SK      bigint    not null
    references H_ORDER (H_ORDER_SK),
  TIMESTAMP       timestamp not null,
  SOURCE_SYSTEM   varchar
);

create table H_LINEITEM
(
  H_LINEITEM_SK bigint not null primary key,
  LINENUMBER    int    not null unique,
  TIMESTAMP     timestamp,
  SOURCE_SYSTEM varchar
);

create table S_LINEITEM
(
  H_LINEITEM_SK bigint not null
    references H_LINEITEM (H_LINEITEM_SK),
  TIMESTAMP     timestamp,
  SOURCE_SYSTEM varchar,
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
  primary key (H_LINEITEM_SK, TIMESTAMP)
);

create table L_LINEITEM_ORDER
(
  L_LINEITEM_ORDER_SK bigint not null primary key,
  H_LINEITEM_SK       bigint unique
    references H_LINEITEM (H_LINEITEM_SK),
  H_ORDER             bigint unique
    references H_ORDER (H_ORDER_SK),
  TIMESTAMP           timestamp,
  SOURCE_SYSTEM       varchar
);

create table L_PART_SUPP_ORDER
(
  L_PART_SUPP_ORDER_SK bigint not null primary key,
  H_PART_SK            bigint unique
    references H_PART (H_PART_SK),
  H_SUPP_SK            bigint unique
    references H_SUPP (H_SUPP_SK),
  H_ORDER_SK           bigint not null
    references H_ORDER (H_ORDER_SK),
  TIMESTAMP            timestamp,
  SOURCE_SYSTEM        varchar
);

create table LS_PART_SUPP_ORDER
(
  L_PART_SUPP_ORDER_SK bigint not null
    references L_PART_SUPP_ORDER (L_PART_SUPP_ORDER_SK),
  TIMESTAMP            timestamp,
  SOURCE_SYSTEM        varchar,
  AVAILQUY             int,
  SYPPLYCOST           decimal,
  COMMENT              varchar(199),
  PRIMARY KEY (L_PART_SUPP_ORDER_SK, TIMESTAMP)
);

