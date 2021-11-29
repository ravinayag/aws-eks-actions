FROM alpine/k8s:1.21.2
LABEL maintainer="Ravinayag <ravinayag@gmail.com>"


RUN kubectl version --client

COPY entrypoint.sh /apps/entrypoint.sh
RUN chmod +x /apps/entrypoint.sh
ENTRYPOINT ["/apps/entrypoint.sh"]