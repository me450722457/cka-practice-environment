FROM nginx
COPY nginx/ /etc/nginx
COPY files/ /etc/nginx/html
ADD entry.bash /opt/entry.bash
RUN chmod a+x /opt/entry.bash
RUN apt update && apt install vim -y
