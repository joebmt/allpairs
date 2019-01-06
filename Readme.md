# allpairs - Generate All-Pair test combinations
Simple python tool to generate All-Pairs test combinations

## Overview

This is a tool to generate All-pairs test combinations from a json, python, or yaml input file using the allpairspy python library.

## What Problem Does tcmd Solve?

## Description



## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development of shell scripts and testing purposes.

### Installing

Install the framework by running git clone or downloading the zip file.

```
git clone https://github.com/joebmt/allpairs.git
```

### Python Dependencies Prerequisites

You will need to install the python click and python libraries:

```
make install
# or
pip install -r requirements.txt
```




## Framework Files

The framework and description looks like this:

```
├── License.md
├── Makefile
├── Readme.md
├── allpairs
├── data
│   ├── ap_datafile.json
│   ├── ap_datafile.py
│   ├── ap_datafile_v1.yml
│   └── ap_datafile_v2.yml
└── requirements.txt
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

