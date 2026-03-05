CREATE DATABASE restoran_app;

USE restoran_app;

CREATE TABLE il (
	il_id INT AUTO_INCREMENT PRIMARY KEY,
	il_ad VARCHAR(100) NOT NULL
);

CREATE TABLE kategori (
	kategori_id INT AUTO_INCREMENT PRIMARY KEY,
	kategori_ad VARCHAR(100) NOT NULL
);

CREATE TABLE admin(
	admin_id INT AUTO_INCREMENT PRIMARY KEY,
	ad VARCHAR(50) NOT NULL,
	sifre VARCHAR(50) NOT NULL
);

CREATE TABLE restoran (
    restoran_id INT AUTO_INCREMENT PRIMARY KEY,
    restoran_ad VARCHAR(200) NOT NULL,
    adres VARCHAR(255),
    kategori_id INT,
    il_id INT,
    ortalama_puan DECIMAL(3,2) DEFAULT 0,
    puan_sayisi INT DEFAULT 0,
    FOREIGN KEY (kategori_id) REFERENCES kategori(kategori_id),
    FOREIGN KEY (il_id) REFERENCES il(il_id)
);

CREATE TABLE kullanici (
    kullanici_id INT AUTO_INCREMENT PRIMARY KEY,
    kullanici_ad VARCHAR(100)
);

CREATE TABLE puan (
	puan_id INT AUTO_INCREMENT PRIMARY KEY,
	restoran_id INT,
	kullanici_id INT,
	UNIQUE (kullanici_id, restoran_id),
	puan DOUBLE NOT NULL,
	FOREIGN KEY (kullanici_id) REFERENCES kullanici(kullanici_id),
	FOREIGN KEY (restoran_id) REFERENCES restoran(restoran_id) ON DELETE CASCADE
);

INSERT INTO il(il_ad) VALUES ('İstanbul'), ('Ankara'), ('Giresun'), ('Ordu'), ('Trabzon');

INSERT INTO kategori(kategori_ad) VALUES ('Kahvaltı'), ('Tatlı'), ('Restoran');

INSERT INTO kullanici (kullanici_ad)
VALUES ('Azra'), ('Büşra');

