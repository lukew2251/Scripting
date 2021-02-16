#Luke Willis
#Mod04Homework
import os, getpass

the_desktop = os.path.join('C:\\Users',getpass.getuser(),'Desktop')
os.chdir(the_desktop)

with open('alert_data.csv', 'w') as my_file:
    my_file.write('Date/Time,Priority,Classification,Description,Source IP,Destination IP/n')

with open('alert_fast.pcap','r') as data_file:
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
     prio = split3[1].split(']')
     prio = prio[0]

     So_IP = split3[1].split('->')
     De_IP = So_IP[1]
     So_IP = So_IP[0].strip('] ')
     So_IP = So_IP[13:]
     
     with open('alert_data.csv', 'a') as my_data:
         my_data.write(attack_date + ',' + attack_time + ',' + prio + ',' + classification + ',' + description + ',' + So_IP + ',' + De_IP + '\n')
input()
input()
