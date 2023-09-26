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
