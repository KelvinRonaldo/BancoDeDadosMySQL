SELECT * FROM tbl_idioma;

UPDATE tbl_idioma SET nome_idioma = 'Inglês' WHERE cod_idioma = 1;

SELECT	f.titulo_filme,
		i.nome_idioma
		FROM tbl_filme AS f
			INNER JOIN tbl_idioma AS i
		ON f.cod_idioma = i.cod_idioma;

SELECT	f.titulo_filme,
		i.nome_idioma
        /* LEFT JOIN -> TRAZER TODAS AS LINHAS DA TABELA À ESQUERDA DO 'JOIN', NO CASO A tbl_filme*/
		FROM tbl_filme AS f LEFT JOIN tbl_idioma AS i
		ON f.cod_idioma = i.cod_idioma;

SELECT	f.titulo_filme,
		i.nome_idioma
        /* LEFT JOIN -> TRAZER TODAS AS LINHAS DA TABELA À DIREITA DO 'JOIN', NO CASO A tbl_idiomas*/
		FROM tbl_filme AS f RIGHT JOIN tbl_idioma AS i
		ON f.cod_idioma = i.cod_idioma
        /* PARA VER SE ALGO É null NÃO SE USA '=' E SIM 'IS' */
        WHERE f.titulo_filme IS null; /* <--VER TODOS OS IDIOMAS O QUAL NÃO TEM EM NENHUM FILME*/
	#↑ MESMO RESULTADO MAS COM O FROM AO CONTRÁRIO
SELECT	f.titulo_filme,
		i.nome_idioma
		FROM tbl_idioma AS i LEFT JOIN tbl_filme AS f
		ON f.cod_idioma = i.cod_idioma
        WHERE f.titulo_filme IS null;