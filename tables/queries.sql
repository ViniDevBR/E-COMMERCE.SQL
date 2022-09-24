select concat(Fname, ' ', Lname) as nome_completo, count(*) idPedido from contaPF as pf, pedido as p, cliente as c
where c.idCliente = pf.idCliente and pf.idContaPF = p.idContaPF
group by nome_completo;



select Pname, f.idFornecedor, q.idEstoque from produto, forneceOproduto as f, QtdEstoque as q
where f.idFornecedor = q.idEstoque
group by Pname;
