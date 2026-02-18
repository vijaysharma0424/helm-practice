.PHONY: kind-up kind-down lint install uninstall package test all

kind-up:
	kind create cluster --name helm-practice || true
	kubectl cluster-info

kind-down:
	kind delete cluster --name helm-practice || true

lint:
	helm lint charts/nginx

install:
	helm upgrade --install nginx charts/nginx -f charts/nginx/values.yaml --wait --timeout 2m

uninstall:
	helm uninstall nginx || true

package:
	helm package charts/nginx --destination ./packages

test:
	helm test nginx --timeout 2m || true

all: kind-up lint install test
