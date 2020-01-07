FROM rocker/tidyverse:3.6.2

COPY reproseries.tar.gz /

COPY /exec/tidy-script.R /

RUN R -e "install.packages('timetk')"

RUN R CMD INSTALL reproseries.tar.gz

RUN mkdir data

CMD ./tidy-script.R data/tidy-temperatures.csv