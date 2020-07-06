venv:
	virtualenv venv -p python3.7


install:
	venv/bin/pip install -r requirements.txt


build: venv install


tests:
	venv/bin/python -m unittest discover -s src -p '*_test.py'

clean:
	rm -rf venv