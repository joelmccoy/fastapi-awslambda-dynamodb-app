init:
	pip install -r lambda/requirements.txt
	pip install -r requirements-dev.txt

all: format lint tf-deploy

format:
	terraform fmt -recursive
	black lambda
	isort lambda --profile black

lint: 
	tflint --recursive
	flake8 lambda
	mypy lambda

clean:
	rm -rf build

build: clean
	mkdir -p build/lambda
	pip install -r lambda/requirements.txt --target ./build/lambda
	rsync -a lambda/ build/lambda --include *.py
	cd build/lambda && zip -r ../lambda.zip .

tf-init:
	terraform init

tf-plan:
	terraform plan

tf-apply:
	terraform apply

tf-deploy: build tf-init tf-apply