# templates/_helpers.tpl

{{- define "create_url_withtoken" }}
{{- $url := deepCopy .defaultValues | merge .url }}

{{- $isValidScheme := include "isValidScheme" $url.scheme }}

{{- if eq $isValidScheme "false" }}
  {{- fail "Scheme must be 'http' or 'https'" }}
{{- end -}}

{{- $tokenUrl := $url.baseUrl -}}
{{- $tokenUrl = $tokenUrl | replace "[scheme]" $url.scheme -}}
{{- $tokenUrl = $tokenUrl | replace "[baseDomain]" $url.baseDomain -}}
{{- $tokenUrl = $tokenUrl | replace "[hostName]" $url.hostName -}}
{{- $tokenUrl = $tokenUrl | replace "[queryString]" $url.queryString -}}
{{- printf "%s" (trimSuffix "/" $tokenUrl) -}}

{{- end -}}

{{/*
{{- end -}}

{{/*
Check if the provided scheme is either "http" or "https".
*/}}
{{- define "isValidScheme" }}
{{- $scheme := . }}
{{- $validSchemes := list "http" "https" "ws" "wss" }}
{{- $return := include "isInList" (dict "value" $scheme "list" $validSchemes) }}
{{- printf "%s" $return -}}
{{- end }}

{{/*
Check if a value is in a list of possible values
*/}}
{{- define "isInList" }}
{{- $value := .value }}
{{- $list := .list }}
{{- $found := false }}
{{- range $item := $list }}
  {{- if eq $item $value }}
    {{- $found = true }}
  {{- end }}
{{- end }}
{{- $found }}
{{- end }}

{{/*
Distinct returns a unique list of strings from the input list.
*/}}
{{- define "distinctList" -}}
{{- $unique := dict -}}
{{- range . -}}
{{- $unique.Set . true -}}
{{- end -}}
{{- $keys := $unique | keys -}}
{{- $keys -}}
{{- end -}}
