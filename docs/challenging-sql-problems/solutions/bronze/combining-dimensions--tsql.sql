```sql
with axis as (
    select
        *,
        lead(dateadd(day, -1, valid_from), 1, '9999-12-31') over (
            partition by employee_id
            order by valid_from
        ) as valid_until
    from (
            select employee_id, valid_from
            from dim_employee_demographics
        union
            select employee_id, valid_from
            from dim_employee_career
        union
            select employee_id, valid_from
            from dim_employee_contact
    ) as _axis
)

select
    axis.employee_id,
    axis.valid_from,
    axis.valid_until,

    dim_employee_demographics.date_of_birth,
    dim_employee_demographics.gender,
    dim_employee_demographics.ethnicity,

    dim_employee_career.job_title,
    dim_employee_career.salary,

    dim_employee_contact.email,
    dim_employee_contact.phone
from axis
    left join dim_employee_demographics
        on  axis.employee_id = dim_employee_demographics.employee_id
        and axis.valid_from >= dim_employee_demographics.valid_from
        and axis.valid_until <= dim_employee_demographics.valid_until
    left join dim_employee_career
        on  axis.employee_id = dim_employee_career.employee_id
        and axis.valid_from >= dim_employee_career.valid_from
        and axis.valid_until <= dim_employee_career.valid_until
    left join dim_employee_contact
        on  axis.employee_id = dim_employee_contact.employee_id
        and axis.valid_from >= dim_employee_contact.valid_from
        and axis.valid_until <= dim_employee_contact.valid_until
order by
    axis.employee_id,
    axis.valid_from
```
