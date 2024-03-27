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
