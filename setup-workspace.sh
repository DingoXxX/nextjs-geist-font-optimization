#!/bin/bash

# Colors for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}Setting up your development workspace...${NC}"

# Create project directory structure
echo -e "${GREEN}Creating directory structure...${NC}"
mkdir -p src/{app,components,lib,pages,middleware,types,hooks}
mkdir -p src/components/ui
mkdir -p src/pages/api
mkdir -p prisma/migrations
mkdir -p public
mkdir -p config/credentials

# Initialize git repository
echo -e "${GREEN}Initializing git repository...${NC}"
git init

# Create initial configuration files
echo -e "${GREEN}Creating configuration files...${NC}"

# Create .gitignore
cat > .gitignore << EOL
# dependencies
/node_modules
/.pnp
.pnp.js

# testing
/coverage

# next.js
/.next/
/out/

# production
/build

# misc
.DS_Store
*.pem
.env
.env.local
.env.development.local
.env.test.local
.env.production.local

# debug
npm-debug.log*
yarn-debug.log*
yarn-error.log*

# local env files
.env*.local

# typescript
*.tsbuildinfo
next-env.d.ts
EOL

# Create .env.example
cat > .env.example << EOL
# Database
DATABASE_URL="postgresql://postgres:postgres@localhost:5432/neofinn_db"

# Authentication
JWT_SECRET="your-jwt-secret"

# Google Cloud Storage
GOOGLE_CLOUD_PROJECT="your-project-id"
GOOGLE_CLOUD_STORAGE_BUCKET="your-bucket-name"

# Email
SMTP_HOST="smtp.example.com"
SMTP_PORT="587"
SMTP_USER="your-smtp-user"
SMTP_PASSWORD="your-smtp-password"
EOL

# Create package.json if it doesn't exist
if [ ! -f package.json ]; then
  echo -e "${GREEN}Creating package.json...${NC}"
  cat > package.json << EOL
{
  "name": "neofinn",
  "version": "0.1.0",
  "private": true,
  "scripts": {
    "dev": "next dev",
    "build": "next build",
    "start": "next start",
    "lint": "next lint",
    "prisma:generate": "prisma generate",
    "prisma:migrate": "prisma migrate dev"
  },
  "dependencies": {
    "@prisma/client": "^5.0.0",
    "next": "^14.0.0",
    "react": "^18.2.0",
    "react-dom": "^18.2.0",
    "tailwindcss": "^3.3.0",
    "@google-cloud/storage": "^7.0.0",
    "jsonwebtoken": "^9.0.0",
    "bcryptjs": "^2.4.3"
  },
  "devDependencies": {
    "@types/node": "^20.0.0",
    "@types/react": "^18.2.0",
    "@types/react-dom": "^18.2.0",
    "typescript": "^5.0.0",
    "prisma": "^5.0.0",
    "autoprefixer": "^10.4.0",
    "postcss": "^8.4.0",
    "eslint": "^8.0.0",
    "eslint-config-next": "^14.0.0"
  }
}
EOL
fi

# Create tsconfig.json if it doesn't exist
if [ ! -f tsconfig.json ]; then
  echo -e "${GREEN}Creating tsconfig.json...${NC}"
  cat > tsconfig.json << EOL
{
  "compilerOptions": {
    "target": "es5",
    "lib": ["dom", "dom.iterable", "esnext"],
    "allowJs": true,
    "skipLibCheck": true,
    "strict": true,
    "forceConsistentCasingInFileNames": true,
    "noEmit": true,
    "esModuleInterop": true,
    "module": "esnext",
    "moduleResolution": "node",
    "resolveJsonModule": true,
    "isolatedModules": true,
    "jsx": "preserve",
    "incremental": true,
    "baseUrl": ".",
    "paths": {
      "@/*": ["src/*"]
    }
  },
  "include": ["next-env.d.ts", "**/*.ts", "**/*.tsx"],
  "exclude": ["node_modules"]
}
EOL
fi

# Create README.md
echo -e "${GREEN}Creating README.md...${NC}"
cat > README.md << EOL
# NeoFinn Project

## Getting Started

1. Clone the repository
2. Install dependencies:
   \`\`\`bash
   npm install
   \`\`\`
3. Copy .env.example to .env and update the values
4. Initialize the database:
   \`\`\`bash
   npm run prisma:migrate
   \`\`\`
5. Start the development server:
   \`\`\`bash
   npm run dev
   \`\`\`

## Project Structure

- \`/src\` - Application source code
  - \`/app\` - Next.js app router pages and layouts
  - \`/components\` - React components
  - \`/lib\` - Utility functions and shared code
  - \`/pages\` - API routes and pages
  - \`/middleware\` - Request middleware
  - \`/types\` - TypeScript type definitions
  - \`/hooks\` - React hooks
- \`/prisma\` - Database schema and migrations
- \`/public\` - Static files
- \`/config\` - Configuration files

## Available Scripts

- \`npm run dev\` - Start development server
- \`npm run build\` - Build for production
- \`npm start\` - Start production server
- \`npm run lint\` - Run ESLint
- \`npm run prisma:generate\` - Generate Prisma client
- \`npm run prisma:migrate\` - Run database migrations
EOL

echo -e "${GREEN}Workspace setup complete!${NC}"
echo -e "${BLUE}Next steps:${NC}"
echo "1. Copy .env.example to .env and update the values"
echo "2. Run 'npm install' to install dependencies"
echo "3. Run 'npm run prisma:migrate' to initialize the database"
echo "4. Run 'npm run dev' to start the development server"
