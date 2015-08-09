FROM phusion/baseimage

WORKDIR /root

RUN apt-get clean && apt-get update

# Install wget and build tools
RUN apt-get install -y wget build-essential

# Install `multilib` for 32-bit support that SML/NJ requires.
RUN apt-get install -y gcc-multilib g++-multilib

# Get the source
RUN wget http://smlnj.cs.uchicago.edu/dist/working/110.78/config.tgz

# Extract the source
RUN gunzip <config.tgz | tar xf -

# Compile
RUN config/install.sh

# Set the default entrypoint to sml itself
ENTRYPOINT /root/bin/sml
