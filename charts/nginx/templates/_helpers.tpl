{{- define "nginx.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "nginx.fullname" -}}
{{- printf "%s-%s" .Release.Name (include "nginx.name" .) | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "nginx.labels" -}}
app.kubernetes.io/name: {{ include "nginx.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
helm.sh/chart: {{ .Chart.Name }}-{{ .Chart.Version }}
{{- end -}}
