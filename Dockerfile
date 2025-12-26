FROM continuumio/miniconda3:latest

ENV DEBIAN_FRONTEND=noninteractive

WORKDIR /opt/qutip

# --- System deps ---
RUN apt-get update && apt-get install -y \
    git \
    build-essential \
 && rm -rf /var/lib/apt/lists/*

# --- Conda environment ---
COPY environment.yml /tmp/environment.yml

RUN conda env create -f /tmp/environment.yml && \
    conda clean -a -y

ENV CONDA_ENV_NAME=qutip-repro
ENV PATH=/opt/conda/envs/${CONDA_ENV_NAME}/bin:$PATH
ENV CONDA_DEFAULT_ENV=${CONDA_ENV_NAME}

# --- Clone QuTiP ---
ARG QUTIP_REF=master
RUN git clone --branch ${QUTIP_REF} https://github.com/qutip/qutip.git .

# --- Ensure latest pip tooling inside env ---
RUN pip install --upgrade pip setuptools wheel

WORKDIR /work

# IMPORTANT:
# Do NOT install qutip here
# Installation mode is selected at runtime

