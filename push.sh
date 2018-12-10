export VERSION=2.138.1
export REGISTRY=docker-registry-default.helix.everis.cloud
export CNAME=gdm_jenkins_front
export Project=gdm-sandbox-jsv

sudo docker rm -f ${CNAME}
sudo docker rmi -f ${CNAME}
sudo docker rmi -f ${REGISTRY}/${Project}/${CNAME}:${VERSION}


sudo docker build -t ${CNAME}:${VERSION} .
sudo docker tag ${CNAME}:${VERSION} ${REGISTRY}/${Project}/${CNAME}:${VERSION}

sudo docker push ${REGISTRY}/${Project}/${CNAME}:${VERSION}
sudo docker push ${REGISTRY}/${Project}/${CNAME}:latest
