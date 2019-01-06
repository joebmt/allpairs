# allpairs - Generate All-Pair test combinations
Simple python tool to generate All-Pairs test combinations

## Overview

This is a tool to generate All-pairs test combinations from a json, python, or yaml input file using the [allpairspy](https://github.com/thombashi/allpairspy) python library.

## What Problem Does allpairs Solve?
The [allpairspy](https://github.com/thombashi/allpairspy) library gives a very useful library for creating All-pairs combinations.
This program extends the library by creating a command line utility to use the library by simply calling the utility with an input datafile for the label and parameters.  This allows one to simply generate allpairs combinations without knowing how to code in python.  The user just defines an input file for the labels and parameters in `json`, `yml`, or `python` format and calls the utility with the datafile as an argument to generate the combinations.  See the [Usage](https://github.com/joebmt/allpairs/blob/master/Readme.md#allpairs-usage-message) section below on how to run.

## Description

All-Pairs testing is a test technique for reducing test combinations.  It reduces test combinations by testing pairs of attributes/features instead of all combinations of features.  This allows test organizations to reduce cost, time, and man hours.  The effectiveness of the technique is discussed in the links below.  Used effectively, the technique can increase code coverage and find a higher percentage of defects than other test techniques. 

See these links for an overview and information about All-Pairs testing:

- https://en.wikipedia.org/wiki/All-pairs_testing
- https://www.stickyminds.com/sites/default/files/presentation/file/2013/08STRER_T19.pdf
- https://www.softwaretestinghelp.com/what-is-pairwise-testing
- http://www.pairwise.org/tools.asp
- https://github.com/thombashi/allpairspy

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

### All Pairs Setup and Execution Procedure

Follow the 3 steps below to setup a input datafile and execute these labels and parameters specified with the allpairs tool.

### Step 1: Run allpairs --examples to see the input syntax in `python`, `json`, or `yml` format

Run allpairs --examples to see examples of data file format in each of the 3 formats.
There are also examples in the ./data directory included with the distribution of the the 3 formats.

```
joe@joemac:[allpairs] allpairs --examples
=== Python Input Data ===
labels = \
['Year', 'Colors', 'Car']
parameters = \
[['2015', '2016', '2017', '2018'],
 ['Red', 'Blue', 'Green', 'Gray', 'Brown'],
 ['Honda', 'Toyota', 'Ford']]

=== JSON Input Data ===
{
  "labels": [
    "Year",
    "Colors",
    "Car"
  ],
  "parameters": [
    [
      "2015",
      "2016",
      "2017",
      "2018"
    ],
    [
      "Red",
      "Blue",
      "Green",
      "Gray",
      "Brown"
    ],
    [
      "Honda",
      "Toyota",
      "Ford"
    ]
  ]
}

=== YML Input Data: Style 1 ===
---
labels:
- Year
- Colors
- Car
parameters:
- - '2015'
  - '2016'
  - '2017'
  - '2018'
- - Red
  - Blue
  - Green
  - Gray
  - Brown
- - Honda
  - Toyota
  - Ford


=== YML Input Data: Style 2 ===
--- {labels: [Year, Colors, Car], parameters: [['2015', '2016', '2017', '2018'], [
      Red, Blue, Green, Gray, Brown], [Honda, Toyota, Ford]]}
```

### Step 2: Create a data file in python, json, or yml format specifiying the labels and parameters

Use the information in step 1 to create data file in one of the 3 formats.
You will need to specify 2 variables inside the input files: `labels` and `parameters`
See the `./data/ap_datafile\*` for examples of the syntax.
The example below is for a python data file.

```
vi ./data/ap_datafile.py

# ---
# ap_datafile.py - python datafile to use as allpairs input to generate allpairs combinations
# ---
labels = \
['Year', 'Colors', 'Car']
parameters = \
[['2015', '2016', '2017', '2018'],
 ['Red', 'Blue', 'Green', 'Gray', 'Brown'],
 ['Honda', 'Toyota', 'Ford']]
```

### Step 3: Generate an allpairs csv file or text table of the pairwise combinations using your datafile as input

You can install the allpairs program to /usr/local/bin/allpairs:

```
allpairs --csv ./data/ap_datafile.py

Output:

joe@joemac:[allpairs] allpairs --csv_out ./data/ap_datafile.py > ap.csv

0,Year,Colors,Car
1,2015,Red,Honda
2,2016,Blue,Honda
3,2017,Green,Honda
4,2018,Gray,Honda
5,2018,Brown,Toyota
6,2017,Brown,Ford
7,2016,Red,Ford
8,2015,Gray,Ford
9,2015,Green,Toyota
10,2016,Green,Ford
11,2017,Blue,Toyota
12,2018,Blue,Ford
13,2016,Gray,Toyota
14,2018,Red,Toyota
15,2017,Red,Toyota
16,2015,Brown,Honda
17,2015,Blue,Toyota
18,2017,Gray,Toyota
19,2018,Green,Toyota
20,2016,Brown,Toyota
```

## allpairs Useful Option:

One useful option built into the tool is to see the output in a pretty printed text table (default).
Combine with the `-v` (verbose) option to see the the labels, parameters, pretty table, and combination counts.
You can remove the counts (`-n`) and the labels (`-r`) from the output data as well.  See the section on [allpairs Usage Message](https://github.com/joebmt/allpairs/blob/master/Readme.md#allpairs-usage-message) below for more information of all the options available.

```
joe@joemac:[allpairs] allpairs -v ./data/ap_datafile.py
Note: Processing python datafile: ./data/ap_datafile.py

labels:
['Year', 'Colors', 'Car']

parameters:
[['2015', '2016', '2017', '2018'],
 ['Red', 'Blue', 'Green', 'Gray', 'Brown'],
 ['Honda', 'Toyota', 'Ford']]

+----+------+--------+--------+
| 0  | Year | Colors |  Car   |
+----+------+--------+--------+
| 1  | 2015 |  Red   | Honda  |
| 2  | 2016 |  Blue  | Honda  |
| 3  | 2017 | Green  | Honda  |
| 4  | 2018 |  Gray  | Honda  |
| 5  | 2018 | Brown  | Toyota |
| 6  | 2017 | Brown  |  Ford  |
| 7  | 2016 |  Red   |  Ford  |
| 8  | 2015 |  Gray  |  Ford  |
| 9  | 2015 | Green  | Toyota |
| 10 | 2016 | Green  |  Ford  |
| 11 | 2017 |  Blue  | Toyota |
| 12 | 2018 |  Blue  |  Ford  |
| 13 | 2016 |  Gray  | Toyota |
| 14 | 2018 |  Red   | Toyota |
| 15 | 2017 |  Red   | Toyota |
| 16 | 2015 | Brown  | Honda  |
| 17 | 2015 |  Blue  | Toyota |
| 18 | 2017 |  Gray  | Toyota |
| 19 | 2018 | Green  | Toyota |
| 20 | 2016 | Brown  | Toyota |
+----+------+--------+--------+

All Combinations:       60 [4, 5, 3]
    vs
All Pairs:              20
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

