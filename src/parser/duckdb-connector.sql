/*
    Connect DuckDB to the other DBs
*/

select version();  /* DuckDB v1.3.2 */


/* Attach PostgreSQL */
detach pg_db;
attach 'host=localhost port=5432 user=postgres password=Test@12345' as pg_db (type postgres);
from pg_db.information_schema.tables;

/* Attach MySQL */
detach mysql_db;
attach 'host=localhost port=3306 user=root password=Test@12345' as mysql_db (type mysql);
from mysql_db.information_schema.tables;

/* Attach SQLite */
detach sqlite_db;
attach 'src/resources/data/sqlite/loan.db' as sqlite_db (type sqlite);
from sqlite_db.main.sqlite_master;
