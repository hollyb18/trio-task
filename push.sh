#! /bin/bash

echo 'Please enter your nexus password:'
read password
sudo docker login -u admin -p${password} localhost:8082
sudo docker tag trio-task-pipeline_mysql:latest localhost:8082/trio-task-pipeline_mysql:latest
sudo docker tag trio-task-pipeline_flask-app:latest localhost:8082/trio-task-pipeline_flask-db:latest
sudo docker push localhost:8082/trio-task-pipeline_mysql:latest
sudo docker push localhost:8082/trio-task-pipeline_flask-app:latest
