
Q28

select ShipCountry, avg(Freight) from Orders 
where Date(OrderDate) between (select date_sub(max(OrderDate), Interval 1 year) from Orders) and (select max(OrderDate) from Orders) 
group by ShipCountry order by avg(Freight) desc limit 3

