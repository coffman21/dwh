create schema dwh_anchor_modelling;
SET SEARCH_PATH = 'dwh_anchor_modelling';

create table A_PART
(
  A_PART_SK     bigint not null primary key,
  TIMESTAMP     timestamp,
  SOURCE_SYSTEM varchar
);



create table A_REGION
(
  A_REGION_SK   bigint not null primary key,
  TIMESTAMP     timestamp,
  SOURCE_SYSTEM varchar
);


create table A_NATION
(
  A_NATION_SK   bigint not null primary key,
  TIMESTAMP     timestamp,
  SOURCE_SYSTEM varchar
);


create table A_SUPPLIER
(
  A_SUPPLIER_SK bigint not null primary key,
  TIMESTAMP     timestamp,
  SOURCE_SYSTEM varchar
);


create table A_CUSTOMER
(
  A_CUSTOMER_SK bigint not null primary key,
  TIMESTAMP     timestamp,
  SOURCE_SYSTEM varchar
);


create table A_PARTSUPP
(
  A_PARTSUPP_SK bigint not null primary key,
  TIMESTAMP     timestamp,
  SOURCE_SYSTEM varchar
);


create table A_ORDERS
(
  A_ORDERS_SK   bigint not null primary key,
  TIMESTAMP     timestamp,
  SOURCE_SYSTEM varchar
);


create table A_LINEITEM
(
  A_LINEITEM_SK bigint not null primary key,
  TIMESTAMP     timestamp,
  SOURCE_SYSTEM varchar
);

create table ATTR_PART_NAME
(
  A_PART_SK     bigint not null primary key references A_PART,
  TIMESTAMP     timestamp,
  SOURCE_SYSTEM varchar,
  NAME          varchar(55)
);


create table ATTR_PART_MFGR
(
  A_PART_SK     bigint not null primary key references A_PART,
  TIMESTAMP     timestamp,
  SOURCE_SYSTEM varchar,
  MFGR          char(25)
);


create table ATTR_PART_BRAND
(
  A_PART_SK     bigint not null primary key references A_PART,
  TIMESTAMP     timestamp,
  SOURCE_SYSTEM varchar,
  BRAND         char(10)
);


create table ATTR_PART_TYPE
(
  A_PART_SK     bigint not null primary key references A_PART,
  TIMESTAMP     timestamp,
  SOURCE_SYSTEM varchar,
  TYPE          varchar(25)
);


create table ATTR_PART_SIZE
(
  A_PART_SK     bigint not null primary key references A_PART,
  TIMESTAMP     timestamp,
  SOURCE_SYSTEM varchar,
  SIZE          integer
);


create table ATTR_PART_CONTAINER
(
  A_PART_SK     bigint not null primary key references A_PART,
  TIMESTAMP     timestamp,
  SOURCE_SYSTEM varchar,
  CONTAINER     char(10)
);


create table ATTR_PART_RETAILPRICE
(
  A_PART_SK     bigint not null primary key references A_PART,
  TIMESTAMP     timestamp,
  SOURCE_SYSTEM varchar,
  RETAILPRICE   decimal
);


create table ATTR_PART_COMMENT
(
  A_PART_SK     bigint not null primary key references A_PART,
  TIMESTAMP     timestamp,
  SOURCE_SYSTEM varchar,
  COMMENT       varchar(23)
);


create table ATTR_REGION_NAME
(
  A_REGION_SK   bigint not null primary key references A_REGION,
  TIMESTAMP     timestamp,
  SOURCE_SYSTEM varchar,
  NAME          char(25)
);


create table ATTR_REGION_COMMENT
(
  A_REGION_SK   bigint not null primary key references A_REGION,
  TIMESTAMP     timestamp,
  SOURCE_SYSTEM varchar,
  COMMENT       varchar(152)
);


create table ATTR_NATION_NAME
(
  A_NATION_SK   bigint not null primary key references A_NATION,
  TIMESTAMP     timestamp,
  SOURCE_SYSTEM varchar,
  NAME          char(25)
);


create table ATTR_NATION_COMMENT
(
  A_NATION_SK   bigint not null primary key references A_NATION,
  TIMESTAMP     timestamp,
  SOURCE_SYSTEM varchar,
  COMMENT       varchar(152)
);


create table ATTR_SUPPLIER_NAME
(
  A_SUPPLIER_SK bigint not null primary key references A_SUPPLIER,
  TIMESTAMP     timestamp,
  SOURCE_SYSTEM varchar,
  NAME          char(25)
);


create table ATTR_SUPPLIER_ADDRESS
(
  A_SUPPLIER_SK bigint not null primary key references A_SUPPLIER,
  TIMESTAMP     timestamp,
  SOURCE_SYSTEM varchar,
  ADDRESS       varchar(40)
);


create table ATTR_SUPPLIER_PHONE
(
  A_SUPPLIER_SK bigint not null primary key references A_SUPPLIER,
  TIMESTAMP     timestamp,
  SOURCE_SYSTEM varchar,
  PHONE         char(15)
);


