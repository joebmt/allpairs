# --- 
# Makefile - Helper commands to install and manage allpairs python program
# --- 
SHELL := /bin/bash

ls:
	@echo "make <target> where <target> is one of:"
	@echo 
	@grep '^[a-zA-Z_]*:' Makefile | sed 's/:.*//' |sed 's/^/	/'
	@echo 

cat:
	@cat Makefile

help:
	@echo "--- Makefile: allpairs -h ---"
	allpairs --help

usage:
	@echo "--- Makefile: allpairs -h ---"
	allpairs --help

examples:
	@echo "--- Makefile: allpairs --examples ---"
	allpairs --examples

install_req:
	@echo "--- Makefile: Installing python dependencies: pip install -r inc/requirements.txt ---"
	pip install -r requirements.txt

install_allpairs:
	@echo "--- Makefile: Installing allpairs to /usr/local/bin ---"
	cp -f allpairs /usr/local/bin/allpairs
	@echo "--- Makefile: ls -alr /usr/local/bin/allpairs ---"
	ls -alt /usr/local/bin/allpairs
