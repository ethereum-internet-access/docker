FROM raspbian-stretch
COPY install-project.sh /
RUN chmod +x /install-project.sh && /install-project.sh

CMD ["Installed!"]
