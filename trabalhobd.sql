DROP TABLE IF EXISTS usuarios;
DROP TABLE IF EXISTS posts;
DROP TABLE IF EXISTS foto;
DROP TABLE IF EXISTS comentarios;
DROP TABLE IF EXISTS seguidores;
DROP TABLE IF EXISTS likes;

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
  datapostagem INT NOT NULL,
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
