#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

echo "Enter your username:"
read USERNAME

USER_DATA=$($PSQL <<EOF
SELECT username, games_played, best_game
FROM users
WHERE username = '$USERNAME';
EOF
)

IFS='|' read -r USERNAME_DATA GAMES_PLAYED_DATA BEST_GAME_DATA <<< "$USER_DATA"

if [[ -z $USERNAME_DATA ]]
then
  echo "Welcome, $USERNAME! It looks like this is your first time here."

 #!/bin/bash INSERT_USERNAME=$($PSQL "INSERT INTO users (username) VALUES ('$USERNAME');")
else
  echo "Welcome back, $USERNAME_DATA! You have played $GAMES_PLAYED_DATA games, and your best game took $BEST_GAME_DATA guesses."
fi

