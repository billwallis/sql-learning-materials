# Customer churn 🔄

> [!TIP]
>
> Solution to the following problem:
>
> - [customer-churn.md](../../problems/bronze/customer-churn.md)

## Result Set

Regardless of the database, the result set should look like:

| user_id | days_active_last_week |
| ------: | --------------------: |
|       1 |                     4 |

<details>
<summary>Expand for the DDL</summary>
--8<-- "docs/challenging-sql-problems/solutions/bronze/customer-churn.sql"
</details>

## Solution

Some SQL solutions per database are provided below.

<!-- prettier-ignore -->
> SUCCESS: **DuckDB**
>
--8<-- "docs/challenging-sql-problems/solutions/bronze/customer-churn--duckdb.sql"

<!-- prettier-ignore -->
> SUCCESS: **PostgreSQL**
>
--8<-- "docs/challenging-sql-problems/solutions/bronze/customer-churn--postgres.sql"

<!-- prettier-ignore -->
> SUCCESS: **SQL Server**
>
--8<-- "docs/challenging-sql-problems/solutions/bronze/customer-churn--tsql.sql"
