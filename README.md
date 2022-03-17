# Cookiecutter for Generic Python Libraries 

### Requirements to use the cookiecutter template:
-----------
 - Python 2.7 or 3.5+
 - [Cookiecutter Python package](http://cookiecutter.readthedocs.org/en/latest/installation.html) >= 1.4.0: This can be installed with pip by or conda depending on how you manage your Python packages:

``` bash
$ pip install cookiecutter
```

or

``` bash
$ conda config --add channels conda-forge
$ conda install cookiecutter
```


### To start a new project, run:
------------

```shell
git clone this project
cookiecutter cookiecutter-svideloc
```
    
### The resulting directory structure
------------

The directory structure of your new project looks like this: 

```
├── Makefile           <- Makefile with commands like `make data` or `make train`
├── README.md          <- The top-level README for developers using this project.
│
├── docs               <- A default Sphinx project; see sphinx-doc.org for details
├── tests              <- directory for test files of the package modules to go
│
├── scripts
│   ├── rollversion.sh <- Script to roll the version (used in the makefile)
│
├── notebooks          <- Jupyter notebooks. Naming convention is a number (for ordering),
│                         the creator's initials, and a short `-` delimited description, e.g.
│                         `1.0-jqp-initial-data-exploration`.
│   ├── data           <- Directory for housing data used in notebooks
│
├── requirements.txt   <- The requirements file for reproducing the analysis environment, e.g.
│                         generated with `pip freeze > requirements.txt`
│
├── setup.py           <- makes project pip installable (pip install -e .) so src can be imported
├── project_slug       <- Source code for use in this project.
│   ├── __init__.py    <- Makes src a Python module
│   ├── __main__.py    <- python file for creating any run scripts
│   ├── _version.py    <- version file which is auto updated with Makefile command
```

### Installing development requirements
------------

    pip install -r requirements-dev.txt

### Running the tests
------------

    pytest tests/*py