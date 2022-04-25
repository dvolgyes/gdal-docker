##
# dvolgyes/gdal:ubuntu-full

# This file is available at the option of the licensee under:
# Public domain

FROM osgeo/gdal

RUN export LANG=en_US.UTF-8

# Derived from osgeo/gdal, the downstraim maintained by me
LABEL maintainer="David Volgyes <david.volgyes@ieee.org>"

RUN apt-get update && apt-get install gnupg2 --yes && apt-get clean
RUN wget -qO - "https://keyserver.ubuntu.com/pks/lookup?op=get&search=0xf23c5a6cf475977595c89f51ba6932366a755776"  |  apt-key add -

RUN echo "deb https://ppa.launchpadcontent.net/deadsnakes/ppa/ubuntu focal main" >>/etc/apt/sources.list.d/deadsnakes.list
RUN echo "deb-src https://ppa.launchpadcontent.net/deadsnakes/ppa/ubuntu focal main" >>/etc/apt/sources.list.d/deadsnakes.list

RUN apt-get update && apt-get install --yes python3.9-full python3.10-full gnupg2 && apt-get clean
