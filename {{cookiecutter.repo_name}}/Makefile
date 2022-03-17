.PHONY: install lint test manual-build 

install:
	pip3 install --upgrade pip pip-tools setuptools wheel
	pip3 install -r requirements.txt
	pip3 install .

lint:
	pylint {{ cookiecutter.project_slug }}/ --disable R,C,I,logging-format-interpolation,fixme

test:
	pytest -p no:warnings tests/*.py

manual-build $(version):
	sh scripts/rollversion.sh -v $(version)
	rm -rf dist/
	python setup.py bdist_wheel sdist
	twine upload -r nexus dist/{{ cookiecutter.project_slug }}-$(version)-py3-none-any.whl dist/{{ cookiecutter.project_slug }}-$(version).tar.gz