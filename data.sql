/* Populate database with ANIMALS data. */

INSERT INTO animals (name, date_of_birth, escape_attempts, nuetered, weight_kg)
VALUES ('Agumon', DATE '2020-02-03', 0, TRUE, 10.23),
       ('Gabumon', DATE '2018-11-15', 2, TRUE, 8),
       ('Pikachu', DATE '2021-01-07', 1, FALSE, 15.04),
       ('Devimon', DATE '2017-05-12', 5, TRUE, 11);

       /* Project milestone 2 */

       INSERT INTO animals(name, date_of_birth, escape_attempts, nuetered, weight_kg)
       VALUES ('Charmander', DATE '2020-02-08', 0, FALSE, 11),
              ('Plantmon', DATE '2021-11-15', 2, TRUE, -5.7),
              ('Squirtle', DATE '1993-04-02', 3, FALSE, -12.13),
              ('Angemon', DATE '2005-06-12', 1, TRUE, -45),
              ('Boarmon', DATE '2005-06-07', 7, TRUE,  20.4),
              ('Blossom', DATE '1998-10-13', 3, TRUE, 17),
              ('Ditto', DATE '2022-05-14', 4, TRUE, 22);

/* Project Milestone 3 - query multiple tables */

INSERT INTO owners (full_name, age)
VALUES ('Sam Smith', 34),
       ('Jennifer Orwell', 19),
       ('Bob', 45),
       ('Melody Pond', 77),
       ('Dean Winchester', 14),
       ('Jodie Whittaker', 38);

INSERT INTO species (name) 
VALUES ('Digimon'),
       ('Pokemon');

UPDATE animals SET species_id = 1 WHERE name LIKE '%mon';

UPDATE animals SET species_id = 2 WHERE species_id IS NULL;

UPDATE animals SET owner_id = 1 WHERE name = 'Agumon';

UPDATE animals SET owner_id = 2 WHERE name IN ('Gabumon', 'Pikachu');

UPDATE animals SET owner_id = 3 WHERE name IN ('Devimon', 'Plantmon');

UPDATE animals SET owner_id = 4 WHERE name IN ('Charmander', 'Squirtle', 'Blossom');

UPDATE animals SET owner_id = 5 WHERE name IN ('Angemon', 'Boarmon');

/* Project Milestone 4 - add "join table" for visits */

INSERT INTO vets (name, age, date_of_graduation)
VALUES ('William Tatcher', 45, DATE '2000-04-23'),
       ('Maisy Smith', 26, DATE '2019-01-17'),
       ('Stephanie Mendez', 64, DATE '1981-05-04'),
       ('Jack Harkness', 38, DATE '2008-06-08');

 INSERT INTO specializations (vet_id, species_id)
 VALUES (1,2),
        (3,1),
        (3,2),
        (4,1);      

INSERT INTO visits (animal_id, date_of_visit, vet_id)
VALUES
((SELECT id FROM animals WHERE name = 'Agumon'), '2020-05-24', (SELECT id FROM vets WHERE name = 'William Tatcher')),
((SELECT id FROM animals WHERE name = 'Agumon'), '2020-07-22', (SELECT id FROM vets WHERE name = 'Stephanie Mendez')),
((SELECT id FROM animals WHERE name = 'Gabumon'), '2021-02-02', (SELECT id FROM vets WHERE name = 'Jack Harkness')),
((SELECT id FROM animals WHERE name = 'Pikachu'), '2020-01-05', (SELECT id FROM vets WHERE name = 'Maisy Smith')),
((SELECT id FROM animals WHERE name = 'Pikachu'), '2020-03-08', (SELECT id FROM vets WHERE name = 'Maisy Smith')),
((SELECT id FROM animals WHERE name = 'Pikachu'), '2020-05-14', (SELECT id FROM vets WHERE name = 'Maisy Smith')),
((SELECT id FROM animals WHERE name = 'Devimon'), '2021-05-04', (SELECT id FROM vets WHERE name = 'Stephanie Mendez')),
((SELECT id FROM animals WHERE name = 'Charmander'), '2021-02-24', (SELECT id FROM vets WHERE name = 'Jack Harkness')),
((SELECT id FROM animals WHERE name = 'Plantmon'), '2019-12-21', (SELECT id FROM vets WHERE name = 'Maisy Smith')),
((SELECT id FROM animals WHERE name = 'Plantmon'), '2020-08-10', (SELECT id FROM vets WHERE name = 'William Tatcher')),
((SELECT id FROM animals WHERE name = 'Plantmon'), '2021-04-07', (SELECT id FROM vets WHERE name = 'Maisy Smith')),
((SELECT id FROM animals WHERE name = 'Squirtle'), '2019-09-29', (SELECT id FROM vets WHERE name = 'Stephanie Mendez')),
((SELECT id FROM animals WHERE name = 'Angemon'), '2020-10-03', (SELECT id FROM vets WHERE name = 'Jack Harkness')),
((SELECT id FROM animals WHERE name = 'Angemon'), '2020-11-04', (SELECT id FROM vets WHERE name = 'Jack Harkness')),
((SELECT id FROM animals WHERE name = 'Boarmon'), '2019-01-24', (SELECT id FROM vets WHERE name = 'Maisy Smith')),
((SELECT id FROM animals WHERE name = 'Boarmon'), '2019-05-15', (SELECT id FROM vets WHERE name = 'Maisy Smith')),
((SELECT id FROM animals WHERE name = 'Boarmon'), '2020-02-27', (SELECT id FROM vets WHERE name = 'Maisy Smith')),
((SELECT id FROM animals WHERE name = 'Boarmon'), '2020-08-03', (SELECT id FROM vets WHERE name = 'Maisy Smith')),
((SELECT id FROM animals WHERE name = 'Blossom'), '2020-05-24', (SELECT id FROM vets WHERE name = 'Stephanie Mendez')),
((SELECT id FROM animals WHERE name = 'Blossom'), '2021-01-11', (SELECT id FROM vets WHERE name = 'William Tatcher'));

/*Project Milestone 5 - Performance -> Query optimiztion*/
               
 INSERT INTO visits (animal_id, vet_id, date_of_visit) SELECT * FROM (SELECT id FROM animals) animal_ids, (SELECT id FROM vets) vets_ids, generate_series('1980-01-01'::timestamp, '2021-01-01', '4 hours') visit_timestamp;

 //incorrect not working query
 ALTER TABLE owners UPDATE COLUMN age INT;

 //correct query
 ALTER TABLE owners ALTER COLUMN age DROP NOT NULL;
 
 insert into owners (full_name, email) select 'Owner ' || generate_series(1,2500000), 'owner_' || generate_series(1,2500000) || '@mail.com';              