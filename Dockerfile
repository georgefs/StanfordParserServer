FROM java:8

ADD . /work
WORKDIR /work

RUN ./install.sh

EXPOSE 9997
CMD ./run.sh
