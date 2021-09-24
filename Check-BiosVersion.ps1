$biosVersion = (Get-ItemPropertyValue -Path "HKLM:\HARDWARE\DESCRIPTION\System\BIOS\" -Name "BiosVersion")
$deviceList = $null
$model = (Get-ItemPropertyValue -Path "HKLM:\HARDWARE\DESCRIPTION\System\BIOS\" -Name "SystemProductName")

function Get-UpdateStatus {

    $deviceList = [ordered]@{
        "Latitude 5580" = "1.20.2"
        "Latitude 5590" = "1.17.0"
        "Latitude 5591" = "1.15.0"
        "Latitude 5400" = "1.12.0"
        "Latitude 5410" = "1.7.0"
        "Latitude 7400" = "1.14.0"
        "OptiPlex 3040" = "1.16.1"
        "OptiPlex 3060" = "1.14.0"
        "OptiPlex 3080" = "2.2.1"
        "Precision 5550" = "1.9.1"
        "XPS 13 9350" = "1.13.0"
        "XPS 13 9380" = "1.15.0"
        "XPS 15 9560" = "1.15.0"
    }

    try {

        $deviceList.GetEnumerator() | ForEach-Object {

            if (($_.Name -eq $model) -and ($_.Value -eq $biosVersion)) {

                Write-Host "This BIOS is up to date. [Exit Code: 1]"
                exit 1

            }

        }

        Write-Host "The BIOS needs to be updated. [Exit Code: 0]"
        exit 0

    } catch {

        Write-Host "Someone set us up the bomb."

    }

}

Get-UpdateStatus