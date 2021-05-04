#Project 3
#Luke Willis

#major descriptors array
$maj_desc=@("BAD-TRAFFIC","DNS SPOOF","ET CURRENT_EVENTS","ET DNS","ET INFO","ET MALWARE","ET POLICY","ET TROJAN",
"ET WEB_CLIENT","ICMP","INFO","SCAN","WEB-IIS")

#parse data function
function parse_func()
{
    $csv_path = $user_path + "\" + $last_name + "\" + $first_name + "\alert_full_short.cleaned.csv"
    Write-Output ("Date,Time,Priority,Classification,Description,Packet Type,Source IP,Source Port,Destination IP,Destination Port") | Out-File -FilePath $csv_path -Encoding ascii 

    $file = $user_path + "\" + $last_name + "\" + $first_name + "\alert_full_short.pcap"
    foreach ($line in Get-Content $file)
    {   
        if ($line.readcount -eq 1)
        {
            continue
        }
    
        if ($line.contains("[**]"))
        {
            $split1 = $line.split("]")[2]
            $split2 = $split1.split("[")[0]
            $description = $split2.trim(" ")
        }
        elseif ($line.contains("Classification"))
        {
            $split1 = $line.split("]")[0]
            $split2 = $split1.split(":")[1]
            $classification = $split2.trim(" ")
            $split3 = $line.split("]")[1]
            $split4 = $split3.split(":")[1]
            $priority = $split4.trim(" ")
        }
        elseif ($line.contains("->") -and $line.contains("/"))
        {
            $split5 = $line.split(" ")[1]
            if ($split5.contains(":"))
            {
                $source_ip = $split5.split(":")[0].trim(" ")
                $source_port = $split5.split(":")[1].trim(" ")
            }
            else
            {
                $source_ip = $split5.trim(" ")
                $source_port = "unspecified"
            }

            $split6 = $line.split(" ")[3]
            if ($split6.contains(":"))
            {
                $destination_ip = $split6.split(":")[0].trim(" ")
                $destination_port = $split6.split(":")[1].trim(" ")
            }
            else
            {
                $destination_ip = $split6.trim(" ")
                $destination_port = "unspecified"
            }
        
                $split7 = $line.split(" ")[0]
                $split8 = $split7.split("-")[0]
                $date = $split8.trim(" ")
                $split9 = $split7.split("-")[1]
                $split10 = $split9.split(":")
                $time = $split10[0] + ":" + $split10[1]
                $flag = 1
        }
        elseif ($line.contains("DgmLen"))
        {
            if ($flag -eq 1)
            {
                $packet_type = $line.split(" ")[0].trim(" ")
                $flag = 0
            }
        }
        elseif ($line.length -eq 0)
        {
            Write-Output ($date+","+$time+","+$priority+","+$classification+","+$description+","+$packet_type+","+$source_ip+","+$source_port+","+$destination_ip+","+$destination_port) | Out-File -FilePath $csv_path -Encoding ascii -Append
        }
    }

}

#major descriptors function
function maj_func()
{
    while ($true)
    {
        $major_des_array = @()
        $clean_matches = @()
        $major_descriptors=@("BAD-TRAFFIC","DNS SPOOF","ET CURRENT_EVENTS","ET DNS","ET INFO","ET MALWARE","ET POLICY","ET TROJAN","ET WEB_CLIENT","ICMP","INFO","SCAN","WEB-IIS")
        Write-Host "Enter one or more starting charachters for your major descriptor, or 
                    Enter nothing to see all major descriptors, or
                    Enter 'exit' to return to the main menu: "
        $user_input = Read-Host "Please enter your selection"
        $user_input = $user_input.ToUpper()
        

        if ($user_input -eq "EXIT")
        {
            break
        }

        foreach ($i in $major_descriptors)
        {
            if ($i.StartsWith($user_input))
            {
                
                $major_des_array += $i
            }
        }
        if ($major_des_array.length -eq 0)
        {
            clear
            read-host "No major descriptor was found with those starting characters. Hit enter to try again."
        }
        elseif ($major_des_array.length -eq 1)
        {
            clear
            write-host "Your selection is: " $major_des_array[0]
            $file = $user_path + "\" + $last_name + "\" + $first_name + "\alert_full_short.cleaned.csv"
            foreach ($line in Get-Content $file)
            {
                $description = $line.split(",")[4]
                if ($description.Contains($major_des_array[0]))
                {
                    if (-not $clean_matches.Contains($description))
                    {
                        $clean_matches += $description
                    }
                }
            }
            $length = $clean_matches.length
            if ($length -eq 1)
            {
                write-host "There is one unique result"
            }
            else
            {
                write-host "There are " $length  " matches"   
            }
            Read-Host "Please hit enter to see the matches"
            write-host $major_des_array[0]
            write-host "--------"
            $clean_matches = $clean_matches | sort
            foreach ($i in $clean_matches)
            {
                write-host $i
            }
            read-host
            break

        }
        else
        {
            foreach ($i in $major_des_array)
            {
                write-host $i 
            }
            Write-Host "There were too many matches try again" 
        }
    }

}

