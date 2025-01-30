#!/bin/bash

address_info(){ #function to display the user-interface
    reset
    echo "welcome to address book"
    echo "1- to display records"
    echo "2- to add records"
    echo "3- to remove records"
    echo "4- to quit the app "
}

diplay_details(){ #function to display required record
    

    RECORD=$1
    

    name=$(nl address.txt | grep -w $RECORD | awk '{print $2}' )  # here $2, $3, $4 are used to extract each word
    role=$(nl address.txt | grep -w $RECORD | awk '{print $3}' )
    phone=$(nl address.txt | grep -w $RECORD | awk '{print $4}' )
    


    echo "Required Details!!:"
    echo "Name: $name , Role: $role and Phone: $phone"
    

}

add_details(){  #function to add the add new records

    read -p "enter the name of employee: " name
    
    read -p "enter the role of employee: " role
    
    read -p "enter the phone no of employee: " phone
    

    echo "$name $role $phone" >> address.txt

    echo "details added!"

}

remove_details() { #function to remove particular record
  
  DATA=$1
  echo "Removing address book entry"
  sed -i "" "/$DATA/d" address.txt
  echo "removed successfully"
}

go_back(){  #function to move to back to main menu

    read -p "please enter 'm' go to main page or 'q' to quit: " REPLY

    if [ $REPLY = "m" ]; then
    address_info
    read choice
       elif [ $REPLY = "q" ]; then
       exit 0
       else 
       echo "entered wrong input"
       go_back
    fi
}

address_info

echo  "enter the choice(1, 2, 3, 4):  "

read choice

while [ $choice -ne 4 ] 
do
   if [ $choice -eq 1 ]; then
   echo "please enter the details to display records <name> or <role> or <phone>: "
   read Query
   diplay_details $Query
   go_back
     elif [ $choice -eq 2 ]; then
     add_details
     go_back
        elif [ $choice -eq 3 ]; then
        echo "please enter the details to removed <name> <role> <address>: "  
        read unwanted
        remove_details $unwanted
        go_back
                  else
                  echo "choice is not valid"
                  exit 0

    fi
done    