INSERT INTO restoran (restoran_ad, adres, kategori_id, il_id, ortalama_puan)
VALUES 
( 'Yiğit Sofram Gözleme ve Kahvaltı', 'Kılıçalipaşa Mahallesi Sıraselviler Caddesi, Yeni Yuva Sk. 31 A, 34433 Beyoğlu/İstanbul, Türkiye', 1, 1, 4.8),
( 'Limon Kahvaltı Evi', 'Firuzağa, Palaska Sk. No:3/A, 34000 Beyoğlu/İstanbul, Türkiye', 1, 1, 4.8),
( 'Serpmece Kahvaltı & Tatlı', 'Hobyar, Hamidiye Türbesi Sk. No:5, 34112 Fatih/İstanbul, Türkiye', 1, 1, 4.8),
( 'Limon Kahvaltı - Galata', 'Müeyyetzade, Tatar Beyi Sk. no:19, 34425 Beyoğlu/İstanbul, Türkiye', 1, 1, 4.8),
( 'Sa Va Anatolian Breakfast House', 'Cihangir, Bakraç Sk. No: 34 A D:B, 34433 Beyoğlu/İstanbul, Türkiye', 1, 1, 4.8),
( 'Efsane Kahvaltı', 'Sarıdemir, Ragıp Gümüşpala Cd. Kantarcılar Camii Altı No:25/4, 34134 Fatih/İstanbul, Türkiye', 1, 1, 4.8),
( 'Galaktos Gurme Restomarket', 'Arap Cami, Tersane Cd. No:62, 34421 Beyoğlu/İstanbul, Türkiye', 1, 1, 4.8),
( 'Doğacıyız Gourmet Breakfast Restaurant', 'Kılıçali Paşa, Akarsu Ykş. Sok. No: 41A, 34433 Beyoğlu/İstanbul, Türkiye', 1, 1, 4.7),
( 'Van Kahvaltı Evi', 'Kılıçali Paşa, Defterdar Ykş. 52/A, 34425 Beyoğlu/İstanbul, Türkiye', 1, 1, 4.6),
( 'Bi Kahvalti', 'Sinanpaşa Mahallesi Ihlamurdere Cad, Çelebi Oğlu Sk. No:21-23/B, 34353 Beşiktaş/İstanbul, Türkiye', 1, 1, 4.6),
( 'Yeşil Orman Kahvaltı - Izgara - Pide', 'Mithatpaşa, Selanik Blv. no141, 34075 Eyüpsultan/İstanbul, Türkiye', 1, 1, 4.6),
( 'Hadika Kahvaltı Evi', 'Meşrutiyet, Ebe Kızı Sokağı No: 16/40, 34363 Şişli/İstanbul, Türkiye', 1, 1, 4.5),
( 'Ethem Efendi Breakfast', 'Erenköy, Ethem Efendi Cd. No:50, 34738 Kadıköy/İstanbul, Türkiye', 1, 1, 4.5),
( 'Samatya Cafe & Van Kahvaltı Salonu', 'Sahil Şeridi, Kocamustafapaşa Mahallesi Kennedy Cad, Narlıkapı Cd. No :1, 34098 Fatih/İstanbul, Türkiye', 1, 1, 4.5),
( 'Saranın Bahçesi Kahvaltı', 'İcadiye Mahallesi, Kuzguncuk, İcadiye Cd. No: 144, 34674 Üsküdar/İstanbul, Türkiye', 1, 1, 4.5),
('Hafız Mustafa 1864 Galataport', 'İç Kapı No:, Kılıçali Paşa, Meclis-i Mebusan Cd. No: 8 D:102 K1 Blok, 34433 Beyoğlu/İstanbul, Türkiye', 2, 1, 4.9),
('Vanilya Tadı | Catering | İstanbul Kurumsal Tatlı Servisi', 'Aydınevler, Albay Karaoğlanoğlu Sk. no:12/c, 34854 Maltepe/İstanbul, Türkiye', 2, 1, 4.9),
('Hafız Mustafa 1864 Beyazıt', 'Mimar Hayrettin, Yeniçeriler Cd. No: 39 /1, 34110 Fatih/İstanbul, Türkiye', 2, 1, 4.8),
('Rumeli Balkan tatlıcısı', 'Alemdar, Himaye-İ Eftal Sk., 34110 Fatih/İstanbul, Türkiye', 2, 1, 4.8),
('Hafiz Mustafa 1864', 'Hoca Paşa, Muradiye Cd. No:51, 34080 Fatih/İstanbul, Türkiye', 2, 1, 4.7),
('Hafız Mustafa', 'Binbirdirek, Divan Yolu Cd. No:14, 34110 Fatih/İstanbul, Türkiye', 2, 1, 4.7),
('Hafiz Mustafa 1864', 'Mimar Sinan Hakimiyeti Milliye Cd. &, Atlas Çk. No:42, 34672 Üsküdar/İstanbul, Türkiye', 2, 1, 4.6),
('Sultan Tatlısı Uluslararası / YusufPaşa', 'Topkapı, Millet Cd. NO: 22a, 34093 Fatih/İstanbul, Türkiye', 2, 1, 4.6),
('Beyzade Künefe & Kahvaltı Karaköy', 'Kemankeş Karamustafa Paşa, Maliye Cd. NO:10/A, 34425 Beyoğlu/İstanbul, Türkiye', 2, 1, 4.5),
('Confectioner Cafer Erol', 'Osmanağa, Yasa Cd. No:19, 34714 Kadıköy/İstanbul, Türkiye', 2, 1, 4.5),
('Tatlı Dükkanı', 'Zafer mahallesi haramidere yolu caddesi İstanbul Prestij Park evleri, A6 BLOK, 34513 Esenyurt/İstanbul, Türkiye', 2, 1, 4.5),
('Karaköy Güllüoğlu - Nadir Güllü', 'Kemankeş Karamustafa Paşa, Kemankeş Cd. No:67, 34425 Beyoğlu/İstanbul, Türkiye', 2, 1, 4.4),
('Sakarya Tatlıcısı', 'Hüseyinağa, Dudu Odaları Sk. No:3, 34435 Beyoğlu/İstanbul, Türkiye', 2, 1, 4.4),
('Halef', 'Teşvikiye, Osman F. Seden Sk. No:4/A, 34365 Şişli/İstanbul, Türkiye', 2, 1, 4.4),
('J^adore Chocolatier', 'Asmalı Mescit, Emir Nevruz Sk. No:22 D:F, 34421 Beyoğlu/İstanbul, Türkiye', 2, 1, 4.3),
('Golden Horn Terrace Restaurant', 'Binbirdirek, Binbirdirek Meydanı Sok. No:1, 34400 Fatih/İstanbul, Türkiye', 3, 1, 5.0),
('Garden 1897 Restaurant', 'Inside of Garden House Hotel, Küçük Ayasofya, Şht. Mehmet Paşa Sk. No5, 34122 Fatih/İstanbul, Türkiye', 3, 1, 4.9),
('Mivan Restaurant & Cafe', 'Emin Sinan, Piyer Loti Cd. No:34, 34130 Fatih/İstanbul, Türkiye', 3, 1, 4.9),
('Istanbul Anatolian Cuisine', 'Küçük Ayasofya, Cami Sk. No:7, 34122 Fatih/İstanbul, Türkiye', 3, 1, 4.9),
('Pleasure terrace roof top restaurant', 'Hoca Paşa, Hüdavendigar Cd. No:4 Kat:5, 34112 Fatih/İstanbul, Türkiye', 3, 1, 4.9),
('Food Palace 1981 Anatolian Restaurant', 'Binbirdirek, Peykhane Cd. No: 18, 34122 Fatih/İstanbul, Türkiye', 3, 1, 4.9),
('Marmara View Terrace Restaurant', 'Cankurtaran, Dalbastı Sk. No:13 F:5, 34122 Fatih/İstanbul, Türkiye', 3, 1, 4.9),
('Glamour Rooftop Restaurant', 'Hoca Paşa, Vezir Cami Çk. No:8, 34110 Fatih/İstanbul, Türkiye', 3, 1, 4.9),
('The Ottomans Kitchen Cafe Restaurant', 'Sultan Ahmet, Akbıyık Cd. No:70, 34122 Fatih/İstanbul, Türkiye', 3, 1, 4.9),
('Luco Restaurant Rooftop Sirkeci', 'Hoca Paşa, Ebussuud Cd. No:21, 34112 Fatih/İstanbul, Türkiye', 3, 1, 4.9),
('Dimbil Restaurant', 'Küçük Ayasofya, Kadırga Limanı Cd. No:112, 34122 Fatih/İstanbul, Türkiye', 3, 1, 4.8),
('Massa Bistro', 'Hacıtahsibey sk alemdar mh no 11 a, Sultanahmet near tramway station İstanbul, 34110 Fatih/İstanbul, Türkiye', 3, 1, 4.8),
('Turgut Kebab Restaurant -Sultanahmet-', 'Sultan Ahmet, Akbıyık Cd. No:64, 34122 Fatih/İstanbul, Türkiye', 3, 1, 4.8),
('Ararat Terrace Restaurant & Rooftop', 'Sultan Ahmet, Torun Sk. no : 3 D:101, 34400 Fatih/İstanbul, Türkiye', 3, 1, 4.8),
('Roof Mezze 360 Restaurant', 'Seres old city hotel, Hoca Paşa, Hüdavendigar Cd. No:25, 34420 Fatih/İstanbul, Türkiye', 3, 1, 4.7),

