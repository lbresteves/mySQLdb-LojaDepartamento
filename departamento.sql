INSERT INTO mydb.Departamento (nomeDepartamento, nomeGerente) VALUES
('Vestuário', 'Ronaldo Fraga'),
('Cosméticos', 'Coco Channel'),
('Acessórios', 'Johann Rupert');

INSERT INTO mydb.Empregado (
	idEmpregado,
	nomeEmpregado,
	cargoEmpregado,
	salarioEmpregado,
	dataAdmissao,
	contatoEmpregado,
	enderecoEmpregado,
	idadeEmpregado,
	Departamento_nomeDepartamento
	) VALUES
    -- Gerentes
	(1, 'Ronaldo Fraga', 'Gerente', 5000, '2023-01-01', 999999999, 'Avenida Brasil, 42', 35, 'Vestuário'),
	(2, 'Coco Channel', 'Gerente', 5000, '2023-01-01', 888888888, 'Avenida Álvares Cabral, 100', 30, 'Cosméticos' ),
	(3, 'Johann Rupert', 'Gerente', 5000, '2023-01-01', 777777777, 'Avenida Afonso Pena, 400', 45, 'Acessórios'),
    -- Vestuário
    (4, 'Mariana Costa', 'Vendedor', 1500, '2023-02-01', 666777888, 'Rua Dos Timbiras, 123', 22, 'Vestuário'),
	(5, 'Carlos Santos', 'Supervisor', 3000, '2023-02-01', 555666777, 'Rua Curitiba, 789', 27, 'Vestuário'),
    
    (6, 'Paulo Pereira', 'Vendedor', 1500, '2023-02-01', 444333222, 'Rua E, 525', 23, 'Cosméticos'),
    (7, 'Miranda Silva', 'Supervisor', 3000, '2023-02-01', 555666777, 'Rua C, 789', 40, 'Cosméticos'),
    
    (8, 'Rodrigo Oliveira', 'Vendedor', 1500, '2023-02-01', 123456789, 'Rua I, 345', 32,'Acessórios'),
	(9, 'Cristina Silva', 'Supervisor', 3000, '2023-02-01', 987654321, 'Avenida J, 678', 36, 'Acessórios');


INSERT INTO mydb.Gerente (
	Empregado_idEmpregado,
	Departamento_nomeDepartamento
) VALUES
	(1, 'Vestuário'),
	(2, 'Cosméticos'),
	(3, 'Acessórios');
    

INSERT INTO mydb.Supervisor (Empregado_idEmpregado) VALUES
(5),
(7),
(9);


INSERT INTO mydb.Vendedor ( 
	Empregado_idEmpregado,
	Supervisor_Empregado_idEmpregado ) VALUES
    (4, 5),
    (6, 7),
    (8, 9);


INSERT INTO mydb.Dependente (
	nomeDependente,
	nascimentoDependente,
	parentescoEmpregado,
	Empregado_idEmpregado
    ) VALUES

    -- Dependents for Ronaldo Fraga (Empregado_idEmpregado = 1)
    ('Gabriel Fraga', '2002-04-12', 'Filho', 1),
    ('Lara Fraga', '2005-09-28', 'Filha', 1),
    
    -- Dependents for Coco Channel (Empregado_idEmpregado = 2)
    ('Oliver Channel', '2010-07-15', 'Filho', 2),
    
    -- Dependents for Johann Rupert (Empregado_idEmpregado = 3)
    ('Sophie Rupert', '1998-12-05', 'Filha', 3),
    ('Max Rupert', '2002-06-20', 'Filho', 3),
    
    -- Dependentes for Mariana Costa (Empregado_idEmpregado = 4)
    ('Ana Costa', '2005-03-15', 'Filho', 4),
    ('João Costa', '2008-07-20', 'Filho', 4),
    
    -- Dependentes for Carlos Santos (Empregado_idEmpregado = 5)
    ('Maria Santos', '2010-01-10', 'Filha', 5),
    
    -- Dependentes for Paulo Pereira (Empregado_idEmpregado = 6)
    ('Pedro Pereira', '2012-05-25', 'Filho', 6),
    ('Luísa Pereira', '2015-11-08', 'Filha', 6),
    
    -- Dependentes for Miranda Silva (Empregado_idEmpregado = 7)
    ('Gabriel Silva', '2000-09-03', 'Filho', 7),
    ('Sophia Silva', '2003-12-18', 'Filha', 7),
    
    -- Dependentes for Rodrigo Oliveira (Empregado_idEmpregado = 8)
    ('Lucas Oliveira', '2007-04-30', 'Filho', 8),
    
    -- Dependentes for Cristina Silva (Empregado_idEmpregado = 9)
    ('Isabella Silva', '2010-08-12', 'Filha', 9);

