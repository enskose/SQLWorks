-- PostreSQL Değişken Tanımlama
DO $$ 
DECLARE
    -- Değişken tanımlamaları
    sayi1 int := 10;
    sayi2 int := 20;
    toplam int;
    isim varchar(50) := 'Enes';
    dogumtarihi date := '1990-01-01';
BEGIN
    -- Değişkenlere değer atama
    toplam := sayi1 + sayi2;

    -- Değişkenleri ekrana yazdırma
    RAISE NOTICE 'Sayi1: %, Sayi2: %, Toplam: %', sayi1, sayi2, toplam;
    RAISE NOTICE 'Isim: %, Dogum Tarihi: %', isim, dogumtarihi;

    -- Alternatif olarak, SELECT ile çıktı alma
    PERFORM sayi1, sayi2, toplam, isim, dogumtarihi;
END $$;