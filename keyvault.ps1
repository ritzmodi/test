New-AzureRmKeyVault -ResourceGroupName mclassSept -Name "mclasssept" `
-Location "West Europe" -EnabledForDeployment -EnabledForTemplateDeployment `
-EnabledForDiskEncryption -Sku Standard -Verbose

Set-AzureRmKeyVaultAccessPolicy -VaultName mclasssept `
-ResourceGroupName mclassSept -ApplicationId d2293be0-0ae9-478f-b8dc-1640e6055a34 `
-PermissionsToKeys all -PermissionsToSecrets @("get","list") -PermissionsToCertificates all `
-PermissionsToStorage all -ObjectId 8f9cef7a-40eb-49b6-b008-66366359f11e -Verbose

$str = $(ConvertTo-SecureString -String "citynext!1234" -AsPlainText -Force )

Set-AzureKeyVaultSecret -VaultName mclasssept -Name "sqlserverpassword" `
-SecretValue $str `
-Verbose
