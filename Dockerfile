# Create from ubuntu image
FROM ubuntu:22.04

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
RUN curl -fsSL https://deb.nodesource.com/setup_16.x | bash -
RUN apt-get install nodejs -y
# Install bhailang
RUN npm install -g npm@latest
RUN npm i -g bhailang
# Install python
RUN apt-get install python python3-pip -y
RUN pip install numpy
# Install C
RUN apt-get install gcc -y
# Install C++
RUN apt-get install g++ -y
# Install objective-c
RUN apt-get install gobjc gnustep gnustep-devel -y
# Install perl
RUN apt-get install perl -y
# Install ruby
RUN apt-get install ruby-full -y

# Update packages
RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get clean -y
RUN apt-get autoclean -y
RUN apt-get autoremove -y

# Set default workdir
WORKDIR /tmp