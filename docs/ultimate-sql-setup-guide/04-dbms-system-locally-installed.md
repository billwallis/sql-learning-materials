# DBMS system (locally installed)

> [!SUCCESS] **Who's this section for?**
>
> _"I want a local database that I install myself."_

> [!TIP]
>
> DBMS stands for [_Database Management System_](https://en.wikipedia.org/wiki/Database). You may also see RDBMS which stands for [_Relational Database Management System_](https://en.wikipedia.org/wiki/Relational_database).

You can install databases directly onto your machine, and many of them come with their own application for connecting to them and writing SQL. You can also use your preferred IDE (like [VS Code](https://code.visualstudio.com/), [DataGrip](https://www.jetbrains.com/datagrip/), or [DBeaver](https://dbeaver.io/)) to connect to them.

Installing a database locally is a bit more work to set up, but it gives you a lot of control and flexibility. While [single-file databases](./03-single-file-databases.md) like SQLite and DuckDB are great for small and/or local projects, most other databases are more appropriate for larger projects and having a local copy is good for testing and development.

Some databases and their corresponding SQL GUIs are:

- [PostgreSQL](https://www.postgresql.org/) with [pgAdmin](https://www.pgadmin.org/)
- [SQL Server](https://www.microsoft.com/en-gb/sql-server/) with [SQL Server Management Studio (SSMS)](https://learn.microsoft.com/en-gb/ssms/download-sql-server-management-studio-ssms)
- [MySQL](https://www.mysql.com/) with [MySQL Workbench](https://www.mysql.com/products/workbench/)

To reiterate: although these SQL GUIs are built for these corresponding databases, you can connect to the databases using any SQL client (see [here](connecting-to-databases.md)).

---

**Using a locally installed DBMS**

The database's corresponding documentation will explain how to install and use them.

There are also plenty of online tutorials that you can follow; a great one is the video below which shows how to install SQL Server and SSMS on Windows:

- [SQL Server Windows Setup](https://youtu.be/VnJAgND_iLc)