('OTTO FİLOTTO', 'Kızılırmak, Muhsin Yazıcıoğlu Cd. No: 25/A, 06510 Çankaya/Ankara, Türkiye', 1, 2, 4.5),
('Vitalen Cafe & Kahvaltı', 'Hacettepe, Kestane Cd. No:55, 06230 Altındağ/Ankara, Türkiye', 1, 2, 4.5),
('Eymir Uçurtmalı Bahçe', 'Yeşilkent, 555. Caddesi no:5, 06705 Çankaya/Ankara, Türkiye', 1, 2, 4.5),
('Van Kahvaltı Sarayı Ankara', 'Alacaatlı, 3381/2. Sk no:36/CK, 06810 Çankaya/Ankara, Türkiye', 1, 2, 4.4),
('Bahçe Miss Eymir', 'Dumlupınar, Eymir Gölü Yolu uzeri no 213, 06450 Çankaya/Ankara, Türkiye', 1, 2, 4.4),
('Kirit Cafe', 'Kale, Koyunpazarı Sk. No:60, 06101 Altındağ/Ankara, Türkiye', 1, 2, 4.3),
('Yeşilçam Turquoise Garden', 'Hacettepe, Sarıkadı Sk. 30 A, 06230 Altındağ/Ankara, Türkiye', 1, 2, 4.3),
('Sobalı Köşk', 'Kavaklıdere, John F. Kennedy Cd. 31/E, 06680 Çankaya/Ankara, Türkiye', 1, 2, 4.2),
('Zeytuni Ege Yöresel Ürünleri', 'Güvenevler, Güvenlik Cd. No:89 D:B, 06690 Çankaya/Ankara, Türkiye', 1, 2, 4.2),
('Deniz Kozanlı', 'Balgat Mah Ceyhun Atuf Kansu Cd. &, 1368. Sk. No:4, 06520 Çankaya/Ankara, Türkiye', 1, 2, 4.2),
('KAFES FIRIN', 'Söğütözü, Dumlupınar Blv. No:122, 06520 Çankaya/Ankara, Türkiye', 1, 2, 4.1),
('Hattena Hatay Sofrası', 'Nasuh Akar, Süleyman Hacıabdullahoğlu Cd. 41/A, 06520 Çankaya/Ankara, Türkiye', 1, 2, 4.1),
('Cafemiz', 'Gaziosmanpaşa, Arjantin Cd. no:19/1, 06300 Çankaya/Ankara, Türkiye', 1, 2, 4.1),
('Altınköy Açık Hava Müzesi Köy Kahvaltısı', 'Beşikkaya, 06360 Altındağ/Ankara, Türkiye', 1, 2, 4.1),
('Ayme Cafe Karadeniz Pide Evi', 'Kızılırmak Mahallesi 1450.sokak 3/D Ankara Ticaret Merkezi Çukurambar, 06530, 06510 Çankaya/Ankara, Türkiye', 1, 2, 4.1),
('Â La Lune Patisserie - Ankara (Kruvasan & Kahve)', 'Yukarı Bahçelievler, Oğuzhan Asiltürk Caddesi 22 A, 06790 Çankaya/Ankara, Türkiye', 2, 2, 4.8),
('Çikolata Evim Kızılay', 'Meşrutiyet Mahallesi, Selanik Cd No:35 D:1, 06420 Çankaya/Ankara, Türkiye', 2, 2, 4.7),
('EKLERİSTAN BEŞEVLER ÇANKAYA ANKARA', 'Mebusevleri, Dögol Cd. No:47, 06570 Çankaya/Ankara, Türkiye', 2, 2, 4.7),
('Kakule Fırın', 'Kavaklıdere, Büklüm Cd No:30 D:C, 06680 Çankaya/Ankara, Türkiye', 2, 2, 4.6),
('Dayı Künefe ve katmer', 'Balgat, Ziyabey Cd. No:45, 06520 Çankaya/Ankara, Türkiye', 2, 2, 4.6),
('Gaziantepli Erol Usta', 'Mahallesi, Şehit Cengiz Karaca, Sokullu Mehmet Paşa Cd. 180/B, 06460 Çankaya/Ankara, Türkiye', 2, 2, 4.5),
('Çikolata Evim Bahçelievler', 'Yukarı Bahçelievler, Aşkabat Cd. No:17 D:B, 06500 Çankaya/Ankara, Türkiye', 2, 2, 4.5),
('Hatun Pastanesi', '100. Yıl, Nenehatun Cd No:28 D:B, 06700 Çankaya/Ankara, Türkiye', 2, 2, 4.5),
('Simple Chocolate & Breakfast Bahçelievler', 'Yukarı Bahçelievler, 69. Sk. No:50, 06490 Çankaya/Ankara, Türkiye', 2, 2, 4.5),
('Senorita Chocolate Bahçelievler', 'Bahçelievler, Prof. Muammer Aksoy Cd No:76, 06490 Bahçelievler/Ankara, Türkiye', 2, 2, 4.5),
('Kanaviçe Çikolata', 'Altındağ Mahallesi, Hamamönü Sk. No:11, 06230 Altındağ/Ankara, Türkiye', 2, 2, 4.4),
('Damla Pastanesi', 'Anıttepe, Gençlik Cd. 91/D, 06570 Çankaya/Ankara, Türkiye', 2, 2, 4.4),
('Cake Art Homemade', 'Bahçelievler, 54. Cad. 15/B, 06490 Çankaya/Ankara, Türkiye', 2, 2, 4.4),
('ZEYN Chocolate', 'Kızılcaşar, Yavuz Sultan Selim Blv 7-A No:171, 06830 Gölbaşı/Ankara, Türkiye', 2, 2, 4.4),
('Figen Cafe & Patisserie', 'Fakülteler, Cemal Gürsel Cad. 62-A, 06590 Çankaya/Ankara, Türkiye', 2, 2, 4.3),
('Kooi Uzak Doğu Restoran', 'Hacettepe, Sarıkadı Sk. No:8, 06230 Altındağ/Ankara, Türkiye', 3, 2, 4.9),
('Kırlangıç Restaurant', 'Gaziosmanpaşa, Nenehatun Cd no : 64, 06680 Çankaya/Ankara, Türkiye', 3, 2, 4.8),
('Göksu Lokantaları - Kızılay', 'Kızılay, Bayındır-1 Sk. No: 22, 06410 Çankaya/Ankara, Türkiye', 3, 2, 4.7),
('Kuytu Meze&Balık Restaurant', 'Kavaklıdere, Bestekar Cd 6/D, 06680 Çankaya/Ankara, Türkiye', 3, 2, 4.7),
('L^avare Sokak', '16/1, Çankaya, Üsküp Cd., 06690 Çankaya/Ankara, Türkiye', 3, 2, 4.6),
('Trilye Restaurant', 'Kazım Özalp, Kuleli Sokağı No: 32, 06680 Çankaya/Ankara, Türkiye', 3, 2, 4.5),
('Nükteli', 'Osmanağa Konakları, Ümit, 2494/3. Sk. no 6, 06810 Çankaya/Ankara, Türkiye', 3, 2, 4.5),
('Nakia Restaurant', 'Çankaya, Çankaya Cd. No:1/A İç Kapı No:85, 06690 Çankaya/Ankara, Türkiye', 3, 2, 4.5),
('Göksu Restoran - Nenehatun', '100. Yıl, Nenehatun Cd No:5, 06700 Çankaya/Ankara, Türkiye', 3, 2, 4.4),
('Fige Restaurant', 'Çankaya Mahallesi, Eski, Prof. Dr Aziz Sancar Caddesi No:15, 06690 Çankaya/Ankara, Türkiye', 3, 2, 4.4),
('Kumsal Lokantası', 'Kazım Özalp Mah., .Nenehatun Cad No:97 Gaziosmanpaşa, Çankaya, 06700 Ankara, Türkiye', 3, 2, 4.4),
('Kıtır', 'Kavaklıdere Mah, Tunalı Hilmi Cd. No:114 D:K, 06680 Çankaya/Ankara, Türkiye', 3, 2, 4.4),
('Louise Cafe Brasserie & Loft', '100. Yıl, Filistin Cd. No:37, 06700 Çankaya/Ankara, Türkiye', 3, 2, 4.3),
('Bogazici Lokantasi', 'Ulus, Denizciler Cd. no 1/A, 06050 Altındağ/Ankara, Türkiye', 3, 2, 4.3),
('Tarihi Mutfak Lokantası', 'Kocatepe, Mithatpaşa Cd. No:64 D:B, 06420 Çankaya/Ankara, Türkiye', 3, 2, 4.3),

