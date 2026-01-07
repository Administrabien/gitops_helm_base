{{- define "envs" -}}
SPRING_CLOUD_VAULT_URI: "http://vault.vault.svc.cluster.local:8200"
SPRING_CLOUD_VAULT_AUTHENTICATION: "KUBERNETES"
SPRING_CLOUD_VAULT_KUBERNETES_ROLE: "{{ .Values.container.vaultRoleName }}"
SPRING_CLOUD_VAULT_KUBERNETES_SERVICE_ACCOUNT_TOKEN_FILE: "/var/run/secrets/kubernetes.io/serviceaccount/token"
SPRING_CONFIG_IMPORT: "optional:vault://"
SPRING_CLOUD_VAULT_ENABLED: "true"
{{- range $key, $val := .Values.container.envs }}
{{ $key }}: {{ $val | quote }}
{{- end }}
{{- end -}}
