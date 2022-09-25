CREATE DATABASE IF NOT EXISTS RESERVATION_MOVIE_THEATER CHARACTER SET  utf8mb4 COLLATE utf8mb4_general_ci;
USE RESERVATION_MOVIE_THEATER;

CREATE TABLE Rate 
(
    id_rate INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
    type VARCHAR(20) NOT NULL,
    price DECIMAL(10,2) NOT NULL
)engine = INNODB;

CREATE TABLE Roles 
(
    id_roles INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
    name VARCHAR(20) NOT NULL
)engine = INNODB;


CREATE TABLE Users
(
    id_user INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
    lastName VARCHAR(20) NOT NULL,
    firstName VARCHAR(20),
    email VARCHAR(20) NOT NULL,
    login VARCHAR(20) NOT NULL,
    password VARCHAR(40) NOT NULL,
    account BOOLEAN NOT NULL,
    idRate INTEGER NOT NULL,
    FOREIGN KEY (idRate) REFERENCES Rate(id_rate)
)engine = INNODB;

CREATE TABLE UserRoles
(
    idRoles INTEGER NOT NULL,
    FOREIGN KEY (idRoles) REFERENCES roles(id_roles),
    idUser INTEGER NOT NULL,
    FOREIGN KEY (idUser) REFERENCES Users(id_user)
)engine = INNODB;

CREATE TABLE Room 
(
    id_room INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
    name VARCHAR(10),
    capacity INTEGER
)engine = INNODB;

CREATE table Session
(
    id_session INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
    hours TIME,
    idRoom INTEGER NOT NULL,
    FOREIGN KEY (idRoom) REFERENCES Room(id_room)
)engine = INNODB;

CREATE TABLE Movie 
(
    id_movie INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
    name VARCHAR(20),
    releaseDate DATE,
    endDate DATE,
    idSession INTEGER NOT NULL,
    FOREIGN KEY (idSession) REFERENCES Session(id_session)
)engine = INNODB;

CREATE TABLE Theater 
(
    id_movieTheater INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
    name VARCHAR(20),
    ville VARCHAR(20)

)engine = INNODB;

CREATE TABLE Payment
(
    id_payment INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
    type VARCHAR(20)
)engine = INNODB;

CREATE TABLE Reservation 
(
    id_reservation INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
    date DATETIME,
    idMovieTheater INTEGER NOT NULL,
    FOREIGN KEY (idMovieTheater) REFERENCES Theater(id_movieTheater),
    idPayment INTEGER NOT NULL,
    FOREIGN KEY (idPayment) REFERENCES Payment(id_payment),
    idUser INTEGER NOT NULL,
    FOREIGN KEY (idUser) REFERENCES Users(id_user),
    idRate INTEGER NOT NULL,
    FOREIGN KEY (idRate) REFERENCES Rate(id_rate),
    idMovie INTEGER NOT NULL,
    FOREIGN KEY (idMovie) REFERENCES Movie(id_movie)
)engine = INNODB;

INSERT INTO rate (type, price)
VALUES
    ('Plein tarif', 9.20),
    ('Etudiant', 7.60),
    ('Moins de 14ans', 5.90);

INSERT INTO roles (id_roles, name)
VALUES
    (1, 'Administrateur'),
    (2, 'Utilisateur');

INSERT INTO payment (id_payment, type)
VALUES
    (1, 'Paiement sur place'),
    (2, 'Paiement en ligne');


