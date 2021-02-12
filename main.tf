# Create Resource Group
resource "azurerm_resource_group" "rg" {
    name = "Terra-K8s"
    location = "centralindia"  
    tags = {
        Name = "terrastgk8s"
    }
}

#### Create the Storage account ####

resource "azurerm_storage_account" "kstg" {
    name = "examplestoraccount" # storage name
    resource_group_name = "azurerm_resource_group.rg.name"
    location = "azurerm_resource_group.rg.location"
    account_tier = "Standard"
    account_replication_type = "LRS"
    tags = {
        environment = "Dev"
    }
}

#### Storage container type

resource "azurerm_storage_container" "stgcontainer" {
  name                  = "vhds"
  //storage_account_name  = "example15"
  storage_account_name = "azurerm_storage_account.kstg.name"
  container_access_type = "private"
}