INSERT INTO mydb.Produto (
	Departamento_nomeDepartamento,
	nomeProduto,
	precoProduto,
	qtd_estoqueProduto,
	marcaProduto
    ) VALUES 
        -- Produtos para Vestuário
    ('Vestuário', 'Camiseta', 30, 100, 'Fashion Co.'),
    ('Vestuário', 'Calça', 50, 80, 'Denim Style'),
    ('Vestuário', 'Vestido', 120, 40, 'Glamour Couture'),
    ('Vestuário', 'Sapato Couro', 80, 60, 'Foot Elegance'),
    
    -- Produtos para Cosméticos
    ('Cosméticos', 'Perfume', 80, 50, 'Fragrance House'),
    ('Cosméticos', 'Creme Hidratante', 50, 70, 'Beauty Essentials'),
    ('Cosméticos', 'Kit de Maquiagem', 150, 20, 'Beauty Glam'),
    ('Cosméticos', 'Creme Capilar', 60, 90, 'Hair Luxe'),
    
    -- Produtos para Acessórios
    ('Acessórios', 'Bolsa de Couro', 120, 30, 'Luxury Bags'),
    ('Acessórios', 'Relógio de Pulso', 100, 40, 'Time Couture'),
    ('Acessórios', 'Óculos de Sol', 60, 50, 'SunStyle'),
    ('Acessórios', 'Colar de Pérolas', 45, 30, 'Elegant Jewelry');

-- aumentando #vendedores para fazer sentido
INSERT INTO mydb.Empregado (
    idEmpregado,
    nomeEmpregado,
    cargoEmpregado,
    salarioEmpregado,
    dataAdmissao,
    contatoEmpregado,
    enderecoEmpregado,
    idadeEmpregado,
    Departamento_nomeDepartamento
) VALUES
    (10, 'Ana Oliveira', 'Vendedor', 1500, '2023-03-01', 111222333, 'Rua A, 123', 25, 'Vestuário'),
    (11, 'Pedro Silva', 'Vendedor', 1500, '2023-03-01', 444555666, 'Rua B, 456', 28, 'Vestuário'),
    
    (12, 'Marta Sousa', 'Vendedor', 1500, '2023-03-01', 777888999, 'Rua C, 789', 26, 'Cosméticos'),
    (13, 'Ricardo Santos', 'Vendedor', 1500, '2023-03-01', 999000111, 'Rua D, 1011', 29, 'Cosméticos'),
    
    (14, 'Carlos Oliveira', 'Vendedor', 1500, '2023-03-01', 123456789, 'Rua E, 1213', 27, 'Acessórios'),
    (15, 'Isabel Pereira', 'Vendedor', 1500, '2023-03-01', 987654321, 'Rua F, 1415', 30, 'Acessórios');

INSERT INTO mydb.Vendedor (
    Empregado_idEmpregado,
    Supervisor_Empregado_idEmpregado
) VALUES
    (10, 5), -- Ana Oliveira, Supervisor: Carlos Santos
    (11, 5), -- Pedro Silva, Supervisor: Carlos Santos
    
    (12, 7), -- Marta Sousa, Supervisor: Miranda Silva
    (13, 7), -- Ricardo Santos, Supervisor: Miranda Silva
    
    (14, 9), -- Carlos Oliveira, Supervisor: Cristina Silva
    (15, 9); -- Isabel Pereira, Supervisor: Cristina Silva

INSERT INTO mydb.Vestuario (
    Produto_Departamento_nomeDepartamento,
    Produto_nomeProduto,
    tamanhoVestuario,
    corVestuario
) VALUES
    -- Calça
    ('Vestuário', 'Calça', 'M', 'Azul'),
    ('Vestuário', 'Calça', 'G', 'Preto'),
    ('Vestuário', 'Calça', 'XG', 'Marrom'),
    
    -- Camiseta
    ('Vestuário', 'Camiseta', 'P', 'Azul'),
    ('Vestuário', 'Camiseta', 'M', 'Azul'),
    ('Vestuário', 'Camiseta', 'G', 'Azul'),
    ('Vestuário', 'Camiseta', 'P', 'Branca'),
    ('Vestuário', 'Camiseta', 'M', 'Branca'),
    ('Vestuário', 'Camiseta', 'G', 'Branca'),
    ('Vestuário', 'Camiseta', 'P', 'Vermelha'),
    ('Vestuário', 'Camiseta', 'M', 'Vermelha'),
    ('Vestuário', 'Camiseta', 'G', 'Vermelha'),
    
    -- Sapato Couro
    ('Vestuário', 'Sapato Couro', '42', 'Preto'),
    ('Vestuário', 'Sapato Couro', '40', 'Marrom'),
    ('Vestuário', 'Sapato Couro', '38', 'Bege'),
    
    -- Vestido
    ('Vestuário', 'Vestido', 'P', 'Rosa'),
    ('Vestuário', 'Vestido', 'M', 'Azul'),
    ('Vestuário', 'Vestido', 'G', 'Preto');


