# Use an official Python runtime as a parent image
FROM python:3.9-slim

# Set the working directory in the container
WORKDIR /app

# Copy the application files
COPY . .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Expose port 8080 for Cloud Run
EXPOSE 8080

# Run the application
CMD ["gunicorn", "-w", "4", "-b", "0.0.0.0:8080", "app:app"]
