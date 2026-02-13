import os
import mysql.connector
from dotenv import load_dotenv
from flask import Flask, render_template, request, jsonify
from restoranlar import restoranlar
from puan import puan
from admin import admin_giris, admin_restoran, restoran_sil, restoran_guncelle

load_dotenv()

def get_db_connection():
    return mysql.connector.connect(
        host = "127.0.0.1",
        user = "root",
        password = "Azra29780*",
        database = "restoran_app",
        port = 3306
    )

app = Flask(
    __name__,
    template_folder=os.path.join(os.path.dirname(__file__), "../frontend"),
    static_folder=os.path.join(os.path.dirname(__file__),"../frontend/js")
)


@app.route("/restoran-liste", methods=["GET"])
def restoran_liste():
    sehir = request.args.get("sehir")
    kategori = request.args.get("kategori")
    data = {"sehir": sehir, "kategori": kategori}
    return restoranlar(data, get_db_connection)

@app.route("/puan-ekle", methods=["POST"])
def puan_ekle():
    data = request.get_json()
    return puan(data, get_db_connection)

@app.route("/admin-giris", methods = ["POST"])
def admin_girisi():
    data = request.get_json()
    return admin_giris(data, get_db_connection)

@app.route("/admin-restoran", methods = ["GET"])
def admin_restoranlar():
    return admin_restoran( get_db_connection)

@app.route("/admin/restoran-sil", methods = ["POST"])
def restoran_silme():
    data = request.get_json()
    return restoran_sil(data, get_db_connection)

@app.route("/admin/restoran-guncelle", methods = ["POST"])
def restoran_guncelleme():
    data =request.get_json()
    return restoran_guncelle(data, get_db_connection)

@app.route("/")
def giriş():
    return render_template("giriş.html")

@app.route("/restoranlar")
def restoranlar_sayfa():
    return render_template("restoranlar.html")

@app.route("/admin-login")
def admin_login_sayfa():
    return render_template("admin_login.html")

@app.route("/admin-restoranlar")
def admin_restoran_sayfa():
    sonuc = admin_restoran(get_db_connection) 
    return render_template("admin_restoranlar.html", restoranlar=sonuc)

if __name__ == "__main__":
    app.run(port=5000, debug=True)
