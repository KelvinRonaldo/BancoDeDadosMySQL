CREATE TABLE tbl_ator(
cod_ator INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
nome_ator VARCHAR(100) NOT NULL,
data_nascimento DATE NULL,
biografia TEXT
);

CREATE TABLE tbl_filme(
cod_filme INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
titulo_filme VARCHAR(100) NOT NULL,
duracao_filme TIME NOT NULL,
ano_lancamento YEAR NOT NULL,
sinopse TEXT NULL,
cod_idioma INT NOT NULL,
FOREIGN KEY (cod_idioma)
    REFERENCES tbl_idioma (cod_idioma)
);

CREATE TABLE tbl_filme_ator(
    cod_filme INT(11) NOT NULL,
    cod_ator INT(11) NOT NULL,
    FOREIGN KEY (cod_filme)
        REFERENCES tbl_filme (cod_filme),
    FOREIGN KEY (cod_ator)
        REFERENCES tbl_ator (cod_ator),
    personagem VARCHAR(100) NULL
);

INSERT INTO tbl_filme (
    titulo_filme, duracao_filme, 
    ano_lancamento, sinopse, 
    cod_idioma
)
VALUES ('STAR WAR', '2:30:00', 1977, 'Eu não sei!', 1);

INSERT INTO tbl_idioma (nome_idioma)
VALUES ('English');

INSERT INTO tbl_idioma (nome_idioma)
VALUES ('Francês');

INSERT INTO tbl_filme (
    titulo_filme, duracao_filme, 
    ano_lancamento, sinopse, 
    cod_idioma
)
VALUES ('Miranha De Volta Ao Lar', '2:21:00', 2017, 'Aaaah, Cê Sabe', 1);

INSERT INTO tbl_filme (
    titulo_filme, duracao_filme, 
    ano_lancamento, sinopse, 
    cod_idioma
)
VALUES ('Tropa de Elite', '2:02:00', 2017, 'SEU ANIMAL!', 2);

SELECT titulo_filme, ano_lancamento, nome_idioma
    FROM tbl_filme, tbl_idioma
    WHERE tbl_filme.cod_idioma = tbl_idioma.cod_idioma;

SELECT f.titulo_filme AS Título,
    f.ano_lancamento AS Lançamento,
    i.nome_idioma AS Idioma
    FROM tbl_filme AS f, tbl_idioma AS i
    WHERE f.cod_idioma = i.cod_idioma;

INSERT INTO tbl_ator(nome_ator, data_nascimento, biografia)
    VALUES('Robert Denyro', '1955-6-10', 'Obi-Wan Kenobi');

INSERT INTO tbl_filme_ator(cod_filme, cod_ator, personagem)
    VALUES(2, 4, 'Obi-Wan Kenobi');

SELECT tbl_filme.titulo_filme,
    tbl_ator.nome_ator,
    tbl_filme_ator.personagem
    FROM tbl_filme, tbl_filme_ator, tbl_ator
    WHERE tbl_filme.cod_filme = tbl_filme_ator.cod_filme 
    AND tbl_filme_ator.cod_ator = tbl_ator.cod_ator 
    AND tbl_filme.titulo_filme = 'STAR WARS';

SELECT f.titulo_filme,
    a.nome_ator,
    fa.personagem
    FROM tbl_filme AS f, tbl_filme_ator AS fa, tbl_ator AS a
    WHERE f.cod_filme = fa.cod_filme 
    AND fa.cod_ator = a.cod_ator 
    AND a.nome_ator = 'Wagner Moura';

ALTER TABLE tbl_ator ADD COLUMN telefone VARCHAR(100) NOT NULL

ALTER TABLE tbl_ator DROP COLUMN telefone;

ALTER TABLE tbl_ator ADD COLUMN xpto VARCHAR(100) NULL FIRST;

ALTER TABLE tbl_ator ADD COLUMN cpf VARCHAR(100) NULL AFTER nome_ator;


CREATE TABLE tbl_classificacao(
    cod_classificacao INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    classificacao VARCHAR(100) NOT NULL
);

ALTER TABLE tbl_filme 
ADD COLUMN cod_classificacao INT NOT NULL

ALTER TABLE tbl_filme 
    ADD CONSTRAINT fk_classificacao_filme
    FOREIGN KEY (cod_classificacao) 
    REFERENCES tbl_classificacao (cod_classificacao);

CONSTRAINT => restrição, limitação, regra;

