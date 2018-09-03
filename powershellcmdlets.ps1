
install-module -name Azurerm

New-AzureRmResourceGroup -Name "mclassSept" -Location "West Europe" -Verbose

 New-AzureRmStorageAccount -ResourceGroupName "mclassSept" -Name "mclass975423" `
 -Location "West Europe" -SkuName Standard_LRS -Kind StorageV2 -Verbose

 New-AzureRmAppServicePlan -Location "West Europe" -Tier Basic -ResourceGroupName "mclassSept" `
 -Name "mclassseptplan" -Verbose

 New-AzureRmWebApp -ResourceGroupName "mclassSept" -Name "mclass975423" -Location "West Europe" `
 -AppServicePlan "mclassseptplan" -Verbose

 $publicIP = New-AzureRmPublicIpAddress -Name "mclassSeptipaddress" -ResourceGroupName "mclassSept" -Location "West Europe" `
 -Sku Basic -AllocationMethod Static -DomainNameLabel "mclass975423" -Verbose

 $subnet = New-AzureRmVirtualNetworkSubnetConfig -Name "frontend" -AddressPrefix "10.0.1.0/24" -Verbose

 New-AzureRmVirtualNetwork -Name "mclass975423Network" -ResourceGroupName "mclassSept" -Location "West Europe" `
 -AddressPrefix "10.0.0.0/16" -Subnet $subnet -Verbose


  $publicIP = Get-AzureRmPublicIpAddress -Name "mclassSeptipaddress" -ResourceGroupName "mclassSept"  -Verbose
  $virtualNetwork = Get-AzureRmVirtualNetwork -Name "mclass975423Network" -ResourceGroupName "mclassSept"
  
  $subnet = Get-AzureRmVirtualNetworkSubnetConfig -Name "frontend" -VirtualNetwork $virtualNetwork



 New-AzureRmNetworkInterface -Name "mclassSeptNIC" -ResourceGroupName "mclassSept" -Location "West Europe" `
 -SubnetId $subnet.Id  -PublicIpAddressId $publicIP.Id -Verbose
 
 $nic = Get-AzureRmNetworkInterface -Name "mclassSeptNIC" -ResourceGroupName "mclassSept"

 $config = New-AzureRmVMConfig -VMName "test01" -VMSize "Standard_A3"

 Set-AzureRmVMOperatingSystem -Windows -ComputerName "test01" -VM $config 
 
 Set-AzureRmVMOSDisk -Name "testosdisk" -Windows -VM $config -CreateOption FromImage  `
 -Caching ReadWrite
 
 Set-AzureRmVMSourceImage -VM $config -PublisherName "MicrosoftWindowsServer" -Offer "WindowsServer" `
 -Skus "2016-Datacenter" -Version latest
 
 Add-AzureRmVMNetworkInterface -VM $config -NetworkInterface $nic 

New-AzureRmVM -ResourceGroupName "mclassSept" -Location "West Europe" -VM $config -Verbose


