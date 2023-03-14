resource "helm_release" "kube-prometheus" {
  name       = "kube-prometheus-stackr"
  version    = "36.2.0"
  repository = "https://prometheus-community.github.io/helm-charts"
  chart      = "kube-prometheus-stack"
}