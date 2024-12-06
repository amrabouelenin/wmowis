{{/*
Expand the name of the chart.
*/}}
{{- define "wis2validation.fullname" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default name using the release name and the chart name.
*/}}
{{- define "wis2validation.name" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name -}}
{{- end -}}

{{- define "wis2validation.labels" -}}
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
{{- define "wis2validation.selectorLabels" -}}
app.kubernetes.io/name: {{ include "wis2validation.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}