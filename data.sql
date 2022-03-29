/* Populate database with sample data. */

INSERT INTO animals (name,date_of_birth,escape_attempts,neutered,weight_kg)
VALUES ('Agumon',  '2020-02-03', 0, TRUE, 10.23 );

INSERT INTO animals (name,date_of_birth,escape_attempts,neutered,weight_kg)
VALUES ('Gabumon',  '2018-11-15', 2, TRUE, 8 );

INSERT INTO animals (name,date_of_birth,escape_attempts,neutered,weight_kg)
VALUES ('Pikachu','2021-01-7', 1, FALSE, 15.08 );

INSERT INTO animals (name,date_of_birth,escape_attempts,neutered,weight_kg)
VALUES ('Devimon','2017-05-12', 5, TRUE, 11 );


/*********************** Insert new Data **************************/
INSERT INTO animals (name,date_of_birth,escape_attempts,neutered,weight_kg)
VALUES ('Charmander','2020-02-08', 0, FALSE, -11 );

INSERT INTO animals (name,date_of_birth,escape_attempts,neutered,weight_kg)
VALUES ('Plantmon','2021-11-15', 2, TRUE, -5.7 );

INSERT INTO animals (name,date_of_birth,escape_attempts,neutered,weight_kg)
VALUES ('Squirtle','1994-04-02', 3, FALSE, -12.13 );

INSERT INTO animals (name,date_of_birth,escape_attempts,neutered,weight_kg)
VALUES ('Angemon','2005-06-12', 1, TRUE, -45 );

INSERT INTO animals (name,date_of_birth,escape_attempts,neutered,weight_kg)
VALUES ('Boarmon','2005-06-07', 7, TRUE, 20.4 );

INSERT INTO animals (name,date_of_birth,escape_attempts,neutered,weight_kg)
VALUES ('Blossom','1998-10-13', 3, TRUE, 17 );

INSERT INTO animals (name,date_of_birth,escape_attempts,neutered,weight_kg)
VALUES ('Ditto','1998-05-14', 4, TRUE, 22 );

-- Inside a transaction update the animals table by setting the species column to unspecified
BEGIN;
UPDATE animals SET species = 'unspecified';

-- Verify that change was made
SELECT * FROM animals;

--  roll back the change
ROLLBACK;

-- verify that species columns went back to the state before transaction.
SELECT * FROM animals;

-- make a transcation
BEGIN;
UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon';
UPDATE animals SET species = 'pokemon' WHERE species IS NULL;

COMMIT;

-- Verify that change was made
SELECT * FROM animals;


-- Deleting all animals
BEGIN;

DELETE FROM animals;

-- Verify that the animnals table is empty
SELECT * FROM animals;

ROLLBACK;

--verify that thet changes were rolledback
SELECT * FROM animals;


BEGIN;
DELETE FROM animals WHERE date_of_birth >'2022-01-01';
select * from animals;
SAVEPOINT save_point1;

UPDATE animals SET weight_kg = weight_kg * -1;

ROLLBACK TO save_point1;





