FROM islasgeci/base:1.0.0
RUN Rscript -e "install.packages(c('rjson'), repos='http://cran.rstudio.com')"
COPY . /workdir
