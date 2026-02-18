# helm-practice

This repository contains a small Helm chart and exercises for learning Helm with a Kubernetes cluster (local `kind` recommended).

## Prerequisites

- kubectl
- helm v3+
- kind (or minikube / k3d / a real cluster)

## Quick start

1. Create a local cluster

   make kind-up

2. Lint and install the example chart

   make lint
   make install

3. Run tests

   make test

4. Tear down

   make uninstall
   make kind-down

## Exercises

See `EXERCISES.md` for guided practice (templating, values, hooks, tests, chart dependencies).
