# Create from ubuntu image
FROM ubuntu:latest

# Label
LABEL maintainer="saif@jitcompiler.com"

# Create user
RUN useradd -ms /bin/bash compiler

# Change default shell to bash
SHELL ["/bin/bash", "-c"]

# Update the image to the latest packages
RUN apt-get update
RUN apt-get upgrade -y

# Install required packages
RUN apt-get install software-properties-common -y
RUN apt-get install zip unzip curl wget tar -y

# Install sdkman
RUN curl -s "https://get.sdkman.io" | bash
RUN chmod a+x "$HOME/.sdkman/bin/sdkman-init.sh"

# Install nodejs
RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash -
RUN apt-get install nodejs -y

# Update packages
RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get clean -y
RUN apt-get autoclean -y
RUN apt-get autoremove -y

# Set default workdir
WORKDIR /tmp