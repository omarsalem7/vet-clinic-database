/* Database schema to keep the structure of entire database. */

CREATE TABLE animals(
   id INT GENERATED ALWAYS AS IDENTITY,
   name CHAR(50) NOT NULL,
   date_of_birth date NOT NULL,
   escape_attempts INT NOT NULL,
   neutered BOOLEAN NOT NULL,
   weight_kg DECIMAL NOT NULL,
   PRIMARY KEY(id)
);

--Add a column species of type string to your animals table.
ALTER TABLE animals ADD species VARCHAR(250);