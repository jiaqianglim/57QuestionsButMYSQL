
Q28
select ShipCountry, avg(Freight) from Orders 
where Date(OrderDate) between (select date_sub(max(OrderDate), Interval 1 year) from Orders) and (select max(OrderDate) from Orders) 
group by ShipCountry order by avg(Freight) desc limit 3

Q32 (not difficult, just annoying)
select c.CustomerID, c.CompanyName from Customers c
join Orders o on c.CustomerID = o.CustomerID
 where o.OrderID in 
  (select o.OrderID from OrderDetails d
  join Orders o on o.OrderID = d.OrderID
  where o.OrderDate like "2016%"
  group by o.OrderId having sum(UnitPrice*Quantity)>10000)
order by c.CustomerID
