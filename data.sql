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
