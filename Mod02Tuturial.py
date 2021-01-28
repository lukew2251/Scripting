#Luke Willis
#MOD 02 Tutorial

import random

def rando_inset(thing_being_inserted):
    position = random.randint(0,9)
    my_list.insert(position, thing_being_inserted)
counter = 0
my_list = []

while counter < 10:
    list_item = input('Please enter a word or a number: ')
    my_list.append(list_item)
    counter +=1

for i in my_list:
    print(i)
    
#Task 1
print('\nTask 1')
print('This list has 10 items. ' + str(len(my_list) == 10))

#Task 2
print('\nTask 2')
print(my_list)

#Task 3
print('\nTask 3')
first_thing = my_list[0]
my_list[0] = my_list[-1]
my_list[-1] = first_thing
print(my_list)

#Task 4
print('\nTask 4')
print(my_list[0:3], my_list[-3:])

#Task 5
print('\nTask 5')
for i in my_list:
    print(i)

#Task 6
print('\nTask 6')
if 'cat' in my_list:
    print('There is a cat in my list')
else:
    print('There is no cat in my list')

#Task 7
print('\nTask 7')
another_item = input('Please inset the name of ')
rando_inset(another_item)

#Task 8
print('\nTask 8')
print(another_item + ' is at index ' + str(my_list.index(another_item)))

#Task 9
print('\nTask 9')
ints_only = my_list
for luke in my_list:
    try:
        int(Luke)
        ints_only.append(int(luke))
    except:
        continue

ints_only.sort()
print('These are the integers from the list')
print(ints_only)

#Task 10
print('\nTask 10')
my_tuple = tuple(my_list)
print(my_tuple)

#Task 11
print('\nTask 11')
try:
    my_tuple[0] = 'cat'
except:
    print('Tuples are immutable!')

#Task 12
print('\nTask 12')
list_in_list = [[1,2,3],['a','b','c']]
for i in list_in_list:
    for j in i:
         print(j)
