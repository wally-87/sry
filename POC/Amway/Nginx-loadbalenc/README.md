## Amway 自动刷新Nginx配置文件说明 

#### 第一步：构建镜像

###### docker build -t nginx:amway .

#### 第二部：运行镜像

	docker run -run --name ng -e IP="192.168.45.166:8081 192.168.45.166:8084 192.168.45.166:8083" -p 8080:80 -d nginx:amway


####说明：nginx的upstream负载项以docker run  -e 的方式传参。参数名：LBIP

 
####例：192.168.45.160:8081  、 192.168.45.161:8082 为两台负载服务器。
	docker run --name ng -e LBIP="192.168.45.160:8081 192.168.45.161:8082" -p 8080:80 -d nginx:amway
	
注：多个负载IP之间用“空格“分开。

启动后即可访问 http://hostIP:8080