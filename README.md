# � Motel Booking API & Frontend

� **Sistema de gerenciamento de reservas de motéis**, incluindo **autenticação JWT**, **listagem de reservas filtradas por data**, **cálculo de faturamento mensal** e **cache para otimização**.

---

## � Índice

- [� Tecnologias](#-tecnologias)
- [� Funcionalidades](#-funcionalidades)
- [� Estrutura do Projeto](#-estrutura-do-projeto)
- [� Como Executar](#-como-executar)
  - [� Configuração do Banco de Dados](#-configuração-do-banco-de-dados)
  - [� Executando o Backend](#-executando-o-backend)
  - [� Executando o Frontend](#-executando-o-frontend)
- [� Planos de Teste](#-planos-de-teste)
- [� Segurança e Performance](#-segurança-e-performance)
- [� Licença](#-licença)

---

## � Tecnologias

Este projeto utiliza as seguintes tecnologias:

- **Backend**: .NET 8, Entity Framework Core, JWT, MemoryCache, Swagger  
- **Frontend**: React, TypeScript, Axios, React Router  
- **Banco de Dados**: SQL Server (ou PostgreSQL)  
- **Cache**: MemoryCache (Redis recomendado para produção)  
- **Autenticação**: JSON Web Token (JWT)  

---

## � Funcionalidades

✅ **Cadastro e login de usuários** (com autenticação JWT)  
✅ **Listagem de reservas filtradas por data**  
✅ **Cálculo do faturamento mensal**  
✅ **Cache para otimizar a listagem de reservas**  
✅ **Proteção contra SQL Injection e otimização de queries**  
✅ **Documentação interativa com Swagger**  

---

## � Estrutura do Projeto

```plaintext
backend/
│── MotelBooking.Api/
│   ├── Controllers/         # Endpoints da API
│   │   ├── UsuarioController.cs
│   │   ├── ReservaController.cs
│   │   ├── ClienteController.cs
│   │   ├── TipoSuiteController.cs
│   │   ├── MotelController.cs
│   ├── Models/              # Modelos do banco de dados
│   │   ├── Usuario.cs
│   │   ├── Reserva.cs
│   │   ├── Cliente.cs
│   │   ├── TipoSuite.cs
│  
