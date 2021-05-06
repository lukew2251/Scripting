#Project 3
#Luke Willis

#major descriptors array
$maj_desc=@("BAD-TRAFFIC","DNS SPOOF","ET CURRENT_EVENTS","ET DNS","ET INFO","ET MALWARE","ET POLICY","ET TROJAN",
"ET WEB_CLIENT","ICMP","INFO","SCAN","WEB-IIS")

#parse data function
function parse_func()
{
    $csv_path = $userpath + "\" + $LName + "\" + $FName + "\alert_full_short.cleaned.csv"
    Write-Output ("Date,Time,Priority,Classification,Description,Packet Type,Source IP,Source Port,Destination IP,Destination Port") | Out-File -FilePath $csv_path -Encoding ascii 

    $file = $userpath + "\" + $LName + "\" + $FName + "\alert_full_short.pcap"
    foreach ($line in Get-Content $file)
    {   
        if ($line.readcount -eq 1)
        {
            continue
        }
    
        if ($line.contains("[**]"))
        {
            $sA = $line.split("]")[2]
            $splitB = $sA.split("[")[0]
            $desc = $splitB.trim(" ")
        }
        elseif ($line.contains("Classification"))
        {
            $sA = $line.split("]")[0]
            $splitB = $sA.split(":")[1]
            $class = $splitB.trim(" ")
            $splitC = $line.split("]")[1]
            $splitD = $splitC.split(":")[1]
            $prio = $splitD.trim(" ")
        }
        elseif ($line.contains("->") -and $line.contains("/"))
        {
            $splitE = $line.split(" ")[1]
            if ($splitE.contains(":"))
            {
                $s_ip = $splitE.split(":")[0].trim(" ")
                $s_port = $splitE.split(":")[1].trim(" ")
            }
            else
            {
                $s_ip = $splitE.trim(" ")
                $s_port = "unspecified"
            }

            $splitF = $line.split(" ")[3]
            if ($splitF.contains(":"))
            {
                $dest_ip = $splitF.split(":")[0].trim(" ")
                $dest_port = $splitF.split(":")[1].trim(" ")
            }
            else
            {
                $dest_ip = $splitF.trim(" ")
                $dest_port = "unspecified"
            }
        
                $splitG = $line.split(" ")[0]
                $splitH = $splitG.split("-")[0]
                $date = $splitH.trim(" ")
                $splitI = $splitG.split("-")[1]
                $splitJ = $splitI.split(":")
                $time = $splitJ[0] + ":" + $splitJ[1]
                $flag = 1
        }
        elseif ($line.contains("DgmLen"))
        {
            if ($flag -eq 1)
            {
                $p_type = $line.split(" ")[0].trim(" ")
                $flag = 0
            }
        }
        elseif ($line.length -eq 0)
        {
            Write-Output ($date+","+$time+","+$prio+","+$class+","+$desc+","+$p_type+","+$s_ip+","+$s_port+","+$dest_ip+","+$dest_port) | Out-File -FilePath $csv_path -Encoding ascii -Append
        }
    }

}

