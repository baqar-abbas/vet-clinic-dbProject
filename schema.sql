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