-- Procedimiento almacenado para agregar un nuevo producto
CREATE PROCEDURE AgregarProducto
    @Nombre VARCHAR(100),
    @Precio DECIMAL(10, 2),
    @Stock INT,
    @Categoria VARCHAR(50),  -- Nuevo parámetro para la categoría
    @NuevoProductoID INT OUTPUT
AS
BEGIN
    INSERT INTO Productos (Nombre, Precio, Stock, Categoria)
    VALUES (@Nombre, @Precio, @Stock, @Categoria);

    -- Obtener el ID del producto recién creado
    SET @NuevoProductoID = SCOPE_IDENTITY();
END;

