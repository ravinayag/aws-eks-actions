FROM alpine/k8s:1.21.2
LABEL maintainer="Ravinayag <ravinayag@gmail.com>"


RUN kubectl version --client

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]