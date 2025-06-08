resource "helm_release" "grafana" {
  name = "grafana"

  repository       = "https://grafana.github.io/helm-charts"
  chart            = "grafana"
  namespace        = "monitoring"
  version          = "8.15.0"
  create_namespace = true

  values = [file("values/grafana.yaml")]
}