insert into users (id_user, lastName, firstName, email, login, password, account, idRate) values (1, 'Eric', 'Philips', 'ephilips@gmail.com', 'eric Philips', '$2y$10$D1DB7Z7e9URzu1myfZeyG.3WiZY0Vk.GuCja56hMz9WKI3sM9yEUO', true, 1);
insert into users (id_user, lastName, firstName, email, login, password, account, idRate) values (2, 'Aurore', 'clarck', 'aclarck@gmail.com', 'Aurore Clarck', '$2y$10$jE6VYt4QcXlbKED7PXJmyeIqRCoqY2WloV0IMUKgBQbBcfLwKXj4u', true, 2);
insert into users (id_user, lastName, firstName, email, login, password, account, idRate) values (3, 'Nicolas', 'Beni', 'nbeni@gmail.com', 'Nicolas Beni', 'SsnY3oFbRvo$2y$10$drOs8NqkrI429Bw0r6eqluf6zqcoqJNYYc2Fn3IKztBJgGzTE4FWS', false, 3);
insert into users (id_user, lastName, firstName, email, login, password, account, idRate) values (4, 'Thomas', 'noel', 'tnoel@gmail.com', 'Thomas Noel', '$2y$10$ICcAo3xkOEZsMpjpxfaJwu.KQmXYnvhNbU/.mJF6.UP10UFwmtu26', true, 1);
insert into users (id_user, lastName, firstName, email, login, password, account, idRate) values (5, 'Clement', 'lovergne', 'clovergne@gmail.com', 'Clement Lovergne', '$2y$10$9TdkgzjGxL9uwoLKAWqlTOZqwDagoO/WhJf7eUU1i/ZdSbGrWQDne', true, 1);
insert into users (id_user, lastName, firstName, email, login, password, account, idRate) values (6, 'Anthony', 'Curro', 'acurro@gmail.com', 'Anthony Curro', '$2y$10$i5P/yRLAMG35r4DrkgkLAuGAjeOf0QFBe8ollKDviwG4jk0Jalqn2', false, 2);
;

INSERT INTO room (id_room, name, capacity)
VALUES  
    (1, 'normal', 180),
    (2, 'normal', 273),
    (3, 'normal', 183),
    (4, '4K', 352),
    (5, '4K', 234),
    (6, 'normal', 50),
    (7, 'normal', 90);

INSERT INTO session (id_session, hours,idRoom)
VALUES
    (1, '10:00:00', 1),
    (2, '12:00:00', 2),
    (3, '13:00:00', 3),
    (4, '16:00:00', 4),
    (5, '20:00:00', 5),
    (6, '23:00:00', 6),
    (7, '10:00:00', 7),
    (8, '12:00:00', 6),
    (9, '13:00:00', 5),
    (10, '16:00:00', 4),
    (11, '20:00:00', 3),
    (12, '23:00:00', 2);




insert into movie (id_movie, name, releaseDate, endDate, idSession) values (1, 'Titanic', '15/12/2022', '11/14/2022', 1);
insert into movie (id_movie, name, releaseDate, endDate, idSession) values (2, 'Avatar', '15/4/2022', '11/10/2022', 2);
insert into movie (id_movie, name, releaseDate, endDate, idSession) values (3, 'Alita', '15/12/2022', '11/9/2022', 3);
insert into movie (id_movie, name, releaseDate, endDate, idSession) values (4, 'Résident evil', '05/5/2022', '11/28/2022', 12);
insert into movie (id_movie, name, releaseDate, endDate, idSession) values (5, 'Acid House, The', '15/23/2022', '11/27/2022', 10);


INSERT INTO theater (id_movieTheater, name, ville)
VALUES  
    (1, 'Cinemanimal', 'Calais'),
    (2, 'Specktakl', 'Boulogne'),
    (3, 'Mon siège à rêves', 'Dunkerque'),
    (4, 'Le coin d\'Hollywood', 'Lille'),
    (5, 'Cinéville', 'Etaples');

INSERT INTO UserRoles (idRoles, idUser)
VALUES
    (1, 1),
    (1, 2),
    (2, 3),
    (2, 4),
    (2, 5),



INSERT INTO Reservation (id_reservation, date, idMovieTheater, idPayment, idUser, idRate, idMovie)
VALUES
    (1, '2021-05-08 23:20:39', 5, 1, 5, 2, 1),
    (2, '2021-07-22 08:43:55', 1, 1, 1, 1, 5),
    (3, '2021-07-15 16:42:20', 2, 1, 3, 3, 3),
    (4, '2021-08-06 01:10:02', 5, 1, 4, 2, 1),
    (5, '2021-01-01 06:33:38', 4, 1, 1, 1, 3),
 
   


CREATE USER 'omnicorp'@'localhost' IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON * . * TO 'omnicorp'@'localhost';
FLUSH PRIVILEGES;

