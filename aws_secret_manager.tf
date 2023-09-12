resource "aws_secretsmanager_secret" "api_key" {
  name = "secret-api-key"
}

resource "aws_secretsmanager_secret_version" "api_key" {
  secret_id = aws_secretsmanager_secret.api_key.id
  secret_string = <<EOF
   {
    "username": "admin",
    "key": "${random_password.api_key_password.result}"
   }
EOF
}

resource "random_password" "api_key_password" {
  length           = 16
  special          = true
  override_special = "@!#$"
}