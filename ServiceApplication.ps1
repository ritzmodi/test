$app = New-AzureRmADApplication -DisplayName "ARMtemplateBook" -IdentifierUris "http://ARMtemplateBook" -ReplyUrls "http://ARMtemplateBook/callback"

$principal = New-AzureRmADServicePrincipal -ApplicationId $app.ApplicationId -Password (ConvertTo-SecureString -String Pa55w0rd -AsPlainText -Force)

$assignment = New-AzureRmRoleAssignment -RoleDefinitionName owner -ServicePrincipalName $app.ApplicationId.Guid
