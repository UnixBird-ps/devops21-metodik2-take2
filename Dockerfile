
FROM nginx:1.21.6

RUN rm /usr/share/nginx/html/*

COPY ./default.conf /etc/nginx/conf.d/

ENV NGINX_PORT=4000

ENV IFRAMER_PORT=4001
ENV WORLD_MAP_PORT=4002
ENV COUNTRY_INFO_PORT=4003
# 4004 is for COUNTRY_INFO's database and should not be proxied
ENV CAPITALS_PORT=4005
# 4006 is for CAPITALS's database and should not be proxied

# Specify name of the branch and port using this form: <branch>:<port>
ENV IFRAMER_BRANCH_AND_PORT=dev-iframer-ps-work-in-progress:4001
ENV WORLD_MAP_BRANCH_AND_PORT=dev-world-map-backend-ps-work-in-progress
ENV COUNTRY_INFO_BRANCH_AND_PORT=dev-country-info-backend-ps-work-in-progress
ENV CAPITALS_BRANCH_AND_PORT=dev-capitals-backend-ps-work-in-progress


CMD \
sed -i.bak "s/__NGINX_PORT__/${NGINX_PORT}/" /etc/nginx/conf.d/default.conf \
&& sed -i.bak "s/__IFRAMER_BRANCH_AND_PORT__/${IFRAMER_BRANCH_AND_PORT}/" /etc/nginx/conf.d/default.conf \
&& sed -i.bak "s/__WORLD_MAP_BRANCH_AND_PORT__/${WORLD_MAP_BRANCH_AND_PORT}/" /etc/nginx/conf.d/default.conf \
&& sed -i.bak "s/__COUNTRY_INFO_BRANCH_AND_PORT__/${COUNTRY_INFO_BRANCH_AND_PORT}/" /etc/nginx/conf.d/default.conf \
&& sed -i.bak "s/__CAPITALS_BRANCH_AND_PORT__/${CAPITALS_BRANCH_AND_PORT}/" /etc/nginx/conf.d/default.conf \
&& cat /etc/nginx/conf.d/default.conf \
&& nginx -g "daemon off;"
