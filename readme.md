# Using Terraform on Azure

Use Terraform to create a Windows Server 2016 VM and an Ubuntu 18.04 LTS VM on Azure.

Before running 'terraform plan/apply', you will need to log in to Azure.

Install Azure CLI

https://docs.microsoft.com/en-us/cli/azure/install-azure-cli?view=azure-cli-latest

Log in to Azure (AZ)

`az login`

A useful AZ command to list image types available:

`az vm image list --output table`

Terraform commands

`terraform plan` to show the changes Terraform will make

`terraform apply` to show and then apply any changes

`terraform show` to show any existing Terraform based infrastructure

`terraform destroy` to remove the infrastructure when finished testing