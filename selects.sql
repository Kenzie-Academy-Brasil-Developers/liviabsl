-- Aqui você deve colocar os códigos SQL referentes às
-- Seleções de dados

-- 1)

SELECT 
	pe.id, pe.status, pe.cliente_id, pr.id, pr.nome, pr.tipo, pr."preço", pr.pts_de_lealdade  
    FROM pedidos pe 
    JOIN produtos_pedidos pp  on pedido_id=pe.id 
    JOIN produtos pr on produto_id = pr.id;

-- 2)

SELECT pedido_id 
    FROM produtos_pedidos pp 
    JOIN produtos p ON pp.produto_id = p.id 
    WHERE p.nome = 'Fritas';

-- 3)

SELECT c.nome gostam_de_fritas
    FROM produtos_pedidos pp 
    JOIN produtos p ON pp.produto_id = p.id  
    JOIN pedidos pe ON pe.id = pedido_id 
    JOIN clientes c ON c.id = pe.cliente_id 
    WHERE p.nome = 'Fritas';


-- 4)

SELECT SUM(p."preço")
    FROM produtos_pedidos pp 
    JOIN produtos p ON pp.produto_id = p.id  
    JOIN pedidos pe ON pe.id = pedido_id 
    JOIN clientes c ON c.id = pe.cliente_id
    WHERE c.nome='Laura';

-- 5)

SELECT p.nome, COUNT(*)
    FROM produtos_pedidos pp 
    JOIN produtos p ON pp.produto_id = p.id  
    JOIN pedidos pe ON pe.id = pedido_id 
    JOIN clientes c ON c.id = pe.cliente_id
    GROUP BY p.nome
    ORDER BY p.nome ASC;