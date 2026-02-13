-- Orjinal cedvelin kopyasini aliriq.﻿
SELECT *
INTO SalesData_Cleaned
FROM Raw_Sales_Data;  


-- 'payment_method' sütununda boşluqların silinməsi və formatın eyniləşdirilməsi
-- Məsələn: ' cod ', 'COD', 'cod' hamısı 'COD' olacaq.
UPDATE SalesData_Cleaned
SET payment_method = UPPER(TRIM(payment_method)),
    category_name_1 = TRIM(category_name_1),
    BI_Status = TRIM(BI_Status);

-- Endirim məbləği boşdursa (NULL), onu 0 ilə əvəz edirik.
UPDATE SalesData_Cleaned
SET discount_amount = ISNULL(discount_amount, 0)
WHERE discount_amount IS NULL;

-- Kateqoriya adı yoxdursa 'Unknown' yazırıq
UPDATE SalesData_Cleaned
SET category_name_1 = 'Unknown'
WHERE category_name_1 IS NULL OR category_name_1 = '';

-- Tarix formatının doğruluğunu yoxlayırıq və yalnız tarixi saxlayırıq (saatsız)
ALTER TABLE SalesData_Cleaned
ALTER COLUMN Working_Date DATE;

-- Total_Sales sütununun riyazi olaraq düzgünlüyünü təmin edirik
-- Düstur: (Qiymət * Say) - Endirim
UPDATE SalesData_Cleaned
SET Total_Sales = (price * qty_ordered) - discount_amount;

-- Qiymət və ya sifariş sayı mənfi ola bilməz. Bu sətirləri silirik və ya ayrıca cədvələ atırıq.
DELETE FROM SalesData_Cleaned
WHERE price < 0 OR qty_ordered <= 0;

--  Dublikatların (Təkrarlanan Sətirlərin) Silinməsi
WITH CTE_Duplicates AS (
    SELECT *,
           ROW_NUMBER() OVER (
               PARTITION BY item_id, Working_Date, price, qty_ordered, payment_method 
               ORDER BY item_id
           ) AS RowNum
    FROM SalesData_Cleaned
)
DELETE FROM CTE_Duplicates
WHERE RowNum > 1;


SELECT * FROM SalesData_Cleaned;
