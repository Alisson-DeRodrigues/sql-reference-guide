#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"


ARG=$1
MAIN() {
  # SE NADA FOR PASSADO COMO ARGUMENTO
  if [[ -z $ARG ]]
  then
    echo "Please provide an element as an argument."
  else
    # BUSCA O ARG PASSADO NO BANCO DE DADOS
    if [[ $ARG =~ ^[0-9]+$ ]]
    then # SE O ARGUMENTO FOR UM NÚMERO
        SELECT_ELEMENT_BY_NUMBER=$($PSQL "select * from elements inner join properties using(atomic_number) inner join types using(type_id) where atomic_number=$ARG")
    else # SE O ARG FOR UMA STRING
        SELECT_ELEMENT_BY_SYMBOL=$($PSQL "select * from elements inner join properties using(atomic_number) inner join types using(type_id) where symbol='$ARG'")
        SELECT_ELEMENT_BY_NAME=$($PSQL "select * from elements inner join properties using(atomic_number) inner join types using(type_id) where name='$ARG'")
    fi

    # EXIBE O RESULTADO DA BUSCA
    if [[ -n $SELECT_ELEMENT_BY_NUMBER ]]
    then
      echo "$SELECT_ELEMENT_BY_NUMBER" | while IFS='|' read ID NUMBER SYMBOL NAME MASS MELTING BOILING TYPE
      do
        echo "The element with atomic number $NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $MASS amu. $NAME has a melting point of $MELTING celsius and a boiling point of $BOILING celsius."
      done
    elif [[ -n $SELECT_ELEMENT_BY_SYMBOL ]]
    then
      echo "$SELECT_ELEMENT_BY_SYMBOL" | while IFS='|' read ID NUMBER SYMBOL NAME MASS MELTING BOILING TYPE
      do
        echo "The element with atomic number $NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $MASS amu. $NAME has a melting point of $MELTING celsius and a boiling point of $BOILING celsius."
      done
    elif [[ -n $SELECT_ELEMENT_BY_NAME ]]
    then
      echo "$SELECT_ELEMENT_BY_NAME" | while IFS='|' read ID NUMBER SYMBOL NAME MASS MELTING BOILING TYPE
      do
        echo "The element with atomic number $NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $MASS amu. $NAME has a melting point of $MELTING celsius and a boiling point of $BOILING celsius."
      done
    else
      echo "I could not find that element in the database."
    fi
  fi
}

MAIN