('DOĞAL RESTAURANT', 'Maden Mah.Atatürk Cad, Maden, 28340 Piraziz/Giresun, Türkiye', 1, 3, 4.9),
('Linarya Cafe', 'Kale, 28100 Giresun Merkez/Giresun, Türkiye', 1, 3, 4.8),
('Masal Bahçe', 'Kayadibi, Dağdibi Sk. No:22/1, 28100 Giresun Merkez/Giresun, Türkiye', 1, 3, 4.7),
('Gırıkbahçe', 'Kulakkaya, 28952 Dereli/Giresun, Türkiye', 1, 3, 4.7),
('BIG GRAN lounge', 'Karabedir, 28902 Keşap/Giresun, Türkiye', 1, 3, 4.6),
('Osmanoğlu Menemen Restoran (Çakallı Menemeni)', 'Erikliman, Atatürk Blv. No:621/A, 28200 Giresun Merkez/Giresun, Türkiye', 1, 3, 4.4),
('Giresun polisevi sosyal tesisleri', 'Teyyaredüzü, 28200 Giresun Merkez/Giresun, Türkiye', 1, 3, 4.3),
('ortakahve246', 'Samanlıkkıranı, Samanlıkkıranı Cd., 28100 Giresun Merkez/Giresun, Türkiye', 1, 3, 4.2),
('Hasbahçe', 'Seldeğirmeni, Şht. Ufuk Bingöl Sk. No:10, 28100 Giresun Merkez/Giresun, Türkiye', 1, 3, 4.1),
('BOHÇA MANTI (Giresun Merkez)', 'Kapu, Bekirpaşa Cd. No:13/A, 28100 Giresun Merkez/Giresun, Türkiye', 1, 3, 4.1),
('Ayvasil Ayhan Usta Restaurant', 'Teyyaredüzü Bahtiyar Aydın Cad. Otogar İçi No:3, 28200 Giresun Merkez/Giresun, Türkiye', 1, 3, 3.8),
('ÇAMCILAR SÜTLÜ KADAYIF & GÜLLAÇ TATLILARI', 'Hacı Hüseyin, Gazi Cd. No:163/A, 28950 Giresun Merkez/Giresun, Türkiye', 2, 3, 5.0),
('Lonca Bakery', 'Sultan Selim, Kazancılar Sk. No:12, 28100 Giresun Merkez/Giresun, Türkiye', 2, 3, 4.9),
('Halil Usta Balkaymak Dondurma', 'Çınarlar, Fevzi Paşa Cd. No:56/D, 28100 Giresun Merkez/Giresun, Türkiye', 2, 3, 4.8),
('Uğur Usta Hamsiköy Sütlaçları Giresun', 'Çıtlakkale, İnönü Cd. No:186/B, 28000 Giresun Merkez/Giresun, Türkiye', 2, 3, 4.7),
('Mustafa Patar Tel Kadayıf', 'Tavuk Dünyası, Hacımiktat Mahallesi Fatih Caddesi, karşısı No:21/B, 28100 Giresun Merkez/Giresun, Türkiye', 2, 3, 4.5),
('Algül Pastanesi', 'Teyyaredüzü, Boztekke Cd. No:38 Merkez, 28200 Giresun Merkez/Giresun, Türkiye', 2, 3, 4.4),
('Elmasım Pastahanesi', 'Teyyaredüzü, Önder Sk. No:1, 28200 Giresun Merkez/Giresun, Türkiye', 2, 3, 4.3),
('Chocolabs Giresun', 'Çıtlakkale, İnönü Cd. No:131/C, 28200 Giresun Merkez/Giresun, Türkiye', 2, 3, 4.2),
('Corylus Cafe & Patisserie', 'Çıtlakkale MAH. No:129 A-C (Carrefour KARŞISI, Çıtlakkale, İnönü Cd. No:129/J, 28200 Giresun Merkez/Giresun, Türkiye', 2, 3, 4.1),
('Boston Drink & Dessert', 'Çıtlakkale, İnönü Cd. No:185, 28200 Giresun Merkez/Giresun, Türkiye', 2, 3, 3.8),
('Ab-I Leziz Giresun', 'Prestij Apt, Teyyaredüzü, Boztekke Cd. No:79-81 A, 28200 Giresun Merkez/Giresun, Türkiye', 2, 3, 3.6),
('Giresun En iyi Restauratı GİSİAD', 'Kale, Eşref Dizdar Cd. no13, 28100 Giresun Merkez/Giresun, Türkiye', 3, 3, 4.6),
('Serender Reastaurant', 'Sultan Selim, Şaircan Sk. No:16, 28100 Giresun Merkez/Giresun, Türkiye', 3, 3, 4.5),
('Soray Balik Lokantasi', 'Yalıköy mevkii no:25/A, 28300 Bulancak/Giresun, Türkiye', 3, 3, 4.4),
('Ziyade Restaurant', 'Sultan Selim, Eski Yağcılar Sk. No:1, 28100 Giresun Merkez/Giresun, Türkiye', 3, 3, 4.4),
('KARACA RESTAURANT', 'Aksu, Pazar Cd. no:107/A, 28100 Giresun Merkez/Giresun, Türkiye', 3, 3, 4.4),
('MADO Giresun Merkez', 'Çıtlakkale, Saffet Beyazıtoğlu Sk. No:6, 28200 Giresun Merkez/Giresun', 3, 3, 4.3),
('haşlamacı giresun', 'hacısiyam mahallesi ataturk bulvarı bulut apt. 11/19 a, 28200 merkez/Giresun, Türkiye', 3, 3, 4.2),
('Efendi Restaurant', 'Yalı mahallesi Atatürk bulvarı No:80 GİRESUN, 28000 giresun/Giresun, Türkiye', 3, 3, 4.1),
('Hasbahçe', 'Seldeğirmeni, Şht. Ufuk Bingöl Sk. No:10, 28100 Giresun Merkez/Giresun, Türkiye', 3, 3, 4.1),
('Yıldız Kafe Restoran', 'Gaziler, Atatürk Blv. 26/3, 28200 Giresun Merkez/Giresun, Türkiye', 3, 3, 3.9),
('Big Bab Cafe & Restaurant', 'Hacımiktat Mah. Tabaklar sok, belediye no:1/201 kat:8 binası 8. kat, 28000 Giresun Merkez/Giresun, Türkiye', 3, 3, 3.6),
('GRAVA LOUNGE', 'Gaziler, Atatürk Blv. No:26/A, 28200 Giresun Merkez/Giresun, Türkiye', 3, 3, 3.5),

