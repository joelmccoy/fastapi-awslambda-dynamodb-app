resource "aws_dynamodb_table" "ecommerce-table" {
  name           = "EcommerceTable"
  billing_mode   = "PROVISIONED"
  read_capacity  = 10
  write_capacity = 10
  hash_key       = "id"

  attribute {
    name = "id"
    type = "S"
  }

}