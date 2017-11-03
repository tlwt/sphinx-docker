# Generating the output (HTML,PDF)

considering that you have created your documentation files as .md and/or .rst in the input folder, you simple need to execute the container.

```
    docker run --name sphinx --rm \
    -e "Project=Sphinx in a docker" \
    -e "Author=Till Witt" \
    -e "Version=v1.0" \
    -v "$(pwd)/input:/project/input" \
    -v "$(pwd)/output:/project/output" \
        -i -t sphinx_image
```
