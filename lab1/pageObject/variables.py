MONGO_URI = "mongodb+srv://sarrs490:izb0diZEjhjtXlei@cluster0.fgh70ff.mongodb.net/"
DB_NAME = "fakeStoreDB"

COLLECTION_PRODUCTS = "products"
valid_product = {
    "title": "Test Product",
    "price": 19.99,
    "description": "A test product",
    "category": "electronics",
    "image": "https://i.pravatar.cc"
}

invalid_product_missing_title = {
    "price": 19.99,
    "description": "Missing title",
    "category": "electronics"
}

invalid_product_price_string = {
    "title": "Bad Price",
    "price": "not-a-number",
    "description": "Invalid price format",
    "category": "electronics"
}