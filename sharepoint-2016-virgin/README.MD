equivalent command:

az vm create --resource-group dinoSp --name spvm --image Win2012R2Datacenter --size Standard_D4s_v3 --storage-sku StandardSSD_LRS --admin-username dino --admin-password Passw0rd12345! --location usgovvirginia --nsg "/subscriptions/322805e7-c587-4a64-ad97-9e62ba98a8e1/resourceGroups/MI-NetworkRG/providers/Microsoft.Network/networkSecurityGroups/MITRE-Only-Inbound" --debug --output table

Then, had to manually set NIC's subnet to point to MITRE-Only-Inbound nsg (its nsg setting was empty).
