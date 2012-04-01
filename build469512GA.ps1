$theLabel = $args[0]
add-EsxSoftwareDepot .\LSI_2.27.08.036vm50-offline_bundle-637081.zip
add-EsxSoftwareDepot .\LSI_3.26.00.003vm50-offline_bundle-646893.zip
add-esxsoftwaredepot .\vmware-ESXi-5.0.0-469512-depot.zip
get-esxsoftwarepackage
get-esximageprofile
new-esximageprofile -CloneProfile "ESXi-5.0.0-469512-standard" -Name $theLabel -Vendor "VMware" -Description "ESXi 5.0 build 469512 with LSI $args[1]...."
add-esxsoftwarepackage -ImageProfile $theLabel -SoftwarePackage $args[1]
add-esxsoftwarepackage -ImageProfile $theLabel -SoftwarePackage $args[2]
export-esximageprofile -ExportToIso -ImageProfile $theLabel -FilePath .\$theLabel.iso