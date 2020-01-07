FROM rocker/tidyverse:3.6.2

COPY . /reproseries

RUN R -e "devtools::install('reproseries')"

RUN mkdir data \
    && chmod +x reproseries/analysis.sh

CMD ./reproseries/analysis.sh