-- Tabela Departamento
CREATE TABLE Departamento (
    NomeDepartamento VARCHAR(255) PRIMARY KEY,
    NomeGerente VARCHAR(255)
);

-- Tabela Empregado
CREATE TABLE Empregado (
    IDEmpregado INT PRIMARY KEY,
    NomeEmpregado VARCHAR(255),
    CargoEmpregado VARCHAR(255),
    SalarioEmpregado DECIMAL(10,2),
    DataAdmissao DATE,
    DepartamentoAlocado VARCHAR(255),
    Contato VARCHAR(255),
    Endereco VARCHAR(255),
    Idade INT,
    PRIMARY KEY (IDEmpregado),
    FOREIGN KEY (DepartamentoAlocado) REFERENCES Departamento(NomeDepartamento)
);

-- Tabela Dependente
CREATE TABLE Dependente (
    NomeDependente VARCHAR(255) PRIMARY KEY,
    DataNascimento DATE,
    ParentescoEmpregado VARCHAR(255),
    NomeEmpregadoResponsavel VARCHAR(255),
    FOREIGN KEY (NomeEmpregadoResponsavel) REFERENCES Empregado(NomeEmpregado)
);

-- Tabela Vendedor
CREATE TABLE Vendedor (
    IDEmpregado INT PRIMARY KEY,
    DesempenhoVendas INT,
    NumClientesAtendidos INT,
    IDSupervisor INT,
    PRIMARY KEY (IDEmpregado),
    FOREIGN KEY (IDSupervisor) REFERENCES Supervisor(IDSupervisor),
    FOREIGN KEY (IDEmpregado) REFERENCES Empregado(IDEmpregado)
);

-- Tabela Supervisor
CREATE TABLE Supervisor (
    IDSupervisor INT PRIMARY KEY,
    AreaSupervisao VARCHAR(255),
    IDGerente INT,
    FOREIGN KEY (IDGerente) REFERENCES Gerente(IDGerente)
);

-- Tabela Gerente
CREATE TABLE Gerente (
    IDGerente INT PRIMARY KEY,
    ResponsabilidadesGerenciamento VARCHAR(255),
    DepartamentoGerenciado VARCHAR(255),
    FOREIGN KEY (DepartamentoGerenciado) REFERENCES Departamento(NomeDepartamento)
);

-- Tabela Produto
CREATE TABLE Produto (
    IDProduto INT PRIMARY KEY,
    NomeProduto VARCHAR(255),
    DescricaoProduto VARCHAR(255),
    Preco DECIMAL(10,2),
    Fornecedor VARCHAR(255),
    EstoqueAtual INT,
    CategoriaProduto VARCHAR(255),
    PRIMARY KEY (IDProduto),
    FOREIGN KEY (CategoriaProduto) REFERENCES Vestuario(CategoriaProduto),
    FOREIGN KEY (CategoriaProduto) REFERENCES Acessorios(CategoriaProduto),
    FOREIGN KEY (CategoriaProduto) REFERENCES Cosmeticos(CategoriaProduto),
    FOREIGN KEY (CategoriaProduto) REFERENCES Produto(IDProduto)
);

-- Tabela Vestuario
CREATE TABLE Vestuario (
    Tamanho VARCHAR(50),
    Tipo VARCHAR(255),
    Cor VARCHAR(255),
    CategoriaProduto INT,
    PRIMARY KEY (CategoriaProduto),
    FOREIGN KEY (CategoriaProduto) REFERENCES Produto(IDProduto)
);

-- Tabela Acessorios
CREATE TABLE Acessorios (
    Tamanho VARCHAR(50),
    Tipo VARCHAR(255),
    Cor VARCHAR(255),
    CategoriaProduto INT,
    PRIMARY KEY (CategoriaProduto),
    FOREIGN KEY (CategoriaProduto) REFERENCES Produto(IDProduto)
);

-- Tabela Cosmeticos
CREATE TABLE Cosmeticos (
    Fragrancia VARCHAR(255),
    Marca VARCHAR(255),
    ID INT PRIMARY KEY,
    FOREIGN KEY (ID) REFERENCES Produto(IDProduto)
);

-- Tabela Receita
CREATE TABLE Receita (
    DataTransacao DATE,
    DescricaoTransacao VARCHAR(255),
    ValorTransacao DECIMAL(10,2),
    TipoTransacao VARCHAR(255),
    IDEmpregadoResponsavelTransacao INT,
    PRIMARY KEY (DataTransacao, IDEmpregadoResponsavelTransacao),
    FOREIGN KEY (IDEmpregadoResponsavelTransacao) REFERENCES Empregado(IDEmpregado)
);

-- Tabela Depende
CREATE TABLE Depende (
    NomeEmpregadoResponsavel VARCHAR(255),
    NomeDependente VARCHAR(255),
    PRIMARY KEY (NomeEmpregadoResponsavel, NomeDependente),
    FOREIGN KEY (NomeEmpregadoResponsavel) REFERENCES Empregado(NomeEmpregado),
    FOREIGN KEY (NomeDependente) REFERENCES Dependente(NomeDependente)
);

-- Tabela Contratado
CREATE TABLE Contratado (
    IDEmpregado INT,
    NomeDepartamento VARCHAR(255),
    PRIMARY KEY (IDEmpregado, NomeDepartamento),
    FOREIGN KEY (IDEmpregado) REFERENCES Empregado(IDEmpregado),
    FOREIGN KEY (NomeDepartamento) REFERENCES Departamento(NomeDepartamento)
);

-- Tabela Supervisiona
CREATE TABLE Supervisiona (
    IDSupervisor INT,
    IDEmpregado INT,
    PRIMARY KEY (IDSupervisor, IDEmpregado),
    FOREIGN KEY (IDSupervisor) REFERENCES Supervisor(IDSupervisor),
    FOREIGN KEY (IDEmpregado) REFERENCES Vendedor(IDEmpregado)
);

-- Tabela Gerencia
CREATE TABLE Gerencia (
    IDGerente INT,
    NomeDepartamento VARCHAR(255),
    PRIMARY KEY (IDGerente, NomeDepartamento),
    FOREIGN KEY (IDGerente) REFERENCES Gerente(IDGerente),
    FOREIGN KEY (NomeDepartamento) REFERENCES Departamento(NomeDepartamento)
);

-- Tabela Pertence
CREATE TABLE Pertence (
    IDProduto INT,
    NomeDepartamento VARCHAR(255),
    PRIMARY KEY (IDProduto, NomeDepartamento),
    FOREIGN KEY (IDProduto) REFERENCES Produto(IDProduto),
    FOREIGN KEY (NomeDepartamento) REFERENCES Departamento(NomeDepartamento)
);

-- Tabela Vende
CREATE TABLE Vende (
    IDEmpregado INT,
    IDProduto INT,
    QuantidadeVendida INT,
    DataCompra DATE,
    PRIMARY KEY (IDEmpregado, IDProduto, DataCompra),
    FOREIGN KEY (IDEmpregado) REFERENCES Vendedor(IDEmpregado),
    FOREIGN KEY (IDProduto) REFERENCES Produto(IDProduto)
);

-- Tabela Para
CREATE TABLE Para (
    IDEmpregado INT,
    IDProduto INT,
    DataCompra DATE,
    PRIMARY KEY (IDEmpregado, IDProduto, DataCompra),
    FOREIGN KEY (IDEmpregado) REFERENCES Vendedor(IDEmpregado),
    FOREIGN KEY (IDProduto) REFERENCES Produto(IDProduto)
);
