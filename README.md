# Telemedicina
Documentação Banco de Dados Telemedicina 
 📌 Banco de Dados para Telemedicina

Este repositório contém a modelagem de um banco de dados para um sistema de telemedicina. O objetivo é fornecer uma estrutura eficiente para armazenar informações de pacientes, profissionais de saúde, consultas, prescrições, exames e pagamentos.

 📊 Modelagem do Banco de Dados

O banco de dados foi projetado seguindo boas práticas de normalização, garantindo integridade e eficiência.

 📌 Entidades Principais

1. Pacientes
   - ID (chave primária)
   - Nome
   - CPF
   - Data de nascimento
   - Endereço
   - Contato (telefone, e-mail)
   - Histórico médico

2. Profissionais de Saúde
   - ID (chave primária)
   - Nome
   - CPF
   - Especialidade
   - Registro profissional (CRM, CRO, etc.)
   - Contato

3. Consultas
   - ID (chave primária)
   - ID do paciente (chave estrangeira)
   - ID do profissional de saúde (chave estrangeira)
   - Data e hora
   - Status (agendada, concluída, cancelada)
   - Link da videoconferência (se for online)
   - Notas médicas

4. Prescrições Médicas
   - ID (chave primária)
   - ID da consulta (chave estrangeira)
   - Medicamento
   - Dosagem
   - Instruções de uso
   - Data da prescrição

5. Exames
   - ID (chave primária)
   - ID do paciente (chave estrangeira)
   - Tipo de exame
   - Data da solicitação
   - Resultado (arquivo ou texto)

6. Pagamentos
   - ID (chave primária)
   - ID do paciente (chave estrangeira)
   - ID da consulta (chave estrangeira)
   - Valor
   - Método de pagamento
   - Status (pago, pendente)

7. Usuários (Login e Acesso)
   - ID (chave primária)
   - ID do paciente ou profissional (chave estrangeira)
   - E-mail
   - Senha (hash)
   - Tipo de usuário (paciente, médico, administrador)

🔗 Relacionamentos

- **Um paciente pode ter várias consultas** (1:N)
- **Um médico pode atender vários pacientes** (1:N)
- **Uma consulta pode gerar prescrições e exames** (1:N)
- **Cada usuário pode estar vinculado a um paciente ou médico** (1:1)
- **Cada consulta pode ter um pagamento associado** (1:1)

🖼️ Diagrama do Banco de Dados

 📌 Tecnologias Utilizadas
- **Banco de Dados:** MySQL
- **Modelagem:** MySQL Workbench
- **Linguagem SQL**

 📄 Licença
Este projeto está sob a licença MIT. Sinta-se à vontade para utilizá-lo e contribuir com melhorias!

