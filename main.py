from flask import Flask, jsonify
import os
from Utils.client import RestClient
from flask_sqlalchemy import SQLAlchemy

DATABASE = ""
IP_INSTANCIA = ""
USUARIO = ""
PASSWORD = ""

DB_URI = f"mssql+pyodbc://{USUARIO}:{PASSWORD}@{IP_INSTANCIA}/{DATABASE}?driver=ODBC+Driver+17+for+SQL+Server"

app = Flask(__name__)

app.config['SQLALCHEMY_DATABASE_URI'] = DB_URI
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
db = SQLAlchemy(app)

class Product(db.Model):
    id = db.Column(db.Integer, primary_key = True)
    title = db.Column(db.String(255), unique = False, nullable = True)
    price = db.Column(db.Float, unique = False, nullable = True)

    def to_dict(self):
        return dict([(k, getattr(self, k)) for k in self.__dict__.keys() if not k.startswith("_")])


@app.route("/Consultar/<int:id_product>", methods=['GET'])
def consultar(id_product):
    result = Product.query.filter_by(id=id_product).first()
    return jsonify(result.to_dict()), 200

@app.route("/Registrar", methods=['POST'])
def obtener_productos():
    response = RestClient.call_get("https://fakestoreapi.com/products")
    products_data = response.json()

    products_list = [{"title": product["title"], "price": product["price"]} for product in products_data ]
    products = [Product(**row) for row in products_list]
    db.session.add_all(products)
    db.session.commit()
    return jsonify({"data": products_list}), 200

if __name__ == "__main__":
    app.run(debug=True, host="0.0.0.0", port=int(os.environ.get("PORT", 8080)))