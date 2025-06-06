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
   ultimologin TIMESTAMP  NOT NULL,
   cadastro TIMESTAMP  NOT NULL,
   primary key(id)
);

CREATE TABLE posts(
  id INT NOT NULL,
  usuario_id INT NOT NULL,
  texto VARCHAR(200) NOT NULL,
  datapostagem TIMESTAMP  NOT NULL,
  PRIMARY KEY(id),
  Foreign KEY(usuario_id) REFERENCES usuarios(id)
);

CREATE TABLE foto(
  id INT NOT NULL,
  usuario_id INT NOT NULL,
  caminhofoto VARCHAR(200) NOT NULL,
  legenda VARCHAR(200) NOT NULL,
  datapostagem TIMESTAMP  NOT NULL,
  PRIMARY KEY(id),
  FOREIGN KEY(usuario_id) REFERENCES usuarios(id)
);

CREATE TABLE comentarios(
  id INT NOT NULL,
  usuario_id INT NOT NULL,
  post_id INT NOT NULL,
  texto VARCHAR(200) NOT NULL,
  datapostagem TIMESTAMP  NOT NULL,
  PRIMARY KEY(id),
  FOREIGN KEY(usuario_id) REFERENCES usuarios(id),
  FOREIGN KEY(post_id) REFERENCES posts(id)
);

