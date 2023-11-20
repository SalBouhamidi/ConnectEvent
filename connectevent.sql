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
insert into lieu_devenement (ville, addresse) values
('Tanger','Grande Salle Royale du Royal Tulip City Center'),
('Tanger','Palais Malak'),
('Tanger','Salle Des Fêtes Malabata, malabata, tanger'),
('Youssoufia', 'Boulevard moulay youssef,Salle agora'),
('Rabat','villa des arts de rabat, 10 Rue Beni Mellal, Hassan, RABAT');