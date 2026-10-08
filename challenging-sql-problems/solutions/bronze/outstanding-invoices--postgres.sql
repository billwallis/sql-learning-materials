```sql
select
    invoices.invoice_currency,
    ceil(100.0 * sum(invoices.invoice_amount_usd * coalesce(rates.rate, 1.0))) / 100.0 as amount_outstanding
from invoices
    left join lateral (
        select *
        from exchange_rates
        where 1=1
            and invoices.invoice_datetime >= exchange_rates.from_datetime
            and invoices.invoice_currency = exchange_rates.to_currency
            and exchange_rates.from_currency = 'USD'
        order by exchange_rates.from_datetime desc
        limit 1
    ) as rates on true
where not invoices.is_paid
group by invoices.invoice_currency
order by invoices.invoice_currency
```
