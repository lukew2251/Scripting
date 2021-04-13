#Luke Willis
#Mod 10 Homework

#decks
$spades = @(
'Ace of Spades', 'King of Spades',
'Queen of Spades', 'Jack of Spades',
'10 of Spades', '9 of Spades',
'8 of Spades', '7 of Spades',
'6 of Spades', '5 of Spades',
'4 of Spades', '3 of Spades',
'2 of Spades')

$diamonds = @(
'Ace of Diamonds', 'King of Diamonds',
'Queen of Diamonds', 'Jack of Diamonds',
'10 of Diamonds', '9 of Diamonds',
'8 of Diamonds', '7 of Diamonds',
'6 of Diamonds', '5 of Diamonds',
'4 of Diamonds', '3 of Diamonds',
'2 of Diamonds')

$clubs = @(
'Ace of Clubs', 'King of Clubs',
'Queen of Clubs', 'Jack of Clubs',
'10 of Clubs', '9 of Clubs',
'8 of Clubs', '7 of Clubs',
'6 of Clubs', '5 of Clubs',
'4 of Clubs', '3 of Clubs',
'2 of Clubs')


$hearts = @(
'Ace of Hearts', 'King of Hearts',
'Queen of Hearts', 'Jack of Hearts',
'10 of Hearts', '9 of Hearts',
'8 of Hearts', '7 of Hearts',
'6 of Hearts', '5 of Hearts',
'4 of Hearts', '3 of Hearts',
'2 of Hearts')

#declaring the play suits
$play_spades = @()
$play_diamonds = @()
$play_clubs = @()
$play_hearts = @()

#function to make a new deck
function new_deck()
{
    $Global:spadesCounter = 0
    $Global:diamondsCounter = 0
    $Global:clubsCounter = 0
    $Global:heartsCounter = 0
    foreach($i in $spades)
    {
        $Global:play_spades += $i
    }
    foreach($i in $diamonds)
    {
        $Global:play_diamonds += $i
    }
    foreach($i in $clubs)
    {
        $Global:play_clubs += $i
    }
    foreach($i in $hearts)
    {
        $Global:play_hearts += $i
    }
}

#function to remove a card
function remove_card($deckArray, $indexSpot)
{
    $deckArray = @()
    foreach ($i in $deckArray)
    {
        if($deckArray.IndexOf($i) -ne $indexSpot)
        {
            $deckArray += $i
        }
    }
    return $deckArray
}

#function to get a card
function get_card()
{

    clear
    #check for valid input
    $cardinput = Read-Host "How many cards would you like to draw from this deck?"
    if($cardinput -notmatch "^[+]?[0-9]")
    {
        Write-Host "Invalid option, Press enter to the main menu"
        Write-Host $i
    }
    $leftover = $play_spades + $play_diamonds + $play_clubs + $play_hearts
    if ($cardinput -gt $leftover)
    {
        Write-Host ("There are only $leftover left in the deck but you have requested $cardinput")
        Read-Host "Press enter to continue"
        return
    }
    Write-Host "Your Cards are: `r`n"
    while ($leftover -gt 0)
    {
        if(($Global:spades_ncounter -eq 1),($Global:diamonds_ncounter -eq 1),($Global:clubs_ncounter -eq 1),($Global:hearts_ncounter))
        {
            Write-Host "There are no more cards in the deck"
            return
        }
            $suit = Get-Random -Minimum 1 -Maximum $suit_len
            if($suit -eq 0)
            {
                $suit_len = $Global:diamonds_ncounter
                if($suit_len -eq 0)
                {
                    $Global:diamonds_ncounter = 1
                    continue
                }
                elseif ($suit_len -eq 1)
                {
                    Write-Host $play_diamonds
                    $play_diamonds = @()
                    continue
                }
                else
                {
                    $card = Get-Random -Minimum 1 -Maximum $suit_len
                    Write-Host $play_diamonds[$card]
                    $card_gone = ($leftover -1)
            
                }
            elseif($suit -eq 1)
            {
                $suit_len = $Global:play_clubs.Length
                if($suit_len -eq 0)
                {
                    $Global:clubs_ncounter = 1
                    continue
                }
                elseif($suit_len -eq 1)
                {
                    Write-Host $Global:play_clubs
                    $play_clubs = @()
                    continue
                }
                else
                {
                    $card = Get-Random -Minimum 1 -Maximum $suit_len
                    Write-Host $Global:play_clubs[$card]
                    $card_gone = ($leftover -1)
                }
            }
            elseif($suit -eq 2)
            {
                $suit_len = $Global:play_hearts.Length
                if($suit_len -eq 0)
                {
                    $Global:hearts_ncounter = 1
                    continue
                }
                elseif($suit_len -eq 1)
                {
                    Write-Host $Global:play_hearts
                    $play_hearts = @()
                    continue
                }
                else
                {
                    $card = Get-Random -Minimum 1 -Maximum $suit_len
                    Write-Host $Global:play_hearts
                    $card_gone = ($leftover -1)
                }
            }
            elseif($suit -eq 3)
            {
                $suit_len = $Global:play_spades.Length
                if($suit_len -eq 0)
                {
                    $Global:spades_ncounter = 1
                    continue
                }
                elseif ($suit_len -eq 1)
                {
                    Write-Host $Global:play_spades
                    $play_spades = @()
                    continue
                }
                else
                {
                    $card = Get-Random -Minimum 1 -Maximum $suit_len
                    Write-Host $Global:play_spades
                    $card_gone = ($leftover -1)
                }
            }
    }
}

#menu

new_deck

while($true)
{
    clear
    Write-Host 
    "Welcome to the card deck simulator.

    Please select from the following options:
        
        1. Draw a selected number of cards from the current deck
        2. Get a new deck of cards
        3. Exit"
   $user_pick = Read-Host " Options#: "
   if ($user_pick -eq 1)
   {
        get_card
        remove_card
   }
   elseif($user_pick -eq 2)
   {
        new_deck
   }
   elseif($user_pick -eq 3)
   {
        else
   }
   else
   {
        Read-Host "That is not a valid selection. Press enter to continue:"
   }
}
