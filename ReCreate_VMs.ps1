$newVMDN1 = New-AzureVMConfig -Name "cophdpdn01" -InstanceSize Standard_G2 -ImageName cophdpbase -HostCaching ReadWrite | 
Add-AzureEndpoint -Name "SSH" -LocalPort 22 -PublicPort 6711 -Protocol tcp | Set-AzureSubnet -SubnetNames "MainHDP" |
Set-AzureStaticVNetIP -IPAddress "192.168.2.101" | Add-AzureProvisioningConfig -Linux -LinuxUser tomesd -Password Kingy123
New-AzureVM -VMs $newVMDN1 -ServiceName cophdp -VNetName cophdpvnet 

$newVMDN2 = New-AzureVMConfig -Name "cophdpdn02" -InstanceSize Standard_G2 -ImageName cophdpbase -HostCaching ReadWrite | 
Add-AzureEndpoint -Name "SSH" -LocalPort 22 -PublicPort 6714 -Protocol tcp | Set-AzureSubnet -SubnetNames "MainHDP" |
Set-AzureStaticVNetIP -IPAddress "192.168.2.102" |
Add-AzureProvisioningConfig -Linux -LinuxUser tomesd -Password Kingy123
New-AzureVM -VMs $newVMDN2 -ServiceName cophdp -VNetName cophdpvnet 

$newVMDN3 = New-AzureVMConfig -Name "cophdpdn03" -InstanceSize Standard_G2 -ImageName cophdpbase -HostCaching ReadWrite | 
Add-AzureEndpoint -Name "SSH" -LocalPort 22 -PublicPort 6713 -Protocol tcp | Set-AzureSubnet -SubnetNames "MainHDP" |
Set-AzureStaticVNetIP -IPAddress "192.168.2.103" |
Add-AzureProvisioningConfig -Linux -LinuxUser tomesd -Password Kingy123
New-AzureVM -VMs $newVMDN3 -ServiceName cophdp -VNetName cophdpvnet 

$newVMNN1 = New-AzureVMConfig -Name "cophdpnn01" -InstanceSize Standard_G4 -ImageName cophdpbase -HostCaching ReadWrite | 
Add-AzureEndpoint -Name "SSH" -LocalPort 22 -PublicPort 6711 -Protocol tcp | Set-AzureSubnet -SubnetNames "MainHDP" |
Set-AzureStaticVNetIP -IPAddress "192.168.2.10" | Add-AzureProvisioningConfig -Linux -LinuxUser tomesd -Password Kingy123
New-AzureVM -VMs $newVMNN1 -ServiceName cophdp -VNetName cophdpvnet 

$newVMNN2 = New-AzureVMConfig -Name "cophdpnn02" -InstanceSize Standard_G4 -ImageName cophdpbase -HostCaching ReadWrite | 
Add-AzureEndpoint -Name "SSH" -LocalPort 22 -PublicPort 6709 -Protocol tcp | Set-AzureSubnet -SubnetNames "MainHDP" |
Set-AzureStaticVNetIP -IPAddress "192.168.2.11" | Add-AzureProvisioningConfig -Linux -LinuxUser tomesd -Password Kingy123
New-AzureVM -VMs $newVMNN2 -ServiceName cophdp -VNetName cophdpvnet 

#no provisioning
$newVME1 = New-AzureVMConfig -Name "cophdpe01" -InstanceSize Standard_G2 -ImageName cophdpbase -HostCaching ReadWrite | 
Add-AzureEndpoint -Name "SSH" -LocalPort 22 -PublicPort 6712 -Protocol tcp | Set-AzureSubnet -SubnetNames "MainHDP" |
Set-AzureStaticVNetIP -IPAddress "192.168.2.12" | Add-AzureProvisioningConfig -Linux -LinuxUser tomesd -Password Kingy123
New-AzureVM -VMs $newVME1 -ServiceName cophdp -VNetName cophdpvnet 

$newVMAMB = New-AzureVMConfig -Name "cophdpamb" -InstanceSize Standard_G2 -ImageName cophdpbase -HostCaching ReadWrite | 
Add-AzureEndpoint -Name "SSH" -LocalPort 22 -PublicPort 6701 -Protocol tcp | Set-AzureSubnet -SubnetNames "MainHDP" |
Set-AzureStaticVNetIP -IPAddress "192.168.2.4" | Add-AzureProvisioningConfig -Linux -LinuxUser tomesd -Password Kingy123
New-AzureVM -VMs $newVMAMB -ServiceName cophdp -VNetName cophdpvnet 


$dn1 = Get-AzureVM -Name cophdpdn01
Add-AzureDataDisk -CreateNew -DiskSizeInGB 750 -LUN 0 


$E01_OSDisk = (Get-AzureDisk | Where-Object {$_.DiskName -like "*cophdpe01*" -and $_.DiskSizeInGB -eq 30})[0].DiskName
$E01_DataDisk = (Get-AzureDisk | Where-Object {$_.DiskName -like "*cophdpe01*" -and $_.DiskSizeInGB -eq 1022})[0].DiskName
$newVME1 = New-AzureVMConfig -Name "cophdpe01" -InstanceSize Standard_G2 -DiskName $E01_OSDisk -HostCaching ReadWrite | 
Add-AzureEndpoint -Name "SSH" -LocalPort 22 -PublicPort 6712 -Protocol tcp | Set-AzureSubnet -SubnetNames "MainHDP" |
Set-AzureStaticVNetIP -IPAddress "192.168.2.12" | Add-AzureDataDisk -Import $E01_DataDisk -LUN 0 -HostCaching ReadWrite
New-AzureVM -VMs $newVME1 -ServiceName cophdp 

Remove-AzureAccount

Add-AzureAccount

Stop-AzureVM -Name cophdpdn01 -ServiceName cophdp
Stop-AzureVM -Name cophdpdn02 -ServiceName cophdp
Stop-AzureVM -Name cophdpdn03 -ServiceName cophdp
Stop-AzureVM -Name cophdpnn01 -ServiceName cophdp
Stop-AzureVM -Name cophdpnn02 -ServiceName cophdp
Stop-AzureVM -Name cophdpe01 -ServiceName cophdp
Stop-AzureVM -Name cophdpamb -ServiceName cophdp