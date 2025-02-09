#!/bin/bash

# Definir os diretórios do projeto
DIRS=(
  "backend/MotelBooking.Api/Controllers"
  "backend/MotelBooking.Api/Models"
  "backend/MotelBooking.Api/Data"
  "backend/MotelBooking.Api/Services"
  "backend/MotelBooking.Api/Repositories"
  "backend/MotelBooking.Api/Middleware"
  "backend/MotelBooking.Tests"
  "frontend/src/components"
  "frontend/src/pages"
  "frontend/src/services"
  "frontend/src/hooks"
)

# Definir os arquivos do projeto
FILES=(
  "backend/MotelBooking.Api/Controllers/UsuarioController.cs"
  "backend/MotelBooking.Api/Controllers/ReservaController.cs"
  "backend/MotelBooking.Api/Models/Usuario.cs"
  "backend/MotelBooking.Api/Models/Reserva.cs"
  "backend/MotelBooking.Api/Data/MotelDbContext.cs"
  "backend/MotelBooking.Api/Services/TokenService.cs"
  "backend/MotelBooking.Api/Repositories/ReservaRepository.cs"
  "backend/MotelBooking.Api/Middleware/JwtMiddleware.cs"
  "backend/MotelBooking.Api/Program.cs"
  "backend/MotelBooking.Api/appsettings.json"
  "backend/MotelBooking.Api/README.md"
  "backend/MotelBooking.Tests/ReservaTests.cs"
  "frontend/src/components/Header.tsx"
  "frontend/src/components/Footer.tsx"
  "frontend/src/pages/Login.tsx"
  "frontend/src/pages/Reservas.tsx"
  "frontend/src/services/api.ts"
  "frontend/src/hooks/useAuth.ts"
  "frontend/src/App.tsx"
  "frontend/src/main.tsx"
  "frontend/package.json"
  "frontend/vite.config.ts"
  "frontend/README.md"
  "docker-compose.yml"
  "README.md"
  "setup_project.sh"
)

# Criar diretórios
echo "� Criando diretórios..."
for dir in "${DIRS[@]}"; do
  mkdir -p "$dir"
  echo "� Criado: $dir"
done

# Criar arquivos
echo "� Criando arquivos..."
for file in "${FILES[@]}"; do
  touch "$file"
  echo "� Criado: $file"
done

# Tornar o script executável
chmod +x setup_project.sh

echo "✅ Estrutura do projeto criada com sucesso!"
