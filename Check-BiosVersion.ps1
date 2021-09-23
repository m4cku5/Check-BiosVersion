$biosVersion = (Get-ItemPropertyValue -Path "HKLM:\HARDWARE\DESCRIPTION\System\BIOS\" -Name "BiosVersion")
$model = (Get-ItemPropertyValue -Path "HKLM:\HARDWARE\DESCRIPTION\System\BIOS\" -Name "SystemProductName")

function Get-UpdateStatus {
     if (($model -eq "Precision 5550") -and ($biosVersion -eq "1.9.1")) {
        $isUpToDate = $true
    } elseif (($model -eq "Latitude 5580") -and ($biosVersion -eq "1.20.2")) {
        $isUpToDate = $true
    } elseif (($model -eq "Latitude 5590") -and ($biosVersion -eq "1.17.0")) {
        $isUpToDate = $true
    } elseif (($model -eq "Latitude 5591") -and ($biosVersion -eq "1.15.0")) {
        $isUpToDate = $true
    } elseif (($model -eq "Latitude 5400") -and ($biosVersion -eq "1.12.0")) {
        $isUpToDate = $true
    } elseif (($model -eq "Latitude 5410") -and ($biosVersion -eq "1.7.0")) {
        $isUpToDate = $true
    } elseif (($model -eq "Latitude 7400") -and ($biosVersion -eq "1.14.0")) {
        $isUpToDate = $true
    } elseif (($model -eq "OptiPlex 3040") -and ($biosVersion -eq "1.16.1")) {
        $isUpToDate = $true
    } elseif (($model -eq "OptiPlex 3060") -and ($biosVersion -eq "1.14.0")) {
        $isUpToDate = $true
    } elseif (($model -eq "OptiPlex 3080") -and ($biosVersion -eq "2.2.1")) {
        $isUpToDate = $true
    } elseif (($model -eq "XPS 13 9350") -and ($biosVersion -eq "1.13.0")) {
        $isUpToDate = $true
    } elseif (($model -eq "XPS 13 9380") -and ($biosVersion -eq "1.15.0")) {
        $isUpToDate = $true
    } elseif (($model -eq "XPS 15 9560") -and ($biosVersion -eq "1.15.0")) {
        $isUpToDate = $true
    } else {
        $isUpToDate = $false
    }
    return $isUptoDate
}

try {
    if (Get-UpdateStatus($isUpToDate) -eq $true) {
        Write-Host "The BIOS is up to date."
        exit 1
    } elseif (Get-UpdateStatus($isUpToDate) -eq $false) {
        Write-Host "The BIOS needs to be updated."
        exit 0
    } 
} catch {
    Write-Host "Something went wrong."
    exit 1
}