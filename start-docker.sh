docker run -ti -p8000:80 -vmysqldata:/var/lib/mysql --device /dev/mem:/dev/mem --device /lib/modules:/lib/modules --cap-add=ALL --privileged oasis-spa bash