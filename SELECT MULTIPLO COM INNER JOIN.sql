SELECT * FROM tbl_idioma;

SELECT * FROM tbl_filme;

SELECT * FROM tbl_classificacao;

DELETE FROM tbl_idioma WHERE cod_idioma > 5;
       
SELECT f.cod_filme AS Código,
       f.titulo_filme AS Título,
       i.nome_idioma AS Idioma,
       c.classificacao AS Classificação
       FROM tbl_filme AS f, tbl_idioma AS i, tbl_classificacao AS c
       WHERE f.cod_idioma = i.cod_idioma AND
			 f.cod_classificacao = c.cod_classificacao;
             
SELECT	f.cod_filme AS Código,
		f.titulo_filme AS Título,
		i.nome_idioma AS Idioma,
		c.classificacao AS Classificação
FROM tbl_filme AS f 
	INNER JOIN tbl_classificacao AS c
ON f.cod_classificacao = c.cod_classificacao
	INNER JOIN tbl_idioma AS i
ON f.cod_idioma = i.cod_idioma;
                    
SELECT	f.cod_filme,
		f.titulo_filme,
		i.nome_idioma,
		c.classificacao
		FROM tbl_filme AS f,
			tbl_idioma AS i,
			tbl_classificacao AS c
		WHERE f.cod_idioma = i.cod_idioma AND
			 f.cod_classificacao = c.cod_classificacao;
