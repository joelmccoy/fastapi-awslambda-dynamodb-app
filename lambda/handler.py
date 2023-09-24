"""
Entry point for lambda
"""
from uuid import UUID

from fastapi import FastAPI
from mangum import Mangum
from repositories import ProductRepository
from schemas import ProductSchemaIn, ProductSchemaOut

app = FastAPI()


@app.get("/product/{product_id}", response_model=ProductSchemaOut)
def get_product(product_id: UUID):
    product_out = ProductRepository.get(product_id)
    return product_out


@app.post("/product", response_model=ProductSchemaOut)
def create_product(product: ProductSchemaIn):
    product_out = ProductRepository.create(product)
    return product_out


@app.get("/")
def hello_world():
    return {"message": "Welcome to the e-commerce API!"}


handler = Mangum(app)
