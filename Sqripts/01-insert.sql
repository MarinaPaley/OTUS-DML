USE Example;
--DELETE FROM OrderLines;
--DELETE FROM Products;

INSERT INTO Products VALUES
 (1, N'Молоко')
,(2, N'Кефир')
,(3, N'Творог')
,(4, N'Сыр');

SELECT *
FROM Products
ORDER BY ID;

GO
--CONSTRAINT PK
INSERT INTO Products VALUES
 (1, N'Масло');
 GO
 --CONSTRAINT UNIQUE
INSERT INTO Products VALUES
 (5, N'Молоко');
 GO
 --SET VALUE IN NVARCHAR() Field
INSERT INTO Products VALUES
  (5, 'Масло');
  --SELECT
INSERT INTO Products VALUES
  (6, '油');

SELECT *
FROM Products
ORDER BY ID;

INSERT INTO Products VALUES
  (7, N'油');

SELECT *
FROM OrderLines;

INSERT INTO OrderLines VALUES
 (1, 1, 10, GETDATE(), 100)
,(2, 2, 20, GETDATE(), 200)
,(3, 3, 30, GETDATE(), 300)
,(4, 4, 40, GETDATE(), 400)
,(5, 5, 50, GETdATE(), 500);

--FK
INSERT INTO OrderLines VALUES
 (6, 100, 10, GETDATE(), 100);

 USE WideWorldImporters;

---INSERT INTO---
SELECT *
FROM Warehouse.Colors;

INSERT INTO Warehouse.Colors
	( ColorId
    , ColorName
    , LastEditedBy)
VALUES
	(NEXT VALUE FOR Sequences.ColorID
    , N'Серобуромалиновый'
    , 1);

SELECT *
FROM [Application].Countries;

INSERT INTO Application.Countries
    ( CountryID
    , CountryName
    , FormalName
    , IsoAlpha3Code
    , IsoNumericCode
    , CountryType
    , LatestRecordedPopulation
    , Continent
    , Region
    , Subregion
    , LastEditedBy)
VALUES
    ( NEXT VALUE FOR Sequences.CountryID
    , N'Луна'
    , N'Спутник планеты Земля'
    , 'MON'
    , 895
    , 'UN Member State'
    , 0
    , N'Вне Земли'
    , N'Вне Земли'
    , N'Вне Земли'
    , 1);

----USING Varibles
DECLARE 
	@colorId INT, 
	@LastEditedBySystemUser INT,
	@SystemUserName NVARCHAR(50) = 'Data Conversion Only'
		
SET @colorId = NEXT VALUE FOR Sequences.ColorID;

SELECT @LastEditedBySystemUser = PersonID
FROM [Application].People
WHERE FullName = @SystemUserName;

INSERT INTO Warehouse.Colors
	(ColorId, ColorName, LastEditedBy)
VALUES
	(@colorId, N'Фиолетовый', @LastEditedBySystemUser);

--ВОПРОСЫ?----