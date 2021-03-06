/* Database schema to keep the structure of entire database. */

CREATE TABLE animals(
   id INT GENERATED ALWAYS AS IDENTITY,
   name VARCHAR(150) NOT NULL,
   date_of_birth date NOT NULL,
   escape_attempts INT NOT NULL,
   neutered BOOLEAN NOT NULL,
   weight_kg DECIMAL NOT NULL,
   PRIMARY KEY(id)
);

--Add a column species of type string to your animals table.
ALTER TABLE animals ADD species VARCHAR(250);

-- Add two tables owners and species
CREATE TABLE owners(
   id INT GENERATED ALWAYS AS IDENTITY,
   full_name VARCHAR(150) ,
   age INT NOT NULL,
   PRIMARY KEY(id)   
);

CREATE TABLE species(
   id INT GENERATED ALWAYS AS IDENTITY,
   name VARCHAR(150) ,
   PRIMARY KEY(id)
);

-- Modify animals table:
ALTER TABLE animals DROP COLUMN species;

-- Add forign key for species in animals table
ALTER TABLE animals 
ADD species_id INT references species (id);

-- Add forign key for owners in animals table
ALTER TABLE animals 
ADD owner_id  INT references owners (id);

-- create vets table 
CREATE TABLE vets(
   id INT GENERATED ALWAYS AS IDENTITY,
   name VARCHAR(150) NOT NULL,
   age INT NOT NULL,
   date_of_graduation date NOT NULL,
   PRIMARY KEY(id)
);

--Specialization table
CREATE TABLE specializations (
    species_id INT NOT NULL,
    vet_id INT NOT NULL,
    FOREIGN KEY (species_id) REFERENCES species (id),
    FOREIGN KEY (vet_id) REFERENCES vets (id) 
);

--visits table
CREATE TABLE visits (
    animal_id INT NOT NULL,
    vet_id INT NOT NULL,
	 date_of_visit DATE,
    FOREIGN KEY (animal_id) REFERENCES animals (id),
    FOREIGN KEY (vet_id) REFERENCES vets (id) 
);

-- Add email column to owners table
ALTER TABLE owners ADD COLUMN email VARCHAR(120);


-- improve performance by adding index
CREATE INDEX animals_id_index ON visits(animal_id);
CREATE INDEX vets_index ON visits(vet_id);
CREATE INDEX owners_index ON owners(email);