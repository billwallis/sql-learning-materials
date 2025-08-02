/*
-- DuckDB data generator

copy (
    from (
        from generate_series(999_999) as gs(n)
        select
            ceiling(1_000 * random()) as user_id,
            (
                '2025-01-01 00:00:00'::timestamp
                + to_seconds(6 * 30 * 24 * 60 * 60 * random())
            ) as event_datetime,
    )
    select
        row_number() over (order by event_datetime) as event_id,
        user_id::int as user_id,
        event_datetime,
)
to 'dockerfiles/shared/sample-events.csv'
*/


------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------

/*
    SQL Server (T-SQL)

    Bulk upload CSV
*/
drop table if exists events;
create table events (
    event_id int primary key,
    user_id int not null,
    event_datetime datetime not null,
    /* Contrived index */
    index user_id_event_ts nonclustered (user_id, event_datetime)
);
bulk insert events
from '/shared/sample-events.csv'
with (
    firstrow = 2,
    fieldterminator = ',',
    rowterminator = '\n',
    tablock
);
update statistics events;
select *, count(*) over() from events;
