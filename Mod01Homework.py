#Luke Willis
#Mod1Homework
import random

print('Welcome to the soda machine. You can enter values of 5, 10 or 25 in payement.')
print('What type of soda would you like?')

#Setting the variable values
Soda = input()
BP = 100
Total = 0

#using the random import to create random soda price
for i in range (0,7):
    random_value = random.randint(-3,3)
    price_variance = random_value * 5

#remaining value
change = BP + price_variance
print('The current price of ' + Soda + ' is ' + str(change) + ' cents')

#loop to get remaining payement
while True:

    cents = int(input('Enter a coin: '))
    Total = Total + cents
    Balance = change - Total
    
    
    #when the amount is still owed
    if Balance > 0:
        fullbalance = str(Balance)
        print('You still owe ' + fullbalance + 'cents.')
    #overpayement
    elif Balance < 0:
        Balance = str(abs(Balance))
        print('You have been refunded ' + Balance + 'cents.')
        print('Enjoy your ' + Soda + '!')
        input()
        break
    #full payed
    else:
        print('Enjoy your ' + Soda + '!')
        input()
        break
        
