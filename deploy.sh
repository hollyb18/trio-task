HOW I COMPLETED THE TASK:

My first step was to build the Dockefile for the flask app, having cloned the repo. I used the same format that we have practised over the last couple of days: 
FROM python:3.7
COPY . .
RUN pip install Flask (there was no .txt file listing requirements in any directory, therefore I stuck with the basics)
EXPOSE 5000
ENTRYPOINT ["python", "app.py"]

I then built my image for the flask app. At this point, I wanted to build the image for mysql BEFORE I started running any containers, as this made most logical sense to me to build all foundations and then run from there. This is so I could ensure that I hadn't missed out on any key links or foundation steps in the image building; running the containers first would mean that there would be more dismantling if Ihad to fix anything. I built my mysql Dockerfile as follows:
FROM mysql:5.7 (most stable)
ENV SQLALCHEMY_DATABASE_URI=flask-db (assigns names to database env var)
COPY CreateTable.sql docker-entrypoint-initdb.d/ (the sql databse file + standard entrypoint for sql databases) 

Again, rather than running the containers at this point, I needed to ensure that the password entry would be secret. Therefore, i exported a variable for the password and referred to this when running the mysql container in an environment variable.
sudo docker run -d -p 3306:3306 --name mysql --network task-network --env MYSQL_ROOT_PASSWORD=${Password} mysql.image

I also ran the flask-app container as follows:
sudo docker run -d -p 5000:5000 --network task-network--name flask-cont flask-app

With both of these running (which i checked with sudo docer ps), I entered the mysql container interactive shell with sudo docker exec -it mysql bash. Here, I checked that my databse was in the correct place with ls entrypoint... to show the CreateTable.sql file. I then entered mysql as the root user with mysql -uroot -p. This allowed me to input the myswl password stored in the variable. To check everything was working, I entered the MYSQL command SHOW DATABASES; and the entries were listed successfully.
