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

/* Project Milestone 3 - query multiple tables */

SELECT animals.name, owners.full_name FROM animals
INNER JOIN owners ON animals.owner_id = owners.id
WHERE owners.full_name = 'Melody Pond';

SELECT animals.name, species.name FROM animals
INNER JOIN species ON animals.species_id = species.id
WHERE species.name = 'Pokemon';

SELECT owners.full_name, animals.name FROM owners
left JOIN animals ON owners.id = animals.owner_id;

SELECT species.name, COUNT(animals.name) as no_of_animals
   FROM animals
   JOIN species ON animals.species_id = species.id GROUP BY(species.name);

 SELECT a.name, o.full_name, s.name
  FROM animals a
  JOIN owners o ON a.owner_id = o.id
  JOIN species s ON a.species_id = s.id WHERE s.name ='Digimon'AND o.full_name = 'Jennifer Orwell';  

  SELECT a.name, o.full_name
   FROM animals a
   JOIN owners o ON a.owner_id = o.id WHERE o.full_name = 'Dean Winchester' AND a.escape_attempts = 0;

  SELECT o.full_name, COUNT(a.name) as total_animal
  FROM animals a
  JOIN owners o ON a.owner_id = o.id GROUP BY(o.full_name) ORDER BY(total_animal) DESC;

  /* Project Milestone 4 - add "join table" for visits */

  SELECT a.name,v.date_of_visit FROM animals a
  JOIN visits v ON a.id = v.animal_id
  JOIN vets ve ON v.vet_id = ve.id WHERE ve.name ='William Tatcher' ORDER BY(v.date_of_visit) DESC
  LIMIT 1;

SELECT ve.name, COUNT(a.name) as animal_visits_count FROM animals a
  JOIN visits v ON a.id = v.animal_id
  JOIN vets ve ON v.vet_id = ve.id WHERE ve.name ='Stephanie Mendez' GROUP BY(ve.name);

SELECT ve.name, s.name FROM vets ve
 	LEFT JOIN specializations sp ON ve.id = sp.vet_id
	LEFT JOIN species s ON s.id= sp.species_id;

 SELECT a.name, v.date_of_visit FROM animals a
  JOIN visits v ON a.id = v.animal_id
  JOIN vets ve ON v.vet_id = ve.id
  WHERE ve.name ='Stephanie Mendez' AND v.date_of_visit >'2020-04-01' AND v.date_of_visit <'2020-08-30'; 

  SELECT a.name, COUNT(*) AS visit_count FROM animals a
  JOIN visits v ON a.id = v.animal_id
  GROUP BY a.id
  ORDER BY visit_count DESC
  LIMIT 1;

  SELECT a.name, v.date_of_visit FROM animals a
  JOIN visits v ON a.id = v.animal_id
  JOIN vets ve ON v.vet_id = ve.id
  WHERE ve.name ='Maisy Smith' ORDER BY(date_of_visit)
  LIMIT 1;

SELECT a.id as a_id, a.name as a_name, v.date_of_visit, ve.id as v_id, ve.name as v_name FROM animals a
  JOIN visits v ON a.id = v.animal_id
  JOIN vets ve ON v.vet_id = ve.id
  ORDER BY(date_of_visit) DESC
  LIMIT 1;

  SELECT a.name, ve.name, COUNT(*) FROM visits v
  JOIN vets ve ON v.vet_id = ve.id
  JOIN animals a ON v.animal_id = a.id
  LEFT JOIN specializations s ON ve.id = s.vet_id AND a.species_id = s.species_id
  WHERE s.species_id IS NULL GROUP BY(a.name, ve.name);

  SELECT s.name, COUNT(*) as sum_of_visits FROM vets ve
  JOIN visits v ON ve.id = v.vet_id
  JOIN animals a ON a.id = v.animal_id
  JOIN species s ON a.species_id = s.id WHERE ve.name ='Maisy Smith' GROUP BY(s.id)
  ORDER BY(sum_of_visits) DESC
  LIMIT 1;