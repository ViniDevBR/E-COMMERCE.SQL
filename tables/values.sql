use E_COMMERCE;

desc cliente;
insert into cliente values
    (0, 'USER', 'PF', 'Null', 000000000),
    (1, 'Maria', 'Silva', 'rua flores 123', 123456789),
    (2, 'Mateus', 'Oliveira', 'rua oliveira 123', 123789456),
    (3, 'Ricardo', 'Silva', 'rua silva 123', 789456123),
    (4, 'Julia', 'França', 'rua celestino 123', 789123456),
    (5, 'Roberta', 'Olveira', 'rua pereira 123', 456789123);
	
desc contaPJ;
insert into contaPJ values
    (0, 0, 00000000000000),
    (1, 1, 12345678912345),
    (2, 2, 12345678978912);

desc contaPF;
insert into contaPF values
    (0, 0, 000000000),
    (1, 3, 123456789),
    (2, 4, 123456987),
    (3, 5, 123456654);
    
desc produto;
insert into produto values
    (1, 'Eletronicos', null, 200, 'Fone'),
    (2, 'Eletronicos', null, 100, 'Carregador'),
    (3, 'Musical', null, 250, 'Microfone'),
    (4, 'Alimentos', null, 50, 'Picanha'),
    (5, 'Outros', null, 20, 'Boneca');
    
desc tiposPagamento;
insert into tiposPagamento values
    (1, true, false, false), -- PIX
    (2, false, true, false), -- BOLETO
    (3, false, false, true); -- CARTÃO
    
desc pagamento;
insert into pagamento values
    (1, 1, default, 1), -- PIX
    (2, default, 1, 3), -- CARTÃO
    (3, 2, default, 1), -- PIX
    (4, default, 2, 2); -- BOLETO
    
desc pedido;
insert into pedido values
    (1, 'Em processo', null, 10, 1, 0, 1),
    (2, 'Confirmado', null, 20, 1, 0, 1),
    (3, 'Em processo', null, 15, 2, 0, 2),
    (4, 'Cancelado', null, 12, 0, 2, 3),
    (5, 'Em processo', null, 14, 3, 0, 4);
    
desc entrega;
insert into entrega values
    (1, 'CODIGO1', 'Caminho'),
    (2, 'CODIGO2', 'Entregue'),
    (3, 'CODIGO3', 'Entregue'),
    (4, 'CODIGO4', 'Não entregue');
    
desc estoque;
insert into estoque values
    (1, 'Campinas - SP', '123456789'),
    (2, 'São Paulo - SP', '123456987'),
    (3, 'Sumaré - SP', '123456654'),
    (4, 'Hortolandia - SP', '123456456'),
    (5, 'Monte Mor - SP', '123456123');
    
desc terceiros;
insert into terceiros values 
    (1, 'Campinas', 'campinas@terceiro.com', 12345678912345),
    (2, 'Campinas', 'campinas@terceiro.com / (12)123456789', 12345678912354),
    (3, 'Sumare', 'sumare@terceiro.com', 12345678912378),
    (4, 'Hortolandia', '(19)123456789', 12345678912398),
    (5, 'Monte Mor', '(15)123456789', 12345678912355);
    
desc fornecedor;
insert into fornecedor values
    (1, 'Campinas', 'fornecedor1@gmail.com / (21)123456789', 12345678912345),
    (2, 'Sumare', 'fornecedor2@gmail.com / (21)123456789', 12345678912344),
    (3, 'Hortolandia', 'fornecedor3@gmail.com / (21)123456789', 12345678912343),
    (4, 'Monte Mor', 'fornecedor4@gmail.com / (21)123456789', 12345678912348),
    (5, 'Americana', 'fornecedor5@gmail.com / (21)123456789', 12345678912347);
    
desc QtdEstoque;
insert into QtdEstoque values
    (1, 1, 1, 20),
    (2, 1, 2, 10),
    (3, 2, 3, 30),
    (4, 4, 4, 20),
    (5, 5, 5, 15);
    
desc produtoPedido;
insert into produtoPedido values
    (1, 1, 1, 3),
    (2, 2, 1, 1),
    (3, 5, 2, 1),
    (4, 4, 3, 2),
    (5, 5, 5, 3);

desc forneceOproduto;
insert into forneceOproduto values
    (1, 1, 1),
    (2, 1, 3),
    (3, 2, 2),
    (4, 2, 5),
    (5, 3, 4);
    
desc produtoDeTerceiro;
insert into produtoDeTerceiro values
    (1, 1, 1, 50),
    (2, 1, 2, 30),
    (3, 3, 3, 10),
    (4, 4, 4, 500),
    (5, 5, 5, 200);
