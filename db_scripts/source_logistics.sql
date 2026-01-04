-- =============================================
-- DATABASE: f1_logistics (Port 5434)
-- TYPE: Reference / Master Data
-- =============================================

DROP TABLE IF EXISTS circuits;
CREATE TABLE circuits (
    circuitId INT PRIMARY KEY,
    circuitRef VARCHAR(255),
    name VARCHAR(255),
    location VARCHAR(255),
    country VARCHAR(255),
    lat FLOAT,
    lng FLOAT,
    alt INT,
    url VARCHAR(255)
);

DROP TABLE IF EXISTS constructors;
CREATE TABLE constructors (
    constructorId INT PRIMARY KEY,
    constructorRef VARCHAR(255),
    name VARCHAR(255),
    nationality VARCHAR(255),
    url VARCHAR(255)
);

DROP TABLE IF EXISTS drivers;
CREATE TABLE drivers (
    driverId INT PRIMARY KEY,
    driverRef VARCHAR(255),
    number INT,
    code VARCHAR(10),
    forename VARCHAR(255),
    surname VARCHAR(255),
    dob DATE,
    nationality VARCHAR(255),
    url VARCHAR(255)
);

DROP TABLE IF EXISTS seasons;
CREATE TABLE seasons (
    year INT PRIMARY KEY,
    url VARCHAR(255)
);