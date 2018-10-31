FROM bioconductor/devel_core2

RUN apt-get update && apt-get -y upgrade
RUN apt-get install build-essential
RUN apt-get install -y libpcre3-dev libbz2-dev liblzma-dev
RUN apt-get install gfortran-4.9.3

RUN mkdir /home/scripts
ADD dependencies.R /home/scripts/dependencies.R

WORKDIR /home/scripts/
RUN Rscript /home/scripts/dependencies.R

CMD R
