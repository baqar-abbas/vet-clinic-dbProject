/* Database schema to keep the structure of entire database. */

CREATE DATABASE vet_clinic;

CREATE TABLE animals (
id BIGSERIAL PRIMARY KEY NOT NULL,
name VARCHAR(50) NOT NULL,
date_of_birth DATE NOT NULL,
escape_attempts INT NOT NULL,
nuetered BOOLEAN NOT NULL,
weight_kg decimal NOT NULL
 );

/* Project milestone 2 */

 ALTER TABLE animals ADD COLUMN species VARCHAR(50);

 /* Project Milestone 3 - query multiple tables */

 CREATE TABLE owners (
    id BIGSERIAL PRIMARY KEY NOT NULL,
    full_name VARCHAR(100) NOT NULL,
    age INT NOT NULL
 );

 CREATE TABLE species (
    id BIGSERIAL PRIMARY KEY NOT NULL,
    name VARCHAR(100) NOT NULL
 );
 
 ALTER TABLE animals DROP COLUMN species;

 ALTER TABLE animals ADD COLUMN species_id INT REFERENCES species(id);

 ALTER TABLE animals ADD COLUMN owner_id INT REFERENCES owners(id);

 /* Project Milestone 4 - add "join table" for visits */

 CREATE TABLE vets (
      id BIGSERIAL PRIMARY KEY NOT NULL,
      name VARCHAR(100) NOT NULL,
      age INT NOT NULL,
      date_of_graduation DATE NOT NULL
 );

 CREATE TABLE specializations (
   vet_id INT REFERENCES vets(id),
   species_id INT REFERENCES species(id)
 );

 CREATE TABLE visits (
   animal_id INT REFERENCES animals(id),
   date_of_visit DATE NOT NULL,
   vet_id INT REFERENCES vets(id)
 );
