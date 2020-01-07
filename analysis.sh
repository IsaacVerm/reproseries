./reproseries/exec/tidy-script.R data/tidy-temperatures.csv;
./reproseries/exec/transform-script.R data/tidy-temperatures.csv data/transform-temperatures.csv;
./reproseries/exec/visualize-script.R data/transform-temperatures.csv data/;
./reproseries/exec/model-script.R data/transform-temperatures.csv data/;