/* File: data_quality_checks.sql
   Mục tiêu: Kiểm tra dữ liệu F1 sau khi transform 
*/

-- 1. Kiểm tra Trùng lặp Khóa chính (Primary Key Uniqueness)
-- Bảng fact_race_results có cột resultid là khóa chính, không được trùng.
SELECT resultid, COUNT(*)
FROM fact_race_results
GROUP BY resultid
HAVING COUNT(*) > 1;

-- 2. Kiểm tra Toàn vẹn Khóa ngoại (Foreign Key Integrity)
-- Kiểm tra xem có driverid nào trong bảng Fact mà KHÔNG tồn tại trong bảng Dim Drivers không.
SELECT f.resultid, f.driverid
FROM fact_race_results f
LEFT JOIN dim_drivers d ON f.driverid = d.driverid
WHERE d.driverid IS NULL;

-- Kiểm tra raceid có tồn tại trong bảng Dim Races không.
SELECT f.resultid, f.raceid
FROM fact_race_results f
LEFT JOIN dim_races r ON f.raceid = r.raceid
WHERE r.raceid IS NULL;

-- 3. Kiểm tra Giá trị NULL (Null Value Checks)
-- Các cột quan trọng như driverid, raceid, constructorid không được phép NULL.
SELECT resultid, driverid, raceid, constructorid
FROM fact_race_results
WHERE driverid IS NULL 
   OR raceid IS NULL 
   OR constructorid IS NULL;

-- 4. Kiểm tra Logic Nghiệp vụ (Business Logic Validation)
-- Logic 1: Điểm số (points) không được là số âm.
SELECT resultid, points
FROM fact_race_results
WHERE points < 0;

-- Logic 2: Thứ hạng (positionorder) phải lớn hơn 0.
SELECT resultid, positionorder
FROM fact_race_results
WHERE positionorder <= 0;

-- Logic 3: Số vòng đua (laps) không được âm.
SELECT resultid, laps
FROM fact_race_results
WHERE laps < 0;