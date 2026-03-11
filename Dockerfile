#Fusion Spark base image
FROM lucidworks/fusion-spark:5.9.14
 
# Switch to root user
USER root


 
# Install Python packages in one pip command
RUN pip3 install --upgrade pip && pip3 install --no-cache-dir tensorflow torch transformers sentence-transformers huggingface-hub beautifulsoup4

# Set up a non-root user
ARG USERNAME=sparkuser
ARG USER_UID=1000
ARG USER_GID=1000

RUN groupadd --gid $USER_GID $USERNAME \
    && useradd --uid $USER_UID --gid $USER_GID -m -s /bin/bash $USERNAME

# Create and set ownership for the application working directory
RUN mkdir -p /home/$USERNAME/app && chown -R $USERNAME:$USERNAME /home/$USERNAME/app

# Switch to the non-root user
USER $USERNAME

# Set the working directory
WORKDIR /home/$USERNAME/app
 


#USER 1099



