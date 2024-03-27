https://www.freecodecamp.org/learn/relational-database/build-a-number-guessing-game-project/build-a-number-guessing-game

# Number Guessing

1. Delete old gitpod repo
2. Open new gitpod from freecodecamp
3. Create a copy of the sql file.
4. Drop old db
   `psql -U postgres -c "DROP DATABASE IF EXISTS number_guess;"`
6. Create new db
   `psql -U postgres -c "CREATE DATABASE number_guess;"`
8. Populate new db
   `psql -U postgres < number_guess.sql`
10. Connect psql --username=freecodecamp --dbname=number_guess
11. Dump `pg_dump -cC --inserts -U freecodecamp number_guess > number_guess.sql`

### Set up sh

`touch setup.sh && chmod +x setup.sh`

```
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
```

```
