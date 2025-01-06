{{/*
Generate a fully qualified name.
This includes the release name and chart name, truncated to 63 characters,
and ensures it's Kubernetes-compliant.
*/}}
{{- define "superset.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else }}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end }}
{{- end }}

{{/*
Generate a name without the release name.
This is just the chart name or a user-defined override.
*/}}
{{- define "superset.name" -}}
{{- if .Values.nameOverride }}
{{- .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- else }}
{{- .Chart.Name -}}
{{- end }}
{{- end }}

{{/*
Generate a namespace-qualified name, combining the namespace and fullname.
This ensures uniqueness across namespaces.
*/}}
{{- define "superset.namespacedFullname" -}}
{{- printf "%s-%s" .Release.Namespace (include "superset.fullname" .) | trunc 63 | trimSuffix "-" -}}
{{- end }}