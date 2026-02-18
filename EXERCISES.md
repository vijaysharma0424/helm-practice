# Helm Practice Exercises

These exercises are ordered from beginner → intermediate.

1) Quick verification
   - Task: Install the chart and verify the Service is running.
   - Commands: `make kind-up && make install && kubectl get svc`

2) Change replica count via `values.yaml`
   - Task: Set `replicaCount: 3` and run `helm upgrade`.
   - Goal: Verify 3 pods are created.

3) Templating exercise
   - Task: Add a new helper in `templates/_helpers.tpl` and use it in `deployment.yaml` to add an annotation.

4) Hooks & tests
   - Task: Inspect `templates/tests/test-connection.yaml` and modify it to check a different path.
   - Goal: Run `helm test <release>` and confirm success.

5) CI validation (optional)
   - Task: Open `.github/workflows/helm-ci.yml` and update the Helm or Kubernetes version used by CI.

6) Ingress configuration & validation
   - Task: Enable and configure `ingress` in `charts/nginx/values.yaml` (set `ingress.enabled: true` and update `ingress.hosts[0].host`).
   - Commands:
     - `helm lint charts/nginx`
     - `helm upgrade --install nginx charts/nginx -f charts/nginx/values.yaml`
     - `kubectl get ingress`
   - Goal: An `Ingress` resource is created for the host you configured. Use `/etc/hosts` or port-forward to test the path.

7) Chart dependencies (local vs remote)
   - Task: Try the example `redis` dependency in `Chart.yaml`:
     - Option A (remote): `helm repo add bitnami https://charts.bitnami.com/bitnami && helm dependency update charts/nginx && helm install nginx charts/nginx`
     - Option B (local): add a small subchart under `charts/nginx/charts/` and re-run `helm install`.
   - Goal: `helm dependency update` pulls the dependency and `helm install` deploys both charts.

8) `values.schema.json` (validation)
   - Task: Inspect `charts/nginx/values.schema.json` and experiment:
     - Set an invalid value (e.g. `replicaCount: "two"`) and run `helm install` or `helm lint`.
   - Goal: Helm/Helm lint should reject invalid values according to the schema.

Hints and solutions are intentionally omitted — try them first, then ask for help.
