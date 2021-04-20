#Luke Willis
#Mod 11 Homework

$name_list = @('Constance Castillo', 'Kerry Goodwin',
 'Dorothy Carson', 'Craig Williams', 'Daryl Guzman', 'Sherman Stewart',
 'Marvin Collier', 'Javier Wilkerson', 'Lena Olson', 'Claudia George',
 'Erik Elliott', 'Traci Peters', 'Jack Burke', 'Jody Turner',
 'Kristy Jenkins', 'Melissa Griffin', 'Shelia Ballard', 'Armando Weaver',
 'Elsie Fitzgerald', 'Ben Evans', 'Lucy Baker', 'Kerry Anderson',
 'Kendra Tran', 'Arnold Wells', 'Anita Aguilar', 'Earnest Reeves',
 'Irving Stone', 'Alice Moore', 'Leigh Parsons', 'Mandy Perez',
 'Rolando Paul', 'Delores Pierce', 'Zachary Webster', 'Eddie Ward',
 'Alvin Soto', 'Ross Welch', 'Tanya Padilla', 'Rachel Logan',
 'Angelica Richards', 'Shelley Lucas', 'Alison Porter', 'Lionel Buchanan',
 'Luis Norman', 'Milton Robinson', 'Ervin Bryant', 'Tabitha Reid',
 'Randal Graves', 'Calvin Murphy', 'Blanca Bell', 'Dean Walters',
 'Elias Klein', 'Madeline White', 'Marty Lewis', 'Beatrice Santiago',
 'Willis Tucker', 'Diane Lloyd', 'Al Harrison', 'Barbara Lawson',
 'Jamie Page', 'Conrad Reynolds', 'Darnell Goodman', 'Derrick Mckenzie',
 'Erika Miller', 'Tasha Todd', 'Aaron Nunez', 'Julio Gomez',
 'Tommie Hunter', 'Darlene Russell', 'Monica Abbott', 'Cassandra Vargas',
 'Gail Obrien', 'Doug Morales', 'Ian James', 'Jean Moran',
 'Carla Ross', 'Marjorie Hanson', 'Clark Sullivan', 'Rick Torres',
 'Byron Hardy', 'Ken Chandler', 'Brendan Carr', 'Richard Francis',
 'Tyler Mitchell', 'Edwin Stevens', 'Paul Santos', 'Jesus Griffith',
 'Maggie Maldonado', 'Isaac Allen', 'Vanessa Thompson', 'Jeremy Barton',
 'Joey Butler', 'Randy Holmes', 'Loretta Pittman', 'Essie Johnston',
 'Felix Weber', 'Gary Hawkins', 'Vivian Bowers', 'Dennis Jefferson',
 'Dale Arnold', 'Joseph Christensen', 'Billie Norton', 'Darla Pope',
 'Tommie Dixon', 'Toby Beck', 'Jodi Payne', 'Marjorie Lowe',
 'Fernando Ballard', 'Jesse Maldonado', 'Elsa Burke', 'Jeanne Vargas',
 'Alton Francis', 'Donald Mitchell', 'Dianna Perry', 'Kristi Stephens',
 'Virgil Goodwin', 'Edmund Newton', 'Luther Huff', 'Hannah Anderson',
 'Emmett Gill', 'Clayton Wallace', 'Tracy Mendez', 'Connie Reeves',
 'Jeanette Hansen', 'Carole Fox', 'Carmen Fowler', 'Alex Diaz',
 'Rick Waters', 'Willis Warren', 'Krista Ferguson', 'Debra Russell',
 'Ellis Christensen', 'Freda Johnston', 'Janis Carpenter', 'Rosemary Sherman',
 'Earnest Peters', 'Kelly West', 'Jorge Caldwell', 'Moses Norris',
 'Erica Riley', 'Ray Gordon', 'Abel Poole', 'Cary Boone',
 'Grant Gomez', 'Denise Chapman', 'Vernon Moran', 'Ben Walker',
 'Francis Benson', 'Andrea Sullivan', 'Wayne Rice', 'Jamie Mason',
 'Jane Figueroa', 'Pat Wade', 'Rudy Bates', 'Clyde Harris',
 'Andre Mathis', 'Carlton Oliver', 'Merle Lee', 'Amber Wright',
 'Russell Becker', 'Natalie Wheeler', 'Maryann Miller', 'Lucia Byrd',
 'Jenny Zimmerman', 'Kari Mccarthy', 'Jeannette Cain', 'Ian Walsh',
 'Herman Martin', 'Ginger Farmer', 'Catherine Williamson', 'Lorena Henderson',
 'Molly Watkins', 'Sherman Ford', 'Adam Gross', 'Alfred Padilla',
 'Dwayne Gibson', 'Shawn Hall', 'Anthony Rios', 'Kelly Thomas',
 'Allan Owens', 'Duane Malone', 'Chris George', 'Dana Holt',
 'Muriel Santiago', 'Shelley Osborne', 'Clinton Ross', 'Kelley Parsons',
 'Sophia Lewis', 'Sylvia Cooper', 'Regina Aguilar', 'Sheila Castillo',
 'Sheri Mcdonald', 'Lynn Hodges', 'Patrick Medina', 'Arlene Tate',
 'Minnie Weber', 'Geneva Pena', 'Byron Collier', 'Veronica Higgins',
 'Leo Roy', 'Nelson Lopez')
 
 #first name function
 function firstname ()
 {
    
    $fname_array = @()
    $fpick = Read-Host -Prompt "Enter the first name, or a partial start of the first name `r`n"
    $fpick = (Get-Culture).TextInfo.ToTitleCase($fpick.ToLower())
    $fname_counter = 0
    foreach($i in $name_list)
    {
        if($i.StartsWith("$fpick"))
        {
            $fname_array += $i
            $fname_counter += 1
        }
        else
        {
            continue
        }
    }
    if($fname_counter -eq 0)
    {
        Write-Host("No first names found starting with $fpick")
        Write-Host("`r`nPress Enter to return to the previous menu")
        Read-Host
        continue
    }
    else
    {
        foreach($i in $fname_array)
        {
            Write-Host $i
        }
        Write-Host("`r`nPress enter to to return to the previous menu")
        Read-Host
        Continue
    }
    Read-Host
 }

 #last name function
 function lastname ()
 {
    clear
    $lname_counter = 0
    $lpick = Read-Host "Enter the last name, or a partial start of the last name "
    $lpick = (Get-Culture).TextInfo.ToTitleCase($lpick.ToLower())
    
    foreach($i in $name_list)
    {
        $lastsplit = $i.Split(" ")
        if($lastsplit[1].StartsWith($lpick))
        {
            Write-Host $lastsplit[1]","$lastsplit[0]
            $lname_counter += 1
        }
        else
        {
            continue
        }
    }
    if($lname_counter -eq 0)
    {
        Write-Host("No Last names found starting with $lpick")
        Write-Host("`r`nPress Enter to return to the previous menu")
        Read-Host
        continue
    }
    else
    {
        foreach($i in $lname_array)
        {
            Write-Host $i
        }
        Write-Host "`r`nPress Enter to return to the previous menu"
        Read-Host
        continue
    }
    Read-Host
 }

 #add a name function
 function add ()
 {
    $input_fname = Read-Host "Enter a new first name"
    $input_fname = (Get-Culture).TextInfo.ToTitleCase($input_fname.ToLower())
    $input_lname = Read-Host "Enter a new last name"
    $input_lname = (Get-Culture).TextInfo.ToTitleCase($input_lname.ToLower())
    $inputname = $input_fname + " " + $input_lname
    $name_list += $inputname
    return $inputname
 }

 #delete a name function
 function delete ()
 {
    $choice = Read-Host ("Enter the full name. '1' to view names or 'Q' to quit: ")
    $choice = (Get-Culture).TextInfo.ToTitleCase($choice.ToLower())
    if ($choice -eq "Q")
    {
        continue
    }
    elseif ($choice -eq 1)
    {
        firstname
        continue
    }
    if (-not $name_list.Contains($choice))
    {
        Write-Host ("`r`n$choice was not found in the array")
        Read-Host ("`r`nPress Enter to return to the previous menu")
        return $name_list
        break
    }
    else
    {
        foreach($i in $name_list)
        {
            if($choice -eq $i)
            {
                $temp_array = @()
                $spot = $name_list.IndexOf($i)
                for ($d = 0; $d -lt $spot; $d++)
                {
                    $temp_array += $name_list[$d]
                }
                Write-Host "`r`n$choice has been removed"
            }
        }
        return $temp_array
        break
    }
 }

 #menu
 while($true)
 {
    Write-Host "
    Please select from the following options:
        1.  List all names starting with one or more letters of the first name
        2.  List all names starting with one or more letters of the last name
        3.  Add a name
        4.  Delete a name
        5.  Exit"

    $pick = Read-Host "Option#: "
    if($pick -eq 1)
    {
        firstname
        
    }
    elseif($pick -eq 2)
    {
        lastname
    }
    elseif($pick -eq 3)
    {
        $name_list += add
    }
    elseif($pick -eq 4)
    {
        $name_list = delete
    }
    elseif($pick -eq 5)
    {
        clear
        break
    }
    else
    {
        clear
        Write-Host "That is not a valid option. Please try again."
        continue
    }
 }