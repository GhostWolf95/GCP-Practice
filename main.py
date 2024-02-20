from flask import Flask, jsonify
import os
from Utils.client import RestClient


app = Flask(__name__)

@app.route("/")
def obtener_productos():
    response = RestClient.call_get("https://fakestoreapi.com/products")
    products_data = response.json()
    products_list = []
    for product in products_data:
        products_list.append({"title": product["title"], "price": product["price"]})
    return jsonify({"data": products_list}), 200

if __name__ == "__main__":
    app.run(debug=True, host="0.0.0.0", port=int(os.environ.get("PORT", 8080)))