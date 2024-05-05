#!/bin/bash
# Apply Terraform configuration
echo "Applying Terraform configuration..."
terraform apply -auto-approve

# Extract outputs from Terraform in JSON format
echo "Extracting Terraform outputs..."
OUTPUT_JSON=$(terraform output -json)

# Extract IP addresses
IP1=$(echo "$OUTPUT_JSON" | jq -r '.webserver_ips.value[0]')
IP2=$(echo "$OUTPUT_JSON" | jq -r '.webserver_ips.value[1]')
DB_HOST=$(echo "$OUTPUT_JSON" | jq -r '.db_host.value')

# Extract sensitive data
DB_USERNAME=$(echo "$OUTPUT_JSON" | jq -r '.db_username.value')
DB_NAME=$(echo "$OUTPUT_JSON" | jq -r '.db_name.value')
DB_PASSWORD=$(echo "$OUTPUT_JSON" | jq -r '.db_password.value')
DB_DATABASE=$(echo "$OUTPUT_JSON" | jq -r '.db_database.value')


# Create or overwrite the inventory.ini file
echo "Creating inventory.ini file..."
cat << EOF > ../ansible/inventory.ini
[webservers]
webserver1 ansible_host=$IP1 ansible_user=ubuntu
webserver2 ansible_host=$IP2 ansible_user=ubuntu

EOF

# Handle sensitive data securely
echo "Creating vault.yml file..."
cat << EOF > ../ansible/group_vars/webservers/vault.yml
db_host: $DB_HOST
db_username: $DB_USERNAME
db_name: $DB_NAME
db_password: $DB_PASSWORD
db_port: 6432
datadog_api_key: 04c06d3864a26174a6bb2b87c40f7fad
EOF

# Confirmation message
echo "Inventory and vault files created successfully."

