-- Función que obtiene el total de compras para todas las obras

select construction_id,sum(precio) as compras from purchase_invoices, purchases_delivery_notes where 
purchase_invoices.id=purchases_delivery_notes.purchase_invoice_id group by construction_id;

-- Función que obtiene el total de ventas para todas las obras

select construction_id,sum(precio) as ventas from sales_invoices, sales_delivery_notes where 
sales_delivery_notes.sales_invoice_id=sales_invoices.id group by construction_id;

-- Función que obtiene el total de nominas para todas las obras

select construction_id,sum((datediff(fecha_fin,fecha_ini)/30)*salario) as nominas from working_workers, workers where 
working_workers.worker_id=workers.id group by construction_id ;

