variable "aws_account" {
}

variable "aws_region" {
}

variable "container_port" {
}

variable "cpuReservation" {
}

variable "desired_count" {
}

variable "docker_image_name" {
}

variable "ecs_cluster_name" {
}

variable "envars" {
}

variable "environment_name" {
}

variable "kms_key_id" {
  default = ""
}

variable "log_group_name" {
}

variable "max_memory" {
}

variable "memory_reservation" {
}

variable "param_store_namespace" {
  default = ""
}

variable "skip" {
  default = ""
}

variable "target_group_arn" {
}

variable "command" {
  description = "Commands to execute after entrypoint"
  default     = ["/bin/echo", "Start command not supplied, just exiting"]
  type        = list(string)
}

variable "task_definition_json" {
  description = "allows specifying a different JSON task definition, if none default (1 container per task) will be used"
  default     = "/deployer/modules/ecs_service/task_definition/default.json"
  type        = string
}
