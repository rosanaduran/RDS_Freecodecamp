#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

# Cada vez que se ejecuta el script se borran los contenidos de las tablas y se vuelve a empezar
echo $($PSQL "TRUNCATE teams, games")
# Primero leo cada fila de games.csv, y meto cada valor separado por comas en una variable
cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
 # empiezo por la primera variable, excluyendo la fila de cabecera. Así que empiezo en la segunda fila
 if [[ $YEAR != "year" ]]
  then
    # Primero quiero rellenar la tabla de teams, y para eso tengo que averiguar si el equipo ya está metido o no. Empiezo por WINNER
    WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
    OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")

     # Si no estaba introducido en la tabla
    if [[ -z $WINNER_ID ]]
    then
      # insertar el equipo en la tabla teams
      INSERT_TEAM_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER')")
      if [[ $INSERT_TEAM_RESULT == "INSERT 0 1" ]]
      then
        echo Inserted into teams, $WINNER
      fi
    fi

    if [[ -z $OPPONENT_ID ]]
    then
      # insertar el equipo en la tabla teams
      INSERT_TEAM_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT')")
      if [[ $INSERT_TEAM_RESULT == "INSERT 0 1" ]]
      then
        echo Inserted into teams, $OPPONENT
      fi
    fi

    # Me preparo para la siguiente fila
    WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
    OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")

  # insert into games table (NO FUNCIONA)
    #INSERT_GAMES_RESULT=$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES($YEAR, $ROUND, $WINNER_ID, $OPPONENT_ID, $WINNER_GOALS, $OPPONENT_GOALS)")
    #if [[ $INSERT_GAMES_RESULT == "INSERT 0 1" ]]
    #then
    #  echo Inserted into games, $YEAR : $ROUND : $WINNER_ID : $OPPONENT_ID : $WINNER_GOALS : $OPPONENT_GOALS
    #fi

    # Primero quiero rellenar la tabla de games, y para eso tengo que averiguar si el partido ya está metido o no.
    GAME_ID=$($PSQL "SELECT game_id FROM games WHERE year='$YEAR' AND round='$ROUND' AND winner_id='$WINNER_ID' AND opponent_id='$OPPONENT_ID'")
    

     # Si no estaba introducido en la tabla
    if [[ -z $GAME_ID ]]
    then
      # insertar los datos del partido en la tabla games
      INSERT_GAMES_RESULT=$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES($YEAR, '$ROUND', '$WINNER_ID', '$OPPONENT_ID', $WINNER_GOALS, $OPPONENT_GOALS)")
      if [[ $INSERT_GAMES_RESULT == "INSERT 0 1" ]]
      then
        echo Inserted into games, $YEAR : $ROUND : $WINNER_ID : $OPPONENT_ID : $WINNER_GOALS : $OPPONENT_GOALS
      fi
    fi

    # Me preparo para la siguiente fila
    GAME_ID=$($PSQL "SELECT game_id FROM games WHERE year='$YEAR' AND round='$ROUND' AND winner_id='$WINNER_ID' AND opponent_id='$OPPONENT_ID'")

  fi
done
