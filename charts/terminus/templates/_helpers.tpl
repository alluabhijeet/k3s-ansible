{{- define "terminus.name" -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- end }}

{{- define "terminus.labels" -}}
app.kubernetes.io/name: {{ include "terminus.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
helm.sh/chart: {{ printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{- define "terminus.selectorLabels" -}}
app.kubernetes.io/name: {{ include "terminus.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{- define "terminus.valkey.selectorLabels" -}}
app.kubernetes.io/name: {{ include "terminus.name" . }}-valkey
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{- define "terminus.cnpg.clusterName" -}}
{{- include "terminus.name" . }}-cluster
{{- end }}
