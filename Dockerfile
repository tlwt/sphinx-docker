# download base image ubuntu 16.10
FROM ubuntu:16.10
MAINTAINER "Till S. Witt <mail@tillwitt.de>"

RUN apt-get update

RUN apt-get -y install python-pip
RUN pip install --upgrade pip

RUN apt-get install nano

RUN pip install Sphinx
RUN pip install recommonmark
RUN pip install sphinx-rtd-theme

# installing pdf
RUN apt-get -y install texlive-latex-recommended
RUN apt-get -y install texlive-fonts-recommended
RUN apt-get -y install texlive-latex-extra
RUN apt-get -y install latexmk


# adds a local file to the image
ADD runAfterBoot.sh /tmp/
RUN chmod 755 /tmp/runAfterBoot.sh

workdir /project

# starting the command line
ENTRYPOINT /tmp/runAfterBoot.sh
