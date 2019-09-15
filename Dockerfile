FROM alpine:latest
COPY install-project.sh /
RUN sh /install-project.sh
