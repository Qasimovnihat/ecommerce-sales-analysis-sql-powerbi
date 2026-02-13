🛒 E-Ticarət Satış Analizi: SQL-dən Power BI-a End-to-End Layihə
Bu layihədə mən xam e-ticarət satış məlumatlarını (raw data) götürərək, onları SQL-də təmizləmişəm və sonda Power BI-da interaktiv bir dashboard hazırlamışam. 
Məqsədim datadakı qeyri-dəqiqlikləri aradan qaldırmaq və biznes üçün önəmli olan KPI-ları vizuallaşdırmaqdır.

🚀 Layihənin Mərhələləri
1. SQL ilə Data Cleaning (Məlumatların Təmizlənməsi)
İlk öncə SQL Server istifadə edərək datanı analizə hazır vəziyyətə gətirdim. Şəkildə gördüyünüz xam datada bəzi problemlər var idi ki, onları aşağıdakı üsullarla həll etdim:

Standardizasiya: payment_method sütununda olan kiçik-böyük hərf fərqlərini və lazımsız boşluqları (TRIM) təmizlədim.

Tarix Formatı: Working_Date sütununu analiz üçün daha uyğun olan standart DATE formatına çevirdim.

Riyazi Doğruluq: Total_Sales sütununu (price * qty_ordered) - discount_amount məntiqi ilə yenidən hesablayaraq datanın dürüstlüyünü təmin etdim.

Dublikatların Silinməsi: CTE və ROW_NUMBER() funksiyalarından istifadə edərək təkrarlanan saxta sətirləri təmizlədim.

2. Power BI ilə Vizuallaşdırma və Analiz
Təmizlənmiş datanı Power BI-a daxil edərək "Satış Performansı və Endirim Analizi" dashboard-unu qurdum.

Dashboard-da nələri görə bilərsiniz?

Ümumi Satış (1bn): Şirkətin əldə etdiyi toplam gəlir.

Toplam Endirim (35M): Müştərilərə tətbiq edilən güzəştlərin ümumi həcmi.

Kateqoriya Analizi: Hansı məhsul qruplarında (Mobiles, Appliances, Fashion və s.) daha çox endirim edildiyini və hansı kateqoriyanın daha çox gəlir gətirdiyini görə bilərsiniz.

Ödəniş Metodları: Müştərilərin ən çox hansı ödəniş növünə (COD, Easypay və s.) üstünlük verdiyinin analizi.

Zaman Trendi: Aylara görə satışın dinamikası.

🛠 İstifadə Etdiyim Texnologiyalar
Database: SQL Server

Data Visualization: Power BI Desktop

Version Control: Git & GitHub Desktop


LinkedIn: https://www.linkedin.com/in/nihat-qasimov-ab4408393?utm_source=share&utm_campaign=share_via&utm_content=profile&utm_medium=android_app

Email: gasimov.niihat@gmail.com
