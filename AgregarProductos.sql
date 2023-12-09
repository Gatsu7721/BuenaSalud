-- Procedimiento almacenado para agregar un nuevo producto
CREATE PROCEDURE AgregarProducto
    @Nombre VARCHAR(100),
    @Precio DECIMAL(10, 2),
    @Stock INT,
    @Categoria VARCHAR(50),  -- Nuevo par�metro para la categor�a
    @NuevoProductoID INT OUTPUT
AS
BEGIN
    INSERT INTO Productos (Nombre, Precio, Stock, Categoria)
    VALUES (@Nombre, @Precio, @Stock, @Categoria);

    -- Obtener el ID del producto reci�n creado
    SET @NuevoProductoID = SCOPE_IDENTITY();
END;

