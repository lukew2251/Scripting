#imports
import os, zipfile, getpass

#tuple
tuple_list = ('ATTACK-RESPONSES',
 'BAD-TRAFFIC', 'CHAT IRC', 'COMMUNITY WEB',
 'DNS SPOOF', 'ET ACTIVEX', 'ET CHAT IRC',
 'ET CNC', 'ET CURRENT_EVENTS', 'ET DNS',
 'ET EXPLOIT', 'ET INFO', 'ET MALWARE', 'ET P2P',
 'ET POLICY', 'ET SCAN', 'ET SHELLCODE', 'ET TROJAN',
 'ET USER_AGENTS', 'ET WEB_CLIENT', 'ET WEB_SERVER',
 'ET WEB_SPECIFIC_APPS', 'GPL', 'ICMP', 'INFO',
 'MS-SQL', 'MULTIMEDIA', 'P2P', 'POLICY', 'SCAN',
 'WEB-ATTACKS', 'WEB-CGI', 'WEB-CLIENT', 'WEB-FRONTPAGE',
 'WEB-IIS', 'WEB-MISC', 'WEB-PHP')
#function 1
def parse():
    print('Be patient for the time being...')
    counter = 0
    with open('Willis\\Luke\\alert.full.maccdc2012.cleaned.csv', 'w') as my_file:
        my_file.write('Date,Time,Priority,Classification,Description,Packet Type,Source IP,Source Port,Destination IP, Destination Port\n')
    with open('Willis\\Luke\\alert.full.maccdc2012.pcap', 'r') as data_file:
        for i in data_file:
            counter += 1
            if '[**]' in i:
                split1 = i.split('] ')
                split2 = split1[2]
                split3 = split2.split(' [')
                Description = split3[0]
            elif 'Classification' in i:
                split4 = i.split('] ')
                Classification = split4[0].strip('[')
                Priority = split4[1].strip('[')
            elif '->' and '/' in i:
                split5 = i.split('-')
                date = split5[0]
                split6 = split5[1].split(' ')
                time = split6[0]
                split7 =  split5[2].strip('>')
                split8 = split7.split(':')
                Destination_IP = split8[0]
                Destination_Port = split8[1].strip('\n')
                split9 = split6[1].split(':')
                Source_IP = split9[0]
                Source_Port = split9[1]
            elif 'DgmLen' in i:
                splita = i.split(':')
                packer = splita[0][:-4]
            elif '\n' in i:
                with open('Willis\\Luke\\alert.full.maccdc2012.cleaned.csv', 'a') as my_file:
                    my_file.write(date + ','
                                  + time + ','
                                  + Priority + ','
                                  + Classification + ','
                                  + Description + ','
                                  + packer + ','
                                  + Source_IP + ','
                                  + Source_Port + ','
                                  + Destination_IP + ','
                                  + Destination_Port)                    
            else:
                menu()
                continue
    
#function 2
def maj_des():
    tuples = tuple_list
    if os.path.exists('.\\alert.full.maccdc2012.cleaned.csv'):
        print()
    else:
        print('Parse alert data first using choice1 from the main menu.')
        return
    while True:
        choice_list = []
        print('''
            Enter one or more starting character for your major descriptor, or 
            Enter nothing to see all major descriptors, or
            Enter 'exit' to return to the main menu: ''')
        choice = input()
        choice.upper()
        if choice == 'exit':
            break
        else:
             for x in range(0, len(desc)):
                 letters = desc[x].split()
                 choice = letters[0]
                 if choice.startswith[choice.title()]:
                     choice_list.append(desc)
                     print(choice_list)
                 else:
                     print('No major descriptor was found with those starting characters. Please try again.')
                 break
  
#function 3
#Def classif

#function 4
##def clean_up():
##new_zip = zipfile.ZipFile('Willis_Luke.zip', 'w') 
##new_zip.write('alert.full.maccdc2012.pcap', compress_type=zipfile.ZIP_DEFLATED)
##new_zip.write('alert.full.maccdc2012.cleaned.csv', compress_type=zipfile.ZIP_DEFLATED)
##new_zip.close()

#Function 5
def menu():
    print('''
Please select from the following options:
1. Parse alert data
2. Major descriptors
3. Classifictions
4. Clean up and exit
''')
    
#main body
MY_NAME = "Luke Willis"
my_name = MY_NAME.split()
l_name = my_name[1]
f_name = my_name[0]
path = os.path.join('C:\\Users\\dwill11\\Desktop', l_name, f_name)
the_desktop = os.path.join('C:\\Users',getpass.getuser(),'Desktop')
os.chdir(the_desktop)
os.makedirs(path)

#Data File Check
if os.path.exists('.\\alert.full.maccdc2012.zip'):
    with zipfile.ZipFile('alert.full.maccdc2012.zip') as zipextract:
        zipextract.extractall(path)
else:
    print('Make sure your file alert.full.maccdc2012.zip is on your desktop and please restart script!')
    

#menu
while True:
    menu()
    choice = input('Option#: ')
#option 1
    if choice == '1':
        parse()
#option 2
    if choice == '2':
        maj_des()
#option 3
    if choice == '3':
        classif()
#option 4
    if choice == '4':
        clean_up()

    

