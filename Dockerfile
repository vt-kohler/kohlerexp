#Fusion Spark base image
FROM lucidworks/fusion-spark:5.9.14
 
# Switch to root user
USER root
 
# Install Python packages in one pip command
RUN pip3 install --upgrade pip && pip3 install --no-cache-dir tensorflow torch transformers sentence-transformers huggingface-hub beautifulsoup4
 
# Switch back to the default non-root user

USER 1099


