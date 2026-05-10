# Flask Docker Tutorial

This project contains a small Flask application that runs inside a Docker container.

## Endpoints

- `GET /` returns `Hello World!`
- `GET /envs` returns the environment variables available inside the container as JSON

The `/envs` endpoint is useful for checking which environment variables were passed to the container. Do not expose this endpoint in production with sensitive environment variables, because it returns them to the client.

## Build The Docker Image

From the project directory, build the image:

```bash
docker build -t tutorial-app .
```

## Run The Docker Image

Run the container and publish port `8000`:

```bash
docker run --rm -p 8000:8000 tutorial-app
```

Open the application:

```bash
curl http://localhost:8000/
```

Check the environment variables returned by the app:

```bash
curl http://localhost:8000/envs
```

## Add Environment Variables

You can pass environment variables to the container with `-e`:

```bash
docker run --rm -p 8000:8000 -e VAR=TEST -e APP_ENV=local tutorial-app
```

Then call:

```bash
curl http://localhost:8000/envs
```

The response includes the variables passed to the container.

## Run With Docker Compose

The project includes a `docker-compose.yml` file. Start the app with:

```bash
docker compose up --build
```

The service is available at:

```text
http://localhost:8000
```

Stop the service with:

```bash
docker compose down
```

## Add Environment Variables With Docker Compose

Environment variables can be added in `docker-compose.yml` under the `environment` section:

```yaml
services:
  web:
    build: .
    ports:
      - "8000:8000"
    environment:
      - VAR=TEST
      - APP_ENV=local
```

After updating the file, rebuild and start the service:

```bash
docker compose up --build
```

Call `/envs` to confirm the variables are available:

```bash
curl http://localhost:8000/envs
```

Note: to run a multi-plafrom architecture use:

```bash
docker buildx build --platform linux/amd64,linux/arm64 -t username/appname:latest --push .
```

