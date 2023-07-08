create schema Trabalho;
use trabalho;

create table Hemocentros (
	ID_Hemocentro INT not null primary key, 
	Nome VARCHAR(100),
	Endereço VARCHAR(100),
	Cidade VARCHAR(100),
	Estado CHAR(2)
); 

create table Doadores (
	ID_Doador INT not null primary key,
	Nome VARCHAR(100) not null,
	CPF CHAR(11) not null,
	DataNascimento DATE,
	Sexo CHAR(1), 
	TipoSanguineo VARCHAR(3) not null,
	HistoricoMedico VARCHAR(100),
	ID_Hemocentro INT,
	foreign key (ID_Hemocentro) references Hemocentros(ID_Hemocentro)
);

create table SangueDisponivel (
	ID_Sangue INT not null primary key,
    ID_Doador INT not null,
	ID_Hemocentro INT,
	TipoSanguineo VARCHAR(5), 
	foreign key (ID_Hemocentro) references Hemocentros(ID_Hemocentro)
); 

create table Pacientes (
	ID_Paciente INT not null primary key,
	Nome VARCHAR(100) not null,
	CPF CHAR(11) not null,
	DataNascimento DATE,
	Sexo CHAR(1), 
	TipoSanguineo VARCHAR(3) not null,
	HistoricoMedico VARCHAR(100),
	ID_Hemocentro INT,
	foreign key (ID_Hemocentro) references Hemocentros(ID_Hemocentro)
);

create table Doacoes (
	ID_Doacao INT not null primary key,
	ID_Doador INT,
	ID_Paciente INT,
    ID_Hemocentro INT,
	DataDoacao DATE,
    DataRecepcao DATE,
	foreign key (ID_Doador) references Doadores(ID_Doador),
	foreign key (ID_Paciente) references Pacientes(ID_Paciente),
    foreign key (ID_Hemocentro) references Hemocentros(ID_Hemocentro)
);
-- Inserção de dados na tabela "Hemocentros"
INSERT INTO Hemocentros (ID_Hemocentro, Nome, Endereço, Cidade, Estado)
VALUES (1, 'Santa Casa de Misericórdia de Porto Alegre', 'Avenida Independência, 75 - Centro Histórico', 'Porto Alegre', 'RS'),
       (2, 'Hospital de Clínicas de Porto Alegre', 'Rua São Manoel, 543 - Rio Branco', 'PortoAlegre', 'RS'),
       (3, 'Grupo Hospitalar Conceição', 'Avenida Francisco Trein, 596 - Cristo Redentor', 'Porto Alegre', 'RS'),
	   (4, 'Hospital São Lucas da PUCRS', 'Avenida Ipiranga, 6690 - Jardim Botânico ', 'Porto Alegre', 'RS'),
       (5, 'Centro de Hematologia e Hemoterapia de Santa Catarina', 'Avenida Prof. Othon Gama D’Eça, 756 – Centro', 'Florianópolis', 'SC'),
       (6, 'Centro de Hematologia e Hemoterapia do Paraná', 'Travessa João Prosdócimo, 145 - Alto da XV', 'Curitiba', 'PR');
       
-- Inserção de dados na tabela "Doadores"
INSERT INTO Doadores (ID_Doador, Nome, CPF, DataNascimento, Sexo, TipoSanguineo, HistoricoMedico, ID_Hemocentro)
VALUES (0001, 'Júlia Camilly Flach', '03371764001', '2003-07-26', 'F', 'A+', NULL, 1),
       (0002, 'Rebeca Kepler', '78263217008', '2003-11-14', 'F', 'O+', NULL, 2),
       (0003, 'Janiner Severo', '93365717021', '2004-04-29', 'F', 'B+', NULL, 3),
       (0004, 'Maria Antônia Maia', '35330901081', '2002-09-04', 'F', 'O+', 'Asma', 4),
       (0005, 'Pedro Luís Flach', '53218960037', '1995-06-18', 'M', 'AB-', 'Hipertensão', 1),
       (0006, 'Julieta Cunha Fernandes', '16591451471', '1994-11-14', 'F', 'O-', 'Labirintite', 6),
       (0007, 'Kauã Cunha Sousa', '16861393576', '1967-11-06', 'M', 'O+', NULL, 2),
       (0008, 'Eduardo Silva Ribeiro', '38124138095', '1974-12-27', 'M', 'B-', 'Tabagismo', 2),
       (0009, 'Breno Souza Gomes', '70408395044', '1985-04-15', 'M', 'AB+', NULL, 4),
       (0010, 'Tomás Melo Sousa', '52136329391', '1968-06-03', 'M', 'A-', 'Depressão', 5); 
       
