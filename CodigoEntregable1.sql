CREATE DATABASE DbBuenaSalud;
USE DbBuenaSalud;
CREATE TABLE Empleados (
    EmpleadoID INT PRIMARY KEY,
    Nombre VARCHAR(50),
    Apellido VARCHAR(50),
    FechaAlta DATE,
    Edad INT,
    Departamento VARCHAR(50),
    Oficio VARCHAR(50),
    Salario DECIMAL(10, 2)
);

INSERT INTO Empleados (EmpleadoID, Nombre, Apellido, FechaAlta, Edad, Departamento, Oficio, Salario)
VALUES
    (1, 'Juan', 'Pérez', '2017-05-15', 30, 'Ventas', 'Vendedor', 50000.00),
    (2, 'María', 'Gómez', '2018-03-10', 25, 'Recursos Humanos', 'Reclutador', 60000.00),
    (3, 'Carlos', 'López', '2016-11-22', 35, 'Ventas', 'Gerente de Ventas', 80000.00),
    (4, 'Laura', 'Martínez', '2019-01-05', 28, 'Finanzas', 'Contador', 70000.00);

SELECT *
FROM Empleados
WHERE YEAR(FechaAlta) < 2018 AND Departamento = 'Ventas';

DELETE FROM Empleados
WHERE YEAR(FechaAlta) < 2018 AND Departamento = 'Ventas';

CREATE PROCEDURE InsertarNuevoDepartamento
    @NombreDepartamento VARCHAR(50)
AS
BEGIN
    INSERT INTO Departamentos (NombreDepartamento)
    VALUES (@NombreDepartamento);
END;

CREATE PROCEDURE ObtenerPromedioEdadPorDepartamento
AS
BEGIN
    SELECT Departamento, AVG(Edad) as PromedioEdad
    FROM Empleados
    GROUP BY Departamento;
END;

CREATE PROCEDURE ObtenerInfoEmpleado
    @NumeroEmpleado INT
AS
BEGIN
    SELECT Apellido, Oficio, Salario
    FROM Empleados
    WHERE EmpleadoID = @NumeroEmpleado;
END;

CREATE PROCEDURE DarDeBajaEmpleado
    @Apellido VARCHAR(50)
AS
BEGIN
    DELETE FROM Empleados
    WHERE Apellido = @Apellido;
END;

-- Crear la tabla de departamentos con identidad en DepartamentoID
CREATE TABLE Departamentos (
    DepartamentoID INT PRIMARY KEY IDENTITY(1,1),
    NombreDepartamento VARCHAR(50)
);

-- Procedimiento para insertar un nuevo departamento
CREATE PROCEDURE InsertarNuevoDepartamento
    @NombreDepartamento VARCHAR(50)
AS
BEGIN
    INSERT INTO Departamentos (NombreDepartamento)
    VALUES (@NombreDepartamento);
END;
GO
-- Procedimiento para obtener el promedio de edad por departamento
CREATE PROCEDURE ObtenerPromedioEdadPorDepartamento
AS
BEGIN
    SELECT d.NombreDepartamento, AVG(e.Edad) as PromedioEdad
    FROM Empleados e
    INNER JOIN Departamentos d ON e.Departamento = d.NombreDepartamento
    GROUP BY d.NombreDepartamento;
END;
GO
EXEC ObtenerPromedioEdadPorDepartamento;
EXEC ObtenerInfoEmpleado @NumeroEmpleado = 2;
EXEC DarDeBajaEmpleado @Apellido = 'Gómez';
select * from Empleados;


EXEC InsertarNuevoDepartamento @NombreDepartamento = 'IT';




