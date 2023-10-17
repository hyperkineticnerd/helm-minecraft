{{- define "minecraft.labels.modpack.type" -}}
{{- if .Values.modpack.forge }}
modpack-type: Forge
{{- else if .Values.modpack.fabric }}
modpack-type: Fabric
{{- end }}
{{- end -}}


{{- define "minecraft.labels.modpack.source" -}}
{{- if .Values.modpack.curseforge }}
modpack-source: CurseForge
{{- else if .Values.modpack.feed_the_beast }}
modpack-source: Feed-The-Beast
{{- end }}
{{- end -}}


{{- define "minecraft.default.pod.selectors" -}}
{{- with .Values.modpack.commonLabels }}
{{- toYaml . }}
{{- end }}
modpack: {{ .Values.modpack.slug }}
{{- end -}}


{{- define "minecraft.default.pod.labels" -}}
{{- include "minecraft.default.pod.selectors" . }}
{{- include "minecraft.labels.modpack.type" . }}
{{- include "minecraft.labels.modpack.source" . }}
modpack-id: {{ .Values.modpack.slug_id | int64 | quote }}
modpack-version: {{ .Values.modpack.version }}
modpack-version-id: {{ .Values.modpack.version_id | int64 | quote }}
{{- end -}}
