CREATE DATABASE
	customers;
    
SELECT
	*
FROM
	data_customer;

DESCRIBE data_customer;

-- 1. Manakah Customer ID yang paling lama telah menjadi customer? (pakai Dt_Customer untuk menentukannya)
-- 1.a. menonaktifkan "safe update mode"
SET SQL_SAFE_UPDATES = 0;

-- 1.b. tambahkan kolom baru dengan tipe data tanggal
ALTER TABLE data_customer
ADD COLUMN new_Dt_Customer DATE;

-- 1.c. update kolom baru dengan nilai tanggal dari kolom lama
UPDATE data_customer
SET new_Dt_Customer = STR_TO_DATE(Dt_Customer, '%d-%m-%Y');

-- 1.d. menampilkan top 3 Customer ID yang paling lama telah menjadi customer dalam hari
SELECT
    ID,
    Dt_Customer,
    DATEDIFF(CURDATE(), new_Dt_Customer) AS hari_lama_berlangganan
FROM
    data_customer
ORDER BY
    hari_lama_berlangganan DESC
LIMIT 3;

-- 1.e. dalam tahun
SELECT
    ID,
    Dt_Customer,
    DATEDIFF(CURDATE(), new_Dt_Customer) / 365.25 AS tahun_lama_berlangganan
FROM
    data_customer
ORDER BY
    tahun_lama_berlangganan DESC
LIMIT 3;

-- 2.	Manakah Customer ID yang berusia paling tua?
SELECT
    ID,
    Year_Birth,
    YEAR(CURDATE()) - Year_Birth AS customer_age
FROM
    data_customer
ORDER BY
    customer_age DESC;
