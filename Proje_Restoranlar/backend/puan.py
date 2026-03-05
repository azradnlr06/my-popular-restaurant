from flask import jsonify

def puan(data, get_db_connection):
    restoran_id = data.get("restoran_id")
    kullanici_id = data.get("kullanici_id")
    puan = data.get("puan")

    if not restoran_id or not kullanici_id or not puan:
        return jsonify({"mesaj": "Eksik bilgi"})

    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)

    cursor.execute(""" 
        SELECT puan FROM puan
        WHERE restoran_id = %s AND kullanici_id = %s
    """, (restoran_id, kullanici_id))

    ilk_puan = cursor.fetchone()

    if ilk_puan:
        cursor.execute("""
            UPDATE puan SET puan = %s
            WHERE restoran_id = %s AND kullanici_id = %s
        """, (puan, restoran_id, kullanici_id))
        
    else: 
        cursor.execute("""
            INSERT INTO puan (puan, restoran_id, kullanici_id)
            VALUES (%s, %s, %s)
        """, (puan, restoran_id, kullanici_id))

    conn.commit()  

    cursor.execute(""" 
        SELECT AVG(puan) AS ortalama, COUNT(*) AS sayi 
        FROM puan
        WHERE restoran_id = %s
    """, (restoran_id, ))
    cevap = cursor.fetchone()

    yeni_ortalama = round(cevap["ortalama"], 1) if cevap["ortalama"] is not None else 0
    puan_sayisi = cevap["sayi"]

    cursor.execute(""" 
        UPDATE restoran SET ortalama_puan = %s, puan_sayisi = %s
        WHERE restoran_id = %s
    """, (yeni_ortalama, puan_sayisi, restoran_id))
    conn.commit()

    cursor.close()
    conn.close()

    return jsonify({"mesaj": "Puan güncellendi", "ortalama_puan": yeni_ortalama})
