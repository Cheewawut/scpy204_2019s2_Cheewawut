#!/bin/bash
data="DATA-COVID-19.csv"
count=0
count2=0
sum=0
sum2=0
for var1 in $(cat $data) #read file
do
    for var2 in $var1 #collecting TH
    do
        IFS=","
        if [ "$var2" = "TH" ] ; then 

            for var3 in $var1  #collecting infected people
            do

                (( count++ ))
                if [ $count -gt 4 ] ;then
                    break
                fi

            done

            (( sum=$sum+$var3 )) #sumation of the infected people
        count=0

            for var4 in $var1  #collecting the dead cases
            do

                (( count2++ ))
                if [ $count2 -gt 5 ] ; then
                    break
                fi

            done

            (( sum2=$sum2+$var4 )) #sumation of the dead cases
         count2=0

#I had tired to store the value of the population coulumn(69428524) in the variable $pop, but when I take it to compute, it's error!. 
#            for var5 in $var1 
#            do
#              dumb=1
#            done
#            pop=$var5

        fi
    done
done

#echo $pop
line="==================================================================="
echo $line

echo "The number of infected people in Thailand is $sum "
echo -e "The number of the dead people from Covid-19 in Thailand is $sum2 \n"

#The percentage of the population exposed to coronavirus 

echo -n "The percentage of infected people is "
printf %.10f\\n "$(( 1000000000 * $sum / 69428524 ))e-9"

#The percentage of the dead

echo -n "The percentage of the dead people is "
printf %.10f\\n "$(( 1000000000 * $sum2*100/$sum ))e-9"

echo $line
