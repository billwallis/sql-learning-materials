"""
Time the queries in the queries directory.
"""

import os
import sqlite3

import db_query_profiler
import dotenv
import duckdb
import psycopg2
import pyodbc
import snowflake.connector

from src import SRC

dotenv.load_dotenv()

Connection = db_query_profiler.query_timer.DatabaseConnection
DB_PATH = SRC / "resources/data"


def sqlite_connector() -> Connection:
    return sqlite3.connect(DB_PATH / "sqlite/loan.db")  # type: ignore


def duckdb_connector() -> Connection:
    return duckdb.connect(database=str(DB_PATH / "duckdb/duckdb.db"))  # type: ignore


def mssql_connector() -> Connection:
    # TODO: Grab from `src/metabase/databases.toml`
    connection = pyodbc.connect(
        "Driver={SQL Server};"
        "Server=localhost;"
        "Database=AdventureWorks2022;"
        "UID=SA;"
        "PWD=Test@12345;"
    )

    return connection.cursor()  # type: ignore


def postgres_connector() -> Connection:
    # TODO: Grab from `src/metabase/databases.toml`
    connection = psycopg2.connect(
        " ".join(
            [
                "host=localhost",
                "port=5432",
                "dbname=postgres",
                "user=postgres",
                "password=Test@12345",
            ]
        )
    )

    return connection.cursor()  # type: ignore


def snowflake_connector() -> Connection:
    connection = snowflake.connector.connect(
        account=os.environ["SNOWFLAKE__ACCOUNT"],
        user=os.environ["SNOWFLAKE__USERNAME"],
        password=os.environ["SNOWFLAKE__PASSWORD"],
    )

    return connection.cursor()  # type: ignore


def main() -> None:
    """
    Time the queries in the queries directory.
    """
    db_conn = {
        "sqlite": sqlite_connector,
        "duckdb": duckdb_connector,
        "mssql": mssql_connector,
        "postgres": postgres_connector,
        "snowflake": snowflake_connector,
    }["sqlite"]()

    db_query_profiler.time_queries(
        conn=db_conn,
        repeat=1_000,
        directory=SRC / "profiler/queries",
    )


if __name__ == "__main__":
    main()
