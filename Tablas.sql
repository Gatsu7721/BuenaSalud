CREATE DATABASE TiendaVirtual;
USE TiendaVirtual;
CREATE TABLE Productos (
    ProductoID INT PRIMARY KEY IDENTITY(1,1),
    Nombre VARCHAR(100),
    Precio DECIMAL(10, 2),
    Stock INT
);

CREATE TABLE Clientes (
    ClienteID INT PRIMARY KEY IDENTITY(1,1),
    NombreCompleto VARCHAR(100),
    Email VARCHAR(100)
);
CREATE TABLE Pedidos (
    PedidoID INT PRIMARY KEY IDENTITY(1,1),
    ClienteID INT,
    FechaPedido DATETIME,
    FOREIGN KEY (ClienteID) REFERENCES Clientes(ClienteID)
);
CREATE TABLE DetallePedidos (
    DetalleID INT PRIMARY KEY IDENTITY(1,1),
    PedidoID INT,
    ProductoID INT,
    Cantidad INT,
    PrecioUnitario DECIMAL(10, 2),
    FOREIGN KEY (PedidoID) REFERENCES Pedidos(PedidoID),
    FOREIGN KEY (ProductoID) REFERENCES Productos(ProductoID)
);

-- Insertar detalles del pedido
INSERT INTO DetallePedidos (PedidoID, ProductoID, Cantidad, PrecioUnitario)
VALUES
    (1, 2, 1, 5.99);   -- Suponiendo que el PedidoID 1 corresponde al pedido recién creado y el ProductoID 2 es otro producto existente
select * from DetallePedidos;



