locals {
  docker_image = var.postgres_version == "latest" ? "postgres:alpine" : "postgres:${var.postgres_version}-alpine"

  initial_heartbeat = <<EOF
docker run -e PGPASSWORD="${var.database_admin_password}" --rm --entrypoint="" ${local.docker_image} \
  psql \
  --host ${var.database_address} \
  --port ${var.database_port} \
  --username ${var.database_admin_username} \
  --dbname "${var.database_name}" \
  --command "
  DO \$\$BEGIN
    ${local.heartbeat_insertion}
  END\$\$
"
EOF
}

resource "null_resource" "postgres_initial_heartbeat" {
  triggers = {
    initial_heartbeat = local.initial_heartbeat
  }

  provisioner "local-exec" {
    command = self.triggers.initial_heartbeat
  }
}
