def restoranlar(data, get_db_connection):
    sehir = data.get("sehir")
    kategori = data.get("kategori")

    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)

    cursor.execute("""
        SELECT restoran.restoran_id, restoran.restoran_ad, restoran.adres, restoran.ortalama_puan 
        FROM restoran
        JOIN il ON restoran.il_id = il.il_id
        JOIN kategori ON restoran.kategori_id = kategori.kategori_id
        WHERE il.il_ad = %s AND kategori.kategori_ad = %s
    """, (sehir, kategori))


    restoranlar = cursor.fetchall()
    cursor.close()
    conn.close()
    return restoranlar