/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    'id' int primary key,
    'name' varchar,
    'date_of_birth' date,
    'escape_attempts' int,
    'neutered' boolean,
    'weight_kg' decimal
);

/* Add column species to animals table */
alter table animals
add column species varchar(255);
