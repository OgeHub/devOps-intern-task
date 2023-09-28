provider "kubectl" {
  apply_retry_count = 10
  config_path = ./kind-config
}

resource "kubectl_manifest" "intern-task" {
    yaml_body = <<YAML
apiVersion: apps/v1
kind: Deployment
metadata:
  name: devops-task-deployment
  labels:
    app: task-app
spec:
  replicas: 3
  selector:
    matchLabels:
      app: task-app
  template:
    metadata:
      labels:
        app: task-app
    spec:
      containers:
        - name: devops-app
          image: ogeedocker/devops-task:1.0
          ports:
            - containerPort: 3000
YAML
}