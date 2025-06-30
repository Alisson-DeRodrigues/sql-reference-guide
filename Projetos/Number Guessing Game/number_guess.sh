#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

MAIN() {
  # get username
  echo "Enter your username:"
  read USERNAME

  # check username db
  SELECT_USERNAME=$($PSQL "select * from games where username='$USERNAME'")

  # username is null
  if [[ -z $SELECT_USERNAME ]]
  then
    echo -e "\nWelcome, $USERNAME! It looks like this is your first time here."
  else # username is not null
    echo $SELECT_USERNAME | while IFS='|' read USERNAME GAMES_PLAYED BEST_GAME
    do
      echo -e "\nWelcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
    done
  fi

  # generate random number
  SECRET_NUMBER=$(( $RANDOM%999 + 1 ))

  NUMBER_OF_GUESSES=0

  echo -e "\nGuess the secret number between 1 and 1000:"
  while [[ $RANDOM_NUMBER != $SECRET_NUMBER ]]
  do
    read RANDOM_NUMBER
    if [[ $RANDOM_NUMBER =~ ^[0-9]+$ ]] # valid number
    then
      if (( $RANDOM_NUMBER > $SECRET_NUMBER ))
      then
        echo -e "\nIt's lower than that, guess again:"
        (( NUMBER_OF_GUESSES+=1 ))
      elif (( $RANDOM_NUMBER < $SECRET_NUMBER ))
      then
        echo -e "\nIt's higher than that, guess again:"
        (( NUMBER_OF_GUESSES+=1 ))
      fi
    else # invalid char
      echo "That is not an integer, guess again:"
      (( NUMBER_OF_GUESSES+=1 ))
    fi
  done
  (( NUMBER_OF_GUESSES+=1 )) # tentativa do acerto

  echo -e "\nYou guessed it in $NUMBER_OF_GUESSES tries. The secret number was $SECRET_NUMBER. Nice job!"

  #INSERT NEW SCORE
  if [[ -z $SELECT_USERNAME ]] #first game
  then
    INSERT_SCORE=$($PSQL "insert into games(username, games_played, best_game) values('$USERNAME', 1, $NUMBER_OF_GUESSES)")
  else
    NUMBER_GAMES=$($PSQL "select games_played from games where username='$USERNAME'")
    BEST_GAME=$($PSQL "select best_game from games where username='$USERNAME'")

    if (( NUMBER_OF_GUESSES >= BEST_GAME ))
    then
      UPDATE_NUMBER_GAMES=$($PSQL "update games set games_played = $(( NUMBER_GAMES+=1 )) where username='$USERNAME'")
    else
      UPDATE_NUMBER_GAMES=$($PSQL "update games set games_played = $(( NUMBER_GAMES+=1 )) where username='$USERNAME'")
      UPDATE_BEST_GAME=$($PSQL "update games set best_game = $NUMBER_OF_GUESSES where username='$USERNAME'")
    fi
  fi
}

MAIN