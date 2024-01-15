FROM python:3.12

ENV PYTHONUNBUFFERED=1

ARG WORKDIR=/wd
ARG USER=user

WORKDIR ${WORKDIR}

RUN useradd --system ${USER} && \
    chown --recursive ${USER} ${WORKDIR}

RUN apt update && apt upgrade --yes

COPY --chown=${USER} requirements requirements

RUN pip install --upgrade pip && \
    pip install --requirement requirements/base.txt

COPY --chown=${USER} main.py main.py

USER ${USER}

ENTRYPOINT ["python", "main.py"]
