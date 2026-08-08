Al-NazairTravel
Al-NazairTravel is a TypeScript monorepo for a travel application (UI + backend + tools). This repository uses pnpm workspaces and contains frontend artifacts, backend scripts, and deployment configuration for Docker, Render, and Replit.
Table of contents
Project overview
Tech stack
Repository layout
Prerequisites
Getting started (local)
Common tasks & scripts
Docker
Deployment
Security / Threat model
Contributing
License
Contact
Project overview
This is a monorepo workspace for Al-NazairTravel. It includes:
frontend/admin dashboard (in artifacts/admin-dashboard)
backend code and scripts (Backend, scripts)
workspace tooling and configuration (pnpm workspace, tsconfig, Dockerfile, render.yaml, replit.md)
a documented threat model (threat_model.md)
The repo aims to provide a modern TypeScript full-stack application using pnpm workspaces for local development and several deployment targets (Docker, Render, Replit).
Tech stack
Language: TypeScript
Package manager: pnpm (workspace)
Frontend: Vite, React (admin dashboard)
Styling: Tailwind CSS (used in admin dashboard)
Database: Postgres (drizzle-orm + pg visible in scripts package)
Auth / utilities: bcryptjs, zod
Tooling: tsx, tsc, prettier, vite
Deployment tooling: Dockerfile, render.yaml, Replit config
(See package.json files in root, scripts, and artifacts/admin-dashboard for concrete dependency lists.)
Repository layout (top-level)
.gitattributes, .gitignore, .npmrc, .replit — repo config
Dockerfile — container build
render.yaml — Render deployment config
replit.md — Replit-specific instructions/notes
pnpm-workspace.yaml, pnpm-lock.yaml — pnpm workspace configuration and lockfile
tsconfig.json, tsconfig.base.json — TypeScript configuration
artifacts/ — built or packaged frontend artifacts (admin-dashboard present)
scripts/ — utility scripts (seed, hello, etc)
Backend — backend code (location present in the repo)
threat_model.md — security / threat model documentation
attached_assets, lib — supporting files and libraries
Prerequisites
Node.js (recommended v18+)
pnpm (v7+ recommended)
Docker (for container usage)
PostgreSQL (for local DB if running the backend that requires one)
Getting started (local)
Clone the repo git clone https://github.com/alkwytalraq712-creator/Al-NazairTravel.git cd Al-NazairTravel
Install dependencies (root workspace) pnpm install
This will install dependencies for workspace packages according to pnpm-workspace.yaml and package.json files.
Build (optional) pnpm run build
The root build script runs pnpm -r --if-present run build which will run build scripts in workspace packages that define them.
Run admin dashboard locally
Option A (workspace-aware): pnpm --filter @workspace/admin-dashboard dev
Option B (cd into package): cd artifacts/admin-dashboard pnpm install pnpm run dev The admin dashboard uses Vite and listens on host 0.0.0.0 (see package.json scripts).
Run scripts / backend tools cd scripts pnpm install pnpm run seed   # seeds DB (if implemented) pnpm run hello  # run the example hello script
For backend, check the Backend directory and any package.json or README inside it for specific run scripts and environment variables.
Common tasks & scripts
Root:
pnpm install — install workspace deps
pnpm run build — run build across workspace packages (pnpm -r)
artifacts/admin-dashboard:
pnpm run dev — start Vite dev server
pnpm run build — build the admin dashboard for production
pnpm run serve — preview production build
scripts:
pnpm run seed — seed the database
pnpm run hello — example script
pnpm run typecheck — run tsc for package
Adjust commands to your local workflow; some packages are named with workspace scopes (see package.json under artifacts and scripts).
Environment variables
The repo doesn’t include a root .env in source. Typical environment variables you may need when running services locally:
DATABASE_URL (Postgres connection string)
NODE_ENV (development | production)
PORT (server port)
JWT_SECRET or SESSION_SECRET (if auth is implemented)
Any provider-specific keys (e.g., cloud, SMTP) if used by the backend
Check individual package READMEs or code for exact environment variables required.
Docker
A Dockerfile is provided at the repository root. Typical usage:
Build: docker build -t al-nazairtravel:latest .
Run: docker run -p 3000:3000 --env-file .env al-nazairtravel:latest
Replace port and env-file path as required by the service. Inspect the Dockerfile to confirm exposed ports and runtime commands.
Deployment
Render: render.yaml is included for Render deployment. Use the Render dashboard or CLI to connect this repository and deploy using the configuration provided.
Replit: replit.md and .replit provide notes to run or debug on Replit. Follow replit.md for Replit-specific setup steps.
Other: You can deploy Docker image to other platforms (AWS ECS, GCP, Fly.io) by building the image with the provided Dockerfile and pushing to your container registry.
Security / Threat model
A threat_model.md file is present in the repository. Please review it before deploying to production; it documents design decisions and threat mitigations relevant to the project.
Contributing
Please follow the repository's formatting and TypeScript conventions.
Use pnpm to add or update dependencies.
Run linting / type checks and tests (if any) before opening PRs.
If you want, I can add a CONTRIBUTING.md with templates and a checklist.
License
This repository lists MIT in the root package.json. Add a LICENSE file if you want a formal license file in the repository (I can create one with MIT text if you want).
