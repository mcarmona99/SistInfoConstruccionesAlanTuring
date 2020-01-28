-- Función que obtiene el total de compras, ventas, nominas y balance para una obra dada

set @obra:=1;

select @compras:=sum(precio) from purchase_invoices, purchases_delivery_notes where 
purchase_invoices.id=purchases_delivery_notes.purchase_invoice_id and construction_id=@obra;

select @ventas:=sum(precio) from sales_invoices, sales_delivery_notes where 
sales_delivery_notes.sales_invoice_id=sales_invoices.id and construction_id=@obra;

select @nominas:=sum((datediff(fecha_fin,fecha_ini)/30)*salario) from working_workers, workers where 
working_workers.worker_id=workers.id and construction_id=@obra;

set @total:=@ventas-@compras-@nominas;

select @ventas as Ventas, @compras as Compras, @nominas as Nominas, @total as Total;

