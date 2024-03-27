#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

echo "Enter your username:"
read USERNAME

USER_DATA=$($PSQL "SELECT username, games_played, best_game FROM users WHERE username = '$USERNAME';")

IFS='|' read -r USERNAME_DATA GAMES_PLAYED_DATA BEST_GAME_DATA <<< "$USER_DATA"

if [[ -z $USERNAME_DATA ]]
then
  echo -e "\nWelcome, $USERNAME! It looks like this is your first time here."
  INSERT_USERNAME=$($PSQL "INSERT INTO users(username) VALUES ('$USERNAME');")
else
  echo -e "\nWelcome back, $USERNAME_DATA! You have played $GAMES_PLAYED_DATA games, and your best game took $BEST_GAME_DATA guesses."
fi

N=$((RANDOM % 1000 + 1))

X=0

echo -e "\nGuess the secret number between 1 and 1000:"
while true; do
    read INPUT

    if [[ "$INPUT" == "quit" ]]; then
        echo -e "\nExiting the game. Goodbye!"
        exit 0
    fi

    if ! [[ "$INPUT" =~ ^[0-9]+$ ]]; then
        echo "That is not an integer, guess again:"
        continue
    fi

    if [[ "$INPUT" -eq "$N" ]]; then
        ((X++))
        echo -e "\nYou guessed it in $X tries. The secret number was $N. Nice job!"
        INCREASE_GAMES_PLAYED=$($PSQL "UPDATE users SET games_played = $((GAMES_PLAYED_DATA + 1)) WHERE username = '$USERNAME';")
        if [[ "$X" -lt "$BEST_GAME_DATA" || -z "$BEST_GAME_DATA" ]]; then
            UPDATE_BEST_GAME=$($PSQL "UPDATE users SET best_game = $X WHERE username = '$USERNAME';")
        fi
        exit 0
    elif [[ "$INPUT" -lt "$N" ]]; then
        echo "It's higher than that, guess again:"
    else
        echo "It's lower than that, guess again:"
    fi
    ((X++))
done

