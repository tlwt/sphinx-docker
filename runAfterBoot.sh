#!/bin/bash
echo sphinx

# folder to keep configuration
mkdir -p input/
mkdir -p tmp/
mkdir -p output/
mkdir -p output/pdf/

cd tmp/
sphinx-quickstart -q -p "$Project" -a "$Author" -v "$Version" --suffix=.rst
echo "from recommonmark.parser import CommonMarkParser" >> conf.py
echo "source_parsers = {'.md': CommonMarkParser}" >> conf.py

#activating proper suffix line
sed -i "s/# source_suffix = \['.rst', '.md'\]/source_suffix = \['.rst', '.md'\]/g"  /project/tmp/conf.py

#removing wrong suffix line
sed -i "s/source_suffix = '.rst'//g"  /project/tmp/conf.py

# correcting output dir in Makefile


# copying to tmp dir
/bin/cp -rf /project/input/* /project/tmp

# creating output
make latexpdf
# build html directly to target dir
#sed -i "s/BUILDDIR      = _build/BUILDDIR      = ..\/output/g"  /project/tmp/Makefile
make html

cp -rf /project/tmp/_build/html/ /project/output/html/
cp -rf /project/tmp/_build/latex/*.pdf /project/output/pdf


# setting up output folder
