#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

echo "$($PSQL "truncate table games, teams")"

# Tabela teams
cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  #pula a primeira linha
  if [[ $YEAR != "year" ]]
  then
    # obtém o id correspondente ao nome do time vencendor
    TEAM_WINNER_ID=$($PSQL "select team_id from teams where name='$WINNER'")

    # se não houver correspondência
    if [[ -z $TEAM_WINNER_ID ]]
    then
      INSERT_TEAM_WINNER=$($PSQL "insert into teams(name) values('$WINNER')")
    fi

    # obtém o id correspondente ao nome do time oponente
    TEAM_OPPONENT_ID=$($PSQL "select team_id from teams where name='$OPPONENT'")

    if [[ -z $TEAM_OPPONENT_ID ]]
    then
      INSERT_TEAM_OPPONENT=$($PSQL "insert into teams(name) values('$OPPONENT')")
    fi
  fi
done

# Tabela games
cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  if [[ $YEAR != "year" ]]
  then
    # Obtém o id do time vencedor
    TEAM_WINNER_ID=$($PSQL "select team_id from teams where name='$WINNER'")
    TEAM_OPPONENT_ID=$($PSQL "select team_id from teams where name='$OPPONENT'")

    # Insere o game se houver times válidos
    if [[ -n $TEAM_WINNER_ID && -n $TEAM_OPPONENT_ID ]]
    then
      GAME_ID=$($PSQL "insert into games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) values($YEAR, '$ROUND', $TEAM_WINNER_ID, $TEAM_OPPONENT_ID, $WINNER_GOALS, $OPPONENT_GOALS)")
    fi
  fi
done