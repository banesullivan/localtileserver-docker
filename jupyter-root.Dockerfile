FROM python:3.9-slim
LABEL maintainer="Bane Sullivan"
LABEL repo="https://github.com/banesullivan/localtileserver"

WORKDIR /build-context

ENV PIP_FIND_LINKS=https://girder.github.io/large_image_wheels
ENV JUPYTER_ENABLE_LAB=yes

RUN python -m pip install --upgrade pip
COPY requirements.txt /build-context/
RUN pip install -r requirements.txt

ARG LOCALTILESERVER_CLIENT_PREFIX='proxy/{port}'
ENV LOCALTILESERVER_CLIENT_PREFIX=$LOCALTILESERVER_CLIENT_PREFIX

WORKDIR /home

EXPOSE 8888
ENTRYPOINT ["jupyter", "lab", "--ip='0.0.0.0'", "--port=8888", "--no-browser", "--allow-root", "/home"]
