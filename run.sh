#!/bin/bash

cd Tool
python3 generate.py

cd ../CV/CV_en
xelatex CV.tex
xelatex CV.tex
cp CV.pdf ../../Website/files/
cd ../..

