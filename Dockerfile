FROM python:3.8

# Set the working directory inside the container
WORKDIR /appp



# Clone your source code from Git
RUN git clone https://github.com/harishberam/python1.git

# Set the working directory to your project directory
WORKDIR /appp/python1

# Run your script (replace with the actual command)
CMD ["python", "even.py"]