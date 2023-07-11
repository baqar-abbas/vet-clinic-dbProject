/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM animals WHERE name LIKE '%mon';
SELECT * FROM animals WHERE date_of_birth > '2015-12-31' AND date_of_birth < '2020-01-01';
SELECT * FROM animals WHERE nuetered = TRUE AND escape_attempts < 3;
SELECT date_of_birth FROM animals WHERE name = 'Agumon' OR name = 'Pikachu';
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;
SELECT * FROM animals WHERE nuetered = TRUE;
SELECT * FROM animals WHERE name != 'Gabumon';
SELECT * FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.3;

/* Project milestone 2 */

BEGIN;
UPDATE animals SET species = 'unspecified';
SELECT * from animals;
ROLLBACK;
SELECT * from animals;

BEGIN;
UPDATE animals SET species = 'Digimon' WHERE name LIKE '%mon';
UPDATE animals SET species = 'Pokemon' WHERE species IS NULL;
SELECT * from animals;
COMMIT;
SELECT * from animals;

BEGIN;
DELETE from animals;
SELECT * from animals;
ROLLBACK;
SELECT * from animals;

BEGIN;
DELETE from animals WHERE date_of_birth > '2022-01-01';
SELECT * from animals;
SAVEPOINT sp1;
UPDATE animals SET weight_kg = weight_kg *  -1;
SELECT * from animals;
ROLLBACK TO sp1;
SELECT * from animals;
COMMIT;

SELECT COUNT(*) FROM animals;

SELECT COUNT(escape_attempts) FROM animals WHERE escape_attempts = 0;

SELECT AVG(weight_kg) FROM animals;

SELECT name, MAX(escape_attempts) AS Max_attempts from animals GROUP BY name;

SELECT nuetered, MIN(weight_kg) AS Min_weight, MAX(weight_kg) AS Max_weight from animals GROUP BY nuetered;

SELECT species, MAX(weight_kg) as Max_weight , MIN(weight_kg) as Min_weight FROM animals GROUP BY species;

SELECT species, AVG(escape_attempts) AS Avg_attempts FROM animals WHERE date_of_birth > '1990-01-01' AND date_of_birth < '2000-01-01' GROUP BY species;

/*CHANGES REQUIRED QUERIES */

UPDATE animals SET weight_kg = -11 WHERE id = 5;
SELECT * FROM animals;