('Şahane Yöresel Kahvaltı Bahçesi', 'Kayabaşı, Çiftlik 77. Sokak no 3, 52200 Altınordu/Ordu, Türkiye', 1, 4, 4.8),
('KAVUŞ KAFE', 'Akyazı, Gazeteci Alaaddin Benal Cd. No:1/A, 52000 Altınordu/Ordu, Türkiye', 1, 4, 4.5),
('Keçiköy Avlu', 'Kirazlimanı, 52100 Altınordu/Ordu, Türkiye', 1, 4, 4.5),
('Kozza Boztepe', 'Orhaniye, Deveci Sokak No:34, 52100 Altınordu/Ordu, Türkiye', 1, 4, 4.4),
('Dafne Kafe Kahvaltı', 'Cumhuriyet, 1225. Sk. No:13/1, 52200 Altınordu/Ordu, Türkiye', 1, 4, 4.2),
('Atabeyoğlu Lezzet Çiftliği', 'Bahçelievler, Atatürk Blv. No:71, 52200 Ordu Merkez/Ordu, Türkiye', 1, 4, 4.1),
('Saklı Bahçe Çaytepe', 'SAKLIBAHÇE, Çaytepe, 52750 Perşembe/Ordu, Türkiye', 1, 4, 4.1),
('Kahvaltı Diyarı', 'Şarkiye, Süleyman Felek Cd. no:46, 52100 Altınordu/Ordu, Türkiye', 1, 4, 4.1),
('Digi''nin Yeri', 'Bahçelievler, 274. Sk. No:3, 52200 Ordu Merkez/Ordu, Türkiye', 1, 4, 4.1),
('Bulvar Cafe & Restoran', 'Bulvar Cafe & Restoran, 52200 Altınordu/Ordu, Türkiye', 1, 4, 3.9),
('Berliner Waffle Ordu', 'Süleyman Felek Cd. No:131/A, 52000 Altınordu/Ordu, Türkiy', 2, 4, 5.0),
('Helvacı Yakub Ordu', 'Şarkiye, Süleyman Felek Cd. no: 120/B, 52100 Altınordu/Ordu, Türkiye', 2, 4, 4.9),
('Aşk-ı Kumpir & Waffle', 'Bahçelievler, 282. Sk. No:2/B, 52200 Altınordu/Ordu, Türkiye', 2, 4, 4.9),
('Minimus Coffee & Bakery', 'Düz, Süleyman Felek Cd. no:8/A, 52100 Altınordu/Ordu, Türkiye', 2, 4, 4.8),
('Çikolata Evim Ordu', 'Düz, Atatürk Blv. No:108A, 52000 Altınordu/Ordu, Türkiye', 2, 4, 4.7),
('Tatlıcı Burhan usta', 'Yenimahalle, Kahraman Sağra Cd. 11/A, 52200 Altınordu/Ordu, Türkiye', 2, 4, 4.6),
('HacıZade1962', 'Düz, Alanarası Sk., 52100 Merkez/Ordu, Türkiye', 2, 4, 4.5),
('Boston Drink & Dessert', 'Bahçelievler, Mehmetçik Blv. No:22/A, 52200 Altınordu/Ordu, Türkiye', 2, 4, 4.5),
('Chocolabs Ordu', 'Akyazı, 822. Sk. No:2/B, 52200 Altınordu/Ordu, Türkiye', 2, 4, 4.4),
('Ballıoğlu Baklavaları Ordu', 'Yeni, İsmet Paşa Cd. No:35, 52200 Ordu Merkez/Ordu, Türkiye', 2, 4, 4.3),
('Müstesna Balık', 'Şirinevler, Atatürk Blv. No:326, 52200 Altınordu/Ordu, Türkiye', 3, 4, 4.9),
('Mersinli Ciğerci Cebo', 'Bahçelievler, Atatürk Blv. No:247/A, 52200 Altınordu/Ordu, Türkiye', 3, 4, 4.8),
('KÖK CAĞ KEBAP ORDU', 'Yeni, Atatürk Blv. 258 /A, 52200 Altınordu/Ordu, Türkiye', 3, 4, 4.7),
('Tabyabaşı Balık', 'Taşbaşı, Atatürk Blv. 70/A, 52200 Altınordu/Ordu, Türkiye', 3, 4, 4.6),
('Firuzende Ordu', 'Anemon Ordu Otel, Taşbaşı, Atatürk Blv. No:59, 52000 Altınordu/Ordu, Türkiye', 3, 4, 4.6),
('Derin Balık', 'Şarkiye, Yükçülük Sk. No:3, 52100 Altınordu/Ordu, Türkiye', 3, 4, 4.5),
('Müstesna Kebap', 'Şirinevler, Atatürk Blv. No:326, 52200 Altınordu/Ordu, Türkiye', 3, 4, 4.4),
('Big Chefs - Ordu Şubesi', 'Akyazı, 822. Sk. No:2, 52200 Altınordu/Ordu, Türkiye', 3, 4, 4.4),
('When Kitchen Brasserie Cafe Restaurant', 'Düz Mahalle, Süleyman Felek Caddesi No: 31/101 Wyspy Hotel Roof Altınordu, 52100 Merkez/Ordu, Türkiye', 3, 4, 4.3),
('NEVİZADE RESTORAN', 'Bahçelievler, 291 nolu sokak no:10, 52200 Altınordu/Ordu, Türkiye', 3, 4, 4.3),

