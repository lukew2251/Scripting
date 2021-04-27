#Luke Willis
#Mod 12 Homework

#make path to the user desktop
$user_path = "C:\Users\" + $env:USERNAME + "\Desktop"
Set-Location $user_path

#write the header
Write-Output ("Date,Time,Priority,Classification,Description,Source IP,Destination IP") | Out-File "alert_data.csv" -Encoding ascii

$file = ".\fast_short.pcap"

foreach ($line in Get-Content $file)
{
    if ($line.readcount -eq 1)
    {
        continue
    }
    $split1 = $line.Split("[**]", [System.StringSplitOptions]::RemoveEmptyEntries)
    $date_time = $split1[0]    #date/time
    $date = $date_time.Substring(0,4)   #date
    $time = $date_time.Substring(6,5)  #time
    $prior = $split1[7]
    $priority = $prior[10]  #priority
    $class = $split1[5]
    $class = $class.Split(":")
    $classification = $class[1].Trim(" ")  #classification
    $desc = $split1[3].Trim(" ")  #description
    $addy = $split1[8].Split(" ")
    $sourceIP = $addy[2]  #source IP
    $destIP = $addy[4]  #destination IP

    #write out the output to the csv file
    Write-Output ($date + "," + 
    $time + "," + 
    $priority + "," + 
    $classification + "," + 
    $desc + "," + 
    $sourceIP + "," + 
    $destIP) | Out-File "alert_data.csv" -Encoding ascii -Append
}
Read-Host "Processing is done. Press Enter to close the script"