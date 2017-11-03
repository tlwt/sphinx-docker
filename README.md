# SPHINX Dokumentation

container to generate SPHINX documentation. Will output HTML and PDF

Build the container with:

```

    docker build -t sphinx_image .
```
the input folder should contain the project documentation.

The output folder should be empty. Existing content may be overwritten!

Run the container with

```

    docker run --name sphinx --rm \
    -e "Project=Test Project" \
    -e "Author=Till Witt" \
    -e "Version=1" \
    -v "$(pwd)/input:/project/input" \
    -v "$(pwd)/output:/project/output" \
        -i -t sphinx_image
```
