Login-AzureRmAccount
Set-AzureRmContext -Subscription 	8e0502bf-56ff-4d96-81e7-11725e8065dd
$app = New-AzureRmADApplication -DisplayName "ARMtemplateBook10" `
-IdentifierUris "http://ARMtemplateBook10" -ReplyUrls "http://ARMtemplateBook10/callback"
$app
$principal = New-AzureRmADServicePrincipal -ApplicationId $app.ApplicationId `
-Password (ConvertTo-SecureString -String Pa55w0rd -AsPlainText -Force)
$principal
$assignment = New-AzureRmRoleAssignment -RoleDefinitionName owner -ApplicationId `
$app.ApplicationId.Guid
$assignment
New-AzureRmResourceGroup -name DSCResources -Location "West Europe" -Verbose
New-AzureRmAutomationAccount -ResourceGroupName DscResources -Name pullserver -Location "West Europe" 
-Verbose
get-command *azureautomation*
get-command *azurermautomation*
Import-AzureRmAutomationDscConfiguration -SourcePath "C:\configs\FileConfiguration.ps1" -Published -Re
sourceGroupName DSCResources -AutomationAccountName pullserver -Verbose
Start-AzureRmAutomationDscCompilationJob -ConfigurationName FileConfiguration -ResourceGroupName DSCRe
sources -AutomationAccountName PullServer -Verbose
Start-AzureRmAutomationDscCompilationJob -ConfigurationName FileConfiguration.FileCOnfiguration -Resou
rceGroupName DSCResources -AutomationAccountName PullServer -Verbose
 Register-AzureRmProviderFeature -ProviderNamespace Microsoft.Automation -FeatureName AutomatioAccount
s
 Register-AzureRmProviderFeature -ProviderNamespace Microsoft.Automation -FeatureName AutomationAccoun
ts
 Register-AzureRmProviderFeature -ProviderNamespace Microsoft.Automation -FeatureName Accounts
Get-AzureRmProviderFeature -ProviderNamespace Microsoft.Automation
Get-AzureRmProviderfeature 
Get-AzureRmProviderfeature -FeatureName *account*
Get-AzureRmProviderFeature -ProviderNamespace Microsoft.Automation
Get-AzureRmProviderFeature -ProviderNamespace Microsoft.Automation -ListAvailable
Register-AzureRmAutomationDscNode -AzureVMName test01 -NodeConfigurationName FileConfiguration.localho
st -ResourceGroupName DSCResources -AutomationAccountName PullServer -Verbose
Register-AzureRmAutomationDscNode -AzureVMName test01 -NodeConfigurationName FileConfiguration.localho
st -ResourceGroupName DSCResources -AutomationAccountName PullServer -AzureVMLocation "West Europe" -V
erbose
Register-AzureRmAutomationDscNode -AzureVMName test01 -AzureVMResourceGroup 	mclassSept -NodeConfigura
tionName FileConfiguration.localhost -ResourceGroupName DSCResources -AutomationAccountName PullServer
 -AzureVMLocation "West Europe" -Verbose
Register-AzureRmAutomationDscNode -AzureVMName test01 -AzureVMResourceGroup 	mclassSept -NodeConfigura
tionName FileConfiguration.localhost -ResourceGroupName DSCResources -AutomationAccountName PullServer
 -AzureVMLocation "West Europe" -Verbose
Register-AzureRmAutomationDscNode -AzureVMName test01 -AzureVMResourceGroup 	mclassSept -NodeConfigura
tionName FileConfiguration.localhost -ResourceGroupName DSCResources -AutomationAccountName PullServer
 -AzureVMLocation "West Europe" -Verbose -Debug
Login-AzureRmAccount
Set-AzureRmContext -Subscription 8e0502bf-56ff-4d96-81e7-11725e8065dd
Register-AzureRmAutomationDscNode -AzureVMName test01 -AzureVMResourceGroup 	mclassSept -NodeConfigura
tionName FileConfiguration.localhost -ResourceGroupName DSCResources -AutomationAccountName PullServer
 -AzureVMLocation "West Europe" -Verbose -Debug
Register-AzureRmAutomationDscNode -AzureVMName test01 -AzureVMResourceGroup 	mclassSept -NodeConfigura
tionName FileConfiguration.localhost -ResourceGroupName DSCResources -AutomationAccountName PullServer
 -AzureVMLocation "West Europe" -Verbose -Debug
