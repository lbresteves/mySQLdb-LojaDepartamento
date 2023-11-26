SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

CREATE SCHEMA IF NOT EXISTS mydb DEFAULT CHARACTER SET UTF8MB4 ;
USE mydb ;

-- Table mydb.Departamento
CREATE TABLE IF NOT EXISTS mydb.Departamento (
  nomeDepartamento VARCHAR(100) NOT NULL,
  nomeGerente VARCHAR(100) NULL,
  PRIMARY KEY (nomeDepartamento))
ENGINE = InnoDB;

-- Table mydb.Empregado
CREATE TABLE IF NOT EXISTS mydb.Empregado (
  idEmpregado INT NOT NULL,
  nomeEmpregado VARCHAR(100) NOT NULL,
  cargoEmpregado VARCHAR(100) NULL,
  salarioEmpregado INT NULL,
  dataAdmissao DATE NULL,
  contatoEmpregado INT NULL,
  enderecoEmpregado VARCHAR(100) NULL,
  idadeEmpregado INT NULL,
  Departamento_nomeDepartamento VARCHAR(100) NOT NULL,
  PRIMARY KEY (idEmpregado),
  INDEX fk_Empregado_Departamento1_idx (Departamento_nomeDepartamento ASC) VISIBLE,
  CONSTRAINT fk_Empregado_Departamento1
    FOREIGN KEY (Departamento_nomeDepartamento)
    REFERENCES mydb.Departamento (nomeDepartamento)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- Table mydb.Gerente
CREATE TABLE IF NOT EXISTS mydb.Gerente (
  Empregado_idEmpregado INT NOT NULL,
  Departamento_nomeDepartamento VARCHAR(100) NOT NULL,
  PRIMARY KEY (Empregado_idEmpregado),
  INDEX fk_Gerente_Departamento1_idx (Departamento_nomeDepartamento ASC) VISIBLE,
  CONSTRAINT fk_Gerente_Empregado1
    FOREIGN KEY (Empregado_idEmpregado)
    REFERENCES mydb.Empregado (idEmpregado)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_Gerente_Departamento1
    FOREIGN KEY (Departamento_nomeDepartamento)
    REFERENCES mydb.Departamento (nomeDepartamento)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- Table mydb.Supervisor
CREATE TABLE IF NOT EXISTS mydb.Supervisor (
  Empregado_idEmpregado INT NOT NULL,
  PRIMARY KEY (Empregado_idEmpregado),
  CONSTRAINT fk_Supervisor_Empregado1
    FOREIGN KEY (Empregado_idEmpregado)
    REFERENCES mydb.Empregado (idEmpregado)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB; 

-- Table mydb.Vendedor
CREATE TABLE IF NOT EXISTS mydb.Vendedor (
  Empregado_idEmpregado INT NOT NULL,
  Supervisor_Empregado_idEmpregado INT NOT NULL,
  PRIMARY KEY (Empregado_idEmpregado),
  INDEX fk_Vendedor_Supervisor1_idx (Supervisor_Empregado_idEmpregado ASC) VISIBLE,
  CONSTRAINT fk_Vendedor_Empregado1
    FOREIGN KEY (Empregado_idEmpregado)
    REFERENCES mydb.Empregado (idEmpregado)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_Vendedor_Supervisor1
    FOREIGN KEY (Supervisor_Empregado_idEmpregado)
    REFERENCES mydb.Supervisor (Empregado_idEmpregado)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB; 

-- Table mydb.Dependente
CREATE TABLE IF NOT EXISTS mydb.Dependente (
  nomeDependente VARCHAR(100) NOT NULL,
  nascimentoDependente DATE NULL,
  parentescoEmpregado VARCHAR(45) NULL,
  Empregado_idEmpregado INT NOT NULL,
  PRIMARY KEY (nomeDependente, Empregado_idEmpregado),
  INDEX fk_Dependente_Empregado_idx (Empregado_idEmpregado ASC) VISIBLE,
  CONSTRAINT fk_Dependente_Empregado
    FOREIGN KEY (Empregado_idEmpregado)
    REFERENCES mydb.Empregado (idEmpregado)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- Table mydb.Produto
CREATE TABLE IF NOT EXISTS mydb.Produto (
  Departamento_nomeDepartamento VARCHAR(100) NOT NULL,
  nomeProduto VARCHAR(45) NOT NULL,
  precoProduto INT NULL,
  qtd_estoqueProduto INT NULL,
  marcaProduto VARCHAR(45) NULL,
  PRIMARY KEY (nomeProduto),
  CONSTRAINT fk_Produto_Departamento1
    FOREIGN KEY (Departamento_nomeDepartamento)
    REFERENCES mydb.Departamento (nomeDepartamento)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- Table mydb.Vestuario with composite primary key
CREATE TABLE IF NOT EXISTS mydb.Vestuario (
    Produto_Departamento_nomeDepartamento VARCHAR(100) NOT NULL,
    Produto_nomeProduto VARCHAR(45) NOT NULL,
    tamanhoVestuario VARCHAR(5) NOT NULL,
    corVestuario VARCHAR(45) NOT NULL,
    PRIMARY KEY (Produto_nomeProduto, tamanhoVestuario, corVestuario),
    CONSTRAINT fk_Vestuario_Produto1
        FOREIGN KEY (Produto_Departamento_nomeDepartamento, Produto_nomeProduto)
        REFERENCES mydb.Produto (Departamento_nomeDepartamento, nomeProduto)
        ON DELETE NO ACTION
        ON UPDATE NO ACTION
) ENGINE = InnoDB;

-- Table mydb.Acessorios
CREATE TABLE IF NOT EXISTS mydb.Acessorios (
  Produto_Departamento_nomeDepartamento VARCHAR(100) NOT NULL,
  Produto_nomeProduto VARCHAR(45) NOT NULL,
  tamanhoAcessorio VARCHAR(5) NOT NULL,
  tipoAcessorio VARCHAR(45) NOT NULL,
  corAcessorio VARCHAR(45) NOT NULL,
  PRIMARY KEY (Produto_nomeProduto, tamanhoAcessorio, tipoAcessorio, corAcessorio),
  CONSTRAINT fk_Acessorios_Produto1
    FOREIGN KEY (Produto_Departamento_nomeDepartamento, Produto_nomeProduto)
    REFERENCES mydb.Produto (Departamento_nomeDepartamento, nomeProduto)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- Table mydb.Cosmeticos
CREATE TABLE IF NOT EXISTS mydb.Cosmeticos (
  Produto_Departamento_nomeDepartamento VARCHAR(100) NOT NULL,
  Produto_nomeProduto VARCHAR(45) NOT NULL,
  tipoCosmetico VARCHAR(45) NULL,
  PRIMARY KEY (Produto_nomeProduto),
  CONSTRAINT fk_Cosmeticos_Produto1
    FOREIGN KEY (Produto_Departamento_nomeDepartamento , Produto_nomeProduto)
    REFERENCES mydb.Produto (Departamento_nomeDepartamento , nomeProduto)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- Table mydb.Cliente
CREATE TABLE IF NOT EXISTS mydb.Cliente (
  idCliente INT NOT NULL,
  nomeCliente VARCHAR(45) NULL,
  PRIMARY KEY (idCliente))
ENGINE = InnoDB;

-- Table mydb.Venda
CREATE TABLE IF NOT EXISTS mydb.Venda (
  Produto_nomeProduto VARCHAR(45) NOT NULL,
  Vendedor_Empregado_idEmpregado INT NOT NULL,
  Cliente_idCliente INT NOT NULL,
  idVenda VARCHAR(45) NOT NULL,
  dataVenda DATE NULL,
  qtdVenda INT NULL,
  INDEX fk_Produto_has_Vendedor_Vendedor1_idx (Vendedor_Empregado_idEmpregado ASC) VISIBLE,
  INDEX fk_Produto_has_Vendedor_Produto1_idx (Produto_nomeProduto ASC) VISIBLE,
  INDEX fk_Produto_has_Vendedor_Cliente1_idx (Cliente_idCliente ASC) VISIBLE,
  PRIMARY KEY (idVenda),
  CONSTRAINT fk_Produto_has_Vendedor_Produto1
    FOREIGN KEY (Produto_nomeProduto)
    REFERENCES mydb.Produto (nomeProduto)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_Produto_has_Vendedor_Vendedor1
    FOREIGN KEY (Vendedor_Empregado_idEmpregado)
    REFERENCES mydb.Vendedor (Empregado_idEmpregado)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_Produto_has_Vendedor_Cliente1
    FOREIGN KEY (Cliente_idCliente)
    REFERENCES mydb.Cliente (idCliente)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

DELIMITER //

CREATE TRIGGER after_insert_Venda
AFTER INSERT ON mydb.Venda FOR EACH ROW
BEGIN
    UPDATE mydb.Produto
    SET qtd_estoqueProduto = qtd_estoqueProduto - NEW.qtdVenda
    WHERE nomeProduto = NEW.Produto_nomeProduto;
END //

DELIMITER ;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
