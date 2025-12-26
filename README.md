# About

This repository aims to present a containerized setup for isolated builds of QuTiP in editable and wheels install. 
In the editable install, we aim to reproduce the issue with runtime compilation of strings pointed in [String compilation fails in editable install #2770](https://github.com/qutip/qutip/issues/2770).

# Base image

Defined in `Dockerfile`. Built on top of `continuumio/miniconda3:latest` base image - Debian + Conda.
Creates a virtual Conda environment with dependencies required for QuTiP installation (see `environment.yml`).
Clones QuTiP repository. 

# Available containers

In `docker-compose.yml`, the following containers are declared and defined:
1. `editable`
2. `editable-fix`
3. `wheel`
4. `wheel-fix` 
All of them use the same image but are isolated from each other during execution.

You can run each separate container as a service via:

```
docker compose up <name> --build
```

