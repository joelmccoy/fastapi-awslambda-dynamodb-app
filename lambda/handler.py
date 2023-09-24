"""
Entry point for lambda
"""
from fastapi import FastAPI
from mangum import Mangum

app = FastAPI()


@app.get("/")
def hello_world():
    return {"message": "Hello from FastAPI"}


handler = Mangum(app)
