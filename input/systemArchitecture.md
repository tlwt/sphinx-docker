# Architecture of the System

## packages
The system is based on

* ubuntu:16.10
* python-pip (upgraded)


* sphinx (the main system)
* with the following packages / add-ons
 * recommark (supports markdown)
 * sphinx-rtd-theme (ReadTheDocs Theme)
 * the following latex/PDF-packages (for PDF generation)
   * texlive-latex-recommended
   * texlive-fonts-recommended
   * texlive-latex-extra
   * latexmk

## execution

These steps are executed by the `runAfterBoot.sh`

1. Within the docker container `/project/tmp` is populated with a `sphinx-quickstart` configuration (taking the input from the run command via environmental variables).
1. a few adaptations to the configuration is done via sed.
1. The content of `/project/input` is then copied into `/project/tmp`.
1. `make pdf` is started.
1. `make html`is started.
1. existing `/project/output/html` folder is deleted.
1. PDF and HTML outputs are copied to the `/project/output` folder.

That's it.
