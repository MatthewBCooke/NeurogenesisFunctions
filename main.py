import math
import csv

def postnatal_day_neurons(x):
    #maxX = 900
    return 1406*math.exp(-((10*x/1867)-(1657/1867))**2)+6065*math.exp(-((50*x/2263)-5407/4526)**2)

def dendritic_length(x):
    #maxX = 350
    return 5041-(5042/x**(471/2500))

def thin_spines(x):
    #maxX = 180
    return 309/(200*(math.exp((114917/25000)-(337*x/2000))+1))

def mushroom_spines(x):
    #maxX = 170
    return (-1073/(1000*x**(1613/10000)))-(3549/5000)

def thin_mush(x):
    #maxX = 170
    return 89/(50*(math.exp((232621/50000)-((167*x)/(1000)))+1))

def protrusions(x):
    #maxX = 170
    return 927/(500*(math.exp((2258157/500000)-(1669*x/10000))+1))


maxX = 170
with open('protrusions.csv', 'w') as csvfile:
    writer = csv.writer(csvfile)
    for x in range(0,maxX*10):
        x = float(x)/10
        y = protrusions(x)
        writer.writerow([x,y])
