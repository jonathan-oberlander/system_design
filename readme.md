# log

<https://www.youtube.com/watch?v=ZYAPH56ANC8&list=PL7g1jYj15RUP0SWYiLhllVEDFhp9Rd4jI>

installed

mysql, python3, docker, kubernetes, minikube, k9s

mkdir system_design

## auth service

auth forlder

add a .venv python

```bash
python3 -m venv .venv
source .venv/bin/activate # select it in vscode
```

dependencies

```bash
pip install pylint
pip install --upgrade pip
pip install pyjwt
pip install flask
pip install flask_mysqldb # had to brew install pkgconfig
```

```bash
mysql -uroot

    mysql> show databases;

# mysql -uroot -e "DROP DATABASE auth"
# mysql -uroot -e "DROP USER auth_user@localhost"

mysql -uroot < init.sql

    mysql> show databases;
    mysql> use auth;
    mysql> show tables;
    mysql> describe user;
    mysql> select * from user;

```

created server.py
created docker file

```bash
# python/src/auth
pip3 freeze > requirements.txt
docker build .
```

created docker account
new repository called <>auth

we need to tag the image to publish it
using the `sha` from docker build

```bash
docker tag aa9fc91349fd7ad327865467bc3c7a058526aa9f71d49b1fc20bab9caec3e30b jonathanoberlander/auth:latest
docker images
docker push jonathanoberlander/auth:latest
```

created all manifests
files for kubernetes

```bash
minikube start
# /system_design/python/src/auth/manifests
kubectl apply -f .
k9s # you can see everything

# stop namespace
kubectl get deployments --all-namespaces
# kubectl delete -n NAMESPACE deployment DEPLOYMENT
kubectl delete deployment auth
```

<https://stackoverflow.com/questions/40686151/kubernetes-pod-gets-recreated-when-deleted>

<https://kubernetes.io/docs/tutorials/hello-minikube/#create-a-docker-container-image>

<https://stackoverflow.com/questions/38979231/imagepullbackoff-local-repository-with-minikube>

`s` will enter the shell of the pod
`env` will show you your env
`env | grep MYSQL`

## gateway service

mkdir system_design

add a venv python

```bash
python3 -m venv .venv
source .venv/bin/activate # select it in vscode
env | grep VIRTUAL_ENV
```

select interpreter in vscode

install flask flask-pymongo pyMongo pika

```bash
mkdir auth_svc
touch __init__.py # to mark directory as a package
touch access.py
pip install requests
```
