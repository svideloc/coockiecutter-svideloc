.PHONY: install lint test build 

install:
		pip3 install --upgrade pip pip-tools setuptools wheel
		pip3 install -r requirements.txt
		pip3 install .

lint:
		pylint {{ cookiecutter.project_slug }}/ --disable R,C,I,logging-format-interpolation,fixme

test:
		pytest -p no:warnings tests/*.py

manual-build $(version):
		rm -rf dist/
		twine upload 