/*No INSERT, quando a quantidade de VALUES for igual a quantidade de campos, 
NÃO é necessário especificar os campos, DESDE QUE OS VALUES sejam colocados na ORDEM que esta no banco*/
INSERT INTO tbl_classificacao (cod_classificacao, classificacao) VALUES(0, 'temp'); ↓
INSERT INTO tbl_classificacao VALUES(0, 'temp');                                   ←↓

CREATE TABLE tbl_diretor(
     cod_diretor INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
     nome_diretor VARCHAR(100) NOT NULL,
     data_nascimento DATE NULL,
     biografia TEXT NULL,
     nacionalidade VARCHAR(100) NULL
);

CREATE TABLE tbl_filme_diretor(
    cod_filme INT NOT NULL,
    cod_diretor INT NOT NULL,
    CONSTRAINT fk_filme_diretor_cod_filme
    FOREIGN KEY (cod_filme)
        REFERENCES tbl_filme (cod_filme),
    CONSTRAINT fk_filme_diretor_cod_diretor
    FOREIGN KEY (cod_diretor)
        REFERENCES tbl_diretor (cod_diretor)
);

CREATE TABLE tbl_genero(
    cod_genero INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    genero VARCHAR(100) NOT NULL
);

CREATE TABLE tbl_filme_genero(
    cod_filme INT NOT NULL,
    cod_genero INT NOT NULL,
    CONSTRAINT fk_filme_genero_cod_filme
    FOREIGN KEY (cod_filme)
        REFERENCES tbl_filme (cod_filme),
    CONSTRAINT fk_filme_diretor_cod_genero
    FOREIGN KEY (cod_genero)
        REFERENCES tbl_genero (cod_genero)
);

CREATE TABLE tbl_sessao(
    cod_sessao INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    sessao TIME NOT NULL
);

CREATE TABLE tbl_sala(
    cod_sala INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    sala VARCHAR(100) NOT NULL
);

CREATE TABLE tbl_dia_semana(
    cod_dia_semana INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    dia VARCHAR(100) NOT NULL
);

CREATE TABLE tbl_agenda(
    cod_agenda INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    cod_filme INT NOT NULL,
    cod_sessao INT NOT NULL,
    cod_sala INT NOT NULL,
    cod_dia_semana INT NOT NULL,
    CONSTRAINT fk_agenda_filme
    FOREIGN KEY (cod_filme)
        REFERENCES tbl_filme (cod_filme),
    CONSTRAINT fk_agenda_sessao
    FOREIGN KEY (cod_sessao)
        REFERENCES tbl_sessao (cod_sessao),
    CONSTRAINT fk_agenda_sala
    FOREIGN KEY (cod_sala)
        REFERENCES tbl_sala (cod_sala),
    CONSTRAINT fk_agenda_dia_semana
        FOREIGN KEY (cod_dia_semana)
        REFERENCES tbl_dia_semana (cod_dia_semana)
);

/*
---**---BACKUP DE BANCO DE DADOS NO MYSQL---**---
Na pasta bin do MySQL Server executar o mysqldump 
     mysqldump.exe -u root -p cinema > \Users\18175301\cinema.bkp ← nome do arquivo de backup
                    ↑ usuario  ↑        ↑lugar onde o bakcup será guardado
                               ↑nome do banco

---**---IMPORTAR BACKUP DE BANCO DE DADOS NO MYSQL---**---
source C:\Users\18175301\cinema.bkp ← nome do arquivo de backup
            ↑lugar onde o bakcup será guardado
*/

/*
CRIAR USUARIO DO BANCO
CREATE USER 'cinema'@'localhost' IDENTIFIED BY '123'
               ↑        ↑origem do usuario      ↑senha do usuario
               ↑nome do usuario

DAR PERMISSÕES AO USUÁRIO
GRANT ALL PRIVILEGES ON db_cinema.* TO 'cinema'@'localhost' ← usuario
      ↑tipo de permissao    ↑     ↑tabelas permitidas
                            ↑banco permitido

GRANT SELECT PRIVILEGES ON db_cinema.* TO 'cinema'@'localhost' ← usuario

GRANT INSERT PRIVILEGES ON db_cinema.* TO 'cinema'@'localhost' ← usuario


SHOW PROCCESS LIST
*/

-- ******NÃO UTILIZAR COM 'WHERE'******
SELECT f.cod_filme AS Código,
       f.titulo_filme AS Título,
       i.nome_idioma AS Idioma,
       c.classificacao AS Classificação
       FROM tbl_filme AS f, tbl_idioma AS i, tbl_classificacao AS c
       WHERE f.cod_idioma = i.cod_idioma AND
			 f.cod_classificacao = c.cod_classificacao;

