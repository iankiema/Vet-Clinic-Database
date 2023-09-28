/* Populate database with sample data. */

insert into animals (animal_id,animal_name,date_of_birth,weight_kg,neutered,escape_attempts)
values (101,'Agumon','2020/02/03',10.23,true,0),
       (102,'Gabumon','2018/11/15',8,true,2),
		(103,'Pikachu','2021/01/07',15.04,false,1),
		(104,'Devimon','2017/05/12',11,true,5);

/*Insert more data into the animals table*/
insert into animals (animal_name,date_of_birth,weight_kg,neutered, escape_attempts,species)
values
('Charmander','2020-02-08',-11,false,0,'unspecified'),
('Plantmon','2021-11-15',-5.7,true,2,'unspecified'),
('Squirtle','1993-04-02',-12.13,false,3,'unspecified'),
('Angemon','2005-06-12',-45,true,1,'unspecified'),
('Boarmon','2005-06-07',20.4,true,7,'unspecified'),
('Blossom','1998-10-13',17,true,3,'unspecified'),
('Ditto','2022-05-14',22,true,4,'unspecified');


/* Insert data into the 'owners' table */
insert into owners (full_name,age) values
('Sam Smith',34),
('Jennifer Orwell',19),
('Bob',45),
('Melody Pond',77),
('Dean Winchester',14),
('Jodie Whittaker',38)

/* Insert data into the 'species' table */
insert into species (species_name) values
('Pokemon'),
('Digimon')

/* Modify animals to include species_id and owner_id */
update animals
set species_id = case
	when animal_name like '%mon' then (select species_id from species where species_name = 'Digimon')
	else (select species_id from species where species_name = 'Pokemon')
end;

update animals 
set owner_id = case
	when animal_name = 'Agumon' then (select owner_id from owners where full_name = 'Sam Smith')
	when animal_name in ('Gabumon','Pikachu') then (select owner_id from owners where full_name = 'Jennifer Orwell' )
	when animal_name in ('Devimon','Plantmon') then (select owner_id from owners where full_name = 'Bob' )
	when animal_name in ('Charmander','Squirtle','Blossom') then (select owner_id from owners where full_name = 'Melody Pond' )
	when animal_name in ('Angemon','Boarmon') then (select owner_id from owners where full_name = 'Dean Winchester' )
end;


/* Insert data for vets */
insert into vets (vet_name, age, date_of_graduation) values
	('William Tatcher',45,'2000-04-23'),
	('Maisy Smith', 26, '2019-01-17'),
	('Stephanie Mendez',64,'1981-05-04'),
	('Jack Harkness',38,'2008-06-08');

/* Insert data for specializations */
insert into specializations (vet_id,species_id)values
(1,1),
(3,1),
(3,2),
(4,2);

/* Data for visits */
insert into visits (vet_id,animal_id,visit_date)
values
	(1, 1, '2020-05-24'),
    (3, 1, '2020-07-22'),
    (4, 2, '2021-02-02'),
    (2, 3, '2020-01-05'),
    (2, 3, '2020-03-08'),
    (2, 3, '2020-05-14'),
    (3, 4, '2021-05-04'),
    (3, 5, '2019-09-29'),
    (4, 6, '2020-10-03'),
    (4, 6, '2020-11-04'),
    (2, 7, '2019-01-24'),
    (2, 7, '2019-05-15'),
    (2, 7, '2020-02-27'),
    (2, 7, '2020-08-03'),
    (3, 8, '2020-05-24'),
    (1, 9, '2021-01-11');