-- Inserção de dados na tabela "SangueDisponivel"
INSERT INTO SangueDisponivel (ID_Sangue, ID_Doador, TipoSanguineo, ID_Hemocentro)
VALUES (0101, 0001, 'A+', 1),
       (0201, 0002, 'O+', 2),
       (0301, 0003, 'B+', 3),
       (0401, 0004, 'O+', 4),
       (0102, 0005, 'AB-', 1),
       (0601, 0006, 'O-', 6),
       (0202, 0007, 'O+', 2),
       (0203, 0008, 'B-', 2),
       (0402, 0009, 'AB+', 4),
       (0501, 0010, 'A-', 5);
       
-- Inserção de dados na tabela "Pacientes"
INSERT INTO Pacientes (ID_Paciente, Nome, CPF, DataNascimento, Sexo, TipoSanguineo, HistoricoMedico, ID_Hemocentro)
VALUES (0001, 'José Silva', '67134695077', '1970-02-15', 'M', 'A+', 'Diabetes', 5),
       (0002, 'Carla Ferreira', '19983742039', '1988-12-02', 'F', 'O-', NULL, 6),
       (0003, 'André Martins', '52817403002', '1992-07-21', 'M', 'AB+', 'Anemia', 4),
       (0004, 'Laura Cardoso', '71538822008',  '1985-09-08', 'F', 'B-', NULL, 2);
       
-- Inserção de dados na tabela "Doacoes"
INSERT INTO Doacoes (ID_Doacao, ID_Doador, ID_Paciente, DataDoacao, DataRecepcao)
VALUES (0150, 0010, 0001, '2023-01-15', '2023-01-19'),
       (0151, 0006, 0002, '2023-02-28', '2023-03-03'),
       (0152, 0004, 0003, '2023-03-10', '2023-03-14'),
       (0153, 0008, 0004, '2023-04-05', '2023-04-09');
       
-- Consulta a Quantidade de Sangue Disponíveis nos Hemocentros
SELECT Hemocentros.Nome, SUM(SangueDisponivel.QuantidadeDisponivel) AS TotalDisponivel
FROM Hemocentros
JOIN SangueDisponivel ON Hemocentros.ID_Hemocentro = SangueDisponivel.ID_Hemocentro
GROUP BY Hemocentros.Nome;

-- Consulta mostra a quantidade de doações feita por cada Doador
SELECT Doadores.Nome, COUNT(Doacoes.ID_Doacao) AS TotalDoacoes
FROM Doadores
JOIN Doacoes ON Doadores.ID_Doador = Doacoes.ID_Doador
GROUP BY Doadores.Nome;

-- Consulta mostra onde os doadores realizaram as doações
SELECT Doadores.Nome, Hemocentros.Nome AS NomeHemocentro
FROM Doadores
JOIN Hemocentros ON Doadores.ID_Hemocentro = Hemocentros.ID_Hemocentro;

-- Consulta de doadores que doaram para pacientes com o mesmo tipo sanguíneo
SELECT D.Nome AS NomeDoador, P.Nome AS NomePaciente
FROM Doadores D
JOIN Doacoes ON D.ID_Doador = Doacoes.ID_Doador
JOIN Pacientes P ON Doacoes.ID_Paciente = P.ID_Paciente
WHERE D.TipoSanguineo IN (
    SELECT TipoSanguineo
    FROM Pacientes
    WHERE ID_Paciente = Doacoes.ID_Paciente
)

-- Consulta mostra onde os doares realizaram as doações 
SELECT Doadores.Nome, Hemocentros.Nome AS NomeHemocentro
FROM Doadores
JOIN Hemocentros ON Doadores.HemocentroID = Hemocentros.ID;
