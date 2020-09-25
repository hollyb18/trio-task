# Derived from official mysql image (our base image)
FROM mysql:latest
# Add a database
ENV SQLALCHEMY_DATABASE_URI=flask_db
# Add the content of the .sql file to your image
COPY CreateTable.sql docker-entrypoint-initdb.d/
# All scripts in docker-entrypoint-initdb.d/ are automatically
# executed during container startup
