use sales;
show tables;



select * from markets
where markets_name = 'Chennai'; 

select * from transactions
where market_code = 'Mark001' and currency = 'inr';

select count(*) from transactions
where market_code = 'Mark001';

select * from transactions
where currency= 'usd';


#total rev in year 2020
select sum(sales_amount) as Total_rev from transactions T
inner join date D
on T.order_date = D.date
where D.year = '2020';

select sum(sales_amount) as Total_rev from transactions T
inner join date D
on T.order_date = D.date
where D.year = '2019';

#business in mumbai in 2020
select sum(sales_amount) as Total_rev from transactions T
inner join date D
on T.order_date = D.date
where D.year = '2020' and market_code = 'Mark002';


select * from transactions 
where sales_amount = '-1';

select * from transactions 
where sales_amount <= 0;


#total rev in 2020 yr
select sum(sales_amount)as totral_rev from transactions
where year(transactions.order_date) = 2020;


select sum(T.sales_amount)as total_rev from transactions T
inner join date D 
on T.order_date = D.date 
where D.year= 2020 and D.month_name = 'January';


select C.custmer_name, sum(sales_amount)as total_rev from transactions T
inner join customers C 
on C.customer_code= T.customer_code
group by custmer_name
order by total_rev desc
limit 5;


select P.product_code, sum(sales_amount)as total_rev from transactions T
inner join products P
on P.product_code= T.product_code
group by P.product_code
order by total_rev desc
limit 5