----------------------------------Connect Event Database---------------------------------------------
--creation de la base de données--
create database connectevent;
--creation des  tables au sein de ma BD--
create table lieu_devenement(
	id int PRIMARY KEY AUTO_INCREMENT,
    ville varchar(100),
    addresse varchar(250)
);
create table sponsor(
    id int PRIMARY KEY AUTO_INCREMENT,
    nom_entreprise varchar(250),
    budget float,
    type_de_pack_choisis varchar(250)	
);
create table organisateur(
	id int PRIMARY KEY AUTO_INCREMENT,
    nom varchar(250),
    cin varchar(10)   
);
create table billet(
	id int PRIMARY KEY AUTO_INCREMENT,
    nom varchar(250),
    date_de_participation date,
    prix float
);
create table evenement(
	id int PRIMARY KEY AUTO_INCREMENT,
    titre varchar(250),
    date_event date,
    lieu varchar(250),
    numero_des_tickets_restés int,
    lieu_id int,
    FOREIGN key (lieu_id) REFERENCES lieu_devenement(id)
);
create table participant(
	id int PRIMARY KEY AUTO_INCREMENT,
    nom varchar(250),
    age int,
    evenement_id int,
    FOREIGN key (evenement_id) REFERENCES evenement(id)
);
-- creation des  tables qui indiquent les relations entre les entités--
create table organiser(
	id int PRIMARY KEY AUTO_INCREMENT,
    evenement_id int, 
    organisateur_id int,
    FOREIGN KEY( evenement_id) REFERENCES evenement(id),
    foreign key (organisateur_id) REFERENCES organisateur(id)
);
create table sponsorer(
    id int PRIMARY KEY AUTO_INCREMENT,
    evenement_id int,
    sponsor_id int,
    FOREIGN KEY( evenement_id) REFERENCES evenement(id),
    FOREIGN KEY (sponsor_id) REFERENCES sponsor(id)   
);
-- pour ecrire dans une DB-- 
--***********Table de lieu_devenement**********--
insert into lieu_devenement (ville, addresse) values
('Tanger','Grande Salle Royale du Royal Tulip City Center'),
('Tanger','Palais Malak'),
('Tanger','Salle Des Fêtes Malabata, malabata, tanger'),
('Youssoufia', 'Boulevard moulay youssef,Salle agora'),
('Rabat','villa des arts de rabat, 10 Rue Beni Mellal, Hassan, RABAT');
--***********Table de sponsor**********--
insert into sponsor (nom_entreprise,budget,type_de_pack_choisis) values 
('OCP', 8000,'Bronze'),
('IBM', 9000,'Bronze'),
('Dell Technologies', 50000, 'Diamond'),
('CGI', 12000, 'Bronze'),
('Capgemini',30000,'Gold');
--***********Table d'organisateur*********--
INSERT into organisateur (nom,cin) VALUES
('Khadija Ameksa','JA8088'),
('Taha Amnay Allam','NA5288'),
('Ossama Ben Mazzi','JA8978'),
('Salima Bouhamidi','DA98668'),
('Fatima Ezzahra El Glioui','AJ8900'),
('Jihad Allaoui','HJ6782'),
('Maryem Khaoua','MIM68988'),
('Oumaima Larhni','KJ9928'),
('Bilal Ez-zaim','ED7890');
--***********Table des participants*********--
INSERT into participant (nom, age, evenement_id) VALUES
('hamzaelkhaili', 18, 1),
('Hajar ', 24, 2),
('Abdelhamid', 30, 3);
INSERT into participant (nom, age, evenement_id) VALUES
('Hajar ', 24, 2);
--***********Table de billet*********--
INSERT into billet (nom,date_de_participation,prix) values 
('Problem solving',2023-03-08,500),
('SDGs for Youth', 2023-12-30, 200),
('La RSE', 2024-05-06,600),
('AI hackathon',2024-03-12,700);
--here i made a mistake instead of adding the date into single quote I didn't, so in my table the date was expressed by 0000-00-00 knowing that i will fix it later--


-- Pour modifier un table--
--***********Table de billet*********--
update billet set date_de_participation = '2023-12-06' where id = 1;
update billet set date_de_participation = '2024-12-06' where id = 2;
update billet set date_de_participation = '2023-07-07' where id = 3;
update billet set date_de_participation = '2030-05-06' where id = 4;

--***********Table d'evenement*********--
update evenement set lieu_id= 3 where id=1
update evenement set lieu_id = 5 where id = 2 
update evenement set lieu_id = 2 where id = 3 
-- Pour supprimer les lignes et les columns dans un table--
--***********Table d'evenement*********--
--**supprimer un colonne **--
alter table evenement drop COLUMN evenement.numero_des_tickets_restés

--**selecter **--
SELECT DISTINCT nom  FROM `participant`

select * from evenement
LIMIT 2;

select * from evenement
order by id DESC;

select * from evenement
order by titre ASC;

select * from evenement
where evenement.date_event BETWEEN '2023-01-01' and '2025-01-01';

select evenement.titre from evenement
where NOT id=1;












