{{- define "minecraft.default.service.ports" -}}
ports: 
- name: minecraft
  port: {{ .Values.minecraft.externalPort }}
  targetPort: {{ .Values.minecraft.serverPort }}
  {{- if .Values.minecraft.nodePortEnable }}
  nodePort: {{ .Values.minecraft.nodePort }}
  {{- end }}
  protocol: TCP
{{- end -}}


{{- define "minecraft.default.service.annotations" -}}
{{- if $.Values.service.annotations -}}
annotations:
{{- with .Values.service.annotations  -}}
{{ toYaml . | nindent 2 }}
{{- end -}}
{{- end -}}
{{- end -}}


{{- define "minecraft.default.service.labels" -}}
labels:
{{- include "minecraft.default.pod.labels" . | nindent 2 }}
{{- end -}}
