# to build this image run the following command
# $ docker build -t sumo - < Dockerfile
# to use it run (GUI applications need more work)
# $ docker run -it sumo
# This Dockerfile installs sumo, python in the ubuntu.

FROM ubuntu:22.04

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y software-properties-common && \
    add-apt-repository -y ppa:sumo/stable
RUN apt-get update
RUN apt-get install -y sumo sumo-tools sumo-doc
RUN apt-get install -y python3 python3-pip
RUN apt-get install -y python3-venv

ENV SUMO_HOME=/usr/share/sumo
ENV PYTHONPATH=${SUMO_HOME}/tools

CMD ["/bin/bash"]