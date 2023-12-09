--Funcion para Calcular el costo total de un Pedido
CREATE FUNCTION CalcularTotalPedido
(
    @PedidoID INT
)
RETURNS DECIMAL(10, 2)
AS
BEGIN
    DECLARE @Total DECIMAL(10, 2);

    SELECT @Total = SUM(Cantidad * PrecioUnitario)
    FROM DetallePedidos
    WHERE PedidoID = @PedidoID;

    RETURN @Total;
END;