#classifications
function class_func()
{
    $class_array = @()
    $temp_array = @()
    $temp_array2 = @()
    $file = $user_path + "\" + $last_name + "\" + $first_name + "\alert_full_short.cleaned.csv"
    foreach ($line in Get-Content $file)
    {
        if ($line.readcount -eq 1)
        {
            continue
        }
        $classif = $line.Split(",")[3]
        if (-not $class_array.Contains($classif))
        {
            $class_array += $classif
        }

    } 
    foreach ($i in $class_array)
    {
        Write-Host $i
        foreach ($line in Get-Content $file)
        {
            $class_name = $line.Split(",")[3]
            $temp_array2 += $class_name
            if ($i -eq $class_name)
            {
                $temp_array += $class_name
            }
        }
        $instances = $temp_array.Length
        $total_len = $temp_array2.Length
        Write-Host `t $instances " instance(s) found in this file"
        $percent =  ($instances/$total_len)*100
        $percent2 = [math]::round($percent,2)
        write-host `t "Comprises " $percent2 "% of all alerts`n"
        $temp_array = @()
        $temp_array2 = @()

    }
}

#clean and exit function
function exit_func()
{
    $csv_tozip = $user_path + "\" + $last_name + "\" + $first_name + "\alert_full_short.cleaned.csv"
    $pcap_tozip = $user_path + "\" + $last_name + "\" + $first_name + "\alert_full_short.pcap"
    $dest_path = $user_path + "\Brill_Andrew"
    $rmdir_path = $user_path + "\" + $last_name + "\" + $first_name
    $rmdir_path2 = $user_path + "\" + $last_name
    $my_zip = @{
    Path = $csv_tozip, $pcap_tozip
    CompressionLevel = "Fastest"
    DestinationPath = $dest_path
    }
    Compress-Archive -Force @my_zip
    #Remove-Item $csv_tozip
    #Remove-Item $pcap_tozip
    Remove-Item $rmdir_path -Force -Recurse
    Remove-Item $rmdir_path2 -Force -Recurse
    
}

#main body

#name strings 
$my_name = "Luke Willis"
$first_name = $my_name.Split(" ")[0]
$last_name = $my_name.Split(" ")[1]

#Active desktop path
$user_path = "C:\Users\" + $env:USERNAME + "\Desktop"
Set-Location $user_path

#student directory
$stu_dir = $user_path + "\Willis\Luke"
if ((Test-Path -Path $stu_dir) -eq $False)
{
    New-Item -Path $user_path -ItemType Directory -Name Willis\Luke | Out-Null
}

#data file check
$data_path = $user_path + "\alert_full_short.zip"
$path_test2 = Test-Path -Path $data_path
#write-host $path_test2
if ((Test-Path -Path $data_path) -eq $False)
{
    Write-Host "Please put the alert_full_short.zip file on the desktop"
}
elseif ((Test-Path -Path $data_path) -eq $True)
{
    $zip_dest = $user_path + "\" + $last_name + "\" + $first_name
    $zip_path = $user_path + "\alert_full_short.zip"
    Expand-Archive -Force -Path $zip_path -DestinationPath $zip_dest
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
    $user_input = Read-Host "Option#" 
    
    if ($user_input -eq 1)
    {
        parse_func
    }
    elseif ($user_input -eq 2)
    {
        maj_fun
    }
    elseif ($user_input -eq 3)
    {
        class_func
    }
    elseif ($user_input -eq 4)
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