#!/bin/bash
# Refreshes library content with latest kubernets api library
echo -e "provider \"kubernetes\" {\n}" > tmp.tf
terraform init
terraform providers schema -json | jq . > provider.json 
rm tmp.tf
python3 prepare.py