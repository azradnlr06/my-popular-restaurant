from flask import jsonify

def admin_giris(data, get_db_connection):
    ad = data.get("ad")
    sifre = data.get("sifre")

    if not ad or not sifre:
        return jsonify({"mesaj": "Bilgiler Eksik"})

    conn = get_db_connection()
    cursor = conn.cursor()

    cursor.execute(""" 
        SELECT ad, sifre FROM admin
        WHERE ad = %s AND sifre = %s
    """,(ad, sifre))
    cevap = cursor.fetchone()
    cursor.close()
    conn.close()

    if cevap:  
        return jsonify({"cevap": True})  
    else:
        return jsonify({"cevap": False}) 

def admin_restoran(get_db_connection):

    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)

    cursor.execute(" SELECT * FROM restoran")
    sonuc = cursor.fetchall()
    cursor.close()
    conn.close()

    return sonuc

def restoran_sil(data, get_db_connection):
    restoran_id = data.get("restoran_id")

    if not restoran_id:
        return jsonify({"mesaj": "Restoran bulunamadı"})

    conn = get_db_connection()
    cursor = conn.cursor()

    cursor.execute(""" 
        DELETE FROM restoran
        WHERE restoran_id = %s
    """, (restoran_id, ))
    conn.commit()
    cursor.close()
    conn.close()

    return jsonify({"mesaj": "Restoran başarıyla silindi"})


def restoran_guncelle(data, get_db_connection):
    adres = data.get("adres")
    restoran_ad = data.get("restoran_ad")
    restoran_id = data.get("restoran_id")

    if not restoran_ad or not adres:
        return jsonify({"mesaj": "Bilgiler eksik"})

    conn = get_db_connection()
    cursor = conn.cursor()

    cursor.execute(""" 
        UPDATE restoran SET adres = %s, restoran_ad = %s
        WHERE restoran_id = %s
    """, (adres, restoran_ad, restoran_id))
    conn.commit()
    cursor.close()
    conn.close()

    return jsonify({"mesaj": "Restoran güncellendi"})
