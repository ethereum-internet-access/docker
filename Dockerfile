FROM raspbian-stretch
COPY install-project.sh /
RUN sh /install-project.sh
