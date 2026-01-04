-- =============================================
-- DATABASE: f1_telemetry (Port 5433)
-- TYPE: Transactional Data
-- =============================================

DROP TABLE IF EXISTS races;
CREATE TABLE races (
    raceId INT PRIMARY KEY,
    year INT,
    round INT,
    circuitId INT, -- Logic FK: trỏ sang DB Logistics
    name VARCHAR(255),
    date DATE,
    time TIME,
    url VARCHAR(255),
    fp1_date DATE,
    fp1_time TIME,
    fp2_date DATE,
    fp2_time TIME,
    fp3_date DATE,
    fp3_time TIME,
    quali_date DATE,
    quali_time TIME,
    sprint_date DATE,
    sprint_time TIME
);

DROP TABLE IF EXISTS status;
CREATE TABLE status (
    statusId INT PRIMARY KEY,
    status VARCHAR(255)
);

DROP TABLE IF EXISTS results;
CREATE TABLE results (
    resultId INT PRIMARY KEY,
    raceId INT, 
    driverId INT, -- Logic FK: trỏ sang DB Logistics
    constructorId INT, -- Logic FK: trỏ sang DB Logistics
    number INT,
    grid INT,
    position INT,
    positionText VARCHAR(255),
    positionOrder INT,
    points FLOAT,
    laps INT,
    time VARCHAR(255),
    milliseconds INT,
    fastestLap INT,
    rank INT,
    fastestLapTime VARCHAR(255),
    fastestLapSpeed VARCHAR(255),
    statusId INT
);

DROP TABLE IF EXISTS sprint_results;
CREATE TABLE sprint_results (
    resultId INT PRIMARY KEY,
    raceId INT,
    driverId INT,
    constructorId INT,
    number INT,
    grid INT,
    position INT,
    positionText VARCHAR(255),
    positionOrder INT,
    points FLOAT,
    laps INT,
    time VARCHAR(255),
    milliseconds INT,
    fastestLap INT,
    fastestLapTime VARCHAR(255),
    statusId INT
);

DROP TABLE IF EXISTS qualifying;
CREATE TABLE qualifying (
    qualifyId INT PRIMARY KEY,
    raceId INT,
    driverId INT,
    constructorId INT,
    number INT,
    position INT,
    q1 VARCHAR(255),
    q2 VARCHAR(255),
    q3 VARCHAR(255)
);

DROP TABLE IF EXISTS lap_times;
CREATE TABLE lap_times (
    raceId INT,
    driverId INT,
    lap INT,
    position INT,
    time VARCHAR(255),
    milliseconds INT,
    PRIMARY KEY (raceId, driverId, lap)
);

DROP TABLE IF EXISTS pit_stops;
CREATE TABLE pit_stops (
    raceId INT,
    driverId INT,
    stop INT,
    lap INT,
    time VARCHAR(255),
    duration VARCHAR(255),
    milliseconds INT,
    PRIMARY KEY (raceId, driverId, stop)
);