#major descriptors function
function maj_func()
{
    while ($true)
    {
        $majdes_array = @()
        $match_array = @()
        $maj_desc=@("BAD-TRAFFIC","DNS SPOOF","ET CURRENT_EVENTS","ET DNS","ET INFO","ET MALWARE","ET POLICY","ET TROJAN","ET WEB_CLIENT","ICMP","INFO","SCAN","WEB-IIS")
        Write-Host "Enter one or more starting characters for your major descriptor, or 
                    Enter nothing to see all major descriptors, or
                    Enter 'exit' to return to the main menu: "
        $input = Read-Host "Please enter your selection"
        $input = $input.ToUpper()
        

        if ($input -eq "EXIT")
        {
            break
        }

        foreach ($i in $maj_desc)
        {
            if ($i.StartsWith($input))
            {
                
                $majdes_array += $i
            }
        }
        if ($majdes_array.length -eq 0)
        {
            clear
            read-host "No major descriptor was found with those starting characters. Hit enter to try again."
        }
        elseif ($majdes_array.length -eq 1)
        {
            clear
            write-host "Your selection is: " $majdes_array[0]
            $file = $userpath + "\" + $LName + "\" + $FName + "\alert_full_short.cleaned.csv"
            foreach ($line in Get-Content $file)
            {
                $desc = $line.split(",")[4]
                if ($desc.Contains($majdes_array[0]))
                {
                    if (-not $match_array.Contains($desc))
                    {
                        $match_array += $desc
                    }
                }
            }
            $length = $match_array.length
            if ($length -eq 1)
            {
                write-host "There is one unique result"
            }
            else
            {
                write-host "There are " $length  " matches"   
            }
            Read-Host "Press enter for a list of unique results"
            write-host $majdes_array[0]
            write-host "--------"
            $match_array = $match_array | sort
            foreach ($i in $match_array)
            {
                write-host $i
            }
            read-host
        }
        else
        {
            foreach ($i in $majdes_array)
            {
                write-host $i 
            }
            Read-Host "More than one major descriptor matches. Press enter to try again." 
        }
    }

}

#classifications function
function class_func()
{
    Read-Host "I tried, sorry. Click enter to return to menu"
}

#clean and exit function
function exit_func()
{
    $csv = $userpath + "\" + $LName + "\" + $FName + "\alert_full_short.cleaned.csv"
    $pcap = $userpath + "\" + $LName + "\" + $FName + "\alert_full_short.pcap"
    $destination = $userpath + "\Willis_Luke"
    $rmdir1 = $userpath + "\" + $LName + "\" + $FName
    $rmdir2 = $userpath + "\" + $LName
    $my_zip = @{
    Path = $csv, $pcap
    CompressionLevel = "Fastest"
    DestinationPath = $destination
    }
    Compress-Archive -Force @my_zip
    #Remove-Item $csv
    #Remove-Item $pcap
    Remove-Item $rmdir1 -Force -Recurse
    Remove-Item $rmdir2 -Force -Recurse
}

#main body
#name strings 
$name = "Luke Willis"
$FName = $name.Split(" ")[0]
$LName = $name.Split(" ")[1]
#Active desktop path
$userpath = "C:\Users\" + $env:USERNAME + "\Desktop"
Set-Location $userpath
#student directory
$dir = $userpath + "\Willis\Luke"
if ((Test-Path -Path $dir) -eq $False)
{
    New-Item -Path $userpath -ItemType Directory -Name Willis\Luke | Out-Null
}
#data file check
$datafile_path = $userpath + "\alert_full_short.zip"
$path2 = Test-Path -Path $datafile_path
#write-host $path2
if ((Test-Path -Path $datafile_path) -eq $False)
{
    Write-Host "Please put the alert_full_short.zip file on the desktop"
}
elseif ((Test-Path -Path $datafile_path) -eq $True)
{
    $zip_final = $userpath + "\" + $LName + "\" + $FName
    $zip_start = $userpath + "\alert_full_short.zip"
    Expand-Archive -Force -Path $zip_start -DestinationPath $zip_final
}
#menu
while ($true)
{
    Write-Host "---- MAIN MENU ----`n"
    Write-Host "Please select from the following options:`n
        1. Parse alert data
        2. Major Descriptors
        3. Classifications
        4. Clean up and exit `n"
    $input = Read-Host "Option#" 
    
    if ($input -eq 1)
    {
        parse_func
    }
    elseif ($input -eq 2)
    {
        maj_func
    }
    elseif ($input -eq 3)
    {
        class_func
    }
    elseif ($input -eq 4)
    {
        exit_func
        break
    }
    else
    {
        Write-Host "That is an invalid selection please pick 1,2,3 or 4"
        continue
    }
}