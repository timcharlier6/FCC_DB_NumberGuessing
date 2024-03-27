# [Number Guessing](https://github.com/timcharlier6/FCC_DB_NumberGuessing/tree/main)

- Delete old [gitpod](https://gitpod.io/workspaces) repo
- Open new gitpod from [freecodecamp](https://www.freecodecamp.org/learn/relational-database/build-a-number-guessing-game-project/build-a-number-guessing-game)
- `touch setup.sh && chmod +x setup.sh`
- Paste code in setup.sh
- `psql -U postgres -c "DROP DATABASE IF EXISTS number_guess;"`
- `psql -U postgres -c "CREATE DATABASE number_guess;"`
- `psql -U postgres < number_guess.sql`
- `psql --username=freecodecamp --dbname=number_guess`
- `pg_dump -cC --inserts -U freecodecamp number_guess > number_guess.sql`

```bash
#!/bin/bash
# set up dir
mkdir number_guessing_game
cd number_guessing_game
git init
touch number_guess.sh
chmod +x ./number_guess.sh
git add .
git commit -m 'Initial commit'
echo '#!/bin/bash' > ./number_guess.sh
echo 'PSQL="psql --username=freecodecamp --dbname=<database_name> -t --no-align -c"' >> ./number_guess.sh

```
