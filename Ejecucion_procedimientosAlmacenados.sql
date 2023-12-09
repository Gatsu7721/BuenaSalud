---Ejecucion de Procedimientos almacenados:

-- 1.Ejecutar el procedimiento para agregar un nuevo producto
DECLARE @NuevoProductoID INT;
EXEC AgregarProducto 'Jarabe', 11.90, 20, 'Medicina', @NuevoProductoID OUTPUT;
PRINT 'Nuevo ProductoID: ' + CAST(@NuevoProductoID AS VARCHAR);
SELECT * FROM Productos;


-- 2.Ejecutar el procedimiento para modificar un producto
EXEC ModificarProducto
    @ProductoID = 2,  -- Reemplaza con el ID del producto que deseas modificar
    @NuevoNombre = 'Arroz Integral',
    @NuevoPrecio = 15.80,
    @NuevoStock = 20;
	Select * from Productos;

-- 3.Ejecutar el procedimiento para eliminar un producto
EXEC EliminarProducto
    @ProductoID = 12;
	Select * from Productos;
	
-- 4.Ejecutar el procedimiento para consultar productos
EXEC ConsultarProductos;

-- 5.Funcion para calcular el costo total de un pedido
DECLARE @TotalPedido DECIMAL(10, 2);
SET @TotalPedido = dbo.CalcularTotalPedido(3);  -- Reemplaza con el ID del pedido deseado
PRINT 'Total del Pedido: ' + CAST(@TotalPedido AS VARCHAR);




