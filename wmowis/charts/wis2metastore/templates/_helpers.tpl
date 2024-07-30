{{/*
Expand the name of the chart.
*/}}
{{- define "wis2metastore.fullname" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default name using the release name and the chart name.
*/}}
{{- define "wis2metastore.name" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name -}}
{{- end -}}

{{- define "wis2metastore.labels" -}}
{{- $labels := dict -}}
{{- $labels = merge $labels (dict "app.kubernetes.io/name" .Chart.Name) -}}
{{- $labels = merge $labels (dict "app.kubernetes.io/instance" .Release.Name) -}}
{{- $labels = merge $labels (dict "app.kubernetes.io/version" .Chart.AppVersion) -}}
{{- $labels = merge $labels (dict "app.kubernetes.io/managed-by" "Helm") -}}
{{- $labels = merge $labels (dict "helm.sh/chart" (printf "%s-%s" .Chart.Name .Chart.Version)) -}}
{{- toYaml $labels | nindent 4 -}}
{{- end -}}

{{/*
Selector labels
*/}}
{{- define "wis2metastore.selectorLabels" -}}
app.kubernetes.io/name: {{ include "wis2metastore.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}