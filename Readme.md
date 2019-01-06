# allpairs - Generate All-Pair test combinations
Simple python tool to generate All-Pairs test combinations

## Overview

This is a tool to generate All-pairs test combinations from a json, python, or yaml input file using the allpairspy python library.

## What Problem Does allpairs Solve?
The allpairspy library gives a very useful library for creating All-pairs combinations.
This program extends the library by creating a command line utility to use the library by simply calling the utility with an input datafile for the label and parameters.  This allows one to simply generate allpairs combinations without knowing how to code in python.  The user just defines an input file for the labels and parameters in json, yml, or python format and calls the utility with the datafile as an argument to generate the combinations.  See the *Usage* section below on how to run.

## Description

All-Pairs testing is a test technique for reducing test combinations.  
See these links for an overview of All-Pairs testing:

https://en.wikipedia.org/wiki/All-pairs_testing
https://www.stickyminds.com/sites/default/files/presentation/file/2013/08STRER_T19.pdf
https://www.softwaretestinghelp.com/what-is-pairwise-testing/


## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development of shell scripts and testing purposes.

### Installing

Install the framework by running git clone or downloading the zip file.

```
git clone https://github.com/joebmt/allpairs.git
```

### Python Dependencies Prerequisites

You will need to install the python click and python libraries before running the program:

```
make install_req
# or
pip install -r requirements.txt
```

### Install allpairs to /usr/local/bin

You can install the allpairs program to /usr/local/bin/allpairs:

```
make install_allpairs
```

## Framework Files

The framework and description looks like this:

```
├── License.md (apache license)
├── Makefile   (makefile with helper commands)
├── Readme.md  (this readme file)
├── allpairs   (the primary program you execute to generate allpairs combinations from an input file)
├── data
│   ├── ap_datafile.json   (example input file in json format)
│   ├── ap_datafile.py     (example input file in python format)
│   ├── ap_datafile_v1.yml (example input file in yml extended format)
│   └── ap_datafile_v2.yml (example input file in yml traditional format)
└── requirements.txt       (pip install -r requirements.txt file to install dependencies)
```

## allpairs Usage Message

Usage:

```
joe@joemac:[bin] allpairs -h
Usage: allpairs [options] [DATAFILE]

  allpairs - generate allpairs combinations from a python .py, .json, or .yml parameter file

  Desc: allpairs [Options] <file>.<py|yml|json>

  Examples:
      allpairs -e ................ gives examples of input file syntax
      allpairs -v ................ print out detailed info and use the file "./ap_datafile.py" as a default datafile
      allpairs --csv_out <file>.py use the file "./ap_datafile.py" as a default datafile and output in csv format
      allpairs --nocnt ........... do not include count in output column 1
      allpairs --rmlabels ........ do not include labels in 1st row of output
      allpairs <file>.py ......... use a python input datafile
      allpairs <file>.yml ........ use a yaml input datafile
      allpairs <file>.json ....... use a json input datafile
  Notes:

    1. Must have "parameters" defined inside datafile which contains a list of lists
    2. Must have "label"      defined inside datafile which contains a list of labels for the columns
    3. Must have a datafile that has one of .py, .yml, or .json file extensions
    4. Install program dependencies: pip install allpairspy pprint prettytable
    5. For allpairs information, see:
       a. Effectiveness: https://www.stickyminds.com/sites/default/files/presentation/file/2013/08STRER_T19.pdf
       b. How to implement: https://www.softwaretestinghelp.com/what-is-pairwise-testing/

Options:
  -c, --csv_out   Print Out Output in csv format only
  -e, --examples  Print Out Examples of the 3 input file types
  -n, --nocnt     Exclude count columns in allpairs output
  -r, --rmlabels  Exclude count columns in allpairs output
  -v, --verbose   Print Out Verbose Output
  -h, --help      This usage message
```

## Authors

* **Joe Orzehoski** - *Initial work* - [Linkedin Profile](http://www.linkedin.com/in/joeorzehoski)

## License

This project is licensed under the Apache License - see the [License.md](License.md) file for details

## Acknowledgments

* allpairspy

