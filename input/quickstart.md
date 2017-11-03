# Getting started really quickly

assuming you have [GIT](https://git-scm.com) and [DOCKER](https://www.docker.com) installed.

Step 1 - open your command line and execute:

```
     git clone https://gogs.tillwitt.de/witt/sphinx-docker.git
```
Step 2 - change into the repository directory and build the image

```
    cd sphinx-docker
    docker build -t sphinx_image .
```

Step 3 - run the container.

```
    docker run --name sphinx --rm \
    -e "Project=Sphinx in a docker" \
    -e "Author=Till Witt" \
    -e "Version=v1.0" \
    -v "$(pwd)/input:/project/input" \
    -v "$(pwd)/output:/project/output" \
        -i -t sphinx_image
```

The docker container looks in the **/input** folder and parses everything from there. Output is written to the **/output** folder. Existing content will be overwritten.

Now you can edit the input files to meet your requirements and re-run step 3.
