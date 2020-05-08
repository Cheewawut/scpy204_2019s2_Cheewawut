#!/bin/bash

# Header
clear
intline="------------------------------------------------"
echo "$intline"
echo "    This is a risk assessment on COVID-19"
echo "$intline"
dum=1
dum5=0
echo -e "\n|| PART I ||\n"

# asking for user's name
read -p "Hello sir may I know your name please : " name

while [ $dum5 -eq 0 ] 
do
    if [ -z $name ] 
    then
        echo "Please enter your name"
        read name
    else 
        dum5=1
    fi  
done

# asking for user's gender
while [ $dum -eq 1 ]
do
    echo -e "\nWhat is your gender (male or female only)? "
    read gender
    if [ ${gender^^} = "MALE" ]
    then
        g="Mr."
        echo -e "\nOK $g$name, nice to meet you."
        dum=0
    elif [ ${gender^^} = "FEMALE" ]
    then
        g="Mrs."
        echo -e "\nOK $g$name nice to meet you."
        dum=0
    else 
        echo -e "\nplease enter the appropriate answer!!!"
    fi
done

#asking for user's ages
dum3=0
while [ $dum3 -eq 0 ] 
do 
    echo -e "\nHow old are you?"
    read age
    if [ $age -lt 100000 ]
    then
        dum3=1
    else
        echo -e "\nERROR!!!"
        echo "Please enter integer only"
    fi
done
arrow="----------------------------------->"
echo -e "\nOk $g$name please press an enter to go to part II"
echo "-------------$arrow"
read any


clear
#Asking for which country he/she is backed from

#declaring arrays of the countries
asia=(China Indonesia Iran Isarael Japan Malaysia Pakistan SouthKorea Vietnam)
eu=(Austria Belgium Czech Denmark Finland France Germany Greece Ireland Italy Luxembourg netherlands Norway Poland Portugal Spain Sweden Switzerland Turkey United_Kingdom)
n_a=(Canada United_State)
s_a=(Brazil Chile Ecudor)
Aus=(Australia)

country=0
dum2=1
Y=("yes" "Yes" "YES" "yEs" "yeS" "yES" "YEs" "YeS")
N=("no" "No" "NO" "nO")

echo -e "\n|| PART II ||"

#show the list of high-risk countries (still having a problem)
echo -e "==========================================================================================="
echo -e "                                  List of High-Risk Countries"
echo -e "==========================================================================================="
echo -e "->Asia" "\n${asia[@]:0:5}" "\n${asia[@]:5:9}" "\n"
echo -e "->Europe\n"${eu[@]:0:10} "\n"${eu[@]:10:20} "\n"
echo -e "->North America\n"${n_a[@]} "\n"
echo -e "->South America\n"${s_a[@]} "\n"
echo -e "->Australia\n"${Aus[@]}     
echo -e "===========================================================================================\n"

while [ $dum2 -eq 1 ]  #asking for the answer
do
    echo "Have you ever visited one of these high-risk countries, which are shown above, in a few months ago?"
    read -p "(Yes or No only!) : " c
        if [ ${c^^} = "YES" ] 
        then
            dum2=0
            country=1
        elif [ ${c^^} = "NO" ]
        then
            dum2=0   
        elif [ -z $c ]
        then
            echo -e "\nPlease Enter The answer" 
        fi
done

echo -e "\nPress an enter to go to PART III"
echo "$arrow"
read any

clear

#Asking whether he/she has these symptoms or not?
echo -e "\n|| PART III ||\n"
f="fever"
st="sore throat"
co="cough"
more="more than one symptom"
line="===================================="

dum4=0
while [ $dum4 -eq 0 ]
do
    echo -e "Do you have any respiratory symptom?"  
    read -p "(YES or NO): "  b
    if [ ${b^^} = "YES" ] #in case he/she has
    then
        echo -e "\n$line"
        echo -e "Please select which one do you have?"
        echo "$line"
        select symptom in "$f" "$st" "$co" "$more" #giving choices to a user
        do
            case $symptom in
                $f)
                  s=1
                  dum4=1
                   break
                    ;;
                $st)
                    s=1
                    dum4=1
                    break
                    ;;
                $co)
                    s=1
                    dum4=1
                    break
                    ;;
                $more)
                    s=1
                    dum4=1
                    break
                    ;;
                 *) 
                    echo -e "\nPlease enter a number from 1-4"
                    ;;
             esac
        done
    elif [ ${b^^} = NO ] #in case he/she doesn't has
    then
        dum4=1
        s=0
    else 
        echo -e "\nplease enter yes or no only."
    fi

done

echo -e "\nPress an enter to see your result."
read any

#showing the result

clear
safeline="########################################################"
dangerline="!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
if [ "$s" -eq 1 ] || [ "$country" -eq 1 ]
then
    echo -e "$dangerline\n"
    echo -e "${g^^}${name^^} please go to see a doctor right away!! You are at risk of Covid-19\n"
    echo -e "$dangerline"
else
    echo -e "$safeline\n"
    echo -e "Congratulation! $g$name you are free from Covid-19\n"
    echo "$safeline"
fi

exit 0





























    

















