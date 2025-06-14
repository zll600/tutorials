resource "helm_release" "postgresql" {
  name = "postgresql"

  repository       = "https://charts.bitnami.com/bitnami"
  chart            = "postgresql"
  namespace        = "db"
  version          = "16.7.10"
  create_namespace = true

  values = [file("values/postgresql.yaml")]
}
