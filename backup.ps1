$date = "201502211434"
$folder = "base/"

Stop-AzureVM -Name cophdpamb -ServiceName cophdp
Stop-AzureVM -Name cophdpe01 -ServiceName cophdp
Stop-AzureVM -Name cophdpdn01 -ServiceName cophdp
Stop-AzureVM -Name cophdpdn02 -ServiceName cophdp
Stop-AzureVM -Name cophdpdn03 -ServiceName cophdp
Stop-AzureVM -Name cophdpnn01 -ServiceName cophdp
Stop-AzureVM -Name cophdpnn02 -ServiceName cophdp

Start-AzureStorageBlobCopy -SrcContainer vhds -SrcBlob djak2wnd.twk201502211545310577.vhd -DestContainer vhdsnapshots -DestBlob ($folder + "dn01osbase" + $date + ".vhd")
Start-AzureStorageBlobCopy -SrcContainer vhds -SrcBlob 1emzqhlw.stu201502211555530890.vhd -DestContainer vhdsnapshots -DestBlob ($folder + "e01osbase" + $date + ".vhd")
Start-AzureStorageBlobCopy -SrcContainer vhds -SrcBlob adozcjfz.em1201502211552320334.vhd -DestContainer vhdsnapshots -DestBlob ($folder + "dn03osbase" + $date + ".vhd")
Start-AzureStorageBlobCopy -SrcContainer vhds -SrcBlob dtal5wuq.oyc201502211555060742.vhd -DestContainer vhdsnapshots -DestBlob ($folder + "ambosbase" + $date + ".vhd")
Start-AzureStorageBlobCopy -SrcContainer vhds -SrcBlob ljptso2o.zpi201502211553430147.vhd -DestContainer vhdsnapshots -DestBlob ($folder + "nn02osbase" + $date + ".vhd")
Start-AzureStorageBlobCopy -SrcContainer vhds -SrcBlob mypgyibp.pk1201502211553060887.vhd -DestContainer vhdsnapshots -DestBlob ($folder + "nn01osbase" + $date + ".vhd")
Start-AzureStorageBlobCopy -SrcContainer vhds -SrcBlob ymgaxqox.au0201502211551580580.vhd -DestContainer vhdsnapshots -DestBlob ($folder + "dn02osbase" + $date + ".vhd")
Start-AzureStorageBlobCopy -SrcContainer vhds -SrcBlob dn01hdfs1.vhd -DestContainer vhdsnapshots -DestBlob ($folder + "dn01hdfs1" + $date + ".vhd")
Start-AzureStorageBlobCopy -SrcContainer vhds -SrcBlob dn02hdfs1.vhd -DestContainer vhdsnapshots -DestBlob ($folder + "dn02hdfs1" + $date + ".vhd")
Start-AzureStorageBlobCopy -SrcContainer vhds -SrcBlob dn03hdfs1.vhd -DestContainer vhdsnapshots -DestBlob ($folder + "dn03hdfs1" + $date + ".vhd")
Start-AzureStorageBlobCopy -SrcContainer vhds -SrcBlob e01ingest.vhd -DestContainer vhdsnapshots -DestBlob ($folder + "e01ingest" + $date + ".vhd")

Start-AzureVM -Name cophdpdn01 -ServiceName cophdp
Start-AzureVM -Name cophdpdn02 -ServiceName cophdp
Start-AzureVM -Name cophdpdn03 -ServiceName cophdp
Start-AzureVM -Name cophdpnn01 -ServiceName cophdp
Start-AzureVM -Name cophdpnn02 -ServiceName cophdp
Start-AzureVM -Name cophdpe01 -ServiceName cophdp
Start-AzureVM -Name cophdpamb -ServiceName cophdp