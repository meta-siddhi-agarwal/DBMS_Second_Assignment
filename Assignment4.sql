SHOW DATABASES;

USE StoreFont;

CREATE TABLE State(Id INT PRIMARY KEY, StateName VARCHAR(20) UNIQUE KEY NOT NULL);

CREATE TABLE City(StateId INT, CityId INT PRIMARY KEY, Name VARCHAR(20) NOT NULL, FOREIGN KEY(StateId) 
REFERENCES State(Id));

CREATE TABLE ZipCode(CityId INT, Code VARCHAR(10), FOREIGN KEY(CityId) REFERENCES City(CityId));

INSERT INTO State (Id, StateName) VALUES 
(1, 'California'),
(2, 'Texas'),
(3, 'New York'),
(4, 'Florida'),
(5, 'Illinois'),
(6, 'Ohio'),
(7, 'Georgia'),
(8, 'Pennsylvania'),
(9, 'Michigan'),
(10, 'North Carolina'),
(11, 'New Jersey'),
(12, 'Virginia'),
(13, 'Washington'),
(14, 'Massachusetts'),
(15, 'Arizona');

INSERT INTO City (StateId, CityId, Name) VALUES 
(1, 101, 'Los Angeles'),
(1, 102, 'San Francisco'),
(1, 103, 'San Diego'),
(2, 201, 'Houston'),
(2, 202, 'Austin'),
(2, 203, 'Dallas'),
(3, 301, 'New York City'),
(3, 302, 'Buffalo'),
(3, 303, 'Rochester'),
(4, 401, 'Miami'),
(4, 402, 'Orlando'),
(4, 403, 'Tampa'),
(5, 501, 'Chicago'),
(5, 502, 'Springfield'),
(5, 503, 'Naperville'),
(6, 601, 'Columbus'),
(6, 602, 'Cleveland'),
(7, 701, 'Atlanta'),
(7, 702, 'Savannah');

INSERT INTO ZipCode (CityId, Code) VALUES 
(101, '90001'),
(102, '94101'),
(103, '92101'),
(201, '77001'),
(202, '73301'),
(203, '75201'),
(301, '10001'),
(302, '14201'),
(303, '14604'),
(401, '33101'),
(402, '32801'),
(403, '33601'),
(501, '60601'),
(502, '62701'),
(503, '60540'),
(601, '43201'),
(602, '44101'),
(701, '30301'),
(702, '31401');

SELECT Code AS ZipCode, Name AS CityName, StateName 
FROM ZipCode,City,State 
WHERE ZipCode.CityId=City.CityId
AND City.StateId=State.Id
ORDER BY StateName AND Name;
