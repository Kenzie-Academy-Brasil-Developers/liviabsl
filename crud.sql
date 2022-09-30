-- Aqui você deve colocar os códigos SQL referentes às
-- Simulações de um CRUD

-- Criação

-- 1)

INSERT INTO clientes(nome, lealdade)
	VALUES
	('Georgia', 0);

-- 2)

INSERT INTO pedidos(status, cliente_id)
	VALUES
	('Recebido', 6);

-- 3)

INSERT INTO produtos_pedidos (pedido_id, produto_id)
	VALUES
	(6,1),
	(6,2),
	(6,6),
	(6,8),
	(6,8);

-- Leitura

-- 1)

SELECT c.id, c.nome, c.lealdade, pe.id, pe.status, pe.cliente_id, pr.id, pr.tipo, pr.preço, pr.pts_de_lealdade 
    FROM clientes c
    JOIN pedidos pe ON c.id = pe.cliente_id
    JOIN produtos_pedidos pp ON pp.pedido_id  = pe.id
    JOIN produtos pr ON pr.id = pp.produto_id
    WHERE c.nome = 'Georgia'; 

-- Atualização

-- 1)

UPDATE
	clientes
SET
	lealdade = (SELECT SUM(pr.pts_de_lealdade )
FROM clientes c
JOIN pedidos pe ON c.id = pe.cliente_id
JOIN produtos_pedidos pp ON pp.pedido_id  = pe.id
JOIN produtos pr ON pr.id = pp.produto_id
WHERE c.nome = 'Georgia')
WHERE id= 6;

-- Deleção

-- 1)

DELETE FROM
	clientes
WHERE
	id= 4;
