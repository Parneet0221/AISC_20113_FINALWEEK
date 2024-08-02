# Use an official Python runtime as a parent image
FROM python:3-slim

# Keeps Python from generating .pyc files in the container
ENV PYTHONDONTWRITEBYTECODE=1

# Turns off buffering for easier container logging
ENV PYTHONUNBUFFERED=1

# Set the working directory in the container
WORKDIR /app

# Install pip requirements
COPY requirements.txt .
RUN python -m pip install -r requirements.txt

# Copy the current directory contents into the container at /app
COPY . /app

# Expose port 8501 for Streamlit
EXPOSE 8501

# Run Streamlit when the container launches
CMD ["streamlit", "run", "Main.py"]
