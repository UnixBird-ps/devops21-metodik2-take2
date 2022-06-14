
# Main webpage. Static HTML with iframes.

FROM nginx:1.22.0-alpine

COPY ./frontend/ /usr/share/nginx/html/
COPY ./nginx-default.conf /etc/nginx/conf.d/default.conf

CMD rm -r /usr/share/nginx/html \
&& ln -s $(pwd) /usr/share/nginx/html \
&& sed -i.bak "s/^[[:space:]]*listen 80 default_server/listen $PORT default_server/" /etc/nginx/conf.d/default.conf \
&& nginx -g "daemon off;"
