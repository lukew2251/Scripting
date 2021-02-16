#Luke Willis
#Mod04Homework
import os,getpass

the_desktop = os.path.join('C:\\Users',getpass.getuser(),'Desktop')
os.chdir(the_desktop)

with open('alert.fast.maccdc2012_00000.csv', 'w') as my_file:
    my_file.write('Date/Time,Priority,Classification,Description,Source IP,Destination IP/n')

with open('alert.fast.maccdc2012_00000.pcap','r') as data_file:
 for i in data_file:
     split1 = i.split('[**]')
     date_time = split1[0]           #date/time
     attack_date = date_time[:5]     #date
     attack_time = date_time[6:11]   #time

     split2 = split1[1].split('] ')
     description = split2[1].strip() #description

     split3 = split1[2].split('] [')
     classification = split3[0]
     classification = classification.strip(' [')
     classification = classification[16:]    #classification
     break
    
input()
input()
