--Procedimiento almacenado para Modificar un Producto
CREATE PROCEDURE ModificarProducto
    @ProductoID INT,
    @NuevoNombre VARCHAR(100),
    @NuevoPrecio DECIMAL(10, 2),
    @NuevoStock INT
AS
BEGIN
    UPDATE Productos
    SET
        Nombre = @NuevoNombre,
        Precio = @NuevoPrecio,
        Stock = @NuevoStock
    WHERE
        ProductoID = @ProductoID;
END;
