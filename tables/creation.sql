create database E_COMMERCE;
use E_COMMERCE;

create table cliente (
    idCliente int NOT NULL, 
    Fname varchar(15) NOT NULL,
    Lname varchar(15) NOT NULL,
    Endereço varchar(255) NOT NULL,
    RG char(9) NOT NULL,
    primary key (idCliente),
    constraint unique_cliente UNIQUE (RG)
);

create table contaPJ (
    idContaPJ int NOT NULL,
    idCliente int NOT NULL,
    CNPJ char(14) NOT NULL,
    primary key (idContaPJ),
    constraint fk_contaPJ_idCliente foreign key (idCliente) references cliente(idCliente),
    constraint unique_CNPJ unique (CNPJ)
);

create table contaPF (
    idContaPF int NOT NULL,
    idCliente int NOT NULL,
    CPF char(9) NOT NULL,
    primary key (idContaPF),
    constraint fk_contaPF_idCliente foreign key (idCliente) references cliente(idCliente),
    constraint unique_CPF unique (CPF)
);

create table tiposPagamento (
    idTipoPagamento int NOT NULL,
    pix boolean,
    boleto boolean,
    cartão boolean,
    primary key (idTipoPagamento)
);

create table pagamento (
    idPagamento int NOT NULL,
    idContaPF int,
    idContaPJ int,
    idTipoPagamento int,
    primary key (idPagamento, idContaPF, idContaPJ),
    constraint fk_pagamento_PF foreign key (idContaPF) references contaPF(idContaPF),
    constraint fk_pagamento_PJ foreign key (idContaPJ) references contaPJ(idContaPJ),
    constraint fk_pagamento_TipoPagamento foreign key (idTipoPagamento) references tiposPagamento(idTipoPagamento)
);

create table pedido (
    idPedido int NOT NULL,
    statusPedido enum('Confirmado', 'Em processo', 'Cancelado') default 'Em processo',
    descrição varchar(255),
    frete float NOT NULL,
    idContaPF int,
    idContaPJ int,
    idEntrega int,
    primary key (idPedido),
    constraint fk_pedido_PF foreign key (idContaPF) references contaPF(idContaPF),
    constraint fk_pedido_PJ foreign key (idContaPJ) references contaPJ(idContaPJ),
    constraint fk_pedido_Entrega foreign key (idEntrega) references entrega(idEntrega)
);

create table entrega (
    idEntrega int NOT NULL,
    codigo varchar(20) NOT NULL,
    statusEntrega enum('Entregue', 'Caminho', 'Não entregue') default 'Caminho',
    primary key (idEntrega),
    constraint unique_entrega unique (codigo)
);

alter table produto
	add Pname varchar(20);
create table produto (
    idProduto int NOT NULL,
    categoria enum('Eletronicos', 'Musical', 'Alimentos', 'Outros') default 'Outros',
    descrição varchar(255),
    valor float NOT NULL,
    primary key(idProduto)
);

create table estoque (
    idEstoque int NOT NULL,
    localEstoque varchar(100) NOT NULL,
    contato varchar(50) NOT NULL,
    primary key(idEstoque)
);

create table terceiros (
    idTerceiro int NOT NULL,
    localTerceiro varchar(100) NOT NULL,
    contato varchar(50) NOT NULL,
    CNPJ char(14) NOT NULL,
    primary key (idTerceiro),
    constraint unique_CNPJ_terceiro unique (CNPJ)
);

create table fornecedor (
    idFornecedor int NOT NULL,
    localFornecedor varchar(100) NOT NULL,
    contato varchar(50) NOT NULL,
    CNPJ char(14) NOT NULL,
    primary key(idFornecedor),
    constraint unique_CNPJ_fornecedor unique(CNPJ)
);

create table QtdEstoque (
    idQtdEstoque int NOT NULL,
    idEstoque int,
    idProduto int,
    Quantidade int default 1,
    primary key(idQtdEstoque, idEstoque, idProduto),
    constraint fk_QTDEstoque_Estoque foreign key (idEstoque) references estoque(idEstoque),
    constraint fk_QTDEstoque_Produto foreign key (idProduto) references produto(idProduto)
);

create table produtoPedido (
    idProdutoPedido int NOT NULL,
    idProduto int,
    idPedido int,
    quantidade int NOT NULL,
    primary key(idProdutoPedido, idProduto, idPedido),
    constraint fk_produtoPedido_Pedido foreign key (idPedido) references pedido(idPedido),
    constraint fk_produtoPedido_Produto foreign key (idProduto) references produto(idProduto)
);

create table forneceOproduto (
    idForneceOproduto int NOT NULL,
    idProduto int,
    idFornecedor int,
    primary key(idForneceOproduto),
    constraint fk_forneceOproduto_Fornecedor foreign key (idFornecedor) references fornecedor(idFornecedor),
    constraint fk_forneceOproduto_Produto foreign key (idProduto) references produto(idProduto)
);

create table produtoDeTerceiro (
    idProdutoDeTerceiro int NOT NULL,
    idProduto int,
    idTerceiro int,
    quantidade int NOT NULL,
    primary key(idProdutoDeTerceiro),
    constraint fk_produtoDeTerceiro_Terceiro foreign key (idTerceiro) references terceiros(idTerceiro),
    constraint fk_produtoDeTerceiro_Produto foreign key (idProduto) references produto(idProduto)
);
