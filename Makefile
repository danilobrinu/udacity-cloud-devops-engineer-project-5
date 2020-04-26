install:
	pip3 install -e .

install-dev:
	pip3 install -e ".[dev]"

install-hadolint:
	wget -O /bin/hadolint https://github.com/hadolint/hadolint/releases/download/v1.17.5/hadolint-Linux-x86_64
	chmod +x /bin/hadolint

install-minikube:
	wget -O /bin/minikube https://github.com/kubernetes/minikube/releases/download/v1.9.2/minikube-linux-amd64
	chmod +x /bin/minikube

test:
	python3 -m coverage run -m pytest -vv
	python3 -m coverage report

test-artifacts:
	python3 -m coverage run -m pytest --junitxml=junit.xml
	python3 -m coverage xml -m

lint:
	hadolint Dockerfile
	python3 -m pylint --disable=R,C,W1202 flazk

run:
	python3 -m uswgi app.ini
