Login-AzureRmAccount

$Subscription = Get-AzureRmSubscription | Out-GridView -Title "Select Subscription" -OutputMode Single
Select-AzureRmSubscription -SubscriptionId $Subscription.Id

$VM = Get-AzureRmVM | Out-GridView -Title "Select VM" -OutputMode Single

Set-AzureRmVMCustomScriptExtension -ResourceGroupName $VM.ResourceGroupName`
    -VMName $VM.Name `
    -Location $VM.Location `
    -FileUri "https://raw.githubusercontent.com/martinfelts/AzureGpo/SystemConfiguration.ps1","https://github.com/martinfelts/AzureGpo/SystemConfiguration.zip" `
    -Run 'SystemConfiguration.ps1' `
    -Name SystemConfigurationExtension

#### Output log -  C:\WindowsAzure\Logs\Plugins\Microsoft.Compute.CustomScriptExtension
#### Download dir - C:\Packages\Plugins\Microsoft.Compute.CustomScriptExtension\1.*\Downloads\<n>
