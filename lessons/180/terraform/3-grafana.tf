resource "helm_release" "grafana" {
  name = "grafana"

  repository       = "https://grafana.github.io/helm-charts"
  chart            = "grafana"
  namespace        = "monitoring"
  version          = "9.2.3"
  create_namespace = true

  values = [file("values/grafana.yaml")]
}
