{{/*
Expand the name of the chart.
*/}}
{{- define "lamp.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "lamp.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "lamp.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "lamp.labels" -}}
helm.sh/chart: {{ include "lamp.chart" . }}
{{ include "lamp.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "lamp.selectorLabels" -}}
app.kubernetes.io/name: {{ include "lamp.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{- define "lamp.authority.selectorLabels" -}}
app.kubernetes.io/name: {{ include "lamp.name" . }}-authority
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{- define "lamp.gateway.selectorLabels" -}}
app.kubernetes.io/name: {{ include "lamp.name" . }}-gateway
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{- define "lamp.oauth.selectorLabels" -}}
app.kubernetes.io/name: {{ include "lamp.name" . }}-oauth
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "lamp.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "lamp.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}
