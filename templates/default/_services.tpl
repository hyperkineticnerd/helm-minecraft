{{- define "minecraft.default.service.ports" -}}
- name: game
  port: {{ .Values.minecraft.externalPort }}
  targetPort: {{ .Values.minecraft.serverPort }}
  {{- if .Values.minecraft.nodePortEnable }}
  nodePort: {{ .Values.minecraft.nodePort }}
  {{- end }}
  protocol: TCP
{{- end -}}
