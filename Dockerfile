# Use an official Anaconda runtime as a parent image
FROM continuumio/anaconda3:latest

# Set the working directory in the container
WORKDIR /app

# Add metadata to the image to describe that the container is maintained by you
LABEL maintainer="your-email@example.com"

# Install git
RUN apt-get update && \
    apt-get install -y git

# Clone the ChatDev repository
RUN git clone https://github.com/OpenBMB/ChatDev.git

# Create a new conda environment with Python 3.9
RUN conda create -n ChatDev_conda_env python=3.9 -y

# Activate the conda environment and install requirements
RUN echo "source activate ChatDev_conda_env" > ~/.bashrc
ENV PATH /opt/conda/envs/ChatDev_conda_env/bin:$PATH
RUN /bin/bash -c "source activate ChatDev_conda_env && \
    cd ChatDev && \
    pip install -r requirements.txt"

# Set the OPENAI_API_KEY environment variable
ARG OPENAI_API_KEY
ENV OPENAI_API_KEY=${OPENAI_API_KEY}

# Make port 8888 available to the world outside this container
EXPOSE 8888

# Run jupyter-notebook when the container launches
CMD ["jupyter-notebook", "--ip='*'", "--port=8888", "--no-browser", "--allow-root"]
