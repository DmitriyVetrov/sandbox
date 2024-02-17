# Use an official Python runtime as a parent image
FROM python:3.7-slim

# Set an environment variable with the directory
# where we'll be running the app
ENV APP /app

# Create the directory and instruct Docker to operate
# from there for the remainder of the Dockerfile.
RUN mkdir $APP
WORKDIR $APP

# Copy the requirements file into the app directory
COPY requirements.txt .

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the code into the app directory
COPY . .

# Set the name of the application
ENV FLASK_APP=playground.py

# Make port 5000 available to the world outside this container
EXPOSE 5000

# Run the application:
CMD [ "python", "-m" , "flask", "run", "--host=0.0.0.0"]
