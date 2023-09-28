/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    animal_id int primary key,
    animal_name varchar,
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
	full_name varchar,
 	age	integer
);

/* Create the 'Species' table*/
create table species
(
    species_id serial primary key,
    species_name varchar
);

/* Modify the 'animal' table */
alter table animals 
drop column species;


alter table animals
add column species_id integer references species(species_id),
add column owner_id integer references owners(owner_id);
