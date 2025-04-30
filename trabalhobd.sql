DROP TABLE IF EXISTS usuarios CASCADE;
DROP TABLE IF EXISTS posts CASCADE;
DROP TABLE IF EXISTS foto CASCADE;
DROP TABLE IF EXISTS comentarios CASCADE;
DROP TABLE IF EXISTS seguidores CASCADE;
DROP TABLE IF EXISTS likes CASCADE;

CREATE TABLE usuarios(
   id INT NOT NULL,
   nome VARCHAR(50) NOT NULL,
   sobrenome VARCHAR(50) NOT NULL,
   nick VARCHAR(50) NOT NULL,
   email VARCHAR(50) NOT NULL,
   senha VARCHAR(50),
   datanascimento DATE NOT NULL,
   ultimologin DATE NOT NULL,
   padastro DATE NOT NULL,
   primary key(id)
);

CREATE TABLE posts(
  id INT NOT NULL,
  usuario_id INT NOT NULL,
  texto VARCHAR(200) NOT NULL,
  datapostagem DATE NOT NULL,
  PRIMARY KEY(id),
  Foreign KEY(usuario_id) REFERENCES usuarios(id)
);

CREATE TABLE foto(
  id INT NOT NULL,
  usuario_id INT NOT NULL,
  caminhofoto VARCHAR(200) NOT NULL,
  legenda VARCHAR(50) NOT NULL,
  datapostagem DATE NOT NULL,
  PRIMARY KEY(id),
  FOREIGN KEY(usuario_id) REFERENCES usuarios(id)
);

CREATE TABLE comentarios(
  id INT NOT NULL,
  usuario_id INT NOT NULL,
  post_id INT NOT NULL,
  texto VARCHAR(200) NOT NULL,
  datapostagem DATE NOT NULL,
  PRIMARY KEY(id),
  FOREIGN KEY(usuario_id) REFERENCES usuarios(id),
  FOREIGN KEY(post_id) REFERENCES posts(id)
);

CREATE TABLE seguidores(
  id INT NOT NULL,
  usuario_id INT NOT NULL,
  PRIMARY KEY(id),
  FOREIGN KEY(usuario_id) REFERENCES usuarios(id)
);

CREATE TABLE likes(
  id INT NOT NULL,
  usuario_id INT NOT NULL,
  post_id INT NOT NULL,
  PRIMARY KEY(id),
  FOREIGN KEY(usuario_id) REFERENCES usuarios(id),
  FOREIGN KEY(post_id) REFERENCES posts(id)
);

INSERT INTO usuarios (id, nome, sobrenome, nick, email, senha, datanascimento, ultimologin, padastro) VALUES
(1, 'Peter', 'Parker', 'spidey', 'peter@dailybugle.com', 'teia123', '2001-08-10', '2025-04-29', '2025-01-01'),
(2, 'Marc', 'Spector', 'moon_knight', 'marc@marvel.com', 'lua123', '1985-03-15', '2025-04-29', '2025-01-05'),
(3, 'Steven', 'Grant', 'mr_knight', 'steven@marvel.com', 'londres321', '1985-03-15', '2025-04-29', '2025-01-06'),
(5, 'Steve', 'Rogers', 'cap', 'steve@avengers.com', 'escudo1941', '1918-07-04', '2025-04-29', '2025-01-03'),
(6, 'Tony', 'Stark', 'ironman', 'tony@starkindustries.com', 'jarvis', '1970-05-29', '2025-04-29', '2025-01-02'),
(7, 'Natasha', 'Romanoff', 'blackwidow', 'natasha@shield.com', 'espionagem', '1984-11-22', '2025-04-29', '2025-01-04'),
(8, 'Bruce', 'Banner', 'hulk', 'bruce@gamma.com', 'hulk_smash', '1969-12-18', '2025-04-29', '2025-01-04'),
(10, 'Loki', 'Laufeyson', 'god_of_mischief', 'loki@asgard.com', 'trickster', '1000-05-01', '2025-04-29', '2025-01-10'),
(11, 'Thanos', '', 'inevitable', 'thanos@titan.com', 'infinity', '1000-01-01', '2025-04-29', '2025-01-11'),
(12, 'Victor', 'Von Doom', 'dr_doom', 'doom@latveria.com', 'doom123', '1960-02-10', '2025-04-29', '2025-01-12'),
(13, 'Norrin', 'Radd', 'silver_surfer', 'norrin@galactus.com', 'surfprata', '1966-08-06', '2025-04-29', '2025-01-13'),
(14, 'Wade', 'Wilson', 'deadpool', 'wade@chimichangas.com', 'imortal', '1975-04-01', '2025-04-29', '2025-01-14'),
(15, 'Norman', 'Osborn', 'green_goblin', 'norman@oscorp.com', 'bomba123', '1965-09-15', '2025-04-29', '2025-01-15');

SELECT nome,sobrenome FROM
usuarios;
