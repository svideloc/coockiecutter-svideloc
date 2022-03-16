#!/usr/bin/env python

from setuptools import setup, find_packages
import re

try:
    with open(f'{ {{ cookiecutter.project_slug }} }/_version.py', 'r') as content_file:
        content = content_file.read()
        VERSION = re.match(r'[\S\s]*VERSION\s*=\s*\"(.*)\"[\S\s]*', content).group(1)
except Exception as e:
    print("WARNING: Unable to parse the version information out of the version file")
    raise e

setup(
    name={{ cookiecutter.project_slug }},
    version=VERSION,
    python_requires='~=3.8',
    description={{ cookiecutter.project_short_description }},
    author= {{ cookiecutter.full_name }},
    author_email= {{ cookiecutter.email }},
    include_package_data=True,
    install_requires=[],
    packages=find_packages(exclude=('tests', 'notebooks')),
    entry_points={}
)