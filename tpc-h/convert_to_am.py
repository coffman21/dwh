queries = [
  '''
create table PART
(
  PARTKEY     int not null primary key,
  NAME        varchar(55),
  MFGR        char(25),
  BRAND       char(10),
  TYPE        varchar(25),
  SIZE        integer,
  CONTAINER   char(10),
  RETAILPRICE decimal,
  COMMENT     varchar(23)
);
''', '''
create table REGION
(
  REGIONKEY int not null
    primary key,
  NAME      char(25),
  COMMENT   varchar(152)
);
''', '''
create table NATION
(
  NATIONKEY int not null
    primary key,
  NAME      char(25),
  REGIONKEY int
    references REGION (REGIONKEY),
  COMMENT   varchar(152)
);
''', '''
create table SUPPLIER
(
  SUPPKEY   int not null
    primary key,
  NAME      char(25),
  ADDRESS   varchar(40),
  NATIONKEY int
    references NATION (NATIONKEY),
  PHONE     char(15),
  ACCTBAL   decimal,
  COMMENT   varchar(101)
);
''', '''
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
''', '''
create table PARTSUPP
(
  PARTKEY    int not null
    references PART (PARTKEY),
  SUPPKEY    int not null
    references SUPPLIER (SUPPKEY),
  AVAILQUY   int,
  SYPPLYCOST decimal,
  COMMENT    varchar(199),
  primary key (PARTKEY, SUPPKEY)
);
''', '''
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
''', '''
create table LINEITEM
(
  ORDERKEY      int not null
    references ORDERS (ORDERKEY),
  PARTKEY       int,
  SUPPKEY       int,
  LINENUMBER    int not null,
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
  foreign key (PARTKEY, SUPPKEY) references PARTSUPP (PARTKEY, SUPPKEY)
);
''']

CREATE_TAB = '''
create table ATTR_{0}_{1}
(
  A_{0}_SK    bigint not null primary key references A_{0},
  TIMESTAMP     timestamp,
  SOURCE_SYSTEM varchar,
  {1}          {2}
);
'''

CREATE_ANCH = '''
create table A_{0}
(
  A_{0}_SK    bigint not null primary key,
  TIMESTAMP     timestamp,
  SOURCE_SYSTEM varchar
);
'''
for q in queries:
    table_name = q.split('\n')[1].split(' ')[2]
    # print (table_name)
    fields = [_ for _ in q.split('\n')[2:-1]][1:-1]
    columns = [row.split() for row in fields ]
    # print(columns)
    # for col in columns:
    #     print (CREATE_TAB.format(table_name, col[0], col[1][:-1]))
    print (CREATE_ANCH.format(table_name))