create table ATTR_SUPPLIER_ACCTBAL
(
  A_SUPPLIER_SK bigint not null primary key references A_SUPPLIER,
  TIMESTAMP     timestamp,
  SOURCE_SYSTEM varchar,
  ACCTBAL       decimal
);


create table ATTR_SUPPLIER_COMMENT
(
  A_SUPPLIER_SK bigint not null primary key references A_SUPPLIER,
  TIMESTAMP     timestamp,
  SOURCE_SYSTEM varchar,
  COMMENT       varchar(101)
);


create table ATTR_CUSTOMER_NAME
(
  A_CUSTOMER_SK bigint not null primary key references A_CUSTOMER,
  TIMESTAMP     timestamp,
  SOURCE_SYSTEM varchar,
  NAME          varchar(25)
);


create table ATTR_CUSTOMER_ADDRESS
(
  A_CUSTOMER_SK bigint not null primary key references A_CUSTOMER,
  TIMESTAMP     timestamp,
  SOURCE_SYSTEM varchar,
  ADDRESS       varchar(40)
);


create table ATTR_CUSTOMER_PHONE
(
  A_CUSTOMER_SK bigint not null primary key references A_CUSTOMER,
  TIMESTAMP     timestamp,
  SOURCE_SYSTEM varchar,
  PHONE         char(15)
);


create table ATTR_CUSTOMER_ACCTBAL
(
  A_CUSTOMER_SK bigint not null primary key references A_CUSTOMER,
  TIMESTAMP     timestamp,
  SOURCE_SYSTEM varchar,
  ACCTBAL       decimal
);


create table ATTR_CUSTOMER_MKTSEGMENT
(
  A_CUSTOMER_SK bigint not null primary key references A_CUSTOMER,
  TIMESTAMP     timestamp,
  SOURCE_SYSTEM varchar,
  MKTSEGMENT    char(10)
);


create table ATTR_CUSTOMER_COMMENT
(
  A_CUSTOMER_SK bigint not null primary key references A_CUSTOMER,
  TIMESTAMP     timestamp,
  SOURCE_SYSTEM varchar,
  COMMENT       varchar(117)
);


create table ATTR_PARTSUPP_AVAILQUY
(
  A_PARTSUPP_SK bigint not null primary key references A_PARTSUPP,
  TIMESTAMP     timestamp,
  SOURCE_SYSTEM varchar,
  AVAILQUY      int
);


create table ATTR_PARTSUPP_SYPPLYCOST
(
  A_PARTSUPP_SK bigint not null primary key references A_PARTSUPP,
  TIMESTAMP     timestamp,
  SOURCE_SYSTEM varchar,
  SYPPLYCOST    decimal
);


create table ATTR_PARTSUPP_COMMENT
(
  A_PARTSUPP_SK bigint not null primary key references A_PARTSUPP,
  TIMESTAMP     timestamp,
  SOURCE_SYSTEM varchar,
  COMMENT       varchar(199)
);


create table ATTR_ORDERS_ORDERSTATUS
(
  A_ORDERS_SK   bigint not null primary key references A_ORDERS,
  TIMESTAMP     timestamp,
  SOURCE_SYSTEM varchar,
  ORDERSTATUS   varchar(1)
);


create table ATTR_ORDERS_ORDERDATE
(
  A_ORDERS_SK   bigint not null primary key references A_ORDERS,
  TIMESTAMP     timestamp,
  SOURCE_SYSTEM varchar,
  ORDERDATE     date
);


create table ATTR_ORDERS_ORDERPRIORITY
(
  A_ORDERS_SK   bigint not null primary key references A_ORDERS,
  TIMESTAMP     timestamp,
  SOURCE_SYSTEM varchar,
  ORDERPRIORITY char(15)
);


create table ATTR_ORDERS_CLERK
(
  A_ORDERS_SK   bigint not null primary key references A_ORDERS,
  TIMESTAMP     timestamp,
  SOURCE_SYSTEM varchar,
  CLERK         char(15)
);


create table ATTR_ORDERS_SHIPPRIORITY
(
  A_ORDERS_SK   bigint not null primary key references A_ORDERS,
  TIMESTAMP     timestamp,
  SOURCE_SYSTEM varchar,
  SHIPPRIORITY  int
);


create table ATTR_ORDERS_COMMENT
(
  A_ORDERS_SK   bigint not null primary key references A_ORDERS,
  TIMESTAMP     timestamp,
  SOURCE_SYSTEM varchar,
  COMMENT       varchar(79)
);


create table ATTR_LINEITEM_QUANTITY
(
  A_LINEITEM_SK bigint not null primary key references A_LINEITEM,
  TIMESTAMP     timestamp,
  SOURCE_SYSTEM varchar,
  QUANTITY      decimal
);


create table ATTR_LINEITEM_EXTENDEDPRICE
(
  A_LINEITEM_SK bigint not null primary key references A_LINEITEM,
  TIMESTAMP     timestamp,
  SOURCE_SYSTEM varchar,
  EXTENDEDPRICE decimal
);


create table ATTR_LINEITEM_DISCOUNT
(
  A_LINEITEM_SK bigint not null primary key references A_LINEITEM,
  TIMESTAMP     timestamp,
  SOURCE_SYSTEM varchar,
  DISCOUNT      decimal
);


