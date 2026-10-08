```sql
select
    invoices.invoice_currency,
    ceiling(100.0 * sum(invoices.invoice_amount_usd * coalesce(rates.rate, 1.0))) / 100.0 as amount_outstanding
from invoices
    outer apply (
        select top 1 *
        from exchange_rates
        where 1=1
            and invoices.invoice_datetime >= exchange_rates.from_datetime
            and invoices.invoice_currency = exchange_rates.to_currency
            and exchange_rates.from_currency = 'USD'
        order by exchange_rates.from_datetime desc
    ) as rates
where invoices.is_paid = 0
group by invoices.invoice_currency
order by invoices.invoice_currency
```