CREATE TABLE seguidores(
  usuario_id INT NOT NULL,
  seguidor_id INT NOT NULL,
  PRIMARY KEY (usuario_id, seguidor_id),
  FOREIGN KEY (seguidor_id) REFERENCES usuarios(id),
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
INSERT INTO usuarios (id, nome, sobrenome, nick, email, senha, datanascimento, ultimologin, cadastro) VALUES
(1, 'Anthony', 'Stark', 'playboyzinho', 'tonys@marvel.com', '2001jarvis', '1970-05-29', '2025-04-25 14:30', '2025-02-17 21:40'),
(2, 'Steve', 'Rogers', 'cap', 'steverogers@marvel.com', 'escudo2703', '1918-07-04', '2025-05-01 13:10', '2025-02-01 16:20'),
(3, 'Thor', 'Odindon', 'faísca', 'othor@marvel.com', 'trovão1234', '965-07-28', '2025-05-01 01:45', '2025-01-13 17:58'),
(4, 'Peter', 'Parker', 'miranha', 'peterp@marvel.com', 'vaiteia', '2002-08-10', '2025-04-30 04:15', '2020-09-02 19:52'),
(5, 'Peter', 'Quill', 'principe_das_estrelas', 'peterquill@marvel.com', '30844', '1980-02-16', '2025-05-03 15:30', '2017-10-28 23:25'),
(6, 'Loki', 'Laufeyson', 'loki.salvador', 'lloki@marvel.com', '1885974', '957-02-09', '2025-04-29 22:45', '2023-11-28 12:38'),
(7, 'Stephen', 'Strange', 'mago_supremo', 'stephens@marvel.com', '3592estranho', '1979-06-12', '2025-05-01 11:24', '2022-12-12 18:14'),
(8, 'James', 'Barner', 'Bucky','jamesbarner@marvel', 'bucky7948', '1917-03-10', '2025-05-02 09:41', '2021-12-31 23:59'),
(9, 'Scott', 'Lang', 'formiga', 'lscott@marvel.com', '4960pequeno', '1969-04-17', '2025-05-01 07:05', '2011-07-12 10:35'),
(10, 'James', 'Hotwleet', 'logan', 'jameslogan@marvel.com', 'wolverine', '1832-10-25', '2025-05-03 03:31', '2009-11-16 16:48');

INSERT INTO seguidores (usuario_id, seguidor_id) VALUES
(1, 4),
(3, 9),
(1, 5),
(10, 5),
(10, 2),
(1, 2),
(10, 7),
(9, 2),
(4, 9),
(2, 6),
(5, 7),
(8, 5),
(3, 10),
(9, 1),
(3, 6),
(5, 1),
(2, 4),
(6, 3),
(4, 2),
(8, 4),
(4, 10),
(9, 6),
(1, 10),
(3, 2),
(7, 1),
(10, 9),
(5, 6),
(5, 4),
(6, 1),
(7, 9);

INSERT INTO posts (id, usuario_id, texto, datapostagem) VALUES
(1, 4, 'Vamos para Manhattan.', '2025-05-01 17:30'),
(2, 5, 'Eis que um gênio da Terra mexe na minha nave.', '2025-02-01 17:00'),
(3, 9, 'Como aumentar o tamanho do seu carro?', '2022-10-01 12:34'),
(4, 1, 'E eu que gastei um milhão dólares ontem com um robô.', '2025-02-22 09:40'),
(5, 2, 'Alguém sabe como faz para curtir?', '2025-04-09 18:30'),
(6, 2, 'Na minha época, os carros eram praticamente carroças de tão lentos.', '2025-04-15 14:37'),
(7, 8, 'Ter a mente restaurada é tão bom.', '2025-03-19 16:13'),
(8, 8, 'Steve pode estar musculoso agora, mas eu era o escudo dele antes.', '2025-03-25 19:27'),
(9, 1, 'Como deve ser o Cap usando fralda depois de virar um velhinho?', '2025-05-02 22:53'),
(10, 4, 'O senhor Stark me convidou para a Alemanha.', '2025-04-12 08:46');

INSERT INTO foto (id, usuario_id, caminhofoto, legenda, datapostagem) VALUES
(1, 1, 'fotos/ys9tej.jpg', 'Bora de burgão!.', '2023-11-25 20:10'),
(2, 1, 'fotos/ks9jf.jpg', 'Tô tentando entender como funciona essa máquina.', '2025-04-16 21:30'),
(3, 4, 'fotos/hy5ft.jpg', 'Qual é a lógica do motor gráfico estar quente?', '2025-01-28 17:03'),
(4, 8, 'fotos/js1gsh.jpg', 'Bora caminhar lá no lado da prefeitura.', '2025-02-28 18:50'),
(5, 8, 'fotos/yd6rhe.jpg', 'Não sinto frio no meu braço esquerdo, por que será?', '2025-04-15 14:39'),
(6, 4, 'fotos/jd2biw.jpg', 'Essas ruas estão sempre movimentadas.', '2025-02-10 07:19'),
(7, 1, 'fotos/us7tej.jpg', 'Que vista linda aqui em cima.', '2024-11-28 20:16'),
(8, 4, 'fotos/bd6gen.jpg', 'O Empire State sempre foi imenso?', '2024-06-14 15:47'),
(9, 2, 'fotos/te4mte.jpg', 'A ponte do Brooklyn está do mesmo jeito mesmo depois de 70 anos?', '2023-12-04 11:43'),
(10, 2, 'fotos/ys1ken.jpg', 'Bora caminhar uns km.', '2022-11-08 06:30');

INSERT INTO comentarios (id, usuario_id, post_id, texto, datapostagem) VALUES
(1, 1, 2, 'Eu só melhorei sua nave!', '2025-04-09 19:12'),
(2, 10, 1, 'Pensei que nesse universo fosse mais limpo...', '2025-05-01 18:03'),
(3, 1, 5, 'O velhinho não sabe curtir', '2025-04-09 19:32'),
(4, 3, 4, 'Você lembra da última vez que aconteceu com robôs né', '2025-05-02 09:11'),
(5, 1, 4, 'Só falta você ainda estar usando aquela tecnologia retrô...', '2025-02-22 11:03'),
(6, 2, 4, 'Que orgulho ver jovens usando tecnologias antigas', '2025-02-22 12:41'),
(7, 2, 6, 'Vamos ver quem vai ser o idoso mais rápido, Bucky?', '2025-04-16 20:19'),
(8, 9, 6, 'Se formos correr que seja em miniatura', '2025-04-16 18:10'),
(9, 1, 8, 'Posso adicionar um aquecedor no seu braço', '2025-03-25 21:46'),
(10, 7, 8, 'Já pensou usar magia para ter um braço?', '2025-03-26 08:02'),
(11, 2, 3, 'No meu tempo os carros não eram essas coisas redondas.', '2025-02-22 14:56'),
(12, 4, 6, 'Pior que na sua época devia ter muita gente nas ruas.', '2025-02-01 18:21'),
(13, 4, 1, 'Já subiu no Empire State?', '2025-05-01 21:04'),
(14, 3, 10, 'Aqui das estrelas a vista é melhor', '2025-05-01 22:30'),
(15, 2, 1, 'Depende de onde... lá no Brooklyn ele é pequeno.', '2025-02-22 15:38'),
(16, 6, 4, 'Sempre achei bonito sua estrutura, depois de quase destruir ele', '2025-02-22 16:29'),
(17, 8, 5, 'É, meu amigo, às vezes as coisas mais belas nunca mudam.', '2025-02-01 20:03'),
(18, 4, 1, 'Além disso, faz tempo que não passo por lá', '2025-03-26 10:52'),
(19, 8, 6, 'Você não se cansa da mesma coisa?', '2025-04-16 20:55'),
(20, 3, 10, 'Eu estou 1500 anos na luta e você falando em descansar?', '2025-03-26 11:14');

INSERT INTO likes (id, usuario_id, post_id) VALUES
(1, 1, 5),
(2, 4, 5),
(3, 8, 5),
(4, 2, 5),
(5, 10, 5),
(6, 1, 9),
(7, 1, 3),
(8, 1, 5),
(9, 1, 7),
(10, 1, 2),
(11, 3, 5),
(12, 6, 5),
(13, 4, 5),
(14, 9, 3),
(15, 9, 6),
(16, 9, 8),
(17, 4, 9),
(18, 4, 1),
(19, 4, 3),
(20, 4, 7),
(21, 4, 6),
(22, 3, 10),
(23, 3, 4),
(24, 3, 1),
(25, 7, 3),
(26, 7, 10),
(27, 7, 2),
(28, 7, 8),
(29, 5, 2),
(30, 2, 10);

--mostra quem fez mais comentarios
SELECT u.id AS usuarios_id, u.nome, COUNT(c.id) AS quantidade_comentarios 
FROM usuarios u 
JOIN comentarios c ON c.usuario_id = u.id 
GROUP BY u.id , u.nome ORDER BY quantidade_comentarios DESC;

--mostra quem deu like nos posts de x usuario
SELECT u.nome, u.sobrenome, p.usuario_id 
FROM usuarios u
JOIN likes l ON l.usuario_id = u.id
JOIN posts p ON l.post_id = p.id
WHERE p.usuario_id = '8';

--mostra os comentarios mais curtidos
SELECT p.id, p.texto, COUNT(l.id) AS curtidas
FROM posts p
JOIN likes l ON l.post_id = p.id
GROUP BY p.id, p.texto
ORDER BY curtidas DESC;

--lista os posts do mais recente para o menos recente
SELECT p.id, p.texto, p.datapostagem
FROM posts p
ORDER BY p.datapostagem DESC;

--mostra todos os posts que terminem com interrogação, ou seja, sao perguntas
SELECT * FROM posts 
WHERE texto like '%?'
