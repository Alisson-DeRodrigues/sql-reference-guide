#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=salon --no-align --tuples-only -c"

echo -e "\n~~~~~ MY SALON ~~~~~\n"

MAIN_MENU () {
  if [[ $1 ]]
  then
    echo -e "\n$1"
  else
    echo -e "Welcome to My Salon, how can I help you?\n"
  fi

  echo -e "1) cut\n2) color\n3) perm\n4) style\n5) trim"
  read SERVICE_ID_SELECTED

  case $SERVICE_ID_SELECTED in
    1) CUSTOMER_SERVICE cut ;;
    2) CUSTOMER_SERVICE color ;;
    3) CUSTOMER_SERVICE perm ;;
    4) CUSTOMER_SERVICE style ;;
    5) CUSTOMER_SERVICE trim ;;
    *) MAIN_MENU "I could not find that service. What would you like today?" ;;
  esac
}

CUSTOMER_SERVICE() {
  SERVICE_NAME=$($PSQL "select name from services where name='$1'")

  # dupla verificação; verifica se o serviço está no intervalo válido
  if [[ -z $SERVICE_NAME ]]
  then
    MAIN_MENU "I could not find that service. What would you like today?"
  else
    #obtém número de telefone
    SERVICE_ID=$($PSQL "select service_id from services where name='$SERVICE_NAME'")
    echo -e "\nWhat's your phone number?"
    read CUSTOMER_PHONE

    #verifica se há um cliente cadastrado
    CUSTOMER_NAME=$($PSQL "select name from customers where phone='$CUSTOMER_PHONE'")

    #se não houver cliente cadastraddo
    if [[ -z $CUSTOMER_NAME ]]
    then
      echo -e "\nI don't have a record for that phone number, what's your name?"
      read CUSTOMER_NAME

      #realiza cadastro de cliente
      INSERT_CUSTOMER_RESULT=$($PSQL "insert into customers (phone, name) values('$CUSTOMER_PHONE', '$CUSTOMER_NAME')")
    fi

    CUSTOMER_ID=$($PSQL "select customer_id from customers where phone='$CUSTOMER_PHONE'")

    #quando há cliente cadastrado
    echo -e "\nWhat time would you like your $SERVICE_NAME, $CUSTOMER_NAME?"
    read SERVICE_TIME
    SERVICE_TIME_DISP=$($PSQL "select time from appointments where time='$SERVICE_TIME'")
    
    #se houver hora disponível
    if [[ -z $SERVICE_TIME_DISP ]]
    then
      INSERT_APPOINTMENT_RESULT=$($PSQL "insert into appointments(customer_id, service_id, time) values($CUSTOMER_ID, $SERVICE_ID, '$SERVICE_TIME')")
      echo -e "\nI have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."
    else
      #se não houver hora disponível
      echo -e "We do not have an agenda for that time, $CUSTOMER_NAME."
    fi
  fi
}

MAIN_MENU
