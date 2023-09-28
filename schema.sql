/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    animal_id int primary key,
    animal_name varchar(255),
    date_of_birth date,
    escape_attempts int,
    neutered boolean,
    weight_kg decimal
);

/* Add column species to animals table */
alter table animals
add column species varchar(255);

/* Create the 'Owners' table*/
create table owners 
(	owner_id serial primary key,
	full_name varchar(255),
 	age	integer
);

/* Create the 'Species' table*/
create table species
(
    species_id serial primary key,
    species_name varchar(255)
);

/* Modify the 'animal' table */
alter table animals 
drop column species;


alter table animals
add column species_id integer references species(species_id),
add column owner_id integer references owners(owner_id);


/* Create table named 'Vets' */
create table vets(
    vet_id serial primary key,
    vet_name varchar(255), 
    age integer, date_of_graduation date
    );

/* Create a join table 'specializations' for the many to many relationship between vet and species */
create table specializations (
	vet_id integer references vets(vet_id),
	species_id integer references species(species_id),
	primary key (vet_id,species_id)
);

/* Create a join table 'visits' for the many-to-many relationship between vets and animals */
create table visits (
	vet_id integer references vets(vet_id),
	animal_id integer references animals(animal_id),
	visit_date date,
	primary key (vet_id, animal_id)
);