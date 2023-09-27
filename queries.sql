/*Queries that provide answers to the questions from all projects.*/

/*Animals whose name ends in 'mon'*/
select * from animals where animal_name like '%mon';

/*Animal names of all animals born between 2016 and 2019*/
select animal_name from animals where date_of_birth between '2016-01-01' and '2019-12-31';

/*Animal names of all animals that are neutered and have less than 3 escape attempts*/
select animal_name from animals where neutered = true and escape_attempts < 3;

/*Date of birth of all animals named either 'Agumon' or 'Pikachu'*/
select date_of_birth from animals where animal_name in ('Agumon', 'Pikachu');

 /*Animal names and escape attempts of animals that weigh more than 10.5kg'*/
select animal_name,escape_attempts from animals where weight_kg >10.5;

/*Animals names of of all animals that are neutered*/
select * from animals where neutered = true;

/*All animals that are not named 'Gabumon*/
select * from animals where animal_name <> 'Gabumon';

/*All animals with a weight between 10.4kg and 17.3kg*/
select * from animals where weight_kg between 10.4 and 17.3;


/* Transactions 1: Set species to 'unspecified' and Rollback*/
begin;
update animals set species = 'unspecified';
select species from animals;
rollback;
select species from animals;

/*Transaction 2: Set species based on name and commit*/
begin;
update animals set species = 'digimon' where animal_name like '%mon';
update animals set species = 'pokemon' where species is null;
select species from animals;
commit;
select species from animals;

/*Transaction 3: Delete and Rollback*/
begin;
select count(*) from animals;
delete from animals;
rollback;
select count(*) from animals;

/* Transaction 4: Update weight  and Rollback to Savepoint*/

begin;
delete from animals where date_of_birth > '2022-01-01';
savepoint my_savepoint;
update animals set weight_kg = weight_kg * -1;
rollback to my_savepoint;
update animals set weight_kg = weight_kg * -1 where weight_kg < 0;
commit;


/*How many animals are there?*/
select count(*) from animals;

/*How many animals have never tried to escape? */
select count(*) from animals where escape_attempts = 0;

/* Average weight of animals */
select avg(weight_kg) from animals;

/* Escapes the most, neutered or not neutered animals */
select neutered, max(escape_attempts) as max_escape_attempts
from animals
group by neutered;

/* Minimum and maximum weight of each type of animal */
select species, min(weight_kg) as min_weight, max(weight_kg) as max_weight
from animals
group by species;


/* Average number of escape attempts per animal type of those born between 1990 and 2000*/
select species, avg (escape_attempts) as avg_escape_attempts
from animals
where date_of_birth between '1990-01-01'and '2000-12-31'
group by species;


/* What animals belong to Melody Pond? */
select a.animal_name
from animals a
inner join owners o on a.owner_id = o.owner_id
where o.full_name = 'Melody Pond';

/*List of all animals that their type is Pokemon */
select a.animal_name
from animals a
inner join species s on a.species_id = s.species_id
where s.species_name = 'Pokemon';

/* List of all owners and their animals, including those that don't own any animal */
select o.full_name, coalesce(array_agg(a.animal_name order by a.animal_name), '{}'::text[]) as owned_animals
from owners o
left join animals a on o.owner_id = a.owner_id
group by o.full_name;

/* Animals that are ther per speocies*/
select s.species_name as species_name, count(*) as animal_count
from animals a
inner join species s on a.species_id = s.species_id
group by s.species_name;

/* List of all Digimon owned by Jennifer Orwell */
 select a.animal_name
from animals a
inner join species s on a.species_id = s.species_id
inner join owners o on a.owner_id = o.owner_id
where s.species_name = 'Digimon' and o.full_name = 'Jennifer Orwell';

/* List of all animals owned by Dean Winchester that haven't tried to escape */
select a.animal_name 
from animals a 
inner join owners o on a.owner_id = o.owner_id
where o.full_name = 'Dean Winchester' and a.escape_attempts = 0;

/* Who owns the most animals */
select o.full_name
from owners o
left join animals a on o.owner_id = a.owner_id
group by o.full_name
order by count(a.owner_id) desc
limit 1;