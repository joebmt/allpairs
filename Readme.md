# allpairs - Generate All-Pair test combinations
Simple python tool to generate All-Pairs test combinations

## Overview

This is a tool to generate All-pairs test combinations from a `json`, `python`, or `yaml` input file using the [allpairspy](https://github.com/thombashi/allpairspy) python library.

## What Problem Does allpairs Solve?
The [allpairspy](https://github.com/thombashi/allpairspy) library gives a very useful library for creating All-pairs combinations.
This program extends the library by creating a command line utility called `allpairs` to use the library by simply calling the utility with an input datafile for the label and parameters.  This allows one to simply generate All-Pairs combinations without knowing how to code in python.  The user just defines an input file for the labels and parameters in `json`, `yml`, or `python` format and calls the utility `allpairs` with the datafile as an argument to generate the combinations.  See the [Usage](https://github.com/joebmt/allpairs/blob/master/Readme.md#allpairs-usage-message) section below on how to run.

## Description

All-Pairs testing is a functional test technique for reducing test combinations.  It reduces test combinations by testing pairs of attributes/features instead of all combinations of features.  This allows test organizations to reduce cost, time, and man hours.  The effectiveness of the technique is discussed in the links below.  Used effectively, the technique can increase code coverage and find a higher percentage of defects than other test techniques. 

For example, in page 24 of [Microsoft All-pairs Theory and Discussion](https://www.stickyminds.com/sites/default/files/presentation/file/2013/08STRER_T19.pdf), allpairs found 98 percent of all bugs seeded an 5 applications.  On page 26, 29 pairwise tests gave 90% code block coverage for the `sort` command.  

See these links for an overview and information about All-Pairs testing:

- [Wikipedia All-pairs](https://en.wikipedia.org/wiki/All-pairs_testing)
- [Microsoft All-pairs Theory and Discussion](https://www.stickyminds.com/sites/default/files/presentation/file/2013/08STRER_T19.pdf)
- [Simple All-pairs How To Example](https://www.softwaretestinghelp.com/what-is-pairwise-testing)
- [All-pairs Reference Site](http://www.pairwise.org/tools.asp)
- [allpairspy Library used by allpairs utility](https://github.com/thombashi/allpairspy)

See the section [All-pairs Test Case Reduction Example](https://github.com/joebmt/allpairs/blob/master/Readme.md#all-pairs-test-case-reduction-example) for how allpairs generates 172 test cases to cover 10 billion test combinations as an example of the reduction in test cases for a simple 10 by 10 combination table of parameters.

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development of shell scripts and testing purposes.

### Installing

Install the framework by running git clone or downloading the zip file.

```
git clone https://github.com/joebmt/allpairs.git
```

### Program Dependencies Pre-requisites

This program assumes you have python, make, and pip installed.
If you do not have pip installed, you can install it here:
- [Install Pip (python package manager](https://www.makeuseof.com/tag/install-pip-for-python/)

### Python Dependencies Pre-requisites

You will need to install the python click and python libraries before running the program:

```
make install_req
# or
pip install -r requirements.txt
```

### Install allpairs to /usr/local/bin

You can install the `allpairs` program to the directory `/usr/local/bin/allpairs` so it can be found in your execution path:

```
make install_allpairs
```

### All Pairs Setup and Execution Procedure

Follow the 3 steps below to setup a input datafile and execute it with the `allpairs` tool.

### Step 1: Run allpairs --examples to see the input syntax in `python`, `json`, or `yml` format

Run allpairs --examples to see examples of data file format in each of the 3 formats.
There are also examples in the ./data directory included with the distribution of the the 3 formats.

```
root # allpairs --examples
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
There is a requirement that the data input file have the correct file suffix (`.py`, `.json`, `.yml` or `.yaml`) to run correctly.

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

### Step 3: Generate an allpairs csv file or text table using your datafile as input

The most used option is to generate an All-Pairs csv table.  Simply run the program with your data input file with the --csv_out option.  The command below uses the ap_datafile.py input file specifying the labels and parameters and the output is redirected to a file called `ap.csv`.

```
root # allpairs --csv_out ./data/ap_datafile.py > ap.csv
cat ap.csv

Output:

allpairs --csv_out ./data/ap_datafile.py > ap.csv

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
root # allpairs -v ./data/ap_datafile.py
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
root # allpairs -h
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
## All-Pairs Test Case Reduction Example

Here is a simple example of how test combinations can be reduced by reducing all combinations using allpairs.
The file data/ap_datafile_v2.py has a 10 rows (features) by 10 possible values for each of the features.
To exhaustively test all combinations, you would need to create 10 billion tests.  With All-pairs you would only need 172 to cover all pairwise combinations.

```
All Combinations: 10,000,000,000 [10, 10, 10, 10, 10, 10, 10, 10, 10, 10] (ten billion combination tests)
    vs
All Pairs:             172

root # allpairs -v data/ap_datafile_v2.py
Note: Processing python datafile: data/ap_datafile_v2.py

labels = \
['col1', 'col2', 'col3', 'col4', 'col5', 'col6', 'col7', 'col8', 'col9', 'col10']
parameters = \
[['r1c1', 'r1c2', 'r1c3', 'r1c4', 'r1c5', 'r1c6', 'r1c7', 'r1c8', 'r1c9', 'r1c10'],
 ['r2c1', 'r2c2', 'r2c3', 'r2c4', 'r2c5', 'r2c6', 'r2c7', 'r2c8', 'r2c9', 'r2c10'],
 ['r3c1', 'r3c2', 'r3c3', 'r3c4', 'r3c5', 'r3c6', 'r3c7', 'r3c8', 'r3c9', 'r3c10'],
 ['r4c1', 'r4c2', 'r4c3', 'r4c4', 'r4c5', 'r4c6', 'r4c7', 'r4c8', 'r4c9', 'r4c10'],
 ['r5c1', 'r5c2', 'r5c3', 'r5c4', 'r5c5', 'r5c6', 'r5c7', 'r5c8', 'r5c9', 'r5c10'],
 ['r6c1', 'r6c2', 'r6c3', 'r6c4', 'r6c5', 'r6c6', 'r6c7', 'r6c8', 'r6c9', 'r6c10'],
 ['r7c1', 'r7c2', 'r7c3', 'r7c4', 'r7c5', 'r7c6', 'r7c7', 'r7c8', 'r7c9', 'r7c10'],
 ['r8c1', 'r8c2', 'r8c3', 'r8c4', 'r8c5', 'r8c6', 'r8c7', 'r8c8', 'r8c9', 'r8c10'],
 ['r9c1', 'r9c2', 'r9c3', 'r9c4', 'r9c5', 'r9c6', 'r9c7', 'r9c8', 'r9c9', 'r9c10'],
 ['r10c1', 'r10c2', 'r10c3', 'r10c4', 'r10c5', 'r10c6', 'r10c7', 'r10c8', 'r10c9', 'r10c10']]

+-----+-------+-------+-------+-------+-------+-------+-------+-------+-------+--------+
|  0  |  col1 |  col2 |  col3 |  col4 |  col5 |  col6 |  col7 |  col8 |  col9 | col10  |
+-----+-------+-------+-------+-------+-------+-------+-------+-------+-------+--------+
|  1  |  r1c1 |  r2c1 |  r3c1 |  r4c1 |  r5c1 |  r6c1 |  r7c1 |  r8c1 |  r9c1 | r10c1  |
|  2  |  r1c2 |  r2c2 |  r3c2 |  r4c2 |  r5c2 |  r6c2 |  r7c2 |  r8c2 |  r9c2 | r10c1  |
|  3  |  r1c3 |  r2c3 |  r3c3 |  r4c3 |  r5c3 |  r6c3 |  r7c3 |  r8c3 |  r9c3 | r10c1  |
|  4  |  r1c4 |  r2c4 |  r3c4 |  r4c4 |  r5c4 |  r6c4 |  r7c4 |  r8c4 |  r9c4 | r10c1  |
|  5  |  r1c5 |  r2c5 |  r3c5 |  r4c5 |  r5c5 |  r6c5 |  r7c5 |  r8c5 |  r9c5 | r10c1  |
|  6  |  r1c6 |  r2c6 |  r3c6 |  r4c6 |  r5c6 |  r6c6 |  r7c6 |  r8c6 |  r9c6 | r10c1  |
|  7  |  r1c7 |  r2c7 |  r3c7 |  r4c7 |  r5c7 |  r6c7 |  r7c7 |  r8c7 |  r9c7 | r10c1  |
|  8  |  r1c8 |  r2c8 |  r3c8 |  r4c8 |  r5c8 |  r6c8 |  r7c8 |  r8c8 |  r9c8 | r10c1  |
|  9  |  r1c9 |  r2c9 |  r3c9 |  r4c9 |  r5c9 |  r6c9 |  r7c9 |  r8c9 |  r9c9 | r10c1  |
|  10 | r1c10 | r2c10 | r3c10 | r4c10 | r5c10 | r6c10 | r7c10 | r8c10 | r9c10 | r10c1  |
 ...
| 170 |  r1c2 |  r2c8 |  r3c8 | r4c10 |  r5c9 |  r6c3 |  r7c4 |  r8c8 |  r9c5 | r10c6  |
| 171 |  r1c2 |  r2c8 |  r3c8 | r4c10 |  r5c9 |  r6c1 |  r7c4 |  r8c8 | r9c10 | r10c6  |
| 172 |  r1c2 |  r2c8 |  r3c8 | r4c10 |  r5c9 |  r6c4 |  r7c7 |  r8c8 |  r9c8 | r10c6  |
+-----+-------+-------+-------+-------+-------+-------+-------+-------+-------+--------+


```
## Authors

- **Joe Orzehoski** - *Initial work* - [Linkedin Profile](http://www.linkedin.com/in/joeorzehoski)

## License

This project is licensed under the Apache License - see the [License.md](License.md) file for details

## Acknowledgments

- [allpairspy](https://github.com/thombashi/allpairspy)

