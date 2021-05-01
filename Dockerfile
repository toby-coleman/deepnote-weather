FROM deepnote/python:3.7

RUN apt update && apt install -y --no-install-recommends gfortran gcc && \
    rm -rf /var/lib/apt/lists/*
RUN wget ftp://ftp.cpc.ncep.noaa.gov/wd51we/wgrib2/wgrib2.tgz.v3.0.2 -O /tmp/wgrib2.tgz

# Build and install wgrib2
RUN mkdir -p /usr/local/grib2/ && \
    cd /tmp/ && \
    tar -xf /tmp/wgrib2.tgz && \
    rm -r /tmp/wgrib2.tgz && \
    cd /tmp/grib2 && \
    CC=gcc FC=gfortran make && \
    mv wgrib2/wgrib2 /usr/local/bin/wgrib2 && \
    cd / && rm -r /tmp/grib2

# Install extra python libraryes
RUN pip install netCDF4 xarray