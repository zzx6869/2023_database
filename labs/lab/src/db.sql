DROP DATABASE IF EXISTS BANK_MANAGEMENT;

CREATE DATABASE BANK_MANAGEMENT;

USE BANK_MANAGEMENT;

DROP TABLE IF EXISTS Bank;

DROP TABLE IF EXISTS Transaction;

DROP TABLE IF EXISTS Staff;

DROP TABLE IF EXISTS Account;

DROP TABLE IF EXISTS Customer;

CREATE TABLE Bank(
    ID VARCHAR(8) PRIMARY KEY
);

CREATE Table Customer (
    Name VARCHAR(20) PRIMARY KEY,
    BirthDay DATE,
    TeleNum VARCHAR(11)
);

CREATE TABLE Staff(
    ID VARCHAR(8) PRIMARY KEY,
    BankID VARCHAR(8),
    Password VARCHAR(20), 
    Name VARCHAR(20),
    TeleNum VARCHAR(11),
    Foreign Key (BankID) REFERENCES Bank(ID)
);

CREATE Table Account (
    ID VARCHAR(8) PRIMARY KEY,
    CustomerName VARCHAR(20),
    BankID VARCHAR(8),
    HeadShot VARCHAR(20),
    Password VARCHAR(20),
    Balance INT,
    Foreign Key (CustomerName) REFERENCES Customer(Name),
    Foreign Key (BankID) REFERENCES Bank(ID)
);

CREATE Table Transaction (
    ID VARCHAR(8) PRIMARY KEY,
    AccountID VARCHAR(8), 
    StaffID VARCHAR(8),
    Type INT,
    Amount INT,
    Foreign Key (AccountID) REFERENCES Account(ID),
    Foreign Key (StaffID) REFERENCES Staff(ID)
);

DROP PROCEDURE IF EXISTS register;

CREATE Procedure register(IN name VARCHAR(20), Birthday DATE, TeleNum VARCHAR(11), 
                    BankID VARCHAR(8), HeadShot VARCHAR(20), Password VARCHAR(20), OUT NextID VARCHAR(8))
BEGIN
IF NOT EXISTS (SELECT * FROM Customer WHERE Customer.Name = name) THEN
    INSERT INTO Customer value(name, Birthday, TeleNum);
END IF;
SELECT @tmp := COUNT(ID) FROM Account;
SELECT @nextID := CAST(@tmp AS CHAR);
INSERT INTO Account value(@nextID, name, BankID, HeadShot, Password, 0);
SET NextID = @nextID;
END;

DROP PROCEDURE IF EXISTS ChangeName;

CREATE Procedure ChangeName(IN oldName VARCHAR(20), newName VARCHAR(20))
BEGIN
SET FOREIGN_KEY_CHECKS = 0;
UPDATE Customer SET Name = newName WHERE Customer.Name = oldName;
UPDATE Account SET CustomerName = newName WHERE Account.CustomerName = oldName;
SET FOREIGN_KEY_CHECKS = 1;
END;
