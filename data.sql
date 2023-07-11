INSERT INTO animals
    (name, date_of_birth, escape_attempts, neutered, weight_kg)
values
    ('Agumon', '2020-02-03', 0, '1', 10.23),
    ('Gabumon', '2018-11-15', 2, '1', 8),
    ('Pikachu', '2021-01-7', 1, '0', 15.04),
    ('Devimon', '2017-05-12', 5, '1', 11);


INSERT INTO animals
    (name, date_of_birth, escape_attempts, neutered, weight_kg)
values
    ('Charmander', '2020-02-08', 0, '1', -11),
    ('Plantmon', '2021-11-15', 2, '1', -5.7),
    ('Squirtle', '1993-04-02', 3, '0', -12.13),
    ('Angemon', '2005-06-12', 1, '1', -45),
    ('Boarmon', '2005-06-07', 7, '1', 20.4),
    ('Blossom', '1998-10-13', 3, '1', 17),
    ('Ditto', '2022-05-14', 4, '1', 22);

INSERT INTO owners
    (full_name, age)
VALUES
    ('sam smith', 34),
    ('Jennifer Orwell', 19),
    ('Bob', 45),
    ('Melody Pond ', 77),
    ('Dean Winchester ', 14),
    ('Jodie Whittaker ', 38);

INSERT INTO species
    (name)
values
    ('Pokemon'),
    ('Digimon');

UPDATE animals SET species_id = 1 WHERE species_id IS null;
UPDATE animals SET species_id = 2 WHERE name LIKE '%mon';

UPDATE animals SET owners_id = 1 WHERE name = 'Agumon';
UPDATE animals SET owners_id = 2 WHERE name = 'Pikachu' OR name = 'Gabumon';
UPDATE animals SET owners_id = 3 WHERE name = 'Devimon' OR name = 'Plantmon';
UPDATE animals SET owners_id = 4 WHERE name = 'Charmander' OR name = 'Squirtle' OR name = 'Blossom';
UPDATE animals SET owners_id = 5 WHERE name = 'Angemon' OR name = 'Boarmon';