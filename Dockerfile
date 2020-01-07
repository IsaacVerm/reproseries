FROM rocker/tidyverse:3.6.2

COPY . /reproseries

RUN R -e "devtools::install('reproseries')"

RUN mkdir data

CMD ./reproseries/exec/tidy-script.R data/tidy-temperatures.csv