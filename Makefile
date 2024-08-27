
S=sudo

all: start

install:
	@$S apt-get update
	@$S curl -sfL https://gist.githubusercontent.com/icebob/958b6aeb0703dc24f436ee8945f0794f/raw/6c1c1843c307a2e3d3c49bd41fff8af1ae98ad12/k3s_helm_install.sh | sh -

start:
	@$S mkdir -p ./volume/billing
	@$S mkdir -p ./volume/inventory
	@$S chown -R 70:70 ./volume/
	@kubectl create secret generic api-secret --from-env-file=.env
	@find ./manifests -name "*.yaml" -exec kubectl apply -f {} \;
	@echo -n '	The api-gateway service Ip : '
	@kubectl get svc | grep api-gateway | awk '{print $$3}'

clean:
	@find ./manifests -name "*.yaml" -exec kubectl delete -f {} \;
	@kubectl delete secret/api-secret

fclean: clean
	$S rm -rf ./volume/ 

ip:
	@kubectl get svc | grep api-gateway | awk '{print $$3}'