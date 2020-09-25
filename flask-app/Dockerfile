#Use Python Image
FROM python:3.7
# Install apt dependencies
 
# Copy contents into image
COPY . . 
# run pip dependencies
RUN pip install Flask flask_sqlalchemy 
# Expose correct port
EXPOSE 5000
# Create an entrypoint
ENTRYPOINT ["python", "app.py"]
