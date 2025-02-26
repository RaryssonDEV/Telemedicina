CREATE DATABASE TelemedicinaDB;
 USE TelemedicinaDB;

CREATE TABLE Pacientes ( 
ID INT AUTO_INCREMENT PRIMARY KEY, 
Nome VARCHAR(100) NOT NULL, 
CPF VARCHAR(14) UNIQUE NOT NULL, 
DataNascimento DATE NOT NULL, 
Endereco TEXT, Contato VARCHAR(50), 
HistoricoMedico TEXT
 );

 CREATE TABLE Profissionais ( 
 ID INT AUTO_INCREMENT PRIMARY KEY,
 Nome VARCHAR(100) NOT NULL, CPF VARCHAR(14) UNIQUE NOT NULL,
 Especialidade VARCHAR(100) NOT NULL,
 RegistroProfissional VARCHAR(20) UNIQUE NOT NULL,
 Contato VARCHAR(50)
 );

 CREATE TABLE Consultas ( 
 ID INT AUTO_INCREMENT PRIMARY KEY,
 PacienteID INT, ProfissionalID INT,
 DataHora DATETIME NOT NULL, 
 Status ENUM('Agendada', 'Concluída', 'Cancelada') NOT NULL,
 LinkVideoconferencia VARCHAR(255),
 NotasMedicas TEXT,
 FOREIGN KEY (PacienteID) REFERENCES Pacientes(ID) ON DELETE CASCADE, 
 FOREIGN KEY (ProfissionalID) REFERENCES Profissionais(ID) ON DELETE CASCADE );

 CREATE TABLE Prescricoes ( ID INT AUTO_INCREMENT PRIMARY KEY,
 ConsultaID INT, 
 Medicamento VARCHAR(255) NOT NULL, 
 Dosagem VARCHAR(100) NOT NULL, 
 InstrucoesUso TEXT NOT NULL, 
 DataPrescricao DATE NOT NULL, 
 FOREIGN KEY (ConsultaID) REFERENCES Consultas(ID) ON DELETE CASCADE
 );

 CREATE TABLE Exames ( 
 ID INT AUTO_INCREMENT PRIMARY KEY,
 PacienteID INT, TipoExame VARCHAR(255) NOT NULL,
 DataSolicitacao DATE NOT NULL, Resultado TEXT,
 FOREIGN KEY (PacienteID) REFERENCES Pacientes(ID) ON DELETE CASCADE );

CREATE TABLE Pagamentos ( 
ID INT AUTO_INCREMENT PRIMARY KEY,
 PacienteID INT,
 ConsultaID INT UNIQUE, 
 Valor DECIMAL(10,2) NOT NULL,
 MetodoPagamento ENUM('Cartão', 'Boleto', 'Pix', 'Dinheiro') NOT NULL,
 Status ENUM('Pago', 'Pendente') NOT NULL,
 FOREIGN KEY (PacienteID) REFERENCES Pacientes(ID) ON DELETE CASCADE, 
 FOREIGN KEY (ConsultaID) REFERENCES Consultas(ID) ON DELETE CASCADE
 );

 CREATE TABLE Usuarios ( 
 ID INT AUTO_INCREMENT PRIMARY KEY,
 PacienteID INT UNIQUE,
 ProfissionalID INT UNIQUE,
 Email VARCHAR(100) UNIQUE NOT NULL,
 Senha VARCHAR(255) NOT NULL, 
 TipoUsuario ENUM('Paciente', 'Médico', 'Administrador') NOT NULL,
 FOREIGN KEY (PacienteID) REFERENCES Pacientes(ID) ON DELETE SET NULL,
 FOREIGN KEY (ProfissionalID) REFERENCES Profissionais(ID) ON DELETE SET NULL );

-- Inserindo Informações na Tabela

 INSERT INTO Pacientes (Nome, CPF, DataNascimento, Endereco, Contato, HistoricoMedico) VALUES ('Carlos Silva', '123.456.789-00', '1985-06-15', 'Rua A, 123', 'carlos@email.com', 'Hipertensão'), ('Ana Souza', '987.654.321-00', '1990-03-20', 'Rua B, 456', 'ana@email.com', 'Diabetes Tipo 2');

INSERT INTO Profissionais (Nome, CPF, Especialidade, RegistroProfissional, Contato) VALUES ('Dr. João Mendes', '555.666.777-88', 'Cardiologia', 'CRM12345', 'joao@hospital.com'), ('Dra. Maria Lima', '999.888.777-66', 'Endocrinologia', 'CRM67890', 'maria@hospital.com');

INSERT INTO Consultas (PacienteID, ProfissionalID, DataHora, Status, LinkVideoconferencia, NotasMedicas) VALUES (1, 1, '2025-03-10 14:00:00', 'Agendada', 'https://meet.telemedicina.com/consulta1', 'Revisar pressão arterial'), (2, 2, '2025-03-11 15:30:00', 'Agendada', 'https://meet.telemedicina.com/consulta2', 'Controle glicêmico');

INSERT INTO Prescricoes (ConsultaID, Medicamento, Dosagem, InstrucoesUso, DataPrescricao) VALUES (1, 'Losartana', '50mg', 'Tomar 1 comprimido ao dia', '2025-03-10'), (2, 'Metformina', '850mg', 'Tomar 1 comprimido após o jantar', '2025-03-11');

INSERT INTO Exames (PacienteID, TipoExame, DataSolicitacao, Resultado) VALUES (1, 'Eletrocardiograma', '2025-03-05', 'Normal'), (2, 'Hemoglobina Glicada', '2025-03-06', '6.5%');

INSERT INTO Pagamentos (PacienteID, ConsultaID, Valor, MetodoPagamento, Status) VALUES (1, 1, 150.00, 'Cartão', 'Pago'), (2, 2, 200.00, 'Pix', 'Pago');

INSERT INTO Usuarios (PacienteID, ProfissionalID, Email, Senha, TipoUsuario) VALUES (1, NULL, 'carlos@email.com', 'senha123', 'Paciente'), (2, NULL, 'ana@email.com', 'senha456', 'Paciente'), (NULL, 1, 'joao@hospital.com', 'senha789', 'Médico'), (NULL, 2, 'maria@hospital.com', 'senha000', 'Médico');
