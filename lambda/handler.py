"""
Entry point for lambda
"""
import json


# pylint: disable=unused-argument
def handler(event, context):
    return {
        "statusCode": 200,
        "body": json.dumps("Hello from Lambda!"),
    }
