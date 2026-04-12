# Jenkins Multibranch Demo

A demo Node.js application with CI/CD pipelines (Jenkins and GitHub Actions) and Docker support.

## Project Structure

```
.
├── index.js              # Main Node.js application
├── app.py                # Python demo script
├── package.json          # Node.js dependencies and scripts
├── Dockerfile            # Production Docker image (Node.js)
├── Jenkinsfile           # Jenkins multibranch pipeline
├── .github/workflows/    # GitHub Actions CI/CD
│   └── ci-cd.yml
└── ...
```

## Quick Start

### Run Locally

```bash
npm install
npm start
```

### Build and Run with Docker

```bash
# Build the image
docker build -t jenkins-multibranch-demo .

# Run the container
docker run --rm jenkins-multibranch-demo
```

## CI/CD Pipelines

### Jenkins (Multibranch Pipeline)

The `Jenkinsfile` defines the following stages:

1. **Checkout** - Pulls the source code
2. **Install Dependencies** - Runs `npm install`
3. **Test** - Runs `npm test`
4. **Build Docker Image** - Builds the Docker image
5. **Push Docker Image** (master only) - Pushes to a Docker registry
6. **Deploy** (master only) - Deploys the application

To use with Jenkins:
1. Create a **Multibranch Pipeline** job in Jenkins
2. Point it to this repository
3. Configure Docker Hub credentials (ID: `docker-hub-credentials`) to enable image push

### GitHub Actions

The `.github/workflows/ci-cd.yml` workflow runs on pushes and PRs to `master`:

1. **build-and-test** - Installs dependencies and runs tests
2. **docker-build** - Builds and verifies the Docker image

To enable Docker Hub push, add these repository secrets:
- `DOCKER_USERNAME`
- `DOCKER_PASSWORD`

## Docker

The `Dockerfile` uses `node:18-alpine` as the base image for a lightweight production build. It copies `package.json` first for optimal layer caching, then installs production dependencies and copies the application code.
