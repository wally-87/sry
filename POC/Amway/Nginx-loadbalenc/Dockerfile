FROM nginx:latest
RUN rm -rf /etc/nginx/conf.d/default.conf
ADD reload-upstream.sh /etc/nginx/conf.d
ADD default.conf /etc/nginx/conf.d
ADD default.conf-template /etc/nginx/conf.d
CMD bash /etc/nginx/conf.d/reload-upstream.sh && tail -f  /var/log/nginx/error.log
