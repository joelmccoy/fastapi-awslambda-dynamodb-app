# fastapi-awslambda-dynamodb-app
A simple project to demonstrate an example of a FastAPI endpoint hosted on AWS Lambda with DynamoDB.

## Problem Statement

*Generated from ChatGPT*

**Project Name:** E-commerce Inventory and Orders API

**Project Description:**

Create an E-commerce Inventory and Orders API that allows users to manage inventory items and customer orders. This project involves two main objects: "Products" and "Orders." Users can perform CRUD operations on both products and orders through separate API endpoints.

**Features:**

**Product Management:**

1. **Create Product:** Users can add new products to the inventory by sending a POST request to the `/products` endpoint with product details such as name, description, price, and quantity.

2. **List Products:** Users can retrieve a list of all available products by sending a GET request to the `/products` endpoint. The API should return a JSON response with product information.

3. **Retrieve Product:** Users can retrieve details of a specific product by sending a GET request to the `/products/{productId}` endpoint, where `{productId}` is the unique identifier of the product.

4. **Update Product:** Users can update the details of a product by sending a PUT request to the `/products/{productId}` endpoint with the product ID and updated information.

5. **Delete Product:** Users can delete a product from the inventory by sending a DELETE request to the `/products/{productId}` endpoint.

**Order Management:**

1. **Create Order:** Users can place new orders by sending a POST request to the `/orders` endpoint with order details, including the list of products ordered, quantities, and customer information.

2. **List Orders:** Users can retrieve a list of all orders by sending a GET request to the `/orders` endpoint. The API should return a JSON response with order information.

3. **Retrieve Order:** Users can retrieve details of a specific order by sending a GET request to the `/orders/{orderId}` endpoint, where `{orderId}` is the unique identifier of the order.

4. **Update Order:** Users can update the details of an order by sending a PUT request to the `/orders/{orderId}` endpoint with the order ID and updated information.

5. **Delete Order:** Users can cancel an order by sending a DELETE request to the `/orders/{orderId}` endpoint.

**DynamoDB Integration:**

- Implement DynamoDB as the backend data store for both products and orders. Design efficient data models and relationships between the two objects.

- Ensure that your API endpoints interact with DynamoDB to perform CRUD operations efficiently.

**Requirements:**

- Use a serverless framework like AWS Lambda and API Gateway to deploy your API.

- Implement proper error handling and validation for API requests. Return meaningful error messages when necessary.

- Include API documentation that describes the endpoints, request/response format, and how to use the API.

- Implement authentication and authorization to secure the API (e.g., AWS Cognito for user authentication).

- Implement features like inventory management (e.g., decrementing product quantities upon order) and order status tracking.

This project will provide you with valuable experience in setting up multiple API endpoints, designing efficient data models in DynamoDB, and integrating AWS services for a real-world application. Enjoy building your E-commerce Inventory and Orders API!