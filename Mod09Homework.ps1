#Luke Willis
#Mod 09 Homework

#setting variables
$base_price = 100
$pay = 0
$balance = 0

#randomizing the cost
$rand_price = Get-Random -Minimum 1 -Maximum 100
$cost = $base_price + $rand_price

#introduction menu
Write-Host "Welcome to the soda machine. You can enter values of 5, 10, or 25 cents in payment."
$choice = Read-Host "What type of soda would you like" 
Write-Host ("The current price of $choice is $cost cents")
if ($choice -ne "")
{
    Write-Host ("The current price of $choice is $cost cents")
    break
}
else
{
    Write-Host "You must enter a value. Press Enter to try again."
    Read-Host
    clear
    continue
}

while ($true)
{
    $input = Read-Host "Enter a coin: "
    if ($input -eq 5)
    {
        Write-Host "You have inserted a nickel."
    }
    elseif ($input -eq 10)
    {
        Write-Host "You have inserted a dime."
    }
    elseif ($input -eq 25)
    {
        Write-Host "You have inserted a quarter."
    }
    else
    {
        Write-Host "That is not a valid amount."
        continue
    }
    $pay += $input
    $balance = $cost - $pay
    if ($balance -gt 0)
    {
        Write-Host ("You still owe $balance cents")
        continue
    }
    elseif ($balance -lt 0)
    {
        Write-Host ("You have been refunded $balance cents.")
        break
    }
    else
    {
        Write-Host ("Enjoy your $choice !")
    }
}
Write-Host "Press enter to close the program: "