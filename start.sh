export VERSION=1
export CNAME=gdm_jenkins_front

sudo docker rmi -f ${CNAME}

sudo docker build -t gdm_jenkins_base -f dockerfile.base .
sudo docker build -t ${CNAME} .

sudo docker rm -f ${CNAME}

sudo docker run --rm \
    --name ${CNAME} \
    -d -p 8080:8080 --net pub_net \
    ${CNAME}

sudo docker logs -f ${CNAME}
