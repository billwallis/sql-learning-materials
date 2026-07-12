Oracle:

- [MULTISET](https://blog.jooq.org/a-probably-incomplete-comprehensive-guide-to-the-many-different-ways-to-join-tables-in-sql/#:~:text=MULTISET)

QuestDB:

- Also has [ASOF](https://questdb.com/docs/concepts/deep-dive/sql-extensions/#asof-join)! -> document what "type" it is (modifier or actual join type)
- [LT](https://questdb.com/docs/concepts/deep-dive/sql-extensions/#lt-join) -> strict inequality variant of ASOF
- [SPLICE](https://questdb.com/docs/concepts/deep-dive/sql-extensions/#splice-join) - interleave two time-ordered streams
- [WINDOW](https://questdb.com/docs/concepts/deep-dive/sql-extensions/#window-join) - join each left row to every right row inside a time range defined relative to the left row's timestamp
- [HORIZON](https://questdb.com/docs/concepts/deep-dive/sql-extensions/#horizon-join) - evaluate the right table at a list or range of time offsets from each left row