('Livera Bir Asır Kahvaltı Evi', 'Cami Mahallesi, 61750 Maçka/Trabzon, Türkiye', 1, 5, 4.8),
('mavi köşk bahçe cafe restaurant', 'Kemerkaya mah. kunduracılar Caddesi 3200, nolu sokak No:5, 61200 Ortahisar/Trabzon, Türkiye', 1, 5, 4.8),
('Çınaraltı Restoran', 'Yenimahalle, Devlet Sahil Yolu Cd. No:269, 61040 Trabzon Merkez, 61040 Ortahisar/Trabzon, Türkiye', 1, 5, 4.7),
('TERRACE', 'Soğuksu, 1405 nolu sokak 6h, 61000 Ortahisar/Trabzon, Türkiye', 1, 5, 4.5),
('Zivera Köy Kahvaltısı ve Bungalov', 'Çamlıca, Camii Küme Evleri No:3, 61290 Yomra/Trabzon, Türkiye', 1, 5, 4.5),
('Asimer Kafe Ve Kahvaltı Salonu', '1 Nolu Bostancı, Yılmaz Sk., 61080 Ortahisar/Trabzon, Türkiye', 1, 5, 4.4),
('Seyrantepe Bahçe', 'Sarıtaş, Çamlık Sk. NO:61, 61300 Akçaabat/Trabzon, Türkiye', 1, 5, 4.4),
('Meşelik Bahçe Serpme Kahvaltı & Et Mangal', 'Çimenli mah. Kolej küme evler 33/1 Ramada otel kavş.1.5km Sosyal Bilimler Lisesi Yanı, 61000 Ortahisar/Trabzon, Türkiye', 1, 5, 4.4),
('Serpmeköy Trabzon Köy Kahvaltısı', '19 Mayıs, Şemsettin Günaltay Cd. No:96/A, 34742 Kadıköy/İstanbul, Türkiye', 1, 5, 4.4),
('Seyri Bahçe', 'Konaklar, Mustafa Alemdağ Cd., 61960 Ortahisar/Trabzon, Türkiye', 1, 5, 4.3),
('61 Platin Patisserie coffee', 'kemerkaya mahallesi gazipaşa caddesi, Balıkpazarı Sk. no: 2/a, 61000 Ortahisar/Trabzon, Türkiye', 2, 5, 4.9),
('Hacı Temel Baklava Lokum', 'İskenderpaşa Mah. Kunduracılar Cad. Sıramağazalar No:2/C, 61030 Ortahisar/Trabzon, Türkiye', 2, 5, 4.9),
('Sevgi Sultan Baklava&Lokum - Baklava - Lokum - Çikolata', 'Yeni Kadınlar Hali Çaprazı, Çarşı, Kahramanmaraş Cd. No:87 D:B, 61000 Ortahisar/Trabzon, Türkiye', 2, 5, 4.8),
('Jumbo Künefe Trabzon', 'Toklu, Devlet Sahil Yolu Cd. No:333A, 61040 Ortahisar/Trabzon, Türkiye', 2, 5, 4.6),
('Chocolabs Trabzon', 'Kalkınma, Farabi Cd. 12/B, 61080 Ortahisar/Trabzon, Türkiye', 2, 5, 4.6),
('Çikolata Evim Trabzon', 'Güven Apt, 2 Nolu Beşirli, Devlet Sahil Yolu Cd. No:425A, 61040 Ortahisar/Trabzon, Türkiye', 2, 5, 4.4),
('Beton Helva', 'Merkez Trabzon TR, Gazipaşa, Uzun Sk. No:13, 61000 Ortahisar/Trabzon, Türkiye', 2, 5, 4.3),
('Zemu Swiss Bakery', '3 Nolu Erdoğdu, Manolya Cd. No:47, 61040 Trabzon Merkez/Trabzon, Türkiye', 2, 5, 4.3),
('Lokma Tatlı Yalıncak', 'Rize Cad. No:120 A Blok İşyeri-3 Yalıncak Mah. Kapı No:0, 61200 Ortahisar/Trabzon, Türkiye', 2, 5, 4.2),
('Ms. nejla Home Desserts', 'Fatih Mahallesi, Adnan Kahveci Blv. No:142, 61310 Akçaabat/Trabzon, Türkiye', 2, 5, 4.0),
('Adanalı Hasan Kolcuoğlu Trabzon', 'Adanalı Hasan Kolcuoğlu Trabzon', 3, 5, 4.9),
('SOKAK KEBAPÇISI TRABZON', 'Ptt Kargo Karsisi Temel Sükrü, Çarşı, Dogru Sokak No: 5, 61000 Ortahisar/Trabzon, Türkiye', 3, 5, 4.9),
('Müzeyyen Restaurant', 'Kalkınma mahallesi ,Devlet karayolu caddesi, Forum Alışveriş Merkezi 2A No:101/2 BLOK 616-16-2A, 61040 Ortahisar, Türkiye', 3, 5, 4.7),
('Berweuli Ala Carte Cafe Restaurant', 'Ortahisar, Sarayatik Cami Sk. no:22, 61000 Ortahisar/Trabzon, Türkiye', 3, 5, 4.7),
('Ganita restaurant', 'İskenderpaşa, ganita sahili no:299, 61100 Ortahisar/Trabzon, Türkiye', 3, 5, 4.6),
('Komaroğlu Köfte Salonu', 'Dürbinar, Orta Cad No:9, 61300 Akçaabat/Trabzon, Türkiye', 3, 5, 4.5),
('Tarihi Kalkanoğlu Pilavı', 'Pazarkapı, Tophane Cami Sk. No:3, 61200 Merkez/Trabzon, Türkiye', 3, 5, 4.3),
('SOFİA GARDEN CAFE & BRASSERİE', 'Fatih, Zübeyde Hanım Cd. No:12, 61040 Ortahisar/Trabzon, Türkiye', 3, 5, 4.2),
('Bordo Mavi Balık-Erşan Yılmaz', 'Boztepe, İpekyolu Cd., 61030 Ortahisar/Trabzon, Türkiy', 3, 5, 4.2),
('AKPINAR YILDIZLI RESTAURANT', 'Yıldızlı Toki Konutları Yanı, Yıldızlı, Sahil Yolu Cad, 61300 Akçaabat/Trabzon, Türkiye', 3, 5, 4.1);


INSERT INTO puan (restoran_id, kullanici_id, puan)
SELECT restoran_id, 2, ortalama_puan
FROM restoran;

INSERT INTO admin (ad, sifre) VALUES ("Azra Dinler", "Azra6.");

SELECT * FROM puan;

SELECT * FROM admin;

