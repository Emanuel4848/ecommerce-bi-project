-- Validación de KPIs
select count(id_venta) as total_ventas
from ventas;

select count(distinct id_cliente) as clientes_unicos
from ventas;

select sum(cantidad) as unidades_vendidas
from ventas;

select sum(p.precio_unitario * v.cantidad) as ingresos_totales
from ventas v
inner join productos p on p.id_producto = v.id_producto;


-- ingresos por categoria

select c.categoria, sum(v.cantidad * p.precio_unitario) as ingresos_totales
from ventas v
inner join productos p on p.id_producto = v.id_producto
inner join categorias_productos c on c.id_categoria = p.id_categoria
group by c.categoria
order by ingresos_totales desc;


-- ingresos por mes

select extract(month from v.fecha) as mes,
sum(v.cantidad * p.precio_unitario) as ingresos_totales
from ventas v
inner join productos p on p.id_producto = v.id_producto
group by mes
order by mes;