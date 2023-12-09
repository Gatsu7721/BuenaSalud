--Consulta 1: Obtener el total de ventas y la cantidad de productos vendidos por cada cliente:
SELECT
    C.ClienteID,
    C.NombreCompleto,
    COUNT(DP.DetalleID) AS CantidadProductos,
    SUM(DP.Cantidad * DP.PrecioUnitario) AS TotalVentas
FROM
    Clientes C
JOIN Pedidos P ON C.ClienteID = P.ClienteID
JOIN DetallePedidos DP ON P.PedidoID = DP.PedidoID
GROUP BY
    C.ClienteID, C.NombreCompleto;

--Calcular el promedio de stock por categoría de productos
SELECT
    Categoria,
    AVG(Stock) AS PromedioStock
FROM
    Productos
GROUP BY
    Categoria;

--Consulta 3: Obtener el total de ingresos por mes:
SELECT
    YEAR(FechaPedido) AS Año,
    MONTH(FechaPedido) AS Mes,
    SUM(DP.Cantidad * DP.PrecioUnitario) AS Ingresos
FROM
    Pedidos P
JOIN DetallePedidos DP ON P.PedidoID = DP.PedidoID
GROUP BY
    YEAR(FechaPedido), MONTH(FechaPedido)
ORDER BY
    Año, Mes;

--Consulta 4: Encontrar productos más vendidos:
SELECT TOP 5
    P.ProductoID,
    P.Nombre,
    SUM(DP.Cantidad) AS TotalVendido
FROM
    Productos P
JOIN DetallePedidos DP ON P.ProductoID = DP.ProductoID
GROUP BY
    P.ProductoID, P.Nombre
ORDER BY
    TotalVendido DESC;

--Vista 1: Crear una vista que muestre la información de productos con bajo stock(menor a 10):
CREATE VIEW VistaBajoStock AS
SELECT
    ProductoID,
    Nombre,
    Stock
FROM
    Productos
WHERE
    Stock < 10;

	select * from Productos;

