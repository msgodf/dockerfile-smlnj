# Overview

This Dockerfile builds an image for SML/NJ (Standard ML of New Jersey), based on the Phusion base image `phusion/baseimage`. It downloads and compiles SML/NJ from source from the University of Chicago, based on the instructions given at [http://www.smlnj.org/dist/working/110.78/INSTALL](http://www.smlnj.org/dist/working/110.78/INSTALL).

# Running

SML/NJ can be run from the resulting image by calling `docker run --rm -i -t msgodf/smlnj /root/bin/sml)`.
