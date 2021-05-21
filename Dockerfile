FROM cabanaonline/humann2:1.0

LABEL base.image="cabanaonline/metaphlan2:1.0"
LABEL description="A HUMAnN2 container."
LABEL maintainer="Alejandro Madrigal Leiva"
LABEL maintainer.email="me@alemadlei.tech"

ARG USER=cabana

ENV HOME /home/$USER

USER root

RUN \
    pip install humann2

RUN \
    apt-get remove -y build-essential && \
    apt-get clean -y && \
    apt-get autoclean -y && \
    apt-get autoremove -y

USER cabana

# Entrypoint to keep the container running.
ENTRYPOINT ["tail", "-f", "/dev/null"]
