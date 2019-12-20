# reproseries

<!-- badges: start -->
  [![Travis build status](https://travis-ci.org/IsaacVerm/reproseries.svg?branch=master)](https://travis-ci.org/IsaacVerm/reproseries)
  <!-- badges: end -->

This repository contains code used as example for the reproducible analysis series on my blog:

- [outline](https://isaacverm.github.io/posts/reproducible-analysis-outline/)
- [example](https://isaacverm.github.io/posts/reproducible-analysis-example/)
- [package development](https://isaacverm.github.io/posts/reproducible-analysis-package-dev/)
- [testing](https://isaacverm.github.io/posts/reproducible-analysis-testing/)
- [documentation](https://isaacverm.github.io/posts/reproducible-analysis-documentation/)
- [literate programming](https://isaacverm.github.io/posts/reproducible-analysis-literate-programming/)

## devtools

The [devtools](https://github.com/rstudio/cheatsheets/raw/master/package-development.pdf) package offers some functionality to ease working with R packages. Prerequisites for running the below commands are:

- to have a R session open
- to have devtools loaded

Opening a session:

- make sure your at the root
- type R in the command line

The console will be displayed.

To load devtools:

```
library(devtools)
```

### Installation

In case you want to use code from your package in some other place, you have to install it:

```
devtools::install()
```

### Tests

To run a general check of the code:

```
devtools::check()
```

The exact checks run are described [here](http://r-pkgs.had.co.nz/check.html). It's important to remark the best case scenario of running the checks will almost always result in at least a warning and a note.

- warning saying not all functions have been documented
- note saying there's no visible binding for a global variable

Documenting functions is good, but documenting everything is excessive so you can safely ignore this warning. The note about the binding is because we use [non-standard evaluation](http://adv-r.had.co.nz/Computing-on-the-language.html). There are [workarounds](https://www.r-bloggers.com/no-visible-binding-for-global-variable/) for this note but honestly the remedy is worse than the disease. We use non-standard evaluation exactly to avoid typing while using functions interactively but the remedy completely undoes this so you end up with the worst of two worlds.

To run the tests written with `testthat`:

```
devtools::test()
```

### Documentation

To get [all the functions](https://stackoverflow.com/questions/30392542/is-there-a-command-in-r-to-view-all-the-functions-present-in-a-package) (make sure the package is installed!) defined in this package:

```
lsf.str("package:reproseries")
```

To get documentation for a function (note not all functions have been documented yet):

```
?plotAvgTemperaturesByYear
```

To open the vignettes:

```
browseVignettes("reproseries")
```

The above only works if you installed the package with `build_vignettes` set to TRUE. `devtools::install()` [does not build vignettes](https://stackoverflow.com/questions/33614660/knitr-rmd-vignettes-do-not-appear-with-vignette) by default (probably because it can take quite some time to run, especially if you use the package structure to run analysis). To build with vignettes:

```
devtools::install(build_vignettes = TRUE)
```

### Interactive use

It's also possible to play around with the functions provided by the `reproseries` packages. Run `devtools::load_all()` which [simulates](https://www.r-project.org/nosvn/pandoc/devtools.html) loading the package (simulating is enough for interactive use). Now all the functions are loaded and you can use them however you want.

It's often interesting to interactively pipe functions together like this (this is a functioning example, executing the first data tidying phase):

```
nottem %>%
  temperatureSeriesToDf %>%
  tidyTemperatures
```

In that case you have to import the `magrittr` package before in order to have access to the pipe operator:

```
library(magrittr)
```

## airflow

Airflow is a Python package called `apache-airflow`. The basic package can be extended with [subpackages](https://airflow.apache.org/docs/stable/installation.html).

It's a best practice to use [virtual environments](https://docs.python.org/3/tutorial/venv.html) to manage packages.

To work with Airflow we need to :

- create a virtual environment
- activate this virtual environment
- install the packages needed (e.g. Airflow)

Create a virtual environment:

```
python3 -m venv venv
```

Activate the virtual environment just created:

```
source venv/bin/activate
```

The `requirements.txt` file contains a list of packages to be installed. To install those packages:

```
pip install -r requirements.txt
```