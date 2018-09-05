New-AzureRmResourceGroupDeployment -Name "test1" `
-ResourceGroupName mclasssept -Mode Incremental `
-TemplateFile "c:\users\rites\source\repos\AzureResourceGroup12\azuredeploy.json" `
-someuniqueDnsName "yourDNSName"
-Verbose
