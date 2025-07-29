from pymongo import MongoClient
from pymongo.server_api import ServerApi
from pymongo.errors import ConnectionFailure
from robot.api.deco import keyword

def create_connector(uri, db_name, collection_name):
    client = MongoClient(uri, server_api=ServerApi('1'))
    db = client[db_name]
    collection = db[collection_name]
    return {"client": client, "db": db, "collection": collection}

@keyword("Connect To Mongo")
def connect_to_mongo(uri, db_name, collection_name):
    """Crée un connecteur MongoDB et retourne un dictionnaire {client, db, collection}."""
    return create_connector(uri, db_name, collection_name)

@keyword("Ping")
def ping(conn):
    """Teste la connexion à MongoDB."""
    try:
        conn["client"].admin.command("ping")
        return True
    except ConnectionFailure:
        return False
@keyword
def insert_product(conn, product):
    if "title" not in product or not product["title"]:
        raise ValueError("Title is required and cannot be empty.")
    if "price" not in product:
        raise ValueError("Price is missing.")
    if not isinstance(product["price"], (int, float)):
        raise TypeError("Price must be a number.")
    if product["price"] < 0:
        raise ValueError("Price cannot be negative.")
    else:
        result = conn["collection"].insert_one(product)
        return str(result.inserted_id)


@keyword
def find_product_by_title(conn, title):
    return conn["collection"].find_one({"title": title})

@keyword
def update_product_price(conn, title, new_price):
    if not isinstance(new_price, (int, float)):
        raise ValueError("Price must be a number.")
    result = conn["collection"].update_one({"title": title}, {"$set": {"price": new_price}})
    return result.modified_count

@keyword
def delete_product_by_title(conn, title):
    result = conn["collection"].delete_one({"title": title})
    return result.deleted_count
