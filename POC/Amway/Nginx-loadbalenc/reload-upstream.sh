#!/bin/bash
#####################################################
#####################################################


function create_upstream_conf() {
        ip_list=`echo $LBIP`
        echo -e "upstream web_app {" >>/etc/nginx/conf.d/upstream.conf
        for ip in ${ip_list[*]};do
            echo -e "\tserver ${ip};" >>/etc/nginx/conf.d/upstream.conf
        done
        echo  "}" >>/etc/nginx/conf.d/upstream.conf
}

create_upstream_conf;

rm -rf /etc/nginx/conf.d/default.conf
cp /etc/nginx/conf.d/default.conf-template /etc/nginx/conf.d/default.conf
cat /etc/nginx/conf.d/upstream.conf >> /etc/nginx/conf.d/default.conf
rm -rf /etc/nginx/conf.d/upstream.conf

nginx -g 'daemon off;'
