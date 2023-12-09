---Procedimiento Almacenado para eliminar registros
CREATE PROCEDURE EliminarProducto
    @ProductoID INT
AS
BEGIN
    DELETE FROM Productos
    WHERE ProductoID = @ProductoID;
END;
