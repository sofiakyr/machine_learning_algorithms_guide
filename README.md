# Machine Learning Algorithms Guide

## Setup

`packrat::reload()`

## Build

To build the project you need to execute the `_build.R` file.
There are many ways to do this for various different operating systems so below is an explanation which should be
platform agnostic *(as long as it supports R of course)*.

The output directory is `_book` and will contain an `index.html` file that you can view in your browser of choice.

### Using the R Console/REPL directly

Open an R Console/REPL in this project's root.
You can check your current directory with:

```R
> getpwd()
```

Then simply run:

```R
> source("_build.R")
```
