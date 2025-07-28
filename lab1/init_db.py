from pymongo import MongoClient
from pageObject import variables

uri = variables.MONGO_URI

client = MongoClient(uri)

db = client["fakeStoreDB"]
collection = db["products"]

sample_product = {
    "title": "Initial Product",
    "price": 10.99,
    "description": "This is a default product",
    "category": "books",
    "image": "https://i.pravatar.cc"
}

inserted_id = collection.insert_one(sample_product).inserted_id
print(f" Produit inséré avec ID : {inserted_id}")
