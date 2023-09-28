WITH AllPurchases AS (	
    SELECT
        t2.Id_Client,
        t2.DocDate,
        t2.Amount,
        t2.Caption,
        t1.Value as total,
        sum(Amount) over (partition by t2.Id_Client order by DocDate desc) as current_total
    FROM
        Table2 t2
    INNER JOIN Table1 t1 ON t1.Id_Client = t2.Id_Client
),
cte2 as (
  select *, lag(current_total) over (partition by Id_Client order by DocDate desc, Caption desc) as lag_current_total
  from AllPurchases
),
cte3 as (
  select *, case when total>= current_total then Amount
               when lag_current_total is null then total
               else total - lag_current_total
               end as purchase_amount
  from cte2
)
select Id_Client, DocDate, purchase_amount, Caption
from cte3
where purchase_amount > 0