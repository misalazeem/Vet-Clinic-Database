SELECT *
from animals
WHERE name like '%mon';

SELECT NAME
FROM animals
WHERE date_of_birth >= '2016-01-01' AND date_of_birth <= '2019-12-31';

SELECT NAME
FROM animals
WHERE neutered = '1' AND escape_attempts < 3;

SELECT date_of_birth
FROM animals
WHERE name = 'Agumon' OR name= 'Pikachu';

SELECT name, escape_attempts
From animals
WHERE weight_kg > 10.5;

SELECT *
FROM animals
WHERE neutered = '1';

SELECT *
FROM animals
WHERE name != 'Gabumon';

SELECT *
FROM animals
WHERE weight_kg BETWEEN 10.4 AND 17.3;

-----
BEGIN;
    UPDATE animals
SET species = 'unspecified';
    SELECT species
    from animals;
    ROLLBACK;
    SELECT species
    from animals;
END;

-----
BEGIN;
    UPDATE animals SET species = 'digimon' WHERE name like '%mon';
    UPDATE animals SET species = 'pokemon' WHERE species is null;
    COMMIT;
END;

-----
BEGIN;
    DELETE FROM animals;
    ROLLBACK;
END;

-----
BEGIN;
    DELETE FROM animals
WHERE date_of_birth > '2022-01-01';
    SAVEPOINT SP1;
UPDATE animals
SET weight_kg = weight_kg * -1;
SELECT *
FROM animals;
ROLLBACK
TO sp1;
SELECT *
FROM animals;
UPDATE animals
SET weight_kg = weight_kg * -1
WHERE weight_kg < 0;
SELECT *
FROM animals;
COMMIT;
SELECT *
FROM animals;
END;

-----
SELECT count(name)
FROM animals;

SELECT count(name)
FROM animals
WHERE escape_attempts = 0;

SELECT AVG(weight_kg)
FROM animals;

SELECT neutered, AVG(escape_attempts) AS average_escape_attempts
FROM animals
GROUP BY neutered
ORDER BY average_escape_attempts DESC;

SELECT species, MIN(weight_kg), MAX(weight_kg)
FROM animals
group by species;

SELECT species, AVG(escape_attempts) AS average_escape_attempts
FROM animals
WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31'
GROUP BY species;
