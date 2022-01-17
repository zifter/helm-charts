setup:
	python3 -m pip install yamllint
	python3 -m pip install yamale

test:
	./dev/run-tests.sh

gen-schema:
	./dev/gen-values-schema.sh

lint:
	ct lint --all

run-cluster:
	./dev/cluster/run.sh

sync-cluster:
	cd ./dev/cluster/ && helmfile sync

apply-cluster:
	cd ./dev/cluster/ && helmfile apply