create table ATTR_LINEITEM_TAX
(
  A_LINEITEM_SK bigint not null primary key references A_LINEITEM,
  TIMESTAMP     timestamp,
  SOURCE_SYSTEM varchar,
  TAX           decimal
);


create table ATTR_LINEITEM_RETURNFLAG
(
  A_LINEITEM_SK bigint not null primary key references A_LINEITEM,
  TIMESTAMP     timestamp,
  SOURCE_SYSTEM varchar,
  RETURNFLAG    char(1)
);


create table ATTR_LINEITEM_LINESTATUS
(
  A_LINEITEM_SK bigint not null primary key references A_LINEITEM,
  TIMESTAMP     timestamp,
  SOURCE_SYSTEM varchar,
  LINESTATUS    char(1)
);


create table ATTR_LINEITEM_SHIPDATE
(
  A_LINEITEM_SK bigint not null primary key references A_LINEITEM,
  TIMESTAMP     timestamp,
  SOURCE_SYSTEM varchar,
  SHIPDATE      date
);


create table ATTR_LINEITEM_COMMITDATE
(
  A_LINEITEM_SK bigint not null primary key references A_LINEITEM,
  TIMESTAMP     timestamp,
  SOURCE_SYSTEM varchar,
  COMMITDATE    date
);


create table ATTR_LINEITEM_RECEIPTDATE
(
  A_LINEITEM_SK bigint not null primary key references A_LINEITEM,
  TIMESTAMP     timestamp,
  SOURCE_SYSTEM varchar,
  RECEIPTDATE   date
);


create table ATTR_LINEITEM_SHIPINSTRICT
(
  A_LINEITEM_SK bigint not null primary key references A_LINEITEM,
  TIMESTAMP     timestamp,
  SOURCE_SYSTEM varchar,
  SHIPINSTRICT  char(25)
);


create table ATTR_LINEITEM_SHIPMODE
(
  A_LINEITEM_SK bigint not null primary key references A_LINEITEM,
  TIMESTAMP     timestamp,
  SOURCE_SYSTEM varchar,
  SHIPMODE      char(10)
);


create table ATTR_LINEITEM_COMMENT
(
  A_LINEITEM_SK bigint not null primary key references A_LINEITEM,
  TIMESTAMP     timestamp,
  SOURCE_SYSTEM varchar,
  COMMENT       varchar(44)
);

create table T_REGION_NATION
(
  T_REGION_NATION_SK bigint not null primary key,
  A_REGION_SK        bigint unique references A_REGION,
  A_NATION_SK        bigint unique references A_NATION,
  TIMESTAMP          timestamp,
  SOURCE_SYSTEM      varchar
);


create table T_NATION_SUPP
(
  T_NATION_SUPP_SK bigint not null primary key,
  A_NATION_SK      bigint unique references A_NATION,
  A_SUPP_SK        bigint unique references A_SUPPLIER,
  TIMESTAMP        timestamp,
  SOURCE_SYSTEM    varchar
);

create table T_NATION_CUST
(
  T_NATION_CUST_SK bigint not null primary key,
  A_NATION_SK      bigint unique references A_NATION,
  A_CUST_SK        bigint unique references A_CUSTOMER,
  TIMESTAMP        timestamp,
  SOURCE_SYSTEM    varchar
);


create table T_CUSTOMER_ORDER
(
  T_CUSTOMER_ORDER_SK bigint not null primary key,
  A_CUST_SK           bigint unique references A_CUSTOMER,
  A_ORDER_SK          bigint unique references A_ORDERS,
  TIMESTAMP           timestamp,
  SOURCE_SYSTEM       varchar
);

create table T_LINEITEM_ORDER
(
  T_LINEITEM_ORDER_SK bigint not null primary key,
  A_LINEITEM_SK       bigint unique references A_LINEITEM,
  A_ORDER_SK          bigint unique references A_ORDERS,
  TIMESTAMP           timestamp,
  SOURCE_SYSTEM       varchar
);

create table T_PART_PARTSUPP
(
  T_PART_PARTSUPP_SK bigint not null primary key,
  A_PART_SK          bigint unique references A_PART,
  A_PARTSUPP_SK      bigint unique references A_PARTSUPP,
  TIMESTAMP          timestamp,
  SOURCE_SYSTEM      varchar
);

create table T_SUPP_PARTSUPP
(
  T_SUPP_PARTSUPP_SK bigint not null primary key,
  A_SUPP_SK          bigint unique references A_SUPPLIER,
  A_PARTSUPP_SK      bigint unique references A_PARTSUPP,
  TIMESTAMP          timestamp,
  SOURCE_SYSTEM      varchar
);

create table T_PARTSUPP_ORDER
(
  T_PARTSUPP_ORDER_SK bigint not null primary key,
  A_PARTSUPP_SK       bigint unique references A_PARTSUPP,
  A_ORDER_SK          bigint unique references A_ORDERS,
  TIMESTAMP           timestamp,
  SOURCE_SYSTEM       varchar
);