-- ******MESMO SELECT, MAS COM JOIN******
SELECT f.cod_filme,
       f.titulo_filme,
       i.nome_idioma
       FROM tbl_filme AS f JOIN tbl_idioma AS i JOIN tbl_classificacao AS c
       WHERE f.cod_idioma = i.cod_idioma AND
			 f.cod_classificacao = c.cod_classificacao;


             -------
                    
SELECT f.cod_filme AS Código,
       f.titulo_filme AS Título,
       i.nome_idioma AS Idioma,
       c.classificacao AS Classificação
       FROM tbl_filme AS f, tbl_idioma AS i, tbl_classificacao AS c
       WHERE f.cod_idioma = i.cod_idioma AND
			 f.cod_classificacao = c.cod_classificacao;
             
SELECT	f.cod_filme,
		f.titulo_filme,
		i.nome_idioma,
		c.classificacao
FROM tbl_filme AS f 
-- INNER JOIN(JOIN) - SERVER PARA JUNTAR 2 TABELAS COM CAMPOS CONINCIDENTES(ON)
	INNER JOIN tbl_idioma AS i
ON f.cod_idioma = i.cod_idioma
	INNER JOIN tbl_classificacao AS c
ON f.cod_classificacao = c.cod_classificacao;
    
                                        
SELECT	f.cod_filme,
		f.titulo_filme,
		i.nome_idioma,
		c.classificacao
		FROM tbl_filme AS f,
			tbl_idioma AS i,
			tbl_classificacao AS c
		WHERE f.cod_idioma = i.cod_idioma AND
			 f.cod_classificacao = c.cod_classificacao;

SELECT  f.title,
        c.name
        FROM filme AS f 
            JOIN category AS C
        ON f.category_id = c.category_id;

------CONTA QUANTAS VEZES O CAMPO REQUISITADO APARECE NO RESULTADO DA CONSULTA-------
SELECT COUNT(film_id) FROM film;


SELECT f.title AS Título,
        c.name AS Categoria,
        fc.category_id AS 'Código da Categoria'
FROM film AS f JOIN film_category AS fc 
ON f.film_id = fc.film_id
    JOIN category AS c 
ON fc.category_id = c.category_id
ORDER BY f.title LIMIT 10;

SELECT  f.title AS Título,
        c.name AS Categoria,
		fc.category_id AS 'Código da Categoria'
        FROM film AS f
            JOIN film_category AS fc
        ON f.film_id = fc.film_id
			JOIN category AS  c
		ON fc.category_id = c.category_id
	ORDER BY f.title LIMIT 10;
    
    
/* CONSULTA DE ATORES POR FILME*/
SELECT  f.title AS Título,
        f.description AS Descrição,
        a.first_name AS 'Primeiro Nome',
        a.last_name AS 'Último Nome'
        FROM film AS f
            JOIN film_actor AS fa
        ON f.film_id = fa.film_id
			JOIN actor AS a
		ON fa.actor_id = a.actor_id
        WHERE f.film_id = 1000;
            
/*CONSULTA FILMES POR ATOR*/
SELECT  f.title AS Título,
        f.description AS Descrição,
        -- ↓junta 2 ou mais campos no mesmo resultado
        concat_ws(" ", a.first_name, a.last_name) AS Nome
--                 ↑caracter separador
        FROM film AS f
            JOIN film_actor AS fa
        ON f.film_id = fa.film_id
			JOIN actor AS a
		ON fa.actor_id = a.actor_id
        WHERE a.actor_id = 1;


SELECT c.store_id AS Store,
	concat_ws(" ", c.first_name, c.last_name) AS Name,
    ct.city AS City,
    co.country AS Country
    FROM customer AS c
		JOIN address AS a
	ON c.address_id = a.address_id
		JOIN city AS ct
	ON ct.city_id = a.city_id
		JOIN country AS co
	ON ct.country_id = co.country_id
	WHERE co.country LIKE '_R%';
    /*_ = Uma caracter */
    /*% = QUALQUER QUANTIDADE DE CARACTERES*/
    /*PARA COMPARAÇÕES COMSTRINGS É CERTO USAR O LIKE*/
	/*WHERE co.country LIKE 'Brazil'
		OR co.country LIKE 'Argentina'
		OR co.country LIKE 'Chile'
        OR co.country LIKE 'Colombia';*/
        
	/*WHERE co.country = 'Brazil'
		OR co.country = 'Argentina'
		OR co.country = 'Chile'
        OR co.country = 'Colombia';*/
    /*WHERE co.country IN ('Brazil', 'Argentina', 'Chile', 'Colombia');*/
    