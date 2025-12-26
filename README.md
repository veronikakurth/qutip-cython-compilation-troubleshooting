# How to create Docker image and run the container with issue reproduction

```bash
docker build -t qutip-editable .
docker compose build
docker compose up
```

`Dockerfile` and `docker-compose.yml` describe the baseline failure.

# Services

In `docker-compose.yml`, you can run the following containers as services:
1. editable
2. editable-fix
3. wheel
4. wheel-fix
