# Online sites

> [!SUCCESS] **Who's this section for?**
>
> _"I just want to practice writing SQL queries."_

If you want to practice SQL in isolation, many online sites are perfect for this because they have already set up a database for you and ask you questions to solve. You don't need to install anything, and you can use them from any machine with internet access.

There are _loads_ of sites, way too many to mention here, so we'll just mention some of the most popular ones. The sites below are all free to use, but have some paid features that you might find interesting. They have varying support for different SQL dialects.

We'll put the sites into three categories:

- **Interactive tutorials**: Sites that teach you SQL, and get you to write SQL queries as you go
- **Practice sites**: Sites with predefined data and corresponding problems to solve
- **Sandbox sites**: Sites that let you run SQL queries against your own data

Here are some examples per category:

<center>

| Interactive tutorials                                                    | Practice sites                                                       | Sandbox sites                              |
| ------------------------------------------------------------------------ | -------------------------------------------------------------------- | ------------------------------------------ |
| [Khan Academy](https://www.khanacademy.org/search?page_search_query=sql) | [Analyst Builder](https://www.analystbuilder.com/)                   | [db<>fiddle](https://dbfiddle.uk/)         |
| [SQLZoo](https://sqlzoo.net/wiki/SQL_Tutorial)                           | [StrataScratch](https://platform.stratascratch.com/coding)           | [DB Fiddle](https://www.db-fiddle.com/)    |
| [Codecademy](https://www.codecademy.com/catalog/language/sql)            | [Learn SQL (SQL Practice)](https://www.sql-practice.com/)            | [SQL Fiddle](https://sqlfiddle.com/)       |
| [SQLBolt](https://sqlbolt.com/)                                          | [SQLNoir](https://www.sqlnoir.com/)                                  | [SQLite Online](https://sqliteonline.com/) |
| [Udacity](https://www.udacity.com/catalog?searchValue=sql)               | [DataLemur](https://datalemur.com/)                                  | [CSVFiddle](https://csvfiddle.io/)         |
| [DataCamp](https://www.datacamp.com/courses-all?q=sql)                   | [HackerRank](https://www.hackerrank.com/domains/sql)                 |                                            |
| [Coursera](https://www.coursera.org/search?query=sql)                    | [Advent of SQL](https://adventofsql.com/)                            |                                            |
| [LearnSQL](https://learnsql.com/)                                        | [LeetCode](https://leetcode.com/problemset/database/)                |                                            |
| [Mode](https://mode.com/sql-tutorial)                                    | [8 Week SQL Challenge](https://8weeksqlchallenge.com/)               |                                            |
| [W3Schools](https://www.w3schools.com/sql/)                              | [Interview Query](https://www.interviewquery.com/questions?tags=SQL) |                                            |

</center>

While the interactive tutorials and practice sites have their own data, the sandbox sites allow you to run SQL queries against your own data (which you'd have to put in the site somehow).

Make sure that you **do not** use the sandbox sites with any sensitive data. These sites are just for practice and learning, they're not appropriate for any "real" work. Depending on the site, the data may not persist between sessions.

---

**Using a sandbox site**

The interactive tutorials and practice sites should be intuitive enough to use without much explanation.

Alternatively, the way to use the sandbox sites depends on the site, but in general you'll most likely need to add your data to the site using SQL's DDL commands (see [here](https://sqlbolt.com/lesson/creating_tables) and [here](https://sqlbolt.com/lesson/inserting_rows)).

For example, say you have a CSV file, `example.csv`, with the following data:

```csv
event_id,event_ts,event_name
1,2025-01-01 09:30:00,login
2,2025-01-01 10:00:00,logout
3,2025-01-01 10:30:00,login_failed
```

This can be converted to SQL DDL like:

```sql
create table events (
    event_id integer,
    event_ts timestamp,
    event_name varchar(50)
);
insert into events (event_id, event_ts, event_name)
values
    (1, '2025-01-01 09:30:00', 'login'),
    (2, '2025-01-01 10:00:00', 'logout'),
    (3, '2025-01-01 10:30:00', 'login_failed')
;
```

I usually hand-write the `create table` command and the first line of the `insert` command, but use Excel or Google Sheets to convert the CSV data into format needed by the `insert` command.

There are additional tools that can help with this; you should be able to find plenty online.

> [!WARNING]
>
> To reiterate, make sure that you **do not** use the sandbox sites (or any other online sites) with any sensitive data.
