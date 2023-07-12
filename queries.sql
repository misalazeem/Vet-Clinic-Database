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


SELECT name
FROM (
    SELECT *
    FROM animals
        JOIN owners ON animals.owners_id = owners.id ) AS alias
WHERE alias.full_name like '%Melody Pond%';

Select animals.name
from animals join species on animals.species_id = species.id
where species.name like '%Pokemon%';

Select owners.full_name, animals.name
from animals right join owners on animals.owners_id = owners.id;

SELECT species.name, COUNT(animals.name)
from animals join species ON animals.species_id = species.id
GROUP BY species.name;

SELECT animals.name, owners.full_name
FROM animals
    JOIN species ON species.id = animals.species_id
    JOIN owners ON animals.owners_id = owners.id
WHERE species.name LIKE '%Digimon%'
    AND owners.full_name LIKE '%Jennifer Orwell%';

SELECT animals.name, owners.full_name
from animals join owners ON animals.owners_id = owners.id
WHERE owners.full_name LIKE '%Dean Winchester%' AND animals.escape_attempts = 0;

SELECT owners.full_name, COUNT(animals.id) AS num_of_animals
FROM owners
    JOIN animals ON animals.owners_id = owners.id
GROUP BY owners.id
ORDER BY num_of_animals DESC
LIMIT 1;

SELECT a.name AS animal_name
FROM animals a
INNER JOIN visits
v ON a.id = v.animal_id
INNER JOIN vets ve ON v.vet_id = ve.id
WHERE ve.name = 'William Tatcher'
ORDER BY v.visit_date DESC
LIMIT 1;

SELECT COUNT(DISTINCT a.id) AS animal_count
FROM animals a
    INNER JOIN visits v ON a.id = v.animal_id
    INNER JOIN vets ve ON v.vet_id = ve.id
WHERE ve.name = 'Stephanie Mendez';

SELECT v.id, v.name, v.age, v.date_of_graduation, s.name AS specialty
FROM vets v
    LEFT JOIN specializations sp ON v.id = sp.vet_id
    LEFT JOIN species s ON sp.species_id = s.id
ORDER BY v.id;

SELECT a.name AS animal_name
FROM animals a
    INNER JOIN visits v ON a.id = v.animal_id
    INNER JOIN vets ve ON v.vet_id = ve.id
WHERE ve.name = 'Stephanie Mendez'
    AND v.visit_date BETWEEN '2020-04-01' AND '2020-08-30';

SELECT a.name AS animal_name, COUNT(v.animal_id) AS visit_count
FROM animals a
    INNER JOIN visits v ON a.id = v.animal_id
GROUP BY a.name
ORDER BY visit_count DESC
LIMIT 1;

SELECT a.name AS animal_name, v.visit_date
FROM animals a
INNER JOIN visits
v ON a.id = v.animal_id
INNER JOIN vets ve ON v.vet_id = ve.id
WHERE ve.name = 'Maisy Smith'
ORDER BY v.visit_date ASC
LIMIT 1;

SELECT a.name AS animal_name, v.visit_date, ve.name AS vet_name, ve.age AS vet_age
FROM animals a
    INNER JOIN visits v ON a.id = v.animal_id
    INNER JOIN vets ve ON v.vet_id = ve.id
ORDER BY v.visit_date DESC
LIMIT 1;

SELECT COUNT(*) AS mismatched_specialties_count
FROM visits v
INNER JOIN animals a ON v.animal_id = a.id
INNER JOIN vets ve ON v.vet_id = ve.id
LEFT JOIN specializations s ON ve.id = s.vet_id AND a.species_id = s.species_id
WHERE s.vet_id IS NULL;