INSERT INTO mydb.Acessorios (
    Produto_Departamento_nomeDepartamento,
    Produto_nomeProduto,
    tamanhoAcessorio,
    tipoAcessorio,
    corAcessorio
) VALUES
    ('Acessórios', 'Bolsa de Couro', 'M', 'Bolsa', 'Preto'),
    ('Acessórios', 'Bolsa de Couro', 'G', 'Bolsa', 'Marrom'),
    ('Acessórios', 'Colar de Pérolas', 'U', 'Colar', 'Branco'),
    ('Acessórios', 'Óculos de Sol', 'U', 'Óculos', 'Preto'),
    ('Acessórios', 'Óculos de Sol', 'U', 'Óculos', 'Rosa'),
    ('Acessórios', 'Relógio de Pulso', 'U', 'Relógio', 'Dourado'),
    ('Acessórios', 'Relógio de Pulso', 'U', 'Relógio', 'Prata');
    
INSERT INTO mydb.Cosmeticos (
    Produto_Departamento_nomeDepartamento,
    Produto_nomeProduto,
    tipoCosmetico
) VALUES
    ('Cosméticos', 'Creme Capilar', 'Creme para Cabelo'),
    ('Cosméticos', 'Creme Hidratante', 'Creme Hidratante'),
    ('Cosméticos', 'Kit de Maquiagem', 'Kit de Maquiagem'),
    ('Cosméticos', 'Perfume', 'Perfume');
    
    
    
-- Insert data into mydb.Cliente with Brazilian names
INSERT INTO mydb.Cliente (
    idCliente,
    nomeCliente
) VALUES
    (1, 'Ana Souza'),
    (2, 'Carlos Silva'),
    (3, 'Camila Santos'),
    (4, 'Diego Oliveira'),
    (5, 'Fernanda Lima'),
    (6, 'Gabriel Costa'),
    (7, 'Isabela Pereira'),
    (8, 'José Rodrigues'),
    (9, 'Juliana Almeida'),
    (10, 'Lucas Martins'),
    (11, 'Mariana Oliveira'),
    (12, 'Mateus Santos'),
    (13, 'Natália Costa'),
    (14, 'Nicolas Lima'),
    (15, 'Patrícia Silva'),
    (16, 'Pedro Oliveira'),
    (17, 'Rafaela Martins'),
    (18, 'Renato Almeida'),
    (19, 'Sofia Pereira'),
    (20, 'Thiago Rodrigues'),
    (21, 'Valentina Almeida'),
    (22, 'Vinícius Lima'),
    (23, 'Vitória Silva'),
    (24, 'Wagner Costa'),
    (25, 'Yasmin Martins'),
    (26, 'Yuri Santos'),
    (27, 'Zara Oliveira'),
    (28, 'Carlos Lima'),
    (29, 'Bianca Almeida'),
    (30, 'Bruno Pereira');
    
INSERT INTO mydb.Venda (
    Produto_nomeProduto,
    Vendedor_Empregado_idEmpregado,
    Cliente_idCliente,
    idVenda,
    dataVenda,
    qtdVenda
) VALUES
    ('Camiseta', 5, 1, SUBSTRING(REPLACE(UUID(), '-', ''), 1, 10), '2023-03-15', 3),
    ('Sapato Couro', 6, 2, SUBSTRING(REPLACE(UUID(), '-', ''), 1, 10), '2023-03-16', 2),
    ('Kit de Maquiagem', 7, 3, SUBSTRING(REPLACE(UUID(), '-', ''), 1, 10), '2023-03-17', 1),
    ('Perfume', 8, 4, SUBSTRING(REPLACE(UUID(), '-', ''), 1, 10), '2023-03-18', 4),
    ('Colar de Pérolas', 9, 5, SUBSTRING(REPLACE(UUID(), '-', ''), 1, 10), '2023-03-19', 2),
    ('Creme Hidratante', 10, 6, SUBSTRING(REPLACE(UUID(), '-', ''), 1, 10), '2023-03-20', 1),
    ('Vestido', 5, 7, SUBSTRING(REPLACE(UUID(), '-', ''), 1, 10), '2023-03-21', 3),
    ('Bolsa de Couro', 6, 8, SUBSTRING(REPLACE(UUID(), '-', ''), 1, 10), '2023-03-22', 2),
    ('Relógio de Pulso', 7, 9, SUBSTRING(REPLACE(UUID(), '-', ''), 1, 10), '2023-